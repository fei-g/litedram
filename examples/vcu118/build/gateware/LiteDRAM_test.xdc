# UART port
# serial:0.rx
set_property LOC AW25 [get_ports serial_rx]
set_property IOSTANDARD LVCMOS18 [get_ports serial_rx]

# serial:0.tx
set_property LOC BB21 [get_ports serial_tx]
set_property IOSTANDARD LVCMOS18 [get_ports serial_tx]

# Reset and CLK
# cpu_reset:0
set_property LOC L19 [get_ports cpu_reset]
set_property IOSTANDARD LVCMOS12 [get_ports cpu_reset]

# clk125:0.p
set_property LOC AY24 [get_ports clk125_p]
set_property IOSTANDARD LVDS [get_ports clk125_p]

# clk125:0.n
set_property LOC AY23 [get_ports clk125_n]
set_property IOSTANDARD LVDS [get_ports clk125_n]

# DDRAM
# ddram:0.a
set_property LOC AM27 [get_ports ddram_a[0]]
set_property SLEW FAST [get_ports ddram_a[0]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[0]]

# ddram:0.a
set_property LOC AL27 [get_ports ddram_a[1]]
set_property SLEW FAST [get_ports ddram_a[1]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[1]]

# ddram:0.a
set_property LOC AP26 [get_ports ddram_a[2]]
set_property SLEW FAST [get_ports ddram_a[2]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[2]]

# ddram:0.a
set_property LOC AP25 [get_ports ddram_a[3]]
set_property SLEW FAST [get_ports ddram_a[3]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[3]]

# ddram:0.a
set_property LOC AN28 [get_ports ddram_a[4]]
set_property SLEW FAST [get_ports ddram_a[4]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[4]]

# ddram:0.a
set_property LOC AM28 [get_ports ddram_a[5]]
set_property SLEW FAST [get_ports ddram_a[5]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[5]]

# ddram:0.a
set_property LOC AP28 [get_ports ddram_a[6]]
set_property SLEW FAST [get_ports ddram_a[6]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[6]]

# ddram:0.a
set_property LOC AP27 [get_ports ddram_a[7]]
set_property SLEW FAST [get_ports ddram_a[7]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[7]]

# ddram:0.a
set_property LOC AN26 [get_ports ddram_a[8]]
set_property SLEW FAST [get_ports ddram_a[8]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[8]]

# ddram:0.a
set_property LOC AM26 [get_ports ddram_a[9]]
set_property SLEW FAST [get_ports ddram_a[9]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[9]]

# ddram:0.a
set_property LOC AR28 [get_ports ddram_a[10]]
set_property SLEW FAST [get_ports ddram_a[10]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[10]]

# ddram:0.a
set_property LOC AR27 [get_ports ddram_a[11]]
set_property SLEW FAST [get_ports ddram_a[11]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[11]]

# ddram:0.a
set_property LOC AV25 [get_ports ddram_a[12]]
set_property SLEW FAST [get_ports ddram_a[12]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[12]]

# ddram:0.a
set_property LOC AT25 [get_ports ddram_a[13]]
set_property SLEW FAST [get_ports ddram_a[13]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_a[13]]

# ddram:0.ba
set_property LOC AR25 [get_ports ddram_ba[0]]
set_property SLEW FAST [get_ports ddram_ba[0]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_ba[0]]

# ddram:0.ba
set_property LOC AU28 [get_ports ddram_ba[1]]
set_property SLEW FAST [get_ports ddram_ba[1]]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_ba[1]]

# ddram:0.bg
set_property LOC AU27 [get_ports ddram_bg]
set_property SLEW FAST [get_ports ddram_bg]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_bg]

# ddram:0.ras_n
set_property LOC AV26 [get_ports ddram_ras_n]
set_property SLEW FAST [get_ports ddram_ras_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_ras_n]

# ddram:0.cas_n
set_property LOC AU26 [get_ports ddram_cas_n]
set_property SLEW FAST [get_ports ddram_cas_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_cas_n]

# ddram:0.we_n
set_property LOC AV28 [get_ports ddram_we_n]
set_property SLEW FAST [get_ports ddram_we_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_we_n]

# ddram:0.cs_n
set_property LOC AY29 [get_ports ddram_cs_n]
set_property SLEW FAST [get_ports ddram_cs_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_cs_n]

# ddram:0.act_n
set_property LOC AN25 [get_ports ddram_act_n]
set_property SLEW FAST [get_ports ddram_act_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_act_n]

# ddram:0.dm
set_property LOC BE32 [get_ports ddram_dm[0]]
set_property SLEW FAST [get_ports ddram_dm[0]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[0]]

# ddram:0.dm
set_property LOC BB31 [get_ports ddram_dm[1]]
set_property SLEW FAST [get_ports ddram_dm[1]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[1]]

# ddram:0.dm
set_property LOC AV33 [get_ports ddram_dm[2]]
set_property SLEW FAST [get_ports ddram_dm[2]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[2]]

# ddram:0.dm
set_property LOC AR32 [get_ports ddram_dm[3]]
set_property SLEW FAST [get_ports ddram_dm[3]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[3]]

# ddram:0.dm
set_property LOC BC34 [get_ports ddram_dm[4]]
set_property SLEW FAST [get_ports ddram_dm[4]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[4]]

# ddram:0.dm
set_property LOC BE40 [get_ports ddram_dm[5]]
set_property SLEW FAST [get_ports ddram_dm[5]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[5]]

# ddram:0.dm
set_property LOC AY37 [get_ports ddram_dm[6]]
set_property SLEW FAST [get_ports ddram_dm[6]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[6]]

# ddram:0.dm
set_property LOC AV35 [get_ports ddram_dm[7]]
set_property SLEW FAST [get_ports ddram_dm[7]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[7]]

# ddram:0.dm
set_property LOC BE29 [get_ports ddram_dm[8]]
set_property SLEW FAST [get_ports ddram_dm[8]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[8]]

# ddram:0.dm
set_property LOC BA29 [get_ports ddram_dm[9]]
set_property SLEW FAST [get_ports ddram_dm[9]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dm[9]]

# ddram:0.dq
set_property LOC BD30 [get_ports ddram_dq[0]]
set_property SLEW FAST [get_ports ddram_dq[0]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[0]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[0]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[0]]

# ddram:0.dq
set_property LOC BE30 [get_ports ddram_dq[1]]
set_property SLEW FAST [get_ports ddram_dq[1]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[1]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[1]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[1]]

# ddram:0.dq
set_property LOC BD32 [get_ports ddram_dq[2]]
set_property SLEW FAST [get_ports ddram_dq[2]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[2]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[2]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[2]]

# ddram:0.dq
set_property LOC BE33 [get_ports ddram_dq[3]]
set_property SLEW FAST [get_ports ddram_dq[3]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[3]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[3]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[3]]

# ddram:0.dq
set_property LOC BC33 [get_ports ddram_dq[4]]
set_property SLEW FAST [get_ports ddram_dq[4]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[4]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[4]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[4]]

# ddram:0.dq
set_property LOC BD33 [get_ports ddram_dq[5]]
set_property SLEW FAST [get_ports ddram_dq[5]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[5]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[5]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[5]]

# ddram:0.dq
set_property LOC BC31 [get_ports ddram_dq[6]]
set_property SLEW FAST [get_ports ddram_dq[6]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[6]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[6]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[6]]

# ddram:0.dq
set_property LOC BD31 [get_ports ddram_dq[7]]
set_property SLEW FAST [get_ports ddram_dq[7]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[7]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[7]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[7]]

# ddram:0.dq
set_property LOC BA32 [get_ports ddram_dq[8]]
set_property SLEW FAST [get_ports ddram_dq[8]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[8]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[8]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[8]]

# ddram:0.dq
set_property LOC BB33 [get_ports ddram_dq[9]]
set_property SLEW FAST [get_ports ddram_dq[9]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[9]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[9]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[9]]

# ddram:0.dq
set_property LOC BA30 [get_ports ddram_dq[10]]
set_property SLEW FAST [get_ports ddram_dq[10]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[10]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[10]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[10]]

# ddram:0.dq
set_property LOC BA31 [get_ports ddram_dq[11]]
set_property SLEW FAST [get_ports ddram_dq[11]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[11]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[11]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[11]]

# ddram:0.dq
set_property LOC AW31 [get_ports ddram_dq[12]]
set_property SLEW FAST [get_ports ddram_dq[12]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[12]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[12]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[12]]

# ddram:0.dq
set_property LOC AW32 [get_ports ddram_dq[13]]
set_property SLEW FAST [get_ports ddram_dq[13]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[13]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[13]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[13]]

# ddram:0.dq
set_property LOC AY32 [get_ports ddram_dq[14]]
set_property SLEW FAST [get_ports ddram_dq[14]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[14]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[14]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[14]]

# ddram:0.dq
set_property LOC AY33 [get_ports ddram_dq[15]]
set_property SLEW FAST [get_ports ddram_dq[15]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[15]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[15]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[15]]

# ddram:0.dq
set_property LOC AV30 [get_ports ddram_dq[16]]
set_property SLEW FAST [get_ports ddram_dq[16]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[16]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[16]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[16]]

# ddram:0.dq
set_property LOC AW30 [get_ports ddram_dq[17]]
set_property SLEW FAST [get_ports ddram_dq[17]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[17]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[17]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[17]]

# ddram:0.dq
set_property LOC AU33 [get_ports ddram_dq[18]]
set_property SLEW FAST [get_ports ddram_dq[18]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[18]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[18]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[18]]

# ddram:0.dq
set_property LOC AU34 [get_ports ddram_dq[19]]
set_property SLEW FAST [get_ports ddram_dq[19]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[19]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[19]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[19]]

# ddram:0.dq
set_property LOC AT31 [get_ports ddram_dq[20]]
set_property SLEW FAST [get_ports ddram_dq[20]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[20]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[20]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[20]]

# ddram:0.dq
set_property LOC AU32 [get_ports ddram_dq[21]]
set_property SLEW FAST [get_ports ddram_dq[21]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[21]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[21]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[21]]

# ddram:0.dq
set_property LOC AU31 [get_ports ddram_dq[22]]
set_property SLEW FAST [get_ports ddram_dq[22]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[22]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[22]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[22]]

# ddram:0.dq
set_property LOC AV31 [get_ports ddram_dq[23]]
set_property SLEW FAST [get_ports ddram_dq[23]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[23]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[23]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[23]]

# ddram:0.dq
set_property LOC AR33 [get_ports ddram_dq[24]]
set_property SLEW FAST [get_ports ddram_dq[24]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[24]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[24]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[24]]

# ddram:0.dq
set_property LOC AT34 [get_ports ddram_dq[25]]
set_property SLEW FAST [get_ports ddram_dq[25]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[25]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[25]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[25]]

# ddram:0.dq
set_property LOC AT29 [get_ports ddram_dq[26]]
set_property SLEW FAST [get_ports ddram_dq[26]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[26]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[26]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[26]]

# ddram:0.dq
set_property LOC AT30 [get_ports ddram_dq[27]]
set_property SLEW FAST [get_ports ddram_dq[27]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[27]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[27]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[27]]

# ddram:0.dq
set_property LOC AP30 [get_ports ddram_dq[28]]
set_property SLEW FAST [get_ports ddram_dq[28]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[28]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[28]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[28]]

# ddram:0.dq
set_property LOC AR30 [get_ports ddram_dq[29]]
set_property SLEW FAST [get_ports ddram_dq[29]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[29]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[29]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[29]]

# ddram:0.dq
set_property LOC AN30 [get_ports ddram_dq[30]]
set_property SLEW FAST [get_ports ddram_dq[30]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[30]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[30]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[30]]

# ddram:0.dq
set_property LOC AN31 [get_ports ddram_dq[31]]
set_property SLEW FAST [get_ports ddram_dq[31]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[31]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[31]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[31]]

# ddram:0.dq
set_property LOC BE34 [get_ports ddram_dq[32]]
set_property SLEW FAST [get_ports ddram_dq[32]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[32]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[32]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[32]]

# ddram:0.dq
set_property LOC BF34 [get_ports ddram_dq[33]]
set_property SLEW FAST [get_ports ddram_dq[33]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[33]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[33]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[33]]

# ddram:0.dq
set_property LOC BC35 [get_ports ddram_dq[34]]
set_property SLEW FAST [get_ports ddram_dq[34]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[34]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[34]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[34]]

# ddram:0.dq
set_property LOC BC36 [get_ports ddram_dq[35]]
set_property SLEW FAST [get_ports ddram_dq[35]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[35]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[35]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[35]]

# ddram:0.dq
set_property LOC BD36 [get_ports ddram_dq[36]]
set_property SLEW FAST [get_ports ddram_dq[36]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[36]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[36]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[36]]

# ddram:0.dq
set_property LOC BE37 [get_ports ddram_dq[37]]
set_property SLEW FAST [get_ports ddram_dq[37]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[37]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[37]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[37]]

# ddram:0.dq
set_property LOC BF36 [get_ports ddram_dq[38]]
set_property SLEW FAST [get_ports ddram_dq[38]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[38]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[38]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[38]]

# ddram:0.dq
set_property LOC BF37 [get_ports ddram_dq[39]]
set_property SLEW FAST [get_ports ddram_dq[39]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[39]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[39]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[39]]

# ddram:0.dq
set_property LOC BD37 [get_ports ddram_dq[40]]
set_property SLEW FAST [get_ports ddram_dq[40]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[40]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[40]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[40]]

# ddram:0.dq
set_property LOC BE38 [get_ports ddram_dq[41]]
set_property SLEW FAST [get_ports ddram_dq[41]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[41]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[41]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[41]]

# ddram:0.dq
set_property LOC BC39 [get_ports ddram_dq[42]]
set_property SLEW FAST [get_ports ddram_dq[42]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[42]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[42]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[42]]

# ddram:0.dq
set_property LOC BD40 [get_ports ddram_dq[43]]
set_property SLEW FAST [get_ports ddram_dq[43]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[43]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[43]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[43]]

# ddram:0.dq
set_property LOC BB38 [get_ports ddram_dq[44]]
set_property SLEW FAST [get_ports ddram_dq[44]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[44]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[44]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[44]]

# ddram:0.dq
set_property LOC BB39 [get_ports ddram_dq[45]]
set_property SLEW FAST [get_ports ddram_dq[45]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[45]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[45]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[45]]

# ddram:0.dq
set_property LOC BC38 [get_ports ddram_dq[46]]
set_property SLEW FAST [get_ports ddram_dq[46]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[46]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[46]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[46]]

# ddram:0.dq
set_property LOC BD38 [get_ports ddram_dq[47]]
set_property SLEW FAST [get_ports ddram_dq[47]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[47]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[47]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[47]]

# ddram:0.dq
set_property LOC BB36 [get_ports ddram_dq[48]]
set_property SLEW FAST [get_ports ddram_dq[48]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[48]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[48]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[48]]

# ddram:0.dq
set_property LOC BB37 [get_ports ddram_dq[49]]
set_property SLEW FAST [get_ports ddram_dq[49]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[49]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[49]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[49]]

# ddram:0.dq
set_property LOC BA39 [get_ports ddram_dq[50]]
set_property SLEW FAST [get_ports ddram_dq[50]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[50]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[50]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[50]]

# ddram:0.dq
set_property LOC BA40 [get_ports ddram_dq[51]]
set_property SLEW FAST [get_ports ddram_dq[51]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[51]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[51]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[51]]

# ddram:0.dq
set_property LOC AW40 [get_ports ddram_dq[52]]
set_property SLEW FAST [get_ports ddram_dq[52]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[52]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[52]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[52]]

# ddram:0.dq
set_property LOC AY40 [get_ports ddram_dq[53]]
set_property SLEW FAST [get_ports ddram_dq[53]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[53]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[53]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[53]]

# ddram:0.dq
set_property LOC AY38 [get_ports ddram_dq[54]]
set_property SLEW FAST [get_ports ddram_dq[54]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[54]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[54]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[54]]

# ddram:0.dq
set_property LOC AY39 [get_ports ddram_dq[55]]
set_property SLEW FAST [get_ports ddram_dq[55]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[55]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[55]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[55]]

# ddram:0.dq
set_property LOC AW35 [get_ports ddram_dq[56]]
set_property SLEW FAST [get_ports ddram_dq[56]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[56]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[56]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[56]]

# ddram:0.dq
set_property LOC AW36 [get_ports ddram_dq[57]]
set_property SLEW FAST [get_ports ddram_dq[57]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[57]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[57]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[57]]

# ddram:0.dq
set_property LOC AU40 [get_ports ddram_dq[58]]
set_property SLEW FAST [get_ports ddram_dq[58]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[58]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[58]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[58]]

# ddram:0.dq
set_property LOC AV40 [get_ports ddram_dq[59]]
set_property SLEW FAST [get_ports ddram_dq[59]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[59]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[59]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[59]]

# ddram:0.dq
set_property LOC AU38 [get_ports ddram_dq[60]]
set_property SLEW FAST [get_ports ddram_dq[60]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[60]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[60]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[60]]

# ddram:0.dq
set_property LOC AU39 [get_ports ddram_dq[61]]
set_property SLEW FAST [get_ports ddram_dq[61]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[61]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[61]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[61]]

# ddram:0.dq
set_property LOC AV38 [get_ports ddram_dq[62]]
set_property SLEW FAST [get_ports ddram_dq[62]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[62]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[62]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[62]]

# ddram:0.dq
set_property LOC AV39 [get_ports ddram_dq[63]]
set_property SLEW FAST [get_ports ddram_dq[63]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[63]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[63]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[63]]

# ddram:0.dq
set_property LOC BF26 [get_ports ddram_dq[64]]
set_property SLEW FAST [get_ports ddram_dq[64]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[64]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[64]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[64]]

# ddram:0.dq
set_property LOC BF27 [get_ports ddram_dq[65]]
set_property SLEW FAST [get_ports ddram_dq[65]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[65]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[65]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[65]]

# ddram:0.dq
set_property LOC BD28 [get_ports ddram_dq[66]]
set_property SLEW FAST [get_ports ddram_dq[66]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[66]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[66]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[66]]

# ddram:0.dq
set_property LOC BE28 [get_ports ddram_dq[67]]
set_property SLEW FAST [get_ports ddram_dq[67]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[67]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[67]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[67]]

# ddram:0.dq
set_property LOC BD27 [get_ports ddram_dq[68]]
set_property SLEW FAST [get_ports ddram_dq[68]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[68]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[68]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[68]]

# ddram:0.dq
set_property LOC BE27 [get_ports ddram_dq[69]]
set_property SLEW FAST [get_ports ddram_dq[69]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[69]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[69]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[69]]

# ddram:0.dq
set_property LOC BD25 [get_ports ddram_dq[70]]
set_property SLEW FAST [get_ports ddram_dq[70]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[70]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[70]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[70]]

# ddram:0.dq
set_property LOC BD26 [get_ports ddram_dq[71]]
set_property SLEW FAST [get_ports ddram_dq[71]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[71]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[71]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[71]]

# ddram:0.dq
set_property LOC BC25 [get_ports ddram_dq[72]]
set_property SLEW FAST [get_ports ddram_dq[72]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[72]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[72]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[72]]

# ddram:0.dq
set_property LOC BC26 [get_ports ddram_dq[73]]
set_property SLEW FAST [get_ports ddram_dq[73]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[73]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[73]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[73]]

# ddram:0.dq
set_property LOC BB28 [get_ports ddram_dq[74]]
set_property SLEW FAST [get_ports ddram_dq[74]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[74]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[74]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[74]]

# ddram:0.dq
set_property LOC BC28 [get_ports ddram_dq[75]]
set_property SLEW FAST [get_ports ddram_dq[75]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[75]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[75]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[75]]

# ddram:0.dq
set_property LOC AY27 [get_ports ddram_dq[76]]
set_property SLEW FAST [get_ports ddram_dq[76]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[76]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[76]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[76]]

# ddram:0.dq
set_property LOC AY28 [get_ports ddram_dq[77]]
set_property SLEW FAST [get_ports ddram_dq[77]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[77]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[77]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[77]]

# ddram:0.dq
set_property LOC BA27 [get_ports ddram_dq[78]]
set_property SLEW FAST [get_ports ddram_dq[78]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[78]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[78]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[78]]

# ddram:0.dq
set_property LOC BB27 [get_ports ddram_dq[79]]
set_property SLEW FAST [get_ports ddram_dq[79]]
set_property IOSTANDARD POD12_DCI [get_ports ddram_dq[79]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dq[79]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dq[79]]

# ddram:0.dqs_p
set_property LOC BF30 [get_ports ddram_dqs_p[0]]
set_property SLEW FAST [get_ports ddram_dqs_p[0]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[0]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[0]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[0]]

# ddram:0.dqs_p
set_property LOC AY34 [get_ports ddram_dqs_p[1]]
set_property SLEW FAST [get_ports ddram_dqs_p[1]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[1]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[1]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[1]]

# ddram:0.dqs_p
set_property LOC AU29 [get_ports ddram_dqs_p[2]]
set_property SLEW FAST [get_ports ddram_dqs_p[2]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[2]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[2]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[2]]

# ddram:0.dqs_p
set_property LOC AP31 [get_ports ddram_dqs_p[3]]
set_property SLEW FAST [get_ports ddram_dqs_p[3]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[3]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[3]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[3]]

# ddram:0.dqs_p
set_property LOC BE35 [get_ports ddram_dqs_p[4]]
set_property SLEW FAST [get_ports ddram_dqs_p[4]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[4]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[4]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[4]]

# ddram:0.dqs_p
set_property LOC BE39 [get_ports ddram_dqs_p[5]]
set_property SLEW FAST [get_ports ddram_dqs_p[5]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[5]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[5]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[5]]

# ddram:0.dqs_p
set_property LOC BA35 [get_ports ddram_dqs_p[6]]
set_property SLEW FAST [get_ports ddram_dqs_p[6]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[6]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[6]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[6]]

# ddram:0.dqs_p
set_property LOC AW37 [get_ports ddram_dqs_p[7]]
set_property SLEW FAST [get_ports ddram_dqs_p[7]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[7]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[7]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[7]]

# ddram:0.dqs_p
set_property LOC BE25 [get_ports ddram_dqs_p[8]]
set_property SLEW FAST [get_ports ddram_dqs_p[8]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[8]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[8]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[8]]

# ddram:0.dqs_p
set_property LOC BA26 [get_ports ddram_dqs_p[9]]
set_property SLEW FAST [get_ports ddram_dqs_p[9]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_p[9]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_p[9]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_p[9]]

# ddram:0.dqs_n
set_property LOC BF31 [get_ports ddram_dqs_n[0]]
set_property SLEW FAST [get_ports ddram_dqs_n[0]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[0]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[0]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[0]]

# ddram:0.dqs_n
set_property LOC BA34 [get_ports ddram_dqs_n[1]]
set_property SLEW FAST [get_ports ddram_dqs_n[1]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[1]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[1]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[1]]

# ddram:0.dqs_n
set_property LOC AV29 [get_ports ddram_dqs_n[2]]
set_property SLEW FAST [get_ports ddram_dqs_n[2]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[2]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[2]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[2]]

# ddram:0.dqs_n
set_property LOC AP32 [get_ports ddram_dqs_n[3]]
set_property SLEW FAST [get_ports ddram_dqs_n[3]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[3]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[3]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[3]]

# ddram:0.dqs_n
set_property LOC BF35 [get_ports ddram_dqs_n[4]]
set_property SLEW FAST [get_ports ddram_dqs_n[4]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[4]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[4]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[4]]

# ddram:0.dqs_n
set_property LOC BF39 [get_ports ddram_dqs_n[5]]
set_property SLEW FAST [get_ports ddram_dqs_n[5]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[5]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[5]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[5]]

# ddram:0.dqs_n
set_property LOC BA36 [get_ports ddram_dqs_n[6]]
set_property SLEW FAST [get_ports ddram_dqs_n[6]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[6]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[6]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[6]]

# ddram:0.dqs_n
set_property LOC AW38 [get_ports ddram_dqs_n[7]]
set_property SLEW FAST [get_ports ddram_dqs_n[7]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[7]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[7]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[7]]

# ddram:0.dqs_n
set_property LOC BF25 [get_ports ddram_dqs_n[8]]
set_property SLEW FAST [get_ports ddram_dqs_n[8]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[8]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[8]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[8]]

# ddram:0.dqs_n
set_property LOC BB26 [get_ports ddram_dqs_n[9]]
set_property SLEW FAST [get_ports ddram_dqs_n[9]]
set_property IOSTANDARD DIFF_POD12 [get_ports ddram_dqs_n[9]]
set_property PRE_EMPHASIS RDRV_240 [get_ports ddram_dqs_n[9]]
set_property EQUALIZATION EQ_LEVEL2 [get_ports ddram_dqs_n[9]]

# ddram:0.clk_p
set_property LOC AT26 [get_ports ddram_clk_p]
set_property SLEW FAST [get_ports ddram_clk_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddram_clk_p]

# ddram:0.clk_n
set_property LOC AT27 [get_ports ddram_clk_n]
set_property SLEW FAST [get_ports ddram_clk_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddram_clk_n]

# ddram:0.cke
set_property LOC AW28 [get_ports ddram_cke]
set_property SLEW FAST [get_ports ddram_cke]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_cke]

# ddram:0.odt
set_property LOC BB29 [get_ports ddram_odt]
set_property SLEW FAST [get_ports ddram_odt]
set_property IOSTANDARD SSTL12_DCI [get_ports ddram_odt]

# ddram:0.reset_n
set_property LOC BD35 [get_ports ddram_reset_n]
set_property SLEW FAST [get_ports ddram_reset_n]
set_property IOSTANDARD LVCMOS12 [get_ports ddram_reset_n]


################################################################################
# Design constraints
################################################################################

set_property INTERNAL_VREF 0.84 [get_iobanks 71]

set_property INTERNAL_VREF 0.84 [get_iobanks 72]

set_property INTERNAL_VREF 0.84 [get_iobanks 73]

set_property INTERNAL_VREF 0.84 [get_iobanks 40]

set_property INTERNAL_VREF 0.84 [get_iobanks 41]

set_property INTERNAL_VREF 0.84 [get_iobanks 42]

################################################################################
# Clock constraints
################################################################################


create_clock -name clk125_p -period 8.0 [get_nets clk125_p]

################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]

# LEDs
set_property PACKAGE_PIN AT32 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[0]}]
set_property PACKAGE_PIN AV34 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[1]}]
set_property PACKAGE_PIN AY30 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[2]}]
set_property PACKAGE_PIN BB32 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[3]}]
set_property PACKAGE_PIN BF32 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[4]}]
set_property PACKAGE_PIN AU37 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[5]}]
set_property PACKAGE_PIN AV36 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[6]}]
set_property PACKAGE_PIN BA37 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led[7]}]


## read btnu
set_property PACKAGE_PIN BB24 [get_ports start_read]
set_property IOSTANDARD LVCMOS18 [get_ports start_read]
## write btnd
set_property PACKAGE_PIN BE22 [get_ports start_write]
set_property IOSTANDARD LVCMOS18 [get_ports start_write]
## home btnc
set_property PACKAGE_PIN BD23 [get_ports home]
set_property IOSTANDARD LVCMOS18 [get_ports home]
## next btnr
set_property PACKAGE_PIN BE23 [get_ports next]
set_property IOSTANDARD LVCMOS18 [get_ports next]
## prev btnl
set_property PACKAGE_PIN BF22 [get_ports prev]
set_property IOSTANDARD LVCMOS18 [get_ports prev]



