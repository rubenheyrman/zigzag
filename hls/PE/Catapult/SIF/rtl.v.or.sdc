# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list layer_instruction_in_rsc_vld {layer_instruction_in_rsc_dat[*]} O_data_in_rsc_vld {O_data_in_rsc_dat[*]} O_data_out_rsc_rdy I_data_in_rsc_vld {I_data_in_rsc_dat[*]} W_data_in_rsc_vld {W_data_in_rsc_dat[*]} zero_guard_in_rsc_vld zero_guard_in_rsc_dat]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_in_rsc_dat[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_in_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_in_rsc_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_out_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_out_rsc_vld}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {O_data_out_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {I_data_in_rsc_dat[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {I_data_in_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {I_data_in_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {W_data_in_rsc_dat[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {W_data_in_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {W_data_in_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {zero_guard_in_rsc_dat}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {zero_guard_in_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {zero_guard_in_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {layer_instruction_in_rsc_dat[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {layer_instruction_in_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {layer_instruction_in_rsc_rdy}]

