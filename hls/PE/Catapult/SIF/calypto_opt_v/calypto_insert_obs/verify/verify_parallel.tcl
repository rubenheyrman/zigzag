# Sets the number of characters to display per line.
set_global message_wrap_at 10000
set scriptdir [file dirname [file normalize [info script]]]
  set script_list {} 
  lappend script_list verify_1_insert_obs.tcl
set lic_cnt [license_utils::get_license_count_for_slecpro]
if {$lic_cnt < 2} { 
  LSFSlecPro::verify_serial $scriptdir $script_list 
} else { 

  # Coming from following settings in Powerpro 
  # set_global slec_max_local_async_workers 1
  # set_global slec_max_remote_async_workers 1
  set_global max_local_async_workers 1
  set_global max_remote_async_workers 1

  LSFSlecPro::verify_lsf $scriptdir $script_list 
}
exit
