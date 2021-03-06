create_project -force -name litedram_core -part xc7vx485tffg1761-2
set_msg_config -id {Common 17-55} -new_severity {Warning}
read_verilog {/tigress/feig/litex/litex/litex/soc/cores/cpu/vexriscv/verilog/VexRiscv.v}
read_verilog {/tigress/feig/litedram/examples/vc707/build/gateware/litedram_core.v}
read_xdc litedram_core.xdc
synth_design -directive default -top litedram_core -part xc7vx485tffg1761-2
report_timing_summary -file litedram_core_timing_synth.rpt
report_utilization -hierarchical -file litedram_core_utilization_hierarchical_synth.rpt
report_utilization -file litedram_core_utilization_synth.rpt
opt_design -directive default
place_design -directive default
report_utilization -hierarchical -file litedram_core_utilization_hierarchical_place.rpt
report_utilization -file litedram_core_utilization_place.rpt
report_io -file litedram_core_io.rpt
report_control_sets -verbose -file litedram_core_control_sets.rpt
report_clock_utilization -file litedram_core_clock_utilization.rpt
route_design -directive default
phys_opt_design -directive default
report_timing_summary -no_header -no_detailed_paths
write_checkpoint -force litedram_core_route.dcp
report_route_status -file litedram_core_route_status.rpt
report_drc -file litedram_core_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file litedram_core_timing.rpt
report_power -file litedram_core_power.rpt
write_bitstream -force litedram_core.bit 
quit