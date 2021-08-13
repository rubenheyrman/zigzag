solution new -state initial
solution options defaults
solution options set /ComponentLibs/SearchPath /users/students/r0678912/Documents/zigzag/hls/mem_macros/catapult -append
solution options set /Input/CppStandard c++11
solution options set /Input/TargetPlatform x86_64
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/LowPower/SWITCHING_ACTIVITY_TYPE saif
solution file add ./testbench.cpp -type C++
directive set -DESIGN_GOAL area
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
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
directive set -TRANSACTION_SYNC ready
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
go new
flow package option set /SCVerify/DISABLE_EMPTY_INPUTS true
flow package option set /SCVerify/USE_CCS_BLOCK true
solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
solution library add sram_128_1296_freepdk45_TT_1p0V_25C_lib
solution library add sram_128_216_freepdk45_TT_1p0V_25C_lib
go libraries
directive set -MEM_MAP_THRESHOLD 256
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set -FIFO_DEPTH 0
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,3456,16,16,W_type,W_addr_type_L2>/run/mem:rsc -MAP_TO_MODULE sram_128_216_freepdk45_TT_1p0V_25C_lib.sram_128_216_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,3456,16,16,W_type,W_addr_type_L2>/run/mem -WORD_WIDTH 128
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,20736,16,16,W_type,W_addr_type_L3>/run/mem:rsc -MAP_TO_MODULE sram_128_1296_freepdk45_TT_1p0V_25C_lib.sram_128_1296_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/W_dp_sb<5,20736,16,16,W_type,W_addr_type_L3>/run/mem -WORD_WIDTH 128
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/I_dp_sb<5,3456,16,16,I_type,I_addr_type_L2>/run/mem:rsc -MAP_TO_MODULE sram_128_216_freepdk45_TT_1p0V_25C_lib.sram_128_216_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/I_dp_sb<5,3456,16,16,I_type,I_addr_type_L2>/run/mem -WORD_WIDTH 128
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/I_dp_sb<5,20736,16,16,I_type,I_addr_type_L3>/run/mem:rsc -MAP_TO_MODULE sram_128_1296_freepdk45_TT_1p0V_25C_lib.sram_128_1296_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/I_dp_sb<5,20736,16,16,I_type,I_addr_type_L3>/run/mem -WORD_WIDTH 128
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,1728,8,8,O_partial_type,O_addr_type_L2>/run/mem:rsc -MAP_TO_MODULE sram_128_216_freepdk45_TT_1p0V_25C_lib.sram_128_216_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,1728,8,8,O_partial_type,O_addr_type_L2>/run/mem -WORD_WIDTH 128
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,10368,8,8,O_partial_type,O_addr_type_L3>/run/mem:rsc -MAP_TO_MODULE sram_128_1296_freepdk45_TT_1p0V_25C_lib.sram_128_1296_freepdk45
directive set /top<5,4,4,32,1,1,O_addr_type_L1,64,1,1,I_addr_type_L1,64,1,1,W_addr_type_L1,5,1728,8,8,O_addr_type_L2,3456,16,16,I_addr_type_L2,3456,16,16,W_addr_type_L2,5,10368,8,8,O_addr_type_L3,20736,16,16,I_addr_type_L3,20736,16,16,W_addr_type_L3,O_partial_type,I_type,W_type>/O_dp_sb<5,10368,8,8,O_partial_type,O_addr_type_L3>/run/mem -WORD_WIDTH 128
go architect
#ignore_memory_precedences -from *RD_OUT_MEM_BOT:read_mem(mem:rsc.@)* -to *WR_IN_MEM_FROM_TOP:write_mem(mem:rsc.@)*
#ignore_memory_precedences -from *WR_IN_MEM:write_mem(mem:rsc.@)* -to *RD_OUT_MEM:read_mem(mem:rsc.@)*
ignore_memory_precedences -from *:read_mem(mem:rsc.@)* -to *:write_mem(mem:rsc.@)*
go allocate
go extract
flow run /SCVerify/launch_make ./scverify/Verify_rtl_v_msim.mk {} SIMTOOL=msim simgui
