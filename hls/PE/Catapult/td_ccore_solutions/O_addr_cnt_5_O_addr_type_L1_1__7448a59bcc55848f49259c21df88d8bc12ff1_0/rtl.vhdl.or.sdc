# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {loop_bound[*]} {tile_sizes[*]} {pntr_in[*]} {counter_in[*]} {tile_bound_in[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_max_delay 10.0 -from [all_inputs] -to [all_outputs]
set_input_delay 0.0 -clock virtual_io_clk [get_ports {loop_bound[*]}]
set_input_delay 0.0 -clock virtual_io_clk [get_ports {tile_sizes[*]}]
set_input_delay 0.0 -clock virtual_io_clk [get_ports {pntr_in[*]}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {pntr_out[*]}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {irrel_at_max_out}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {irrel_at_zero_out}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {all_at_max_1_out}]
set_input_delay 0.0 -clock virtual_io_clk [get_ports {counter_in[*]}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {counter_out[*]}]
set_input_delay 0.0 -clock virtual_io_clk [get_ports {tile_bound_in[*]}]
set_output_delay 0.0 -clock virtual_io_clk [get_ports {tile_bound_out[*]}]

