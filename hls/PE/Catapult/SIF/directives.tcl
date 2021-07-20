//  Catapult Ultra Synthesis 10.5c/896140 (Production Release) Sun Sep  6 22:45:38 PDT 2020
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2020, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                 PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux r0678912@amazone.esat.kuleuven.be 4.18.0-305.3.1.el8.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v23.5_3.0, HLS_PKGS v23.5_3.0, 
//                       SIF_TOOLKITS v23.5_3.0, SIF_XILINX v23.5_3.0, 
//                       SIF_ALTERA v23.5_3.0, CCS_LIBS v23.5_3.0, 
//                       CDS_PPRO v10.3c_2, CDS_DesigChecker v10.5c, 
//                       CDS_OASYS v19.1_3.7, CDS_PSR v20.1_0.0, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /General/PdfViewer okular
solution options set /ComponentLibs/SearchPath /users/students/r0678912/Downloads/zigzag/hls_impl/memories -append
solution options set /Input/CppStandard c++11
solution options set /Input/TargetPlatform x86_64
solution options set /Input/CompilerFlags -DSTALL
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/LowPower/SWITCHING_ACTIVITY_TYPE saif
solution options set /Flows/SCVerify/DISABLE_EMPTY_INPUTS true
solution options set /Flows/SCVerify/USE_CCS_BLOCK true
solution file add ./core.h -type CHEADER
solution file add ./testbench.cpp -type C++
directive set -PIPELINE_RAMP_UP true
directive set -PROTOTYPING_ENGINE oasys
directive set -CLUSTER_TYPE combinational
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_ADDTREE_IN_WIDTH_THRESHOLD 0
directive set -ROM_THRESHOLD 64
directive set -PROTOTYPE_ROM true
directive set -CHARACTERIZE_ROM false
directive set -OPT_CONST_MULTS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -RESET_CLEARS_ALL_REGS use_library
directive set -START_FLAG {}
directive set -READY_FLAG {}
directive set -DONE_FLAG {}
directive set -TRANSACTION_DONE_SIGNAL true
directive set -STALL_FLAG false
directive set -IDLE_SIGNAL {}
directive set -REGISTER_IDLE_SIGNAL false
directive set -ARRAY_SIZE 1024
directive set -CHAN_IO_PROTOCOL use_library
directive set -IO_MODE super
directive set -UNROLL no
directive set -REALLOC true
directive set -MUXPATH true
directive set -TIMING_CHECKS true
directive set -ASSIGN_OVERHEAD 0
directive set -REGISTER_SHARING_LIMIT 0
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -SAFE_FSM false
directive set -NO_X_ASSIGNMENTS true
directive set -REG_MAX_FANOUT 0
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -FSM_ENCODING none
directive set -LOGIC_OPT false
directive set -MEM_MAP_THRESHOLD 32
directive set -REGISTER_THRESHOLD 256
directive set -MERGEABLE true
directive set -SPECULATE true
directive set -DESIGN_GOAL area
go new
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ram_nangate-45nm_pipe_beh
solution library add ram_nangate-45nm-dualport_beh
solution library add ram_nangate-45nm-separate_beh
solution library add ram_nangate-45nm-singleport_beh
solution library add ram_nangate-45nm-register-file_beh
solution library add ccs_sample_mem
go libraries
directive set -FIFO_DEPTH 0
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/W_mem:rsc -GEN_EXTERNAL_ENABLE false
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/W_mem:rsc -MAP_TO_MODULE {[Register]}
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/I_mem:rsc -GEN_EXTERNAL_ENABLE false
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/I_mem:rsc -MAP_TO_MODULE {[Register]}
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/O_mem:rsc -GEN_EXTERNAL_ENABLE false
directive set /top<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>/rf<5,32,32,32,1,1,1,1,1,1,O_partial_type,O_addr_type_L1,I_type,I_addr_type_L1,W_type,W_addr_type_L1>/run/O_mem:rsc -MAP_TO_MODULE {[Register]}
go architect
go power
