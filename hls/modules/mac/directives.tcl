solution new -state initial

solution options defaults
solution options set /General/PdfViewer okular
solution options set /Input/CppStandard c++11
solution options set /Input/TargetPlatform x86_64
solution options set /Input/CompilerFlags -DSTALL
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/LowPower/SWITCHING_ACTIVITY_TYPE saif
solution file add ./mac.cpp -type C++
solution file add ./tb.cpp -type C++ -exclude true

flow package option set /SCVerify/DISABLE_EMPTY_INPUTS true
flow package option set /SCVerify/USE_CCS_BLOCK true

go new

go analyze

solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ram_nangate-45nm_pipe_beh
solution library add ram_nangate-45nm-dualport_beh
solution library add ram_nangate-45nm-separate_beh
solution library add ram_nangate-45nm-singleport_beh
solution library add ram_nangate-45nm-register-file_beh
solution library add ccs_sample_mem

go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}

go assembly

go memories

go architect 

go allocate

go extract

flow run /SCVerify/launch_make ./scverify/Verify_rtl_v_msim.mk {} SIMTOOL=msim simgui
