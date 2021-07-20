solution new -state initial

solution options defaults
solution options set /General/PdfViewer okular
solution options set /ComponentLibs/SearchPath /users/students/r0678912/Downloads/zigzag/hls_impl/memories -append
solution options set /Input/CppStandard c++11
solution options set /Input/TargetPlatform x86_64
solution options set /Input/CompilerFlags -DSTALL
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/LowPower/SWITCHING_ACTIVITY_TYPE saif
solution file add ./core.h -type CHEADER
solution file add ./testbench.cpp -type C++

directive set -DESIGN_GOAL area
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -LOGIC_OPT false
directive set -FSM_ENCODING none
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -CHAN_IO_PROTOCOL use_library
directive set -ARRAY_SIZE 1024
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -RESET_CLEARS_ALL_REGS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -PROTOTYPING_ENGINE oasys
directive set -PIPELINE_RAMP_UP true

flow package option set /SCVerify/DISABLE_EMPTY_INPUTS true
flow package option set /SCVerify/USE_CCS_BLOCK true

go new

#solution design set {tiling_unit<5, O_addr_type_L1>} -block
#solution design set {config_control_unit<5, O_addr_type_L1, O_addr_type_L2, O_addr_type_L3, I_addr_type_L1, I_addr_type_L2, I_addr_type_L3, W_addr_type_L1, W_addr_type_L2, W_addr_type_L3>} -block
#solution design set {BW_buffer_down<O_partial_type, 8, 1>} -block
#solution design set {BW_buffer_up<O_partial_type, 1, 8>} -block
#solution design set {BW_conv_zero_guard<8, 1>} -block
#solution design set {addr_cnt_flex<5, O_addr_type_L3>} -block
#solution design set {O_dp_sb<5, 8640, 8, 8, O_partial_type, O_addr_type_L3>} -block
#solution design set {O_dp_sb<5, 288, 8, 8, O_partial_type, O_addr_type_L2>} -block
#solution design set {W_addr_cnt<5, I_addr_type_L3, 8>} -block
#solution design set {W_dp_sb<5, $mem_word_bit_I_L3, 8, 8, I_type, I_addr_type_L3>} -block
#solution design set {W_dp_sb<5, 312, 8, 8, I_type, I_addr_type_L2>} -block
#solution design set {W_dp_sb<5, 55296, 8, 8, W_type, W_addr_type_L3>} -block
#solution design set {W_dp_sb<5, 1728, 8, 8, W_type, W_addr_type_L2>} -block
#solution design set {O_addr_cnt<5, O_addr_type_L1, 1>} -block
#solution design set {rf<5, 32, 32, 32, 1, 1, 1, 1, 1, 1, O_partial_type, O_addr_type_L1, I_type, I_addr_type_L1, W_type, W_addr_type_L1>} -block
#solution design set {top<5, 32, 1, 1, O_addr_type_L1, 32, 1, 1, I_addr_type_L1, 32, 1, 1, W_addr_type_L1, 5, 288, 8, 8, O_addr_type_L2, 312, 8, 8, I_addr_type_L2, 1728, 8, 8, W_addr_type_L2, 5, 8640, 8, 8, O_addr_type_L3, $mem_word_bit_I_L3, 8, 8, I_addr_type_L3, 55296, 8, 8, W_addr_type_L3, O_partial_type, I_type, W_type>} -top

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
directive set -FIFO_DEPTH 0

go assembly

#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/O_mem:rsc -MAP_TO_MODULE ram_nangate-45nm-register-file_beh.REGISTER_FILE
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/I_mem:rsc -MAP_TO_MODULE ram_nangate-45nm-register-file_beh.REGISTER_FILE
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/W_mem:rsc -MAP_TO_MODULE ram_nangate-45nm-register-file_beh.REGISTER_FILE
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,1728,8,8,W_type,W_addr_type_L2>/run/mem -WORD_WIDTH 128
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,1728,8,8,W_type,W_addr_type_L2>/run/skid_buf.regs.data:rsc -MAP_TO_MODULE {[Register]}
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,55296,8,8,W_type,W_addr_type_L3>/run/mem -WORD_WIDTH 128
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,55296,8,8,W_type,W_addr_type_L3>/run/skid_buf.regs.data:rsc -MAP_TO_MODULE {[Register]}
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,312,8,8,I_type,I_addr_type_L2>/run/mem -WORD_WIDTH 128
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,312,8,8,I_type,I_addr_type_L2>/run/skid_buf.regs.data:rsc -MAP_TO_MODULE {[Register]}
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,624,8,8,I_type,I_addr_type_L3>/run/mem -WORD_WIDTH 128
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,624,8,8,I_type,I_addr_type_L3>/run/skid_buf.regs.data:rsc -MAP_TO_MODULE {[Register]}
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,288,8,8,O_partial_type,O_addr_type_L2>/run/mem -WORD_WIDTH 128
#directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,624,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,8640,8,8,O_partial_type,O_addr_type_L3>/run/mem -WORD_WIDTH 128

options set Message/ErrorOverride ASSERT-1 -remove

go memories

go architect 

ignore_memory_precedences -from *:write_mem(*_mem:rsc.@) -to *:read_mem(*_mem:rsc.@)
ignore_memory_precedences -from WR_IN_MEM_FROM_BOT:write_mem(mem:rsc.@)* -to RD_OUT_MEM_BOT:read_mem(mem:rsc.@)*

go allocate

go extract

flow run /SCVerify/launch_make ./scverify/Verify_rtl_v_msim.mk {} SIMTOOL=msim simgui
