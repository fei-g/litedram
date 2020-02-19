from migen import *

from litex.soc.interconnect.csr import AutoCSR

from litedram.dfii import DFIInjector
from litedram.core.controller import ControllerSettings, LiteDRAMController
from litedram.core.crossbar import LiteDRAMCrossbar

# Core ---------------------------------------------------------------------------------------------

class LiteDRAMCore(Module, AutoCSR):
    def __init__(self, phy, geom_settings, timing_settings, clk_freq, **kwargs):
        self.submodules.dfii = DFIInjector(
            addressbits = geom_settings.addressbits,
            bankbits    = geom_settings.bankbits,
            nranks      = phy.settings.nranks,
            databits    = phy.settings.dfi_databits,
            nphases     = phy.settings.nphases)
        self.comb += self.dfii.master.connect(phy.dfi)

        self.submodules.controller = controller = LiteDRAMController(
            phy_settings    = phy.settings,
            geom_settings   = geom_settings,
            timing_settings = timing_settings,
            clk_freq        = clk_freq,
            **kwargs)
        self.comb += controller.dfi.connect(self.dfii.slave)

        self.submodules.crossbar = LiteDRAMCrossbar(controller.interface)

        # Instantiate ComputeDRAM sequence generator 
        self.R1 = Signal(geom_settings.addressbits)
        self.R2 = Signal(geom_settings.addressbits)
        self.T1 = Signal(4)
        self.T2 = Signal(4)
        self.vld = Signal()
        self.rdy = Signal()
        self.specials.seqgen = Instance( "ComputeDRAM_FSM",
            i_clk               = ClockSignal(),
            i_rst               = ResetSignal(),

            i_vld               = self.vld,
            o_rdy               = self.rdy,

            i_R1                = self.R1,
            i_R2                = self.R2,
            i_T1                = self.T1,
            i_T2                = self.T2,

            o_cmd_valid         = self.dfii.cmd_valid,

            ## R1, R2, T1, T2
            o_k7ddrphy_dfi_p0_address           = self.dfii.cmds.phases[0].address     ,
            o_k7ddrphy_dfi_p0_bank              = self.dfii.cmds.phases[0].bank        ,
            o_k7ddrphy_dfi_p0_cas_n             = self.dfii.cmds.phases[0].cas_n       ,
            o_k7ddrphy_dfi_p0_cs_n              = self.dfii.cmds.phases[0].cs_n        ,
            o_k7ddrphy_dfi_p0_ras_n             = self.dfii.cmds.phases[0].ras_n       ,
            o_k7ddrphy_dfi_p0_we_n              = self.dfii.cmds.phases[0].we_n        ,
            o_k7ddrphy_dfi_p0_cke               = self.dfii.cmds.phases[0].cke         ,
            o_k7ddrphy_dfi_p0_odt               = self.dfii.cmds.phases[0].odt         ,
            o_k7ddrphy_dfi_p0_reset_n           = self.dfii.cmds.phases[0].reset_n     ,
            o_k7ddrphy_dfi_p0_wrdata            = self.dfii.cmds.phases[0].wrdata      ,
            o_k7ddrphy_dfi_p0_wrdata_mask       = self.dfii.cmds.phases[0].wrdata_mask ,

            o_k7ddrphy_dfi_p1_address           = self.dfii.cmds.phases[1].address     ,
            o_k7ddrphy_dfi_p1_bank              = self.dfii.cmds.phases[1].bank        ,
            o_k7ddrphy_dfi_p1_cas_n             = self.dfii.cmds.phases[1].cas_n       ,
            o_k7ddrphy_dfi_p1_cs_n              = self.dfii.cmds.phases[1].cs_n        ,
            o_k7ddrphy_dfi_p1_ras_n             = self.dfii.cmds.phases[1].ras_n       ,
            o_k7ddrphy_dfi_p1_we_n              = self.dfii.cmds.phases[1].we_n        ,
            o_k7ddrphy_dfi_p1_cke               = self.dfii.cmds.phases[1].cke         ,
            o_k7ddrphy_dfi_p1_odt               = self.dfii.cmds.phases[1].odt         ,
            o_k7ddrphy_dfi_p1_reset_n           = self.dfii.cmds.phases[1].reset_n     ,
            o_k7ddrphy_dfi_p1_wrdata            = self.dfii.cmds.phases[1].wrdata      ,
            o_k7ddrphy_dfi_p1_wrdata_mask       = self.dfii.cmds.phases[1].wrdata_mask ,

            o_k7ddrphy_dfi_p2_address           = self.dfii.cmds.phases[2].address     ,
            o_k7ddrphy_dfi_p2_bank              = self.dfii.cmds.phases[2].bank        ,
            o_k7ddrphy_dfi_p2_cas_n             = self.dfii.cmds.phases[2].cas_n       ,
            o_k7ddrphy_dfi_p2_cs_n              = self.dfii.cmds.phases[2].cs_n        ,
            o_k7ddrphy_dfi_p2_ras_n             = self.dfii.cmds.phases[2].ras_n       ,
            o_k7ddrphy_dfi_p2_we_n              = self.dfii.cmds.phases[2].we_n        ,
            o_k7ddrphy_dfi_p2_cke               = self.dfii.cmds.phases[2].cke         ,
            o_k7ddrphy_dfi_p2_odt               = self.dfii.cmds.phases[2].odt         ,
            o_k7ddrphy_dfi_p2_reset_n           = self.dfii.cmds.phases[2].reset_n     ,
            o_k7ddrphy_dfi_p2_wrdata            = self.dfii.cmds.phases[2].wrdata      ,
            o_k7ddrphy_dfi_p2_wrdata_mask       = self.dfii.cmds.phases[2].wrdata_mask ,
            o_k7ddrphy_dfi_p2_rddata_en         = self.dfii.cmds.phases[2].rddata_en   ,

            o_k7ddrphy_dfi_p3_address           = self.dfii.cmds.phases[3].address     ,
            o_k7ddrphy_dfi_p3_bank              = self.dfii.cmds.phases[3].bank        ,
            o_k7ddrphy_dfi_p3_cas_n             = self.dfii.cmds.phases[3].cas_n       ,
            o_k7ddrphy_dfi_p3_cs_n              = self.dfii.cmds.phases[3].cs_n        ,
            o_k7ddrphy_dfi_p3_ras_n             = self.dfii.cmds.phases[3].ras_n       ,
            o_k7ddrphy_dfi_p3_we_n              = self.dfii.cmds.phases[3].we_n        ,
            o_k7ddrphy_dfi_p3_cke               = self.dfii.cmds.phases[3].cke         ,
            o_k7ddrphy_dfi_p3_odt               = self.dfii.cmds.phases[3].odt         ,
            o_k7ddrphy_dfi_p3_reset_n           = self.dfii.cmds.phases[3].reset_n     ,
            o_k7ddrphy_dfi_p3_wrdata            = self.dfii.cmds.phases[3].wrdata      ,
            o_k7ddrphy_dfi_p3_wrdata_en         = self.dfii.cmds.phases[3].wrdata_en   ,
            o_k7ddrphy_dfi_p3_wrdata_mask       = self.dfii.cmds.phases[3].wrdata_mask 

            
        )
