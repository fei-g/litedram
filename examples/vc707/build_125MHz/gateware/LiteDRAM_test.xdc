## serial:0.rx
set_property PACKAGE_PIN AU33 [get_ports serial_rx]
set_property IOSTANDARD LVCMOS18 [get_ports serial_rx]
## serial:0.tx
set_property PACKAGE_PIN AU36 [get_ports serial_tx]
set_property IOSTANDARD LVCMOS18 [get_ports serial_tx]
## clk200:0.p
set_property IOSTANDARD LVDS [get_ports clk200_p]
## clk200:0.n
set_property PACKAGE_PIN E19 [get_ports clk200_p]
set_property PACKAGE_PIN E18 [get_ports clk200_n]
set_property IOSTANDARD LVDS [get_ports clk200_n]
## cpu_reset:0
set_property PACKAGE_PIN AV40 [get_ports cpu_reset]
set_property IOSTANDARD LVCMOS18 [get_ports cpu_reset]

## DDR PINs
## ddram:0.a
set_property PACKAGE_PIN A20 [get_ports {ddram_a[0]}]
set_property SLEW FAST [get_ports {ddram_a[0]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[0]}]
## ddram:0.a
set_property PACKAGE_PIN B19 [get_ports {ddram_a[1]}]
set_property SLEW FAST [get_ports {ddram_a[1]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[1]}]
## ddram:0.a
set_property PACKAGE_PIN C20 [get_ports {ddram_a[2]}]
set_property SLEW FAST [get_ports {ddram_a[2]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[2]}]
## ddram:0.a
set_property PACKAGE_PIN A19 [get_ports {ddram_a[3]}]
set_property SLEW FAST [get_ports {ddram_a[3]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[3]}]
## ddram:0.a
set_property PACKAGE_PIN A17 [get_ports {ddram_a[4]}]
set_property SLEW FAST [get_ports {ddram_a[4]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[4]}]
## ddram:0.a
set_property PACKAGE_PIN A16 [get_ports {ddram_a[5]}]
set_property SLEW FAST [get_ports {ddram_a[5]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[5]}]
## ddram:0.a
set_property PACKAGE_PIN D20 [get_ports {ddram_a[6]}]
set_property SLEW FAST [get_ports {ddram_a[6]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[6]}]
## ddram:0.a
set_property PACKAGE_PIN C18 [get_ports {ddram_a[7]}]
set_property SLEW FAST [get_ports {ddram_a[7]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[7]}]
## ddram:0.a
set_property PACKAGE_PIN D17 [get_ports {ddram_a[8]}]
set_property SLEW FAST [get_ports {ddram_a[8]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[8]}]
## ddram:0.a
set_property PACKAGE_PIN C19 [get_ports {ddram_a[9]}]
set_property SLEW FAST [get_ports {ddram_a[9]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[9]}]
## ddram:0.a
set_property PACKAGE_PIN B21 [get_ports {ddram_a[10]}]
set_property SLEW FAST [get_ports {ddram_a[10]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[10]}]
## ddram:0.a
set_property PACKAGE_PIN B17 [get_ports {ddram_a[11]}]
set_property SLEW FAST [get_ports {ddram_a[11]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[11]}]
## ddram:0.a
set_property PACKAGE_PIN A15 [get_ports {ddram_a[12]}]
set_property SLEW FAST [get_ports {ddram_a[12]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[12]}]
## ddram:0.a
set_property PACKAGE_PIN A21 [get_ports {ddram_a[13]}]
set_property SLEW FAST [get_ports {ddram_a[13]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[13]}]
## ddram:0.a
set_property PACKAGE_PIN F17 [get_ports {ddram_a[14]}]
set_property SLEW FAST [get_ports {ddram_a[14]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[14]}]
## ddram:0.a
set_property PACKAGE_PIN E17 [get_ports {ddram_a[15]}]
set_property SLEW FAST [get_ports {ddram_a[15]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_a[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[15]}]
## ddram:0.ba
set_property PACKAGE_PIN D21 [get_ports {ddram_ba[0]}]
set_property SLEW FAST [get_ports {ddram_ba[0]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[0]}]
## ddram:0.ba
set_property PACKAGE_PIN C21 [get_ports {ddram_ba[1]}]
set_property SLEW FAST [get_ports {ddram_ba[1]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[1]}]
## ddram:0.ba
set_property PACKAGE_PIN D18 [get_ports {ddram_ba[2]}]
set_property SLEW FAST [get_ports {ddram_ba[2]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[2]}]
## ddram:0.ras_n
set_property PACKAGE_PIN E20 [get_ports ddram_ras_n]
set_property SLEW FAST [get_ports ddram_ras_n]
set_property VCCAUX_IO HIGH [get_ports ddram_ras_n]
set_property IOSTANDARD SSTL15 [get_ports ddram_ras_n]
## ddram:0.cas_n
set_property PACKAGE_PIN K17 [get_ports ddram_cas_n]
set_property SLEW FAST [get_ports ddram_cas_n]
set_property VCCAUX_IO HIGH [get_ports ddram_cas_n]
set_property IOSTANDARD SSTL15 [get_ports ddram_cas_n]
## ddram:0.we_n
set_property PACKAGE_PIN F20 [get_ports ddram_we_n]
set_property SLEW FAST [get_ports ddram_we_n]
set_property VCCAUX_IO HIGH [get_ports ddram_we_n]
set_property IOSTANDARD SSTL15 [get_ports ddram_we_n]
## ddram:0.cs_n
set_property PACKAGE_PIN J17 [get_ports ddram_cs_n]
set_property SLEW FAST [get_ports ddram_cs_n]
set_property VCCAUX_IO HIGH [get_ports ddram_cs_n]
set_property IOSTANDARD SSTL15 [get_ports ddram_cs_n]
## ddram:0.dm
set_property PACKAGE_PIN M13 [get_ports {ddram_dm[0]}]
set_property SLEW FAST [get_ports {ddram_dm[0]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[0]}]
## ddram:0.dm
set_property PACKAGE_PIN K15 [get_ports {ddram_dm[1]}]
set_property SLEW FAST [get_ports {ddram_dm[1]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[1]}]
## ddram:0.dm
set_property PACKAGE_PIN F12 [get_ports {ddram_dm[2]}]
set_property SLEW FAST [get_ports {ddram_dm[2]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dm[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[2]}]
## ddram:0.dm
set_property PACKAGE_PIN A14 [get_ports {ddram_dm[3]}]
set_property SLEW FAST [get_ports {ddram_dm[3]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dm[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[3]}]
## ddram:0.dq
set_property PACKAGE_PIN N14 [get_ports {ddram_dq[0]}]
set_property SLEW FAST [get_ports {ddram_dq[0]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[0]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[0]}]
## ddram:0.dq
set_property PACKAGE_PIN N13 [get_ports {ddram_dq[1]}]
set_property SLEW FAST [get_ports {ddram_dq[1]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[1]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[1]}]
## ddram:0.dq
set_property PACKAGE_PIN L14 [get_ports {ddram_dq[2]}]
set_property SLEW FAST [get_ports {ddram_dq[2]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[2]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[2]}]
## ddram:0.dq
set_property PACKAGE_PIN M14 [get_ports {ddram_dq[3]}]
set_property SLEW FAST [get_ports {ddram_dq[3]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[3]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[3]}]
## ddram:0.dq
set_property PACKAGE_PIN M12 [get_ports {ddram_dq[4]}]
set_property SLEW FAST [get_ports {ddram_dq[4]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[4]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[4]}]
## ddram:0.dq
set_property PACKAGE_PIN N15 [get_ports {ddram_dq[5]}]
set_property SLEW FAST [get_ports {ddram_dq[5]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[5]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[5]}]
## ddram:0.dq
set_property PACKAGE_PIN M11 [get_ports {ddram_dq[6]}]
set_property SLEW FAST [get_ports {ddram_dq[6]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[6]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[6]}]
## ddram:0.dq
set_property PACKAGE_PIN L12 [get_ports {ddram_dq[7]}]
set_property SLEW FAST [get_ports {ddram_dq[7]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[7]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[7]}]
## ddram:0.dq
set_property PACKAGE_PIN K14 [get_ports {ddram_dq[8]}]
set_property SLEW FAST [get_ports {ddram_dq[8]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[8]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[8]}]
## ddram:0.dq
set_property PACKAGE_PIN K13 [get_ports {ddram_dq[9]}]
set_property SLEW FAST [get_ports {ddram_dq[9]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[9]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[9]}]
## ddram:0.dq
set_property PACKAGE_PIN H13 [get_ports {ddram_dq[10]}]
set_property SLEW FAST [get_ports {ddram_dq[10]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[10]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[10]}]
## ddram:0.dq
set_property PACKAGE_PIN J13 [get_ports {ddram_dq[11]}]
set_property SLEW FAST [get_ports {ddram_dq[11]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[11]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[11]}]
## ddram:0.dq
set_property PACKAGE_PIN L16 [get_ports {ddram_dq[12]}]
set_property SLEW FAST [get_ports {ddram_dq[12]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[12]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[12]}]
## ddram:0.dq
set_property PACKAGE_PIN L15 [get_ports {ddram_dq[13]}]
set_property SLEW FAST [get_ports {ddram_dq[13]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[13]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[13]}]
## ddram:0.dq
set_property PACKAGE_PIN H14 [get_ports {ddram_dq[14]}]
set_property SLEW FAST [get_ports {ddram_dq[14]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[14]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[14]}]
## ddram:0.dq
set_property PACKAGE_PIN J15 [get_ports {ddram_dq[15]}]
set_property SLEW FAST [get_ports {ddram_dq[15]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[15]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[15]}]
## ddram:0.dq
set_property PACKAGE_PIN E15 [get_ports {ddram_dq[16]}]
set_property SLEW FAST [get_ports {ddram_dq[16]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[16]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[16]}]
## ddram:0.dq
set_property PACKAGE_PIN E13 [get_ports {ddram_dq[17]}]
set_property SLEW FAST [get_ports {ddram_dq[17]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[17]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[17]}]
## ddram:0.dq
set_property PACKAGE_PIN F15 [get_ports {ddram_dq[18]}]
set_property SLEW FAST [get_ports {ddram_dq[18]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[18]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[18]}]
## ddram:0.dq
set_property PACKAGE_PIN E14 [get_ports {ddram_dq[19]}]
set_property SLEW FAST [get_ports {ddram_dq[19]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[19]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[19]}]
## ddram:0.dq
set_property PACKAGE_PIN G13 [get_ports {ddram_dq[20]}]
set_property SLEW FAST [get_ports {ddram_dq[20]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[20]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[20]}]
## ddram:0.dq
set_property PACKAGE_PIN G12 [get_ports {ddram_dq[21]}]
set_property SLEW FAST [get_ports {ddram_dq[21]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[21]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[21]}]
## ddram:0.dq
set_property PACKAGE_PIN F14 [get_ports {ddram_dq[22]}]
set_property SLEW FAST [get_ports {ddram_dq[22]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[22]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[22]}]
## ddram:0.dq
set_property PACKAGE_PIN G14 [get_ports {ddram_dq[23]}]
set_property SLEW FAST [get_ports {ddram_dq[23]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[23]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[23]}]
## ddram:0.dq
set_property PACKAGE_PIN B14 [get_ports {ddram_dq[24]}]
set_property SLEW FAST [get_ports {ddram_dq[24]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[24]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[24]}]
## ddram:0.dq
set_property PACKAGE_PIN C13 [get_ports {ddram_dq[25]}]
set_property SLEW FAST [get_ports {ddram_dq[25]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[25]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[25]}]
## ddram:0.dq
set_property PACKAGE_PIN B16 [get_ports {ddram_dq[26]}]
set_property SLEW FAST [get_ports {ddram_dq[26]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[26]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[26]}]
## ddram:0.dq
set_property PACKAGE_PIN D15 [get_ports {ddram_dq[27]}]
set_property SLEW FAST [get_ports {ddram_dq[27]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[27]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[27]}]
## ddram:0.dq
set_property PACKAGE_PIN D13 [get_ports {ddram_dq[28]}]
set_property SLEW FAST [get_ports {ddram_dq[28]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[28]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[28]}]
## ddram:0.dq
set_property PACKAGE_PIN E12 [get_ports {ddram_dq[29]}]
set_property SLEW FAST [get_ports {ddram_dq[29]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[29]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[29]}]
## ddram:0.dq
set_property PACKAGE_PIN C16 [get_ports {ddram_dq[30]}]
set_property SLEW FAST [get_ports {ddram_dq[30]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[30]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[30]}]
## ddram:0.dq
set_property PACKAGE_PIN D16 [get_ports {ddram_dq[31]}]
set_property SLEW FAST [get_ports {ddram_dq[31]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dq[31]}]
set_property IOSTANDARD SSTL15_T_DCI [get_ports {ddram_dq[31]}]
## ddram:0.dqs_p
set_property SLEW FAST [get_ports {ddram_dqs_p[0]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[0]}]
## ddram:0.dqs_p
set_property SLEW FAST [get_ports {ddram_dqs_p[1]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[1]}]
## ddram:0.dqs_p
set_property SLEW FAST [get_ports {ddram_dqs_p[2]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dqs_p[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[2]}]
## ddram:0.dqs_p
set_property SLEW FAST [get_ports {ddram_dqs_p[3]}]
set_property VCCAUX_IO HIGH [get_ports {ddram_dqs_p[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[3]}]
## ddram:0.dqs_n
set_property PACKAGE_PIN N16 [get_ports {ddram_dqs_p[0]}]
set_property PACKAGE_PIN M16 [get_ports {ddram_dqs_n[0]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[0]}]
## ddram:0.dqs_n
set_property PACKAGE_PIN K12 [get_ports {ddram_dqs_p[1]}]
set_property PACKAGE_PIN J12 [get_ports {ddram_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[1]}]
## ddram:0.dqs_n
set_property PACKAGE_PIN H16 [get_ports {ddram_dqs_p[2]}]
set_property PACKAGE_PIN G16 [get_ports {ddram_dqs_n[2]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[2]}]
## ddram:0.dqs_n
set_property PACKAGE_PIN C15 [get_ports {ddram_dqs_p[3]}]
set_property PACKAGE_PIN C14 [get_ports {ddram_dqs_n[3]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[3]}]
## ddram:0.clk_p
set_property SLEW FAST [get_ports ddram_clk_p]
set_property VCCAUX_IO HIGH [get_ports ddram_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports ddram_clk_p]
## ddram:0.clk_n
set_property PACKAGE_PIN H19 [get_ports ddram_clk_p]
set_property PACKAGE_PIN G18 [get_ports ddram_clk_n]
set_property SLEW FAST [get_ports ddram_clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports ddram_clk_n]
## ddram:0.cke
set_property PACKAGE_PIN K19 [get_ports ddram_cke]
set_property SLEW FAST [get_ports ddram_cke]
set_property VCCAUX_IO HIGH [get_ports ddram_cke]
set_property IOSTANDARD SSTL15 [get_ports ddram_cke]
## ddram:0.odt
set_property PACKAGE_PIN H20 [get_ports ddram_odt]
set_property SLEW FAST [get_ports ddram_odt]
set_property VCCAUX_IO HIGH [get_ports ddram_odt]
set_property IOSTANDARD SSTL15 [get_ports ddram_odt]
## ddram:0.reset_n
set_property PACKAGE_PIN C29 [get_ports ddram_reset_n]
set_property SLEW FAST [get_ports ddram_reset_n]
set_property VCCAUX_IO HIGH [get_ports ddram_reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports ddram_reset_n]


set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[7]}]


## read btnu
set_property PACKAGE_PIN AR40 [get_ports start_read]
set_property IOSTANDARD LVCMOS18 [get_ports start_read]
## write btnd
set_property PACKAGE_PIN AP40 [get_ports start_write]
set_property IOSTANDARD LVCMOS18 [get_ports start_write]
## home btnc
set_property PACKAGE_PIN AV39 [get_ports home]
set_property IOSTANDARD LVCMOS18 [get_ports home]
## next btnr
set_property PACKAGE_PIN AU38 [get_ports next]
set_property IOSTANDARD LVCMOS18 [get_ports next]
## prev btnl
set_property PACKAGE_PIN AW40 [get_ports prev]
set_property IOSTANDARD LVCMOS18 [get_ports prev]




set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]


create_clock -period 5.000 -name clk200_p [get_nets clk200_p]




connect_debug_port dbg_hub/clk [get_nets u_ila_0_sys4x_clk]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list litedram_core_impl/user_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list litedram_core_impl/v7ddrphy_dfi_p0_cas_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list litedram_core_impl/v7ddrphy_dfi_p0_ras_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list litedram_core_impl/v7ddrphy_dfi_p0_we_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list litedram_core_impl/v7ddrphy_dfi_p0_wrdata_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets user_clk]
