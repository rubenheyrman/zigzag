# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {loops_bound_rsc_dat[*]} {loops_relevancy_rsc_dat[*]} {tile_size_in_rsc_dat[*]} ccs_ccore_en ccs_ccore_start_rsc_dat]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name ccs_ccore_clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {ccs_ccore_clk}]
set_clock_uncertainty 0.0 [get_clocks {ccs_ccore_clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {loops_bound_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {loops_relevancy_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {tile_size_in_rsc_dat[*]}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {tile_size_out_rsc_z[*]}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {instr_bound_rsc_z[*]}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {instr_tile_rsc_z[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_start_rsc_dat}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_srst}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_en}]

