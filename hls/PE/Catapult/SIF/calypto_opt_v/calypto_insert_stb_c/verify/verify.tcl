# Sets the number of characters to display per line.
set_global message_wrap_at 10000
set scriptdir [file dirname [file normalize [info script]]]
  set script_list {} 
  lappend script_list verify_1_insert_obs.tcl
  lappend script_list verify_2_insert_stb_c.tcl
LSFSlecPro::verify_serial $scriptdir $script_list
exit
