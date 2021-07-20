#include <string>
#include <fstream>
#include <iostream>
#include "mc_testbench.h"
#include <mc_reset.h>
#include <mc_transactors.h>
#include <mc_scverify.h>
#include <mc_stall_ctrl.h>
#include "ccs_ioport_trans_rsc_v1.h"
#include <mc_monitor.h>
#include <mc_simulator_extensions.h>
#include "mc_dut_wrapper.h"
#include "ccs_probes.cpp"
#include <mt19937ar.c>
#ifndef TO_QUOTED_STRING
#define TO_QUOTED_STRING(x) TO_QUOTED_STRING1(x)
#define TO_QUOTED_STRING1(x) #x
#endif
#ifndef TOP_HDL_ENTITY
#define TOP_HDL_ENTITY top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000
#endif
// Hold time for the SCVerify testbench to account for the gate delay after downstream synthesis in pico second(s)
// Hold time value is obtained from 'top_gate_constraints.cpp', which is generated at the end of RTL synthesis
#ifdef CCS_DUT_GATE
extern double __scv_hold_time;
extern double __scv_hold_time_RSCID_106;
extern double __scv_hold_time_RSCID_107;
extern double __scv_hold_time_RSCID_108;
extern double __scv_hold_time_RSCID_109;
extern double __scv_hold_time_RSCID_110;
extern double __scv_hold_time_RSCID_112;
#else
double __scv_hold_time = 0.0; // default for non-gate simulation is zero
double __scv_hold_time_RSCID_106 = 0;
double __scv_hold_time_RSCID_107 = 0;
double __scv_hold_time_RSCID_108 = 0;
double __scv_hold_time_RSCID_109 = 0;
double __scv_hold_time_RSCID_110 = 0;
double __scv_hold_time_RSCID_112 = 0;
#endif

class scverify_top : public sc_module
{
public:
  sc_signal<sc_logic>                                                                                      rst;
  sc_signal<sc_logic>                                                                                      rst_n;
  sc_signal<sc_logic>                                                                                      SIG_SC_LOGIC_0;
  sc_signal<sc_logic>                                                                                      SIG_SC_LOGIC_1;
  sc_signal<sc_logic>                                                                                      TLS_design_is_idle;
  sc_signal<bool>                                                                                          TLS_design_is_idle_reg;
  sc_clock                                                                                                 clk;
  mc_programmable_reset                                                                                    rst_driver;
  sc_signal<sc_logic>                                                                                      TLS_rst;
  sc_signal<sc_lv<16> >                                                                                    TLS_O_data_in_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_O_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_O_data_in_rsc_rdy;
  sc_signal<sc_lv<16> >                                                                                    TLS_O_data_out_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_O_data_out_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_O_data_out_rsc_rdy;
  sc_signal<sc_lv<16> >                                                                                    TLS_I_data_in_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_I_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_I_data_in_rsc_rdy;
  sc_signal<sc_lv<16> >                                                                                    TLS_W_data_in_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_W_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_W_data_in_rsc_rdy;
  sc_signal<sc_logic>                                                                                      TLS_zero_guard_in_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_zero_guard_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_zero_guard_in_rsc_rdy;
  sc_signal<sc_lv<485> >                                                                                   TLS_layer_instruction_in_rsc_dat;
  sc_signal<sc_logic>                                                                                      TLS_layer_instruction_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_layer_instruction_in_rsc_rdy;
  ccs_DUT_wrapper                                                                                          top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST;
  ccs_in_wait_trans_rsc_v1<1,485 >                                                                         layer_instruction_in_rsc_INST;
  ccs_in_wait_trans_rsc_v1<1,16 >                                                                          O_data_in_rsc_INST;
  ccs_out_wait_trans_rsc_v1<1,16 >                                                                         O_data_out_rsc_INST;
  ccs_in_wait_trans_rsc_v1<1,16 >                                                                          I_data_in_rsc_INST;
  ccs_in_wait_trans_rsc_v1<1,16 >                                                                          W_data_in_rsc_INST;
  sc_signal<sc_lv<1> >                                                                                     CCS_ADAPTOR_zero_guard_in_rsc_dat;
  ccs_sc_lv1_to_sc_logic_adapter                                                                           CCS_ADAPTOR_TLS_zero_guard_in_rsc_dat;
  ccs_in_wait_trans_rsc_v1<1,1 >                                                                           zero_guard_in_rsc_INST;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<14, false >,5> >                                               TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound_sizecount;
  sc_signal<sc_logic>                                                                                      TLS_layer_instruction_in_rsc_trdone;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<14, false >,5>,14,false>                         transactor_layer_instruction_in_O_loopData_L3_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_O_loopData_L3_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<9, false >,5> >                                                TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<9, false >,5>,9,false>                           transactor_layer_instruction_in_O_loopData_L2_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_O_loopData_L2_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<5, false >,5> >                                                TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<5, false >,5>,5,false>                           transactor_layer_instruction_in_O_loopData_L1_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_O_loopData_L1_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<14, false >,5> >                                               TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<14, false >,5>,14,false>                         transactor_layer_instruction_in_I_loopData_L3_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_I_loopData_L3_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<9, false >,5> >                                                TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<9, false >,5>,9,false>                           transactor_layer_instruction_in_I_loopData_L2_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_I_loopData_L2_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<5, false >,5> >                                                TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<5, false >,5>,5,false>                           transactor_layer_instruction_in_I_loopData_L1_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_I_loopData_L1_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<16, false >,5> >                                               TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<16, false >,5>,16,false>                         transactor_layer_instruction_in_W_loopData_L3_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_W_loopData_L3_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<11, false >,5> >                                               TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<11, false >,5>,11,false>                         transactor_layer_instruction_in_W_loopData_L2_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_W_loopData_L2_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_int<5, false >,5> >                                                TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_bound;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_int<5, false >,5>,5,false>                           transactor_layer_instruction_in_W_loopData_L1_bound;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<bool,5> >                                                             TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_relevancy;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy_sizecount;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<bool,5>,1,false>                                        transactor_layer_instruction_in_W_loopData_L1_relevancy;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1> >                        TLS_in_fifo_O_data_in_data;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_O_data_in_data;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_O_data_in_data_sizecount;
  sc_signal<sc_logic>                                                                                      TLS_O_data_in_rsc_trdone;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1>,16,false>  transactor_O_data_in_data;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1> >                        TLS_out_fifo_O_data_out_data;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_out_wait_ctrl_fifo_O_data_out_data;
  sc_signal<sc_logic>                                                                                      TLS_O_data_out_rsc_trdone;
  mc_output_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1>,16,false>         transactor_O_data_out_data;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1> >                        TLS_in_fifo_I_data_in_data;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_I_data_in_data;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_I_data_in_data_sizecount;
  sc_signal<sc_logic>                                                                                      TLS_I_data_in_rsc_trdone;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1>,16,false>  transactor_I_data_in_data;
  tlm::tlm_fifo<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1> >                        TLS_in_fifo_W_data_in_data;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_W_data_in_data;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_W_data_in_data_sizecount;
  sc_signal<sc_logic>                                                                                      TLS_W_data_in_rsc_trdone;
  mc_channel_input_transactor<mgc_sysc_ver_array1D<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >,1>,16,false>  transactor_W_data_in_data;
  tlm::tlm_fifo<bool >                                                                                     TLS_in_fifo_zero_guard_in;
  tlm::tlm_fifo<mc_wait_ctrl>                                                                              TLS_in_wait_ctrl_fifo_zero_guard_in;
  tlm::tlm_fifo<int>                                                                                       TLS_in_fifo_zero_guard_in_sizecount;
  sc_signal<sc_logic>                                                                                      TLS_zero_guard_in_rsc_trdone;
  mc_channel_input_transactor<bool,1,false>                                                                transactor_zero_guard_in;
  mc_testbench                                                                                             testbench_INST;
  sc_signal<sc_logic>                                                                                      catapult_start;
  sc_signal<sc_logic>                                                                                      catapult_done;
  sc_signal<sc_logic>                                                                                      catapult_ready;
  sc_signal<sc_logic>                                                                                      in_sync;
  sc_signal<sc_logic>                                                                                      out_sync;
  sc_signal<sc_logic>                                                                                      inout_sync;
  sc_signal<unsigned>                                                                                      wait_for_init;
  sync_generator                                                                                           sync_generator_INST;
  catapult_monitor                                                                                         catapult_monitor_INST;
  ccs_probe_monitor                                                                                       *ccs_probe_monitor_INST;
  sc_event                                                                                                 generate_reset_event;
  sc_event                                                                                                 deadlock_event;
  sc_signal<sc_logic>                                                                                      deadlocked;
  sc_signal<sc_logic>                                                                                      maxsimtime;
  sc_event                                                                                                 max_sim_time_event;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst_run_wen;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst_run_wen;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst_layer_instruction_in_rsci_irdy_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst_layer_instruction_in_rsci_ivld;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst_O_instr_L1_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst_O_instr_L1_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst_O_instr_L2_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst_O_instr_L2_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst_O_instr_L3_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst_O_instr_L3_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst_I_instr_L1_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst_I_instr_L1_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst_I_instr_L2_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst_I_instr_L2_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst_I_instr_L3_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst_I_instr_L3_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst_W_instr_L1_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst_W_instr_L1_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst_W_instr_L2_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst_W_instr_L2_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst_W_instr_L3_out_rsci_irdy;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst_W_instr_L3_out_rsci_ivld_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst_O_instr_in_rsci_irdy_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst_O_instr_in_rsci_ivld;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst_I_instr_in_rsci_irdy_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst_I_instr_in_rsci_ivld;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst_W_instr_in_rsci_irdy_run_sct;
  sc_signal<sc_logic>                                                                                      OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst_W_instr_in_rsci_ivld;
  sc_signal<sc_logic>                                                                                      OFS_layer_instruction_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      OFS_O_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      OFS_O_data_out_rsc_rdy;
  sc_signal<sc_logic>                                                                                      OFS_I_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      OFS_W_data_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      OFS_zero_guard_in_rsc_vld;
  sc_signal<sc_logic>                                                                                      TLS_enable_stalls;
  sc_signal<unsigned short>                                                                                TLS_stall_coverage;

  void TLS_rst_method();
  void drive_TLS_layer_instruction_in_rsc_trdone();
  void drive_TLS_O_data_in_rsc_trdone();
  void drive_TLS_O_data_out_rsc_trdone();
  void drive_TLS_I_data_in_rsc_trdone();
  void drive_TLS_W_data_in_rsc_trdone();
  void drive_TLS_zero_guard_in_rsc_trdone();
  void max_sim_time_notify();
  void start_of_simulation();
  void setup_debug();
  void debug(const char* varname, int flags, int count);
  void generate_reset();
  void install_observe_foreign_signals();
  void deadlock_watch();
  void deadlock_notify();

  // Constructor
  SC_HAS_PROCESS(scverify_top);
  scverify_top(const sc_module_name& name)
    : rst("rst")
    , rst_n("rst_n")
    , SIG_SC_LOGIC_0("SIG_SC_LOGIC_0")
    , SIG_SC_LOGIC_1("SIG_SC_LOGIC_1")
    , TLS_design_is_idle("TLS_design_is_idle")
    , TLS_design_is_idle_reg("TLS_design_is_idle_reg")
    , CCS_CLK_CTOR(clk, "clk", 10, SC_NS, 0.5, 0, SC_NS, false)
    , rst_driver("rst_driver", 20.000000, false)
    , TLS_rst("TLS_rst")
    , TLS_O_data_in_rsc_dat("TLS_O_data_in_rsc_dat")
    , TLS_O_data_in_rsc_vld("TLS_O_data_in_rsc_vld")
    , TLS_O_data_in_rsc_rdy("TLS_O_data_in_rsc_rdy")
    , TLS_O_data_out_rsc_dat("TLS_O_data_out_rsc_dat")
    , TLS_O_data_out_rsc_vld("TLS_O_data_out_rsc_vld")
    , TLS_O_data_out_rsc_rdy("TLS_O_data_out_rsc_rdy")
    , TLS_I_data_in_rsc_dat("TLS_I_data_in_rsc_dat")
    , TLS_I_data_in_rsc_vld("TLS_I_data_in_rsc_vld")
    , TLS_I_data_in_rsc_rdy("TLS_I_data_in_rsc_rdy")
    , TLS_W_data_in_rsc_dat("TLS_W_data_in_rsc_dat")
    , TLS_W_data_in_rsc_vld("TLS_W_data_in_rsc_vld")
    , TLS_W_data_in_rsc_rdy("TLS_W_data_in_rsc_rdy")
    , TLS_zero_guard_in_rsc_dat("TLS_zero_guard_in_rsc_dat")
    , TLS_zero_guard_in_rsc_vld("TLS_zero_guard_in_rsc_vld")
    , TLS_zero_guard_in_rsc_rdy("TLS_zero_guard_in_rsc_rdy")
    , TLS_layer_instruction_in_rsc_dat("TLS_layer_instruction_in_rsc_dat")
    , TLS_layer_instruction_in_rsc_vld("TLS_layer_instruction_in_rsc_vld")
    , TLS_layer_instruction_in_rsc_rdy("TLS_layer_instruction_in_rsc_rdy")
    , top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST("rtl",
        TO_QUOTED_STRING(TOP_HDL_ENTITY))
    , layer_instruction_in_rsc_INST("layer_instruction_in_rsc", true)
    , O_data_in_rsc_INST("O_data_in_rsc", true)
    , O_data_out_rsc_INST("O_data_out_rsc", true)
    , I_data_in_rsc_INST("I_data_in_rsc", true)
    , W_data_in_rsc_INST("W_data_in_rsc", true)
    , CCS_ADAPTOR_TLS_zero_guard_in_rsc_dat("CCS_ADAPTOR_TLS_zero_guard_in_rsc_dat")
    , zero_guard_in_rsc_INST("zero_guard_in_rsc", true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound("TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound_sizecount",
        1)
    , TLS_layer_instruction_in_rsc_trdone("TLS_layer_instruction_in_rsc_trdone")
    , transactor_layer_instruction_in_O_loopData_L3_bound("transactor_layer_instruction_in_O_loopData_L3_bound",
        0, 70, 0, true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy("TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_O_loopData_L3_relevancy("transactor_layer_instruction_in_O_loopData_L3_relevancy",
        0, 5, 70, true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound("TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound_sizecount",
        1)
    , transactor_layer_instruction_in_O_loopData_L2_bound("transactor_layer_instruction_in_O_loopData_L2_bound",
        0, 45, 75, true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy("TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_O_loopData_L2_relevancy("transactor_layer_instruction_in_O_loopData_L2_relevancy",
        0, 5, 120, true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound("TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound_sizecount",
        1)
    , transactor_layer_instruction_in_O_loopData_L1_bound("transactor_layer_instruction_in_O_loopData_L1_bound",
        0, 25, 125, true)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy("TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_O_loopData_L1_relevancy("transactor_layer_instruction_in_O_loopData_L1_relevancy",
        0, 5, 150, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound("TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L3_bound("transactor_layer_instruction_in_I_loopData_L3_bound",
        0, 70, 155, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy("TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L3_relevancy("transactor_layer_instruction_in_I_loopData_L3_relevancy",
        0, 5, 225, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound("TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L2_bound("transactor_layer_instruction_in_I_loopData_L2_bound",
        0, 45, 230, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy("TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L2_relevancy("transactor_layer_instruction_in_I_loopData_L2_relevancy",
        0, 5, 275, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound("TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L1_bound("transactor_layer_instruction_in_I_loopData_L1_bound",
        0, 25, 280, true)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy("TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_I_loopData_L1_relevancy("transactor_layer_instruction_in_I_loopData_L1_relevancy",
        0, 5, 305, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound("TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L3_bound("transactor_layer_instruction_in_W_loopData_L3_bound",
        0, 80, 310, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy("TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L3_relevancy("transactor_layer_instruction_in_W_loopData_L3_relevancy",
        0, 5, 390, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound("TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L2_bound("transactor_layer_instruction_in_W_loopData_L2_bound",
        0, 55, 395, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy("TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L2_relevancy("transactor_layer_instruction_in_W_loopData_L2_relevancy",
        0, 5, 450, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound("TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_bound("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_bound",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L1_bound("transactor_layer_instruction_in_W_loopData_L1_bound",
        0, 25, 455, true)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy("TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy",
        -1)
    , TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_relevancy("TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_relevancy",
        -1)
    , TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy_sizecount("TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy_sizecount",
        1)
    , transactor_layer_instruction_in_W_loopData_L1_relevancy("transactor_layer_instruction_in_W_loopData_L1_relevancy",
        0, 5, 480, true)
    , TLS_in_fifo_O_data_in_data("TLS_in_fifo_O_data_in_data", -1)
    , TLS_in_wait_ctrl_fifo_O_data_in_data("TLS_in_wait_ctrl_fifo_O_data_in_data", -1)
    , TLS_in_fifo_O_data_in_data_sizecount("TLS_in_fifo_O_data_in_data_sizecount", 1)
    , TLS_O_data_in_rsc_trdone("TLS_O_data_in_rsc_trdone")
    , transactor_O_data_in_data("transactor_O_data_in_data", 0, 16, 0, true)
    , TLS_out_fifo_O_data_out_data("TLS_out_fifo_O_data_out_data", -1)
    , TLS_out_wait_ctrl_fifo_O_data_out_data("TLS_out_wait_ctrl_fifo_O_data_out_data", -1)
    , TLS_O_data_out_rsc_trdone("TLS_O_data_out_rsc_trdone")
    , transactor_O_data_out_data("transactor_O_data_out_data", 0, 16, 0)
    , TLS_in_fifo_I_data_in_data("TLS_in_fifo_I_data_in_data", -1)
    , TLS_in_wait_ctrl_fifo_I_data_in_data("TLS_in_wait_ctrl_fifo_I_data_in_data", -1)
    , TLS_in_fifo_I_data_in_data_sizecount("TLS_in_fifo_I_data_in_data_sizecount", 1)
    , TLS_I_data_in_rsc_trdone("TLS_I_data_in_rsc_trdone")
    , transactor_I_data_in_data("transactor_I_data_in_data", 0, 16, 0, true)
    , TLS_in_fifo_W_data_in_data("TLS_in_fifo_W_data_in_data", -1)
    , TLS_in_wait_ctrl_fifo_W_data_in_data("TLS_in_wait_ctrl_fifo_W_data_in_data", -1)
    , TLS_in_fifo_W_data_in_data_sizecount("TLS_in_fifo_W_data_in_data_sizecount", 1)
    , TLS_W_data_in_rsc_trdone("TLS_W_data_in_rsc_trdone")
    , transactor_W_data_in_data("transactor_W_data_in_data", 0, 16, 0, true)
    , TLS_in_fifo_zero_guard_in("TLS_in_fifo_zero_guard_in", -1)
    , TLS_in_wait_ctrl_fifo_zero_guard_in("TLS_in_wait_ctrl_fifo_zero_guard_in", -1)
    , TLS_in_fifo_zero_guard_in_sizecount("TLS_in_fifo_zero_guard_in_sizecount", 1)
    , TLS_zero_guard_in_rsc_trdone("TLS_zero_guard_in_rsc_trdone")
    , transactor_zero_guard_in("transactor_zero_guard_in", 0, 1, 0, true)
    , testbench_INST("user_tb")
    , catapult_start("catapult_start")
    , catapult_done("catapult_done")
    , catapult_ready("catapult_ready")
    , in_sync("in_sync")
    , out_sync("out_sync")
    , inout_sync("inout_sync")
    , wait_for_init("wait_for_init")
    , sync_generator_INST("sync_generator", true, false, false, false, 11, 11, 0)
    , catapult_monitor_INST("Monitor", clk, true, 11LL, 7LL)
    , ccs_probe_monitor_INST(NULL)
    , deadlocked("deadlocked")
    , maxsimtime("maxsimtime")
  {
    rst_driver.reset_out(TLS_rst);

    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.clk(clk);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.rst(TLS_rst);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_in_rsc_dat(TLS_O_data_in_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_in_rsc_vld(TLS_O_data_in_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_in_rsc_rdy(TLS_O_data_in_rsc_rdy);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_out_rsc_dat(TLS_O_data_out_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_out_rsc_vld(TLS_O_data_out_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.O_data_out_rsc_rdy(TLS_O_data_out_rsc_rdy);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.I_data_in_rsc_dat(TLS_I_data_in_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.I_data_in_rsc_vld(TLS_I_data_in_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.I_data_in_rsc_rdy(TLS_I_data_in_rsc_rdy);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.W_data_in_rsc_dat(TLS_W_data_in_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.W_data_in_rsc_vld(TLS_W_data_in_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.W_data_in_rsc_rdy(TLS_W_data_in_rsc_rdy);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.zero_guard_in_rsc_dat(TLS_zero_guard_in_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.zero_guard_in_rsc_vld(TLS_zero_guard_in_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.zero_guard_in_rsc_rdy(TLS_zero_guard_in_rsc_rdy);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.layer_instruction_in_rsc_dat(TLS_layer_instruction_in_rsc_dat);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.layer_instruction_in_rsc_vld(TLS_layer_instruction_in_rsc_vld);
    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_INST.layer_instruction_in_rsc_rdy(TLS_layer_instruction_in_rsc_rdy);

    layer_instruction_in_rsc_INST.rdy(TLS_layer_instruction_in_rsc_rdy);
    layer_instruction_in_rsc_INST.vld(TLS_layer_instruction_in_rsc_vld);
    layer_instruction_in_rsc_INST.dat(TLS_layer_instruction_in_rsc_dat);
    layer_instruction_in_rsc_INST.clk(clk);
    layer_instruction_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_112)));

    O_data_in_rsc_INST.rdy(TLS_O_data_in_rsc_rdy);
    O_data_in_rsc_INST.vld(TLS_O_data_in_rsc_vld);
    O_data_in_rsc_INST.dat(TLS_O_data_in_rsc_dat);
    O_data_in_rsc_INST.clk(clk);
    O_data_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_106)));

    O_data_out_rsc_INST.rdy(TLS_O_data_out_rsc_rdy);
    O_data_out_rsc_INST.vld(TLS_O_data_out_rsc_vld);
    O_data_out_rsc_INST.dat(TLS_O_data_out_rsc_dat);
    O_data_out_rsc_INST.clk(clk);
    O_data_out_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_107)));

    I_data_in_rsc_INST.rdy(TLS_I_data_in_rsc_rdy);
    I_data_in_rsc_INST.vld(TLS_I_data_in_rsc_vld);
    I_data_in_rsc_INST.dat(TLS_I_data_in_rsc_dat);
    I_data_in_rsc_INST.clk(clk);
    I_data_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_108)));

    W_data_in_rsc_INST.rdy(TLS_W_data_in_rsc_rdy);
    W_data_in_rsc_INST.vld(TLS_W_data_in_rsc_vld);
    W_data_in_rsc_INST.dat(TLS_W_data_in_rsc_dat);
    W_data_in_rsc_INST.clk(clk);
    W_data_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_109)));

    CCS_ADAPTOR_TLS_zero_guard_in_rsc_dat.inVECTOR(CCS_ADAPTOR_zero_guard_in_rsc_dat);
    CCS_ADAPTOR_TLS_zero_guard_in_rsc_dat.outSCALAR(TLS_zero_guard_in_rsc_dat);

    zero_guard_in_rsc_INST.rdy(TLS_zero_guard_in_rsc_rdy);
    zero_guard_in_rsc_INST.vld(TLS_zero_guard_in_rsc_vld);
    zero_guard_in_rsc_INST.dat(CCS_ADAPTOR_zero_guard_in_rsc_dat);
    zero_guard_in_rsc_INST.clk(clk);
    zero_guard_in_rsc_INST.add_attribute(*(new sc_attribute<double>("CLK_SKEW_DELAY", __scv_hold_time_RSCID_110)));

    transactor_layer_instruction_in_O_loopData_L3_bound.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound);
    transactor_layer_instruction_in_O_loopData_L3_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_bound);
    transactor_layer_instruction_in_O_loopData_L3_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound_sizecount);
    transactor_layer_instruction_in_O_loopData_L3_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L3_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L3_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_O_loopData_L3_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy);
    transactor_layer_instruction_in_O_loopData_L3_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_relevancy);
    transactor_layer_instruction_in_O_loopData_L3_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy_sizecount);
    transactor_layer_instruction_in_O_loopData_L3_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L3_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L3_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_O_loopData_L2_bound.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound);
    transactor_layer_instruction_in_O_loopData_L2_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_bound);
    transactor_layer_instruction_in_O_loopData_L2_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound_sizecount);
    transactor_layer_instruction_in_O_loopData_L2_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L2_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L2_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_O_loopData_L2_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy);
    transactor_layer_instruction_in_O_loopData_L2_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_relevancy);
    transactor_layer_instruction_in_O_loopData_L2_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy_sizecount);
    transactor_layer_instruction_in_O_loopData_L2_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L2_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L2_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_O_loopData_L1_bound.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound);
    transactor_layer_instruction_in_O_loopData_L1_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_bound);
    transactor_layer_instruction_in_O_loopData_L1_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound_sizecount);
    transactor_layer_instruction_in_O_loopData_L1_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L1_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L1_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_O_loopData_L1_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy);
    transactor_layer_instruction_in_O_loopData_L1_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_relevancy);
    transactor_layer_instruction_in_O_loopData_L1_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy_sizecount);
    transactor_layer_instruction_in_O_loopData_L1_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_O_loopData_L1_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_O_loopData_L1_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L3_bound.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound);
    transactor_layer_instruction_in_I_loopData_L3_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_bound);
    transactor_layer_instruction_in_I_loopData_L3_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound_sizecount);
    transactor_layer_instruction_in_I_loopData_L3_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L3_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L3_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L3_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy);
    transactor_layer_instruction_in_I_loopData_L3_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_relevancy);
    transactor_layer_instruction_in_I_loopData_L3_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy_sizecount);
    transactor_layer_instruction_in_I_loopData_L3_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L3_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L3_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L2_bound.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound);
    transactor_layer_instruction_in_I_loopData_L2_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_bound);
    transactor_layer_instruction_in_I_loopData_L2_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound_sizecount);
    transactor_layer_instruction_in_I_loopData_L2_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L2_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L2_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L2_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy);
    transactor_layer_instruction_in_I_loopData_L2_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_relevancy);
    transactor_layer_instruction_in_I_loopData_L2_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy_sizecount);
    transactor_layer_instruction_in_I_loopData_L2_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L2_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L2_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L1_bound.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound);
    transactor_layer_instruction_in_I_loopData_L1_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_bound);
    transactor_layer_instruction_in_I_loopData_L1_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound_sizecount);
    transactor_layer_instruction_in_I_loopData_L1_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L1_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L1_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_I_loopData_L1_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy);
    transactor_layer_instruction_in_I_loopData_L1_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_relevancy);
    transactor_layer_instruction_in_I_loopData_L1_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy_sizecount);
    transactor_layer_instruction_in_I_loopData_L1_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_I_loopData_L1_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_I_loopData_L1_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L3_bound.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound);
    transactor_layer_instruction_in_W_loopData_L3_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_bound);
    transactor_layer_instruction_in_W_loopData_L3_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound_sizecount);
    transactor_layer_instruction_in_W_loopData_L3_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L3_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L3_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L3_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy);
    transactor_layer_instruction_in_W_loopData_L3_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_relevancy);
    transactor_layer_instruction_in_W_loopData_L3_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy_sizecount);
    transactor_layer_instruction_in_W_loopData_L3_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L3_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L3_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L2_bound.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound);
    transactor_layer_instruction_in_W_loopData_L2_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_bound);
    transactor_layer_instruction_in_W_loopData_L2_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound_sizecount);
    transactor_layer_instruction_in_W_loopData_L2_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L2_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L2_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L2_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy);
    transactor_layer_instruction_in_W_loopData_L2_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_relevancy);
    transactor_layer_instruction_in_W_loopData_L2_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy_sizecount);
    transactor_layer_instruction_in_W_loopData_L2_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L2_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L2_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L1_bound.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound);
    transactor_layer_instruction_in_W_loopData_L1_bound.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_bound);
    transactor_layer_instruction_in_W_loopData_L1_bound.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound_sizecount);
    transactor_layer_instruction_in_W_loopData_L1_bound.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L1_bound.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L1_bound.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_layer_instruction_in_W_loopData_L1_relevancy.in_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy);
    transactor_layer_instruction_in_W_loopData_L1_relevancy.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_relevancy);
    transactor_layer_instruction_in_W_loopData_L1_relevancy.sizecount_fifo(TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy_sizecount);
    transactor_layer_instruction_in_W_loopData_L1_relevancy.bind_clk(clk, true, rst);
    transactor_layer_instruction_in_W_loopData_L1_relevancy.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT",
        0 )));
    transactor_layer_instruction_in_W_loopData_L1_relevancy.register_block(&layer_instruction_in_rsc_INST, layer_instruction_in_rsc_INST.basename(),
        TLS_layer_instruction_in_rsc_trdone, 0, 0, 1);

    transactor_O_data_in_data.in_fifo(TLS_in_fifo_O_data_in_data);
    transactor_O_data_in_data.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_O_data_in_data);
    transactor_O_data_in_data.sizecount_fifo(TLS_in_fifo_O_data_in_data_sizecount);
    transactor_O_data_in_data.bind_clk(clk, true, rst);
    transactor_O_data_in_data.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_O_data_in_data.register_block(&O_data_in_rsc_INST, O_data_in_rsc_INST.basename(), TLS_O_data_in_rsc_trdone,
        0, 0, 1);

    transactor_O_data_out_data.out_fifo(TLS_out_fifo_O_data_out_data);
    transactor_O_data_out_data.out_wait_ctrl_fifo(TLS_out_wait_ctrl_fifo_O_data_out_data);
    transactor_O_data_out_data.bind_clk(clk, true, rst);
    transactor_O_data_out_data.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_O_data_out_data.register_block(&O_data_out_rsc_INST, O_data_out_rsc_INST.basename(), TLS_O_data_out_rsc_trdone,
        0, 0, 1);

    transactor_I_data_in_data.in_fifo(TLS_in_fifo_I_data_in_data);
    transactor_I_data_in_data.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_I_data_in_data);
    transactor_I_data_in_data.sizecount_fifo(TLS_in_fifo_I_data_in_data_sizecount);
    transactor_I_data_in_data.bind_clk(clk, true, rst);
    transactor_I_data_in_data.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_I_data_in_data.register_block(&I_data_in_rsc_INST, I_data_in_rsc_INST.basename(), TLS_I_data_in_rsc_trdone,
        0, 0, 1);

    transactor_W_data_in_data.in_fifo(TLS_in_fifo_W_data_in_data);
    transactor_W_data_in_data.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_W_data_in_data);
    transactor_W_data_in_data.sizecount_fifo(TLS_in_fifo_W_data_in_data_sizecount);
    transactor_W_data_in_data.bind_clk(clk, true, rst);
    transactor_W_data_in_data.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_W_data_in_data.register_block(&W_data_in_rsc_INST, W_data_in_rsc_INST.basename(), TLS_W_data_in_rsc_trdone,
        0, 0, 1);

    transactor_zero_guard_in.in_fifo(TLS_in_fifo_zero_guard_in);
    transactor_zero_guard_in.in_wait_ctrl_fifo(TLS_in_wait_ctrl_fifo_zero_guard_in);
    transactor_zero_guard_in.sizecount_fifo(TLS_in_fifo_zero_guard_in_sizecount);
    transactor_zero_guard_in.bind_clk(clk, true, rst);
    transactor_zero_guard_in.add_attribute(*(new sc_attribute<int>("MC_TRANSACTOR_EVENT", 0 )));
    transactor_zero_guard_in.register_block(&zero_guard_in_rsc_INST, zero_guard_in_rsc_INST.basename(), TLS_zero_guard_in_rsc_trdone,
        0, 0, 1);

    testbench_INST.clk(clk);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L3_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L3_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L3_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L3_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L3_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L2_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L2_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L2_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L2_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L2_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L1_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_O_loopData_L1_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_O_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_O_loopData_L1_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_O_loopData_L1_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_O_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_O_loopData_L1_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L3_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L3_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L3_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L3_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L3_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L2_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L2_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L2_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L2_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L2_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L1_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_I_loopData_L1_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_I_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_I_loopData_L1_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_I_loopData_L1_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_I_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_I_loopData_L1_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L3_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L3_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L3_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L3_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L3_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L3_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L3_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L2_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L2_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L2_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L2_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L2_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L2_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L2_relevancy_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L1_bound(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_bound);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L1_bound(TLS_in_fifo_layer_instruction_in_W_loopData_L1_bound_sizecount);
    testbench_INST.ccs_layer_instruction_in_W_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy);
    testbench_INST.ccs_wait_ctrl_layer_instruction_in_W_loopData_L1_relevancy(TLS_in_wait_ctrl_fifo_layer_instruction_in_W_loopData_L1_relevancy);
    testbench_INST.ccs_sizecount_layer_instruction_in_W_loopData_L1_relevancy(TLS_in_fifo_layer_instruction_in_W_loopData_L1_relevancy_sizecount);
    testbench_INST.ccs_O_data_in_data(TLS_in_fifo_O_data_in_data);
    testbench_INST.ccs_wait_ctrl_O_data_in_data(TLS_in_wait_ctrl_fifo_O_data_in_data);
    testbench_INST.ccs_sizecount_O_data_in_data(TLS_in_fifo_O_data_in_data_sizecount);
    testbench_INST.ccs_O_data_out_data(TLS_out_fifo_O_data_out_data);
    testbench_INST.ccs_wait_ctrl_O_data_out_data(TLS_out_wait_ctrl_fifo_O_data_out_data);
    testbench_INST.ccs_I_data_in_data(TLS_in_fifo_I_data_in_data);
    testbench_INST.ccs_wait_ctrl_I_data_in_data(TLS_in_wait_ctrl_fifo_I_data_in_data);
    testbench_INST.ccs_sizecount_I_data_in_data(TLS_in_fifo_I_data_in_data_sizecount);
    testbench_INST.ccs_W_data_in_data(TLS_in_fifo_W_data_in_data);
    testbench_INST.ccs_wait_ctrl_W_data_in_data(TLS_in_wait_ctrl_fifo_W_data_in_data);
    testbench_INST.ccs_sizecount_W_data_in_data(TLS_in_fifo_W_data_in_data_sizecount);
    testbench_INST.ccs_zero_guard_in(TLS_in_fifo_zero_guard_in);
    testbench_INST.ccs_wait_ctrl_zero_guard_in(TLS_in_wait_ctrl_fifo_zero_guard_in);
    testbench_INST.ccs_sizecount_zero_guard_in(TLS_in_fifo_zero_guard_in_sizecount);
    testbench_INST.design_is_idle(TLS_design_is_idle_reg);
    testbench_INST.enable_stalls(TLS_enable_stalls);
    testbench_INST.stall_coverage(TLS_stall_coverage);

    sync_generator_INST.clk(clk);
    sync_generator_INST.rst(rst);
    sync_generator_INST.in_sync(in_sync);
    sync_generator_INST.out_sync(out_sync);
    sync_generator_INST.inout_sync(inout_sync);
    sync_generator_INST.wait_for_init(wait_for_init);
    sync_generator_INST.catapult_start(catapult_start);
    sync_generator_INST.catapult_ready(catapult_ready);
    sync_generator_INST.catapult_done(catapult_done);

    catapult_monitor_INST.rst(rst);


    SC_METHOD(TLS_rst_method);
      sensitive_pos << TLS_rst;
      dont_initialize();

    SC_METHOD(drive_TLS_layer_instruction_in_rsc_trdone);
      sensitive << TLS_layer_instruction_in_rsc_rdy;
      sensitive << TLS_layer_instruction_in_rsc_vld;
      sensitive << rst;

    SC_METHOD(drive_TLS_O_data_in_rsc_trdone);
      sensitive << TLS_O_data_in_rsc_rdy;
      sensitive << TLS_O_data_in_rsc_vld;
      sensitive << rst;

    SC_METHOD(drive_TLS_O_data_out_rsc_trdone);
      sensitive << TLS_O_data_out_rsc_vld;
      sensitive << TLS_O_data_out_rsc_rdy;

    SC_METHOD(drive_TLS_I_data_in_rsc_trdone);
      sensitive << TLS_I_data_in_rsc_rdy;
      sensitive << TLS_I_data_in_rsc_vld;
      sensitive << rst;

    SC_METHOD(drive_TLS_W_data_in_rsc_trdone);
      sensitive << TLS_W_data_in_rsc_rdy;
      sensitive << TLS_W_data_in_rsc_vld;
      sensitive << rst;

    SC_METHOD(drive_TLS_zero_guard_in_rsc_trdone);
      sensitive << TLS_zero_guard_in_rsc_rdy;
      sensitive << TLS_zero_guard_in_rsc_vld;
      sensitive << rst;

    SC_METHOD(max_sim_time_notify);
      sensitive << max_sim_time_event;
      dont_initialize();

    SC_METHOD(generate_reset);
      sensitive << generate_reset_event;
      sensitive << testbench_INST.reset_request_event;

    SC_METHOD(deadlock_watch);
      sensitive << clk;
      sensitive << OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst_run_wen;
      sensitive << OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst_run_wen;
      dont_initialize();

    SC_METHOD(deadlock_notify);
      sensitive << deadlock_event;
      dont_initialize();


    #if defined(CCS_SCVERIFY) && defined(CCS_DUT_RTL) && !defined(CCS_DUT_SYSC) && !defined(CCS_SYSC) && !defined(CCS_DUT_POWER)
        ccs_probe_monitor_INST = new ccs_probe_monitor("ccs_probe_monitor");
    ccs_probe_monitor_INST->clk(clk);
    ccs_probe_monitor_INST->rst(rst);
    #endif
    SIG_SC_LOGIC_0.write(SC_LOGIC_0);
    SIG_SC_LOGIC_1.write(SC_LOGIC_1);
    mt19937_init_genrand(19650218UL);
    install_observe_foreign_signals();
  }
};
void scverify_top::TLS_rst_method() {
  std::ostringstream msg;
  msg << "TLS_rst active @ " << sc_time_stamp();
  SC_REPORT_INFO("HW reset", msg.str().c_str());
  layer_instruction_in_rsc_INST.clear();
  O_data_in_rsc_INST.clear();
  O_data_out_rsc_INST.clear();
  I_data_in_rsc_INST.clear();
  W_data_in_rsc_INST.clear();
  zero_guard_in_rsc_INST.clear();
}

void scverify_top::drive_TLS_layer_instruction_in_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_layer_instruction_in_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_layer_instruction_in_rsc_trdone.write(TLS_layer_instruction_in_rsc_rdy.read() & TLS_layer_instruction_in_rsc_vld.read()
      & ~rst.read());
}

void scverify_top::drive_TLS_O_data_in_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_O_data_in_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_O_data_in_rsc_trdone.write(TLS_O_data_in_rsc_rdy.read() & TLS_O_data_in_rsc_vld.read() & ~rst.read());
}

void scverify_top::drive_TLS_O_data_out_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_O_data_out_rsc_vld.read()!= SC_LOGIC_1); }
  TLS_O_data_out_rsc_trdone.write(TLS_O_data_out_rsc_vld.read() & TLS_O_data_out_rsc_rdy.read());
}

void scverify_top::drive_TLS_I_data_in_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_I_data_in_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_I_data_in_rsc_trdone.write(TLS_I_data_in_rsc_rdy.read() & TLS_I_data_in_rsc_vld.read() & ~rst.read());
}

void scverify_top::drive_TLS_W_data_in_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_W_data_in_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_W_data_in_rsc_trdone.write(TLS_W_data_in_rsc_rdy.read() & TLS_W_data_in_rsc_vld.read() & ~rst.read());
}

void scverify_top::drive_TLS_zero_guard_in_rsc_trdone() {
  if (rst.read()==sc_dt::Log_1) { assert(TLS_zero_guard_in_rsc_rdy.read()!= SC_LOGIC_1); }
  TLS_zero_guard_in_rsc_trdone.write(TLS_zero_guard_in_rsc_rdy.read() & TLS_zero_guard_in_rsc_vld.read() & ~rst.read());
}

void scverify_top::max_sim_time_notify() {
  testbench_INST.set_failed(true);
  testbench_INST.check_results();
  SC_REPORT_ERROR("System", "Specified maximum simulation time reached");
  sc_stop();
}

void scverify_top::start_of_simulation() {
  char *SCVerify_AUTOWAIT = getenv("SCVerify_AUTOWAIT");
  if (SCVerify_AUTOWAIT) {
    int l = atoi(SCVerify_AUTOWAIT);
    transactor_layer_instruction_in_O_loopData_L3_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_O_loopData_L3_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_O_loopData_L2_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_O_loopData_L2_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_O_loopData_L1_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_O_loopData_L1_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L3_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L3_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L2_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L2_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L1_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_I_loopData_L1_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L3_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L3_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L2_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L2_relevancy.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L1_bound.set_auto_wait_limit(l);
    transactor_layer_instruction_in_W_loopData_L1_relevancy.set_auto_wait_limit(l);
    transactor_O_data_in_data.set_auto_wait_limit(l);
    transactor_O_data_out_data.set_auto_wait_limit(l);
    transactor_I_data_in_data.set_auto_wait_limit(l);
    transactor_W_data_in_data.set_auto_wait_limit(l);
    transactor_zero_guard_in.set_auto_wait_limit(l);
  }
}

void scverify_top::setup_debug() {
#ifdef MC_DEFAULT_TRANSACTOR_LOG
  static int transactor_layer_instruction_in_O_loopData_L3_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_O_loopData_L3_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_O_loopData_L2_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_O_loopData_L2_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_O_loopData_L1_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_O_loopData_L1_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L3_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L3_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L2_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L2_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L1_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_I_loopData_L1_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L3_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L3_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L2_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L2_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L1_bound_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_layer_instruction_in_W_loopData_L1_relevancy_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_O_data_in_data_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_O_data_out_data_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_I_data_in_data_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_W_data_in_data_flags = MC_DEFAULT_TRANSACTOR_LOG;
  static int transactor_zero_guard_in_flags = MC_DEFAULT_TRANSACTOR_LOG;
#else
  static int transactor_layer_instruction_in_O_loopData_L3_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_O_loopData_L3_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_O_loopData_L2_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_O_loopData_L2_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_O_loopData_L1_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_O_loopData_L1_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L3_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L3_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L2_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L2_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L1_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_I_loopData_L1_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L3_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L3_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L2_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L2_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L1_bound_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_layer_instruction_in_W_loopData_L1_relevancy_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_O_data_in_data_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_O_data_out_data_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_I_data_in_data_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_W_data_in_data_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
  static int transactor_zero_guard_in_flags = MC_TRANSACTOR_UNDERFLOW | MC_TRANSACTOR_WAIT;
#endif
  static int transactor_layer_instruction_in_O_loopData_L3_bound_count = -1;
  static int transactor_layer_instruction_in_O_loopData_L3_relevancy_count = -1;
  static int transactor_layer_instruction_in_O_loopData_L2_bound_count = -1;
  static int transactor_layer_instruction_in_O_loopData_L2_relevancy_count = -1;
  static int transactor_layer_instruction_in_O_loopData_L1_bound_count = -1;
  static int transactor_layer_instruction_in_O_loopData_L1_relevancy_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L3_bound_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L3_relevancy_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L2_bound_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L2_relevancy_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L1_bound_count = -1;
  static int transactor_layer_instruction_in_I_loopData_L1_relevancy_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L3_bound_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L3_relevancy_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L2_bound_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L2_relevancy_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L1_bound_count = -1;
  static int transactor_layer_instruction_in_W_loopData_L1_relevancy_count = -1;
  static int transactor_O_data_in_data_count = -1;
  static int transactor_O_data_out_data_count = -1;
  static int transactor_I_data_in_data_count = -1;
  static int transactor_W_data_in_data_count = -1;
  static int transactor_zero_guard_in_count = -1;

  // At the breakpoint, modify the local variables
  // above to turn on/off different levels of transaction
  // logging for each variable. Available flags are:
  //   MC_TRANSACTOR_EMPTY       - log empty FIFOs (on by default)
  //   MC_TRANSACTOR_UNDERFLOW   - log FIFOs that run empty and then are loaded again (off)
  //   MC_TRANSACTOR_READ        - log all read events
  //   MC_TRANSACTOR_WRITE       - log all write events
  //   MC_TRANSACTOR_LOAD        - log all FIFO load events
  //   MC_TRANSACTOR_DUMP        - log all FIFO dump events
  //   MC_TRANSACTOR_STREAMCNT   - log all streamed port index counter events
  //   MC_TRANSACTOR_WAIT        - log user specified handshake waits
  //   MC_TRANSACTOR_SIZE        - log input FIFO size updates

  std::ifstream debug_cmds;
  debug_cmds.open("scverify.cmd",std::fstream::in);
  if (debug_cmds.is_open()) {
    std::cout << "Reading SCVerify debug commands from file 'scverify.cmd'" << std::endl;
    std::string line;
    while (getline(debug_cmds,line)) {
      std::size_t pos1 = line.find(" ");
      if (pos1 == std::string::npos) continue;
      std::size_t pos2 = line.find(" ", pos1+1);
      std::string varname = line.substr(0,pos1);
      std::string flags = line.substr(pos1+1,pos2-pos1-1);
      std::string count = line.substr(pos2+1);
      debug(varname.c_str(),std::atoi(flags.c_str()),std::atoi(count.c_str()));
    }
    debug_cmds.close();
  } else {
    debug("transactor_layer_instruction_in_O_loopData_L3_bound",transactor_layer_instruction_in_O_loopData_L3_bound_flags,transactor_layer_instruction_in_O_loopData_L3_bound_count);
    debug("transactor_layer_instruction_in_O_loopData_L3_relevancy",transactor_layer_instruction_in_O_loopData_L3_relevancy_flags,transactor_layer_instruction_in_O_loopData_L3_relevancy_count);
    debug("transactor_layer_instruction_in_O_loopData_L2_bound",transactor_layer_instruction_in_O_loopData_L2_bound_flags,transactor_layer_instruction_in_O_loopData_L2_bound_count);
    debug("transactor_layer_instruction_in_O_loopData_L2_relevancy",transactor_layer_instruction_in_O_loopData_L2_relevancy_flags,transactor_layer_instruction_in_O_loopData_L2_relevancy_count);
    debug("transactor_layer_instruction_in_O_loopData_L1_bound",transactor_layer_instruction_in_O_loopData_L1_bound_flags,transactor_layer_instruction_in_O_loopData_L1_bound_count);
    debug("transactor_layer_instruction_in_O_loopData_L1_relevancy",transactor_layer_instruction_in_O_loopData_L1_relevancy_flags,transactor_layer_instruction_in_O_loopData_L1_relevancy_count);
    debug("transactor_layer_instruction_in_I_loopData_L3_bound",transactor_layer_instruction_in_I_loopData_L3_bound_flags,transactor_layer_instruction_in_I_loopData_L3_bound_count);
    debug("transactor_layer_instruction_in_I_loopData_L3_relevancy",transactor_layer_instruction_in_I_loopData_L3_relevancy_flags,transactor_layer_instruction_in_I_loopData_L3_relevancy_count);
    debug("transactor_layer_instruction_in_I_loopData_L2_bound",transactor_layer_instruction_in_I_loopData_L2_bound_flags,transactor_layer_instruction_in_I_loopData_L2_bound_count);
    debug("transactor_layer_instruction_in_I_loopData_L2_relevancy",transactor_layer_instruction_in_I_loopData_L2_relevancy_flags,transactor_layer_instruction_in_I_loopData_L2_relevancy_count);
    debug("transactor_layer_instruction_in_I_loopData_L1_bound",transactor_layer_instruction_in_I_loopData_L1_bound_flags,transactor_layer_instruction_in_I_loopData_L1_bound_count);
    debug("transactor_layer_instruction_in_I_loopData_L1_relevancy",transactor_layer_instruction_in_I_loopData_L1_relevancy_flags,transactor_layer_instruction_in_I_loopData_L1_relevancy_count);
    debug("transactor_layer_instruction_in_W_loopData_L3_bound",transactor_layer_instruction_in_W_loopData_L3_bound_flags,transactor_layer_instruction_in_W_loopData_L3_bound_count);
    debug("transactor_layer_instruction_in_W_loopData_L3_relevancy",transactor_layer_instruction_in_W_loopData_L3_relevancy_flags,transactor_layer_instruction_in_W_loopData_L3_relevancy_count);
    debug("transactor_layer_instruction_in_W_loopData_L2_bound",transactor_layer_instruction_in_W_loopData_L2_bound_flags,transactor_layer_instruction_in_W_loopData_L2_bound_count);
    debug("transactor_layer_instruction_in_W_loopData_L2_relevancy",transactor_layer_instruction_in_W_loopData_L2_relevancy_flags,transactor_layer_instruction_in_W_loopData_L2_relevancy_count);
    debug("transactor_layer_instruction_in_W_loopData_L1_bound",transactor_layer_instruction_in_W_loopData_L1_bound_flags,transactor_layer_instruction_in_W_loopData_L1_bound_count);
    debug("transactor_layer_instruction_in_W_loopData_L1_relevancy",transactor_layer_instruction_in_W_loopData_L1_relevancy_flags,transactor_layer_instruction_in_W_loopData_L1_relevancy_count);
    debug("transactor_O_data_in_data",transactor_O_data_in_data_flags,transactor_O_data_in_data_count);
    debug("transactor_O_data_out_data",transactor_O_data_out_data_flags,transactor_O_data_out_data_count);
    debug("transactor_I_data_in_data",transactor_I_data_in_data_flags,transactor_I_data_in_data_count);
    debug("transactor_W_data_in_data",transactor_W_data_in_data_flags,transactor_W_data_in_data_count);
    debug("transactor_zero_guard_in",transactor_zero_guard_in_flags,transactor_zero_guard_in_count);
  }
}

void scverify_top::debug(const char* varname, int flags, int count) {
  sc_module *xlator_p = 0;
  sc_attr_base *debug_attr_p = 0;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L3_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L3_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L3_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L3_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L2_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L2_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L2_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L2_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L1_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L1_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_O_loopData_L1_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_O_loopData_L1_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L3_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L3_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L3_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L3_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L2_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L2_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L2_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L2_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L1_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L1_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_I_loopData_L1_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_I_loopData_L1_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L3_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L3_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L3_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L3_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L2_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L2_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L2_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L2_relevancy;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L1_bound") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L1_bound;
  if (strcmp(varname,"transactor_layer_instruction_in_W_loopData_L1_relevancy") == 0)
    xlator_p = &transactor_layer_instruction_in_W_loopData_L1_relevancy;
  if (strcmp(varname,"transactor_O_data_in_data") == 0)
    xlator_p = &transactor_O_data_in_data;
  if (strcmp(varname,"transactor_O_data_out_data") == 0)
    xlator_p = &transactor_O_data_out_data;
  if (strcmp(varname,"transactor_I_data_in_data") == 0)
    xlator_p = &transactor_I_data_in_data;
  if (strcmp(varname,"transactor_W_data_in_data") == 0)
    xlator_p = &transactor_W_data_in_data;
  if (strcmp(varname,"transactor_zero_guard_in") == 0)
    xlator_p = &transactor_zero_guard_in;
  if (xlator_p) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_EVENT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_EVENT",flags);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = flags;
  }

  if (count>=0) {
    debug_attr_p = xlator_p->get_attribute("MC_TRANSACTOR_COUNT");
    if (!debug_attr_p) {
      debug_attr_p = new sc_attribute<int>("MC_TRANSACTOR_COUNT",count);
      xlator_p->add_attribute(*debug_attr_p);
    }
    ((sc_attribute<int>*)debug_attr_p)->value = count;
  }
}

// Process: SC_METHOD generate_reset
void scverify_top::generate_reset() {
  static bool activate_reset = true;
  static bool toggle_hw_reset = false;
  if (activate_reset || sc_time_stamp() == SC_ZERO_TIME) {
    setup_debug();
    activate_reset = false;
    rst.write(SC_LOGIC_1);
    rst_driver.reset_driver();
    generate_reset_event.notify(20.000000 , SC_NS);
  } else {
    if (toggle_hw_reset) {
      toggle_hw_reset = false;
      generate_reset_event.notify(20.000000 , SC_NS);
    } else {
      transactor_layer_instruction_in_O_loopData_L3_bound.reset_streams();
      transactor_layer_instruction_in_O_loopData_L3_relevancy.reset_streams();
      transactor_layer_instruction_in_O_loopData_L2_bound.reset_streams();
      transactor_layer_instruction_in_O_loopData_L2_relevancy.reset_streams();
      transactor_layer_instruction_in_O_loopData_L1_bound.reset_streams();
      transactor_layer_instruction_in_O_loopData_L1_relevancy.reset_streams();
      transactor_layer_instruction_in_I_loopData_L3_bound.reset_streams();
      transactor_layer_instruction_in_I_loopData_L3_relevancy.reset_streams();
      transactor_layer_instruction_in_I_loopData_L2_bound.reset_streams();
      transactor_layer_instruction_in_I_loopData_L2_relevancy.reset_streams();
      transactor_layer_instruction_in_I_loopData_L1_bound.reset_streams();
      transactor_layer_instruction_in_I_loopData_L1_relevancy.reset_streams();
      transactor_layer_instruction_in_W_loopData_L3_bound.reset_streams();
      transactor_layer_instruction_in_W_loopData_L3_relevancy.reset_streams();
      transactor_layer_instruction_in_W_loopData_L2_bound.reset_streams();
      transactor_layer_instruction_in_W_loopData_L2_relevancy.reset_streams();
      transactor_layer_instruction_in_W_loopData_L1_bound.reset_streams();
      transactor_layer_instruction_in_W_loopData_L1_relevancy.reset_streams();
      transactor_O_data_in_data.reset_streams();
      transactor_O_data_out_data.reset_streams();
      transactor_I_data_in_data.reset_streams();
      transactor_W_data_in_data.reset_streams();
      transactor_zero_guard_in.reset_streams();
      rst.write(SC_LOGIC_0);
    }
    activate_reset = true;
  }
}

void scverify_top::install_observe_foreign_signals() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst_run_wen,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst/run_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst_run_wen,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst/run_wen);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst_layer_instruction_in_rsci_irdy_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst/layer_instruction_in_rsci_irdy_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst_layer_instruction_in_rsci_ivld,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst/layer_instruction_in_rsci_ivld);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst_O_instr_L1_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst/O_instr_L1_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst_O_instr_L1_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst/O_instr_L1_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst_O_instr_L2_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst/O_instr_L2_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst_O_instr_L2_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst/O_instr_L2_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst_O_instr_L3_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst/O_instr_L3_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst_O_instr_L3_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst/O_instr_L3_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst_I_instr_L1_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst/I_instr_L1_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst_I_instr_L1_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst/I_instr_L1_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst_I_instr_L2_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst/I_instr_L2_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst_I_instr_L2_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst/I_instr_L2_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst_I_instr_L3_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst/I_instr_L3_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst_I_instr_L3_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst/I_instr_L3_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst_W_instr_L1_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst/W_instr_L1_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst_W_instr_L1_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst/W_instr_L1_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst_W_instr_L2_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst/W_instr_L2_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst_W_instr_L2_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst/W_instr_L2_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst_W_instr_L3_out_rsci_irdy,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst/W_instr_L3_out_rsci_irdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst_W_instr_L3_out_rsci_ivld_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/CCInst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst/config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst/W_instr_L3_out_rsci_ivld_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst_O_instr_in_rsci_irdy_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst/O_instr_in_rsci_irdy_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst_O_instr_in_rsci_ivld,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst/O_instr_in_rsci_ivld);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst_I_instr_in_rsci_irdy_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst/I_instr_in_rsci_irdy_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst_I_instr_in_rsci_ivld,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst/I_instr_in_rsci_ivld);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst_W_instr_in_rsci_irdy_run_sct,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst/W_instr_in_rsci_irdy_run_sct);
  OBSERVE_FOREIGN_SIGNAL(OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst_W_instr_in_rsci_ivld,
      /scverify_top/rtl/top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002/PE/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst/rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst/W_instr_in_rsci_ivld);
  OBSERVE_FOREIGN_SIGNAL(OFS_layer_instruction_in_rsc_vld, /scverify_top/rtl/layer_instruction_in_rsc_vld);
  OBSERVE_FOREIGN_SIGNAL(OFS_O_data_in_rsc_vld, /scverify_top/rtl/O_data_in_rsc_vld);
  OBSERVE_FOREIGN_SIGNAL(OFS_O_data_out_rsc_rdy, /scverify_top/rtl/O_data_out_rsc_rdy);
  OBSERVE_FOREIGN_SIGNAL(OFS_I_data_in_rsc_vld, /scverify_top/rtl/I_data_in_rsc_vld);
  OBSERVE_FOREIGN_SIGNAL(OFS_W_data_in_rsc_vld, /scverify_top/rtl/W_data_in_rsc_vld);
  OBSERVE_FOREIGN_SIGNAL(OFS_zero_guard_in_rsc_vld, /scverify_top/rtl/zero_guard_in_rsc_vld);
#endif
#endif
}

void scverify_top::deadlock_watch() {
#if !defined(CCS_DUT_SYSC) && defined(DEADLOCK_DETECTION)
#if defined(CCS_DUT_CYCLE) || defined(CCS_DUT_RTL)
#if defined(MTI_SYSTEMC) || defined(NCSC) || defined(VCS_SYSTEMC)
  if (!clk) {
    if (rst == SC_LOGIC_0 &&
      (OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_CCInst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst_run_wen.read()
          == SC_LOGIC_0)
      && (OFS_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002_PE_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst_run_wen.read()
          == SC_LOGIC_0)
      && (OFS_layer_instruction_in_rsc_vld.read() == SC_LOGIC_1)
      && (OFS_O_data_in_rsc_vld.read() == SC_LOGIC_1)
      && (OFS_O_data_out_rsc_rdy.read() == SC_LOGIC_1)
      && (OFS_I_data_in_rsc_vld.read() == SC_LOGIC_1)
      && (OFS_W_data_in_rsc_vld.read() == SC_LOGIC_1)
      && (OFS_zero_guard_in_rsc_vld.read() == SC_LOGIC_1)
    ) {
      deadlocked.write(SC_LOGIC_1);
      deadlock_event.notify(640, SC_NS);
    } else {
      if (deadlocked.read() == SC_LOGIC_1)
        deadlock_event.cancel();
      deadlocked.write(SC_LOGIC_0);
    }
  }
#endif
#endif
#endif
}

void scverify_top::deadlock_notify() {
  if (deadlocked.read() == SC_LOGIC_1) {
    testbench_INST.check_results();
    SC_REPORT_ERROR("System", "Simulation deadlock detected");
    sc_stop();
  }
}

#if defined(MC_SIMULATOR_OSCI) || defined(MC_SIMULATOR_VCS)
int sc_main(int argc, char *argv[]) {
  sc_report_handler::set_actions("/IEEE_Std_1666/deprecated", SC_DO_NOTHING);
  scverify_top scverify_top("scverify_top");
  sc_start();
  return scverify_top.testbench_INST.failed();
}
#else
MC_MODULE_EXPORT(scverify_top);
#endif
