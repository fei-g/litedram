#!/usr/bin/env python3

# This file is Copyright (c) 2018-2020 Florent Kermarrec <florent@enjoy-digital.fr>
# This file is Copyright (c) 2020 Stefan Schrijvers <ximin@ximinity.net>
# License: BSD

"""
LiteDRAM standalone core generator

LiteDRAM aims to be directly used as a python package when the SoC is created using LiteX. However,
for some use cases it could be interesting to generate a standalone verilog file of the core:
- integration of the core in a SoC using a more traditional flow.
- need to version/package the core.
- avoid Migen/LiteX dependencies.
- etc...

The standalone core is generated from a YAML configuration file that allows the user to generate
easily a custom configuration of the core.

Current version of the generator is limited to DDR2/DDR3 Xilinx 7-Series FPGA and DDR3 on Lattice
ECP5.
"""

import os
import sys
import math
import struct
import yaml
import argparse

from migen import *
from migen.genlib.resetsync import AsyncResetSynchronizer

from migen.fhdl import verilog

from litex.build.tools import replace_in_file
from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform
from litex.build.lattice import LatticePlatform
from litex.boards.platforms import versa_ecp5

from litex.boards.platforms import genesys2
from litex.boards.platforms import vc707
from litex_boards.platforms import vcu118

from litex.soc.cores.clock import *
from litex.soc.integration.soc_sdram import *
from litex.soc.integration.builder import *
from litex.soc.interconnect import csr_bus
from litex.soc.interconnect import wishbone
from litex.soc.cores.uart import *

from litedram import modules as litedram_modules
from litedram import phy as litedram_phys
from litedram.phy.ecp5ddrphy import ECP5DDRPHY
from litedram.phy.s7ddrphy import S7DDRPHY
from litedram.core.controller import ControllerSettings
from litedram.frontend.axi import *
from litedram.frontend.wishbone import *
from litedram.frontend.bist import LiteDRAMBISTGenerator
from litedram.frontend.bist import LiteDRAMBISTChecker
from litedram.frontend.fifo import LiteDRAMFIFO
from litedram.common import PHYPadsReducer

# IOs/Interfaces -----------------------------------------------------------------------------------

def get_common_ios():
    return [
        # clk / rst
        # ("clk", 0, Pins(1)),
        # ("rst", 0, Pins(1)),

        # serial
        # ("serial", 0,
        #     Subsignal("tx", Pins(1)),
        #     Subsignal("rx", Pins(1))
        # ),

        # crg status
        ("pll_locked", 0, Pins(1)),

        # init status
        ("init_done",  0, Pins(1)),
        ("init_error", 0, Pins(1)),

        # ComputeDRAM interface TODO need to pass the arg to config the length of R1 R2
        ("ComputeDRAM_R1",  0, Pins(16)),
        ("ComputeDRAM_R2",  0, Pins(16)),
        ("ComputeDRAM_T1",  0, Pins(4)),
        ("ComputeDRAM_T2",  0, Pins(4)),
        ("ComputeDRAM_vld",  0, Pins(1)),
        ("ComputeDRAM_rdy",  0, Pins(1)),

        # iodelay clk / rst
        ("clk_iodelay", 0, Pins(1)),
        ("rst_iodelay", 0, Pins(1)),

        # user clk / rst
        ("user_clk", 0, Pins(1)),
        ("user_rst", 0, Pins(1))

    ]

def get_dram_ios(core_config):
    sdram_module = core_config["sdram_module"]
    return [
        ("ddram", 0,
            Subsignal("a",       Pins(log2_int(core_config["sdram_module"].nrows))),
            Subsignal("ba",      Pins(log2_int(core_config["sdram_module"].nbanks))),
            Subsignal("ras_n",   Pins(1)),
            Subsignal("cas_n",   Pins(1)),
            Subsignal("we_n",    Pins(1)),
            Subsignal("cs_n",    Pins(core_config["sdram_rank_nb"])),
            Subsignal("dm",      Pins(core_config["sdram_module_nb"])),
            Subsignal("dq",      Pins(8*core_config["sdram_module_nb"])),
            Subsignal("dqs_p",   Pins(core_config["sdram_module_nb"])),
            Subsignal("dqs_n",   Pins(core_config["sdram_module_nb"])),
            Subsignal("clk_p",   Pins(core_config["sdram_rank_nb"])),
            Subsignal("clk_n",   Pins(core_config["sdram_rank_nb"])),
            Subsignal("cke",     Pins(core_config["sdram_rank_nb"])),
            Subsignal("odt",     Pins(core_config["sdram_rank_nb"])),
            Subsignal("reset_n", Pins(1))
        ),
    ]

def get_csr_ios(aw, dw):
    return [
        ("csr_port", 0,
            Subsignal("adr",   Pins(aw)),
            Subsignal("we",    Pins(1)),
            Subsignal("dat_w", Pins(dw)),
            Subsignal("dat_r", Pins(dw))
        ),
    ]

def get_native_user_port_ios(_id, aw, dw):
    return [
        ("user_port_{}".format(_id), 0,
            # cmd
            Subsignal("cmd_valid", Pins(1)),
            Subsignal("cmd_ready", Pins(1)),
            Subsignal("cmd_we",    Pins(1)),
            Subsignal("cmd_addr",  Pins(aw)),

            # wdata
            Subsignal("wdata_valid", Pins(1)),
            Subsignal("wdata_ready", Pins(1)),
            Subsignal("wdata_we",    Pins(dw//8)),
            Subsignal("wdata_data",  Pins(dw)),

            # rdata
            Subsignal("rdata_valid", Pins(1)),
            Subsignal("rdata_ready", Pins(1)),
            Subsignal("rdata_data",  Pins(dw))
        ),
    ]

def get_wishbone_user_port_ios(_id, aw, dw):
    return [
        ("user_port_{}".format(_id), 0,
            Subsignal("adr",   Pins(aw)),
            Subsignal("dat_w", Pins(dw)),
            Subsignal("dat_r", Pins(dw)),
            Subsignal("sel",   Pins(dw//8)),
            Subsignal("cyc",   Pins(1)),
            Subsignal("stb",   Pins(1)),
            Subsignal("ack",   Pins(1)),
            Subsignal("we",    Pins(1)),
            Subsignal("err",   Pins(1)),
        ),
    ]

def get_axi_user_port_ios(_id, aw, dw, iw):
    return [
        ("user_port_{}".format(_id), 0,
            # aw
            Subsignal("awvalid", Pins(1)),
            Subsignal("awready", Pins(1)),
            Subsignal("awaddr",  Pins(aw)),
            Subsignal("awburst", Pins(2)),
            Subsignal("awlen",   Pins(8)),
            Subsignal("awsize",  Pins(4)),
            Subsignal("awid",    Pins(iw)),

            # w
            Subsignal("wvalid", Pins(1)),
            Subsignal("wready", Pins(1)),
            Subsignal("wlast",  Pins(1)),
            Subsignal("wstrb",  Pins(dw//8)),
            Subsignal("wdata",  Pins(dw)),

            # b
            Subsignal("bvalid", Pins(1)),
            Subsignal("bready", Pins(1)),
            Subsignal("bresp",  Pins(2)),
            Subsignal("bid",    Pins(iw)),

            # ar
            Subsignal("arvalid", Pins(1)),
            Subsignal("arready", Pins(1)),
            Subsignal("araddr",  Pins(aw)),
            Subsignal("arburst", Pins(2)),
            Subsignal("arlen",   Pins(8)),
            Subsignal("arsize",  Pins(4)),
            Subsignal("arid",    Pins(iw)),

            # r
            Subsignal("rvalid", Pins(1)),
            Subsignal("rready", Pins(1)),
            Subsignal("rlast",  Pins(1)),
            Subsignal("rresp",  Pins(2)),
            Subsignal("rdata",  Pins(dw)),
            Subsignal("rid",    Pins(iw))
        ),
    ]

def get_fifo_user_port_ios(_id, dw):
    return [
        ("user_fifo_{}".format(_id), 0,
            # in
            Subsignal("in_valid", Pins(1)),
            Subsignal("in_ready", Pins(1)),
            Subsignal("in_data",  Pins(dw)),

            # out
            Subsignal("out_valid", Pins(1)),
            Subsignal("out_ready", Pins(1)),
            Subsignal("out_data",  Pins(dw)),
        ),
    ]


class Platform(XilinxPlatform):
    def __init__(self):
        XilinxPlatform.__init__(self, "", io=[], toolchain="vivado")

# CRG ----------------------------------------------------------------------------------------------

class LiteDRAMECP5DDRPHYCRG(Module):
    def __init__(self, platform, core_config):
        self.clock_domains.cd_init    = ClockDomain()
        self.clock_domains.cd_por     = ClockDomain(reset_less=True)
        self.clock_domains.cd_sys     = ClockDomain()
        self.clock_domains.cd_sys2x   = ClockDomain()
        self.clock_domains.cd_sys2x_i = ClockDomain(reset_less=True)

        # # #

        self.stop = Signal()

        # clk / rst
        clk = platform.request("clk")
        rst = platform.request("rst")

        # power on reset
        por_count = Signal(16, reset=2**16-1)
        por_done  = Signal()
        self.comb += self.cd_por.clk.eq(ClockSignal())
        self.comb += por_done.eq(por_count == 0)
        self.sync.por += If(~por_done, por_count.eq(por_count - 1))

        # pll
        self.submodules.pll = pll = ECP5PLL()
        pll.register_clkin(clk, core_config["input_clk_freq"])
        pll.create_clkout(self.cd_sys2x_i, 2*core_config["sys_clk_freq"])
        pll.create_clkout(self.cd_init, core_config["init_clk_freq"])
        self.specials += [
            Instance("ECLKSYNCB",
                i_ECLKI = self.cd_sys2x_i.clk,
                i_STOP  = self.stop,
                o_ECLKO = self.cd_sys2x.clk),
            Instance("CLKDIVF",
                p_DIV     = "2.0",
                i_ALIGNWD = 0,
                i_CLKI    = self.cd_sys2x.clk,
                i_RST     = self.cd_sys2x.rst,
                o_CDIVX   = self.cd_sys.clk),
            AsyncResetSynchronizer(self.cd_init, ~por_done | ~pll.locked | rst),
            AsyncResetSynchronizer(self.cd_sys,  ~por_done | ~pll.locked | rst),
        ]

class LiteDRAMS7DDRPHYCRG(Module):
    def __init__(self, platform, core_config):
        self.clock_domains.cd_sys = ClockDomain()
        if core_config["memtype"] == "DDR3":
            self.clock_domains.cd_sys4x     = ClockDomain(reset_less=True)
            self.clock_domains.cd_sys4x_dqs = ClockDomain(reset_less=True)
        else:
            self.clock_domains.cd_sys2x     = ClockDomain(reset_less=True)
            self.clock_domains.cd_sys2x_dqs = ClockDomain(reset_less=True)
        self.clock_domains.cd_iodelay = ClockDomain()

        # # #

        clk = platform.request("clk200")
        rst = platform.request("cpu_reset")
        # rst_n = platform.request("cpu_reset_n")  # For Genesys2

        self.submodules.sys_pll = sys_pll = S7PLL(speedgrade=core_config["speedgrade"])
        self.comb += sys_pll.reset.eq(rst)
        sys_pll.register_clkin(clk, core_config["input_clk_freq"])
        sys_pll.create_clkout(self.cd_sys, core_config["sys_clk_freq"])
        if core_config["memtype"] == "DDR3":
            sys_pll.create_clkout(self.cd_sys4x, 4*core_config["sys_clk_freq"])
            sys_pll.create_clkout(self.cd_sys4x_dqs, 4*core_config["sys_clk_freq"], phase=90)
        else:
            sys_pll.create_clkout(self.cd_sys2x, 2*core_config["sys_clk_freq"])
            sys_pll.create_clkout(self.cd_sys2x_dqs, 2*core_config["sys_clk_freq"], phase=90)
        self.comb += platform.request("pll_locked").eq(sys_pll.locked)

        sys_pll.create_clkout(self.cd_iodelay, core_config["iodelay_clk_freq"])

        # self.submodules.iodelay_pll = iodelay_pll = S7PLL()
        # self.comb += iodelay_pll.reset.eq(rst)
        # iodelay_pll.register_clkin(clk, core_config["input_clk_freq"])
        # iodelay_pll.create_clkout(self.cd_iodelay, core_config["iodelay_clk_freq"])
        self.submodules.idelayctrl = S7IDELAYCTRL(self.cd_iodelay)

class LiteDRAMUSDDRPHYCRG(Module):
    def __init__(self, platform, core_config):
        self.clock_domains.cd_sys     = ClockDomain()
        self.clock_domains.cd_sys4x   = ClockDomain(reset_less=True)
        self.clock_domains.cd_pll4x   = ClockDomain(reset_less=True)
        self.clock_domains.cd_iodelay = ClockDomain()

        # # #

        self.submodules.pll = pll = USMMCM(speedgrade=-2)
        self.comb += pll.reset.eq(platform.request("cpu_reset"))

        # Assume input clk for US/USPDDRPHY is 125MHz
        pll.register_clkin(platform.request("clk125"), core_config["input_clk_freq"])
        pll.create_clkout(self.cd_pll4x, core_config["sys_clk_freq"]*4, buf=None, with_reset=False)
        pll.create_clkout(self.cd_iodelay, core_config["iodelay_clk_freq"], with_reset=False)

        self.specials += [
            Instance("BUFGCE_DIV", name="main_bufgce_div",
                p_BUFGCE_DIVIDE=4,
                i_CE=1, i_I=self.cd_pll4x.clk, o_O=self.cd_sys.clk),
            Instance("BUFGCE", name="main_bufgce",
                i_CE=1, i_I=self.cd_pll4x.clk, o_O=self.cd_sys4x.clk),
            AsyncResetSynchronizer(self.cd_iodelay, ~pll.locked),
        ]

        self.comb += platform.request("pll_locked").eq(pll.locked)
        self.submodules.idelayctrl = USIDELAYCTRL(cd_ref=self.cd_iodelay, cd_sys=self.cd_sys)

# LiteDRAMCoreControl ------------------------------------------------------------------------------

class LiteDRAMCoreControl(Module, AutoCSR):
    def __init__(self):
        self.init_done  = CSRStorage()
        self.init_error = CSRStorage()

# LiteDRAMCore -------------------------------------------------------------------------------------

class LiteDRAMCore(SoCSDRAM):
    def __init__(self, platform, core_config, **kwargs):
        platform.add_extension(get_common_ios())

        # Parameters -------------------------------------------------------------------------------
        sys_clk_freq = core_config["sys_clk_freq"]
        cpu_type     = core_config["cpu"]
        csr_expose   = core_config.get("csr_expose", False)
        csr_align    = core_config.get("csr_align", 32)
        if cpu_type is None:
            kwargs["integrated_rom_size"]  = 0
            kwargs["integrated_sram_size"] = 0
            kwargs["l2_size"]              = 0
            kwargs["min_l2_data_width"]    = 0
            kwargs["with_uart"]            = False
            kwargs["with_timer"]           = False
            kwargs["with_ctrl"]            = False
            kwargs["with_wishbone"]        = False
        else:
            kwargs["l2_size"]           = 0
            kwargs["min_l2_data_width"] = 0

        # SoCSDRAM ---------------------------------------------------------------------------------
        SoCSDRAM.__init__(self, platform, sys_clk_freq,
            cpu_type       = cpu_type,
            #cpu_variant    = "lite",
            csr_alignment  = csr_align,
            max_sdram_size = 0x01000000, # Only expose 16MB to the CPU, enough for Init/Calib.
            **kwargs)

        # CRG --------------------------------------------------------------------------------------
        if core_config["sdram_phy"] in [litedram_phys.ECP5DDRPHY]:
            self.submodules.crg = crg = LiteDRAMECP5DDRPHYCRG(platform, core_config)
        if core_config["sdram_phy"] in [litedram_phys.A7DDRPHY, litedram_phys.K7DDRPHY, litedram_phys.V7DDRPHY]:
            self.submodules.crg = LiteDRAMS7DDRPHYCRG(platform, core_config)
        if core_config["sdram_phy"] in [litedram_phys.USDDRPHY, litedram_phys.USPDDRPHY]:
            self.submodules.crg = LiteDRAMUSDDRPHYCRG(platform, core_config)

        # DRAM -------------------------------------------------------------------------------------
        # platform.add_extension(get_dram_ios(core_config))
        platform.add_extension(get_dram_ios(core_config))
        # ECP5DDRPHY
        if core_config["sdram_phy"] in  [litedram_phys.ECP5DDRPHY]:
            assert core_config["memtype"] in ["DDR3"]
            self.submodules.ddrphy = core_config["sdram_phy"](
                pads         = platform.request("ddram"),
                sys_clk_freq = sys_clk_freq)
            self.comb += crg.stop.eq(self.ddrphy.init.stop)
            self.add_constant("ECP5DDRPHY")
            sdram_module = core_config["sdram_module"](sys_clk_freq, "1:2")
        # S7DDRPHY
        if core_config["sdram_phy"] in [litedram_phys.A7DDRPHY, litedram_phys.K7DDRPHY, litedram_phys.V7DDRPHY]:
            assert core_config["memtype"] in ["DDR2", "DDR3"]
            self.submodules.ddrphy = core_config["sdram_phy"](
                pads             = platform.request("ddram"),
                memtype          = core_config["memtype"],
                nphases          = 4 if core_config["memtype"] == "DDR3" else 2,
                sys_clk_freq     = sys_clk_freq,
                iodelay_clk_freq = core_config["iodelay_clk_freq"],
                cmd_latency      = core_config["cmd_latency"])
            self.add_constant("CMD_DELAY", core_config["cmd_delay"])
            if core_config["memtype"] == "DDR3":
                self.ddrphy.settings.add_electrical_settings(
                    rtt_nom = core_config["rtt_nom"],
                    rtt_wr  = core_config["rtt_wr"],
                    ron     = core_config["ron"])
        # USDDRPHY
        if core_config["sdram_phy"] in [litedram_phys.USDDRPHY, litedram_phys.USPDDRPHY]:
            assert core_config["memtype"] in ["DDR3", "DDR4"]
            ddram_pads = platform.request("ddram")
            # TODO make it configurable
            ddram_pads = PHYPadsReducer(ddram_pads, modules=[0, 1, 2, 3])
            self.submodules.ddrphy = core_config["sdram_phy"](
                pads             = ddram_pads,
                memtype          = core_config["memtype"],
                sys_clk_freq     = sys_clk_freq,
                iodelay_clk_freq = core_config["iodelay_clk_freq"],
                cmd_latency      = core_config["cmd_latency"])
            self.add_constant("USDDRPHY_DEBUG")

        self.add_csr("ddrphy")

        sdram_module = core_config["sdram_module"](sys_clk_freq,
            "1:4" if core_config["memtype"] == "DDR3" else "1:2")
        controller_settings = controller_settings=ControllerSettings(
            cmd_buffer_depth=core_config["cmd_buffer_depth"])

        #print("Before register, submodules are")
        #print(self._submodules)

        self.register_sdram(self.ddrphy,
            geom_settings       = sdram_module.geom_settings,
            timing_settings     = sdram_module.timing_settings,
            controller_settings = controller_settings)


        #feig Print out the PHY submodule
        # verilog.convert(self.ddrphy).write("DDRPHY.v")        
        #print("After register, submodules are")
        #print(self._submodules)

        # DRAM Initialization ----------------------------------------------------------------------
        self.submodules.ddrctrl = LiteDRAMCoreControl()
        self.add_csr("ddrctrl")
        self.comb += [
            platform.request("init_done").eq(self.ddrctrl.init_done.storage),
            platform.request("init_error").eq(self.ddrctrl.init_error.storage)
        ]

        #print("Before setting up controller, submodules are")
        #print(self._submodules)

        print("Crossbar has {} master ports".format(len(self.sdram.crossbar.masters)))

        # CSR port ---------------------------------------------------------------------------------
        if csr_expose:
            csr_port = csr_bus.Interface(
                address_width = self.csr_address_width,
                data_width    = self.csr_data_width)
            self.add_csr_master(csr_port)
            platform.add_extension(get_csr_ios(self.csr_address_width, self.csr_data_width))
            _csr_port_io = platform.request("csr_port", 0)
            self.comb += [
                csr_port.adr.eq(_csr_port_io.adr),
                csr_port.we.eq(_csr_port_io.we),
                csr_port.dat_w.eq(_csr_port_io.dat_w),
                _csr_port_io.dat_r.eq(csr_port.dat_r),
            ]
            if self.cpu_type == None:
                csr_base = core_config.get("csr_base", 0)
                self.shadow_base = csr_base;

        # User ports -------------------------------------------------------------------------------
        self.comb += [
            platform.request("user_clk").eq(ClockSignal()),
            platform.request("user_rst").eq(ResetSignal())
        ]
        for name, port in core_config["user_ports"].items():
            # Native -------------------------------------------------------------------------------
            if port["type"] == "native":
                user_port = self.sdram.crossbar.get_port()
                platform.add_extension(get_native_user_port_ios(name,
                    user_port.address_width,
                    user_port.data_width))
                _user_port_io = platform.request("user_port_{}".format(name))
                self.comb += [
                    # cmd
                    user_port.cmd.valid.eq(_user_port_io.cmd_valid),
                    _user_port_io.cmd_ready.eq(user_port.cmd.ready),
                    user_port.cmd.we.eq(_user_port_io.cmd_we),
                    user_port.cmd.addr.eq(_user_port_io.cmd_addr),

                    # wdata
                    user_port.wdata.valid.eq(_user_port_io.wdata_valid),
                    _user_port_io.wdata_ready.eq(user_port.wdata.ready),
                    user_port.wdata.we.eq(_user_port_io.wdata_we),
                    user_port.wdata.data.eq(_user_port_io.wdata_data),

                    # rdata
                    _user_port_io.rdata_valid.eq(user_port.rdata.valid),
                    user_port.rdata.ready.eq(_user_port_io.rdata_ready),
                    _user_port_io.rdata_data.eq(user_port.rdata.data),
                ]
            # Wishbone -----------------------------------------------------------------------------
            elif port["type"] == "wishbone":
                user_port = self.sdram.crossbar.get_port()
                wb_port = wishbone.Interface(
                    user_port.data_width,
                    user_port.address_width)
                wishbone2native = LiteDRAMWishbone2Native(wb_port, user_port)
                self.submodules += wishbone2native
                platform.add_extension(get_wishbone_user_port_ios(name,
                        len(wb_port.adr),
                        len(wb_port.dat_w)))
                _wb_port_io = platform.request("user_port_{}".format(name))
                self.comb += [
                    wb_port.adr.eq(_wb_port_io.adr),
                    wb_port.dat_w.eq(_wb_port_io.dat_w),
                    _wb_port_io.dat_r.eq(wb_port.dat_r),
                    wb_port.sel.eq(_wb_port_io.sel),
                    wb_port.cyc.eq(_wb_port_io.cyc),
                    wb_port.stb.eq(_wb_port_io.stb),
                    _wb_port_io.ack.eq(wb_port.ack),
                    wb_port.we.eq(_wb_port_io.we),
                    _wb_port_io.err.eq(wb_port.err),
                ]
            # AXI ----------------------------------------------------------------------------------
            elif port["type"] == "axi":
                user_port = self.sdram.crossbar.get_port()
                axi_port  = LiteDRAMAXIPort(
                    user_port.data_width,
                    user_port.address_width + log2_int(user_port.data_width//8),
                    port["id_width"])
                axi2native = LiteDRAMAXI2Native(axi_port, user_port)
                self.submodules += axi2native
                platform.add_extension(get_axi_user_port_ios(name,
                        axi_port.address_width,
                        axi_port.data_width,
                        port["id_width"]))
                _axi_port_io = platform.request("user_port_{}".format(name))
                self.comb += [
                    # aw
                    axi_port.aw.valid.eq(_axi_port_io.awvalid),
                    _axi_port_io.awready.eq(axi_port.aw.ready),
                    axi_port.aw.addr.eq(_axi_port_io.awaddr),
                    axi_port.aw.burst.eq(_axi_port_io.awburst),
                    axi_port.aw.len.eq(_axi_port_io.awlen),
                    axi_port.aw.size.eq(_axi_port_io.awsize),
                    axi_port.aw.id.eq(_axi_port_io.awid),

                    # w
                    axi_port.w.valid.eq(_axi_port_io.wvalid),
                    _axi_port_io.wready.eq(axi_port.w.ready),
                    axi_port.w.last.eq(_axi_port_io.wlast),
                    axi_port.w.strb.eq(_axi_port_io.wstrb),
                    axi_port.w.data.eq(_axi_port_io.wdata),

                    # b
                    _axi_port_io.bvalid.eq(axi_port.b.valid),
                    axi_port.b.ready.eq(_axi_port_io.bready),
                    _axi_port_io.bresp.eq(axi_port.b.resp),
                    _axi_port_io.bid.eq(axi_port.b.id),

                    # ar
                    axi_port.ar.valid.eq(_axi_port_io.arvalid),
                    _axi_port_io.arready.eq(axi_port.ar.ready),
                    axi_port.ar.addr.eq(_axi_port_io.araddr),
                    axi_port.ar.burst.eq(_axi_port_io.arburst),
                    axi_port.ar.len.eq(_axi_port_io.arlen),
                    axi_port.ar.size.eq(_axi_port_io.arsize),
                    axi_port.ar.id.eq(_axi_port_io.arid),

                    # r
                    _axi_port_io.rvalid.eq(axi_port.r.valid),
                    axi_port.r.ready.eq(_axi_port_io.rready),
                    _axi_port_io.rlast.eq(axi_port.r.last),
                    _axi_port_io.rresp.eq(axi_port.r.resp),
                    _axi_port_io.rdata.eq(axi_port.r.data),
                    _axi_port_io.rid.eq(axi_port.r.id),
                ]
            # FIFO ---------------------------------------------------------------------------------
            elif port["type"] == "fifo":
                platform.add_extension(get_fifo_user_port_ios(name, user_port.data_width))
                _user_fifo_io = platform.request("user_fifo_{}".format(name))
                fifo = LiteDRAMFIFO(
                    data_width      = user_port.data_width,
                    base            = port["base"],
                    depth           = port["depth"],
                    write_port      = self.sdram.crossbar.get_port("write"),
                    write_threshold = port["depth"] - 32, # FIXME
                    read_port       = self.sdram.crossbar.get_port("read"),
                    read_threshold  = 32 # FIXME
                )
                self.submodules += fifo
                self.comb += [
                    # in
                    fifo.sink.valid.eq(_user_fifo_io.in_valid),
                    _user_fifo_io.in_ready.eq(fifo.sink.ready),
                    fifo.sink.data.eq(_user_fifo_io.in_data),

                    # out
                    _user_fifo_io.out_valid.eq(fifo.source.valid),
                    fifo.source.ready.eq(_user_fifo_io.out_ready),
                    _user_fifo_io.out_data.eq(fifo.source.data),
                ]
            else:
                raise ValueError("Unsupported port type: {}".format(port["type"]))
        
            print("Crossbar has {} master ports".format(len(self.sdram.crossbar.masters)))
        
        ## ComputeDRAM ports
        # print (self._submodules)
        self.comb += [
            self.sdram.R1.eq(platform.request("ComputeDRAM_R1")),
            self.sdram.R2.eq(platform.request("ComputeDRAM_R2")),
            self.sdram.T1.eq(platform.request("ComputeDRAM_T1")),
            self.sdram.T2.eq(platform.request("ComputeDRAM_T2")),
            self.sdram.vld.eq(platform.request("ComputeDRAM_vld")),
            platform.request("ComputeDRAM_rdy").eq(self.sdram.rdy)
        ]



# Build --------------------------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(description="LiteDRAM standalone core generator")
    builder_args(parser)
    parser.set_defaults(output_dir="build")
    parser.add_argument("config", help="YAML config file")
    args = parser.parse_args()
    core_config = yaml.load(open(args.config).read(), Loader=yaml.Loader)

    # Convert YAML elements to Python/LiteX --------------------------------------------------------
    for k, v in core_config.items():
        replaces = {"False": False, "True": True, "None": None}
        for r in replaces.keys():
            if v == r:
                core_config[k] = replaces[r]
        if "clk_freq" in k:
            core_config[k] = float(core_config[k])
        if k == "sdram_module":
            core_config[k] = getattr(litedram_modules, core_config[k])
        if k == "sdram_phy":
            core_config[k] = getattr(litedram_phys, core_config[k])

    # Generate core --------------------------------------------------------------------------------
    platform = vcu118.Platform()
    '''
    if core_config["sdram_phy"] in [litedram_phys.ECP5DDRPHY]:
        platform = LatticePlatform("LFE5UM5G-45F-8BG381C", io=[], toolchain="trellis") # FIXME: allow other devices.
    elif core_config["sdram_phy"] in [litedram_phys.A7DDRPHY, litedram_phys.K7DDRPHY, litedram_phys.V7DDRPHY]:
        platform = XilinxPlatform("", io=[], toolchain="vivado")
    else:
        raise ValueError("Unsupported SDRAM PHY: {}".format(core_config["sdram_phy"]))
    '''

    builder_arguments = builder_argdict(args)
    builder_arguments["compile_gateware"] = False

    soc      = LiteDRAMCore(platform, core_config, integrated_rom_size=0x6000)
    builder  = Builder(soc, **builder_arguments)
    vns      = builder.build(build_name="litedram_core", regular_comb=False)

    if soc.cpu_type is not None:
        init_filename = "mem.init"
        os.system("mv {} {}".format(
            os.path.join(builder.gateware_dir, init_filename),
            os.path.join(builder.gateware_dir, "litedram_core.init"),
        ))
        replace_in_file(os.path.join(builder.gateware_dir, "litedram_core.v"), init_filename, "litedram_core.init")

if __name__ == "__main__":
    main()
