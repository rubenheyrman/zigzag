// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_type_I_type_W_type_run
extern void mc_testbench_capture_IN( ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_out,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &I_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &W_data_in,  ac_channel<bool > &zero_guard_in,  ac_channel<bool > &done_out,  ac_channel<loopinstrData<ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<16, false >, ac_int<11, false >, ac_int<5, false >, 5 > > &layer_instruction_in);
extern void mc_testbench_capture_OUT( ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_out,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &I_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &W_data_in,  ac_channel<bool > &zero_guard_in,  ac_channel<bool > &done_out,  ac_channel<loopinstrData<ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<16, false >, ac_int<11, false >, ac_int<5, false >, 5 > > &layer_instruction_in);
extern void mc_testbench_wait_for_idle_sync();

//Capture DUT class template specialization
template < int nb_counters_L1,
         int mem_size_word_O_L1, int mem_words_O_L1_in, int mem_words_O_L1_out, class O_addr_type_L1,
         int mem_size_word_I_L1, int mem_words_I_L1_in, int mem_words_I_L1_out, class I_addr_type_L1,
         int mem_size_word_W_L1, int mem_words_W_L1_in, int mem_words_W_L1_out, class W_addr_type_L1,
         int nb_counters_L2,
         int mem_size_word_O_L2, int mem_words_O_L2_in, int mem_words_O_L2_out, class O_addr_type_L2,
         int mem_size_word_I_L2, int mem_words_I_L2_in, int mem_words_I_L2_out, class I_addr_type_L2,
         int mem_size_word_W_L2, int mem_words_W_L2_in, int mem_words_W_L2_out, class W_addr_type_L2,
         int nb_counters_L3,
         int mem_size_word_O_L3, int mem_words_O_L3_in, int mem_words_O_L3_out, class O_addr_type_L3,
         int mem_size_word_I_L3, int mem_words_I_L3_in, int mem_words_I_L3_out, class I_addr_type_L3,
         int mem_size_word_W_L3, int mem_words_W_L3_in, int mem_words_W_L3_out, class W_addr_type_L3,
         class O_partial_type, class I_type, class W_type >
struct ccs_class_spec {
  static void* get( void* _this ) { return NULL; }
};
template<>
struct ccs_class_spec<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type> {
  static void* get( void* _this ) { return _this; }
};

//Generic template class and DUT specialization
template < int nb_counters_L1,
         int mem_size_word_O_L1, int mem_words_O_L1_in, int mem_words_O_L1_out, class O_addr_type_L1,
         int mem_size_word_I_L1, int mem_words_I_L1_in, int mem_words_I_L1_out, class I_addr_type_L1,
         int mem_size_word_W_L1, int mem_words_W_L1_in, int mem_words_W_L1_out, class W_addr_type_L1,
         int nb_counters_L2,
         int mem_size_word_O_L2, int mem_words_O_L2_in, int mem_words_O_L2_out, class O_addr_type_L2,
         int mem_size_word_I_L2, int mem_words_I_L2_in, int mem_words_I_L2_out, class I_addr_type_L2,
         int mem_size_word_W_L2, int mem_words_W_L2_in, int mem_words_W_L2_out, class W_addr_type_L2,
         int nb_counters_L3,
         int mem_size_word_O_L3, int mem_words_O_L3_in, int mem_words_O_L3_out, class O_addr_type_L3,
         int mem_size_word_I_L3, int mem_words_I_L3_in, int mem_words_I_L3_out, class I_addr_type_L3,
         int mem_size_word_W_L3, int mem_words_W_L3_in, int mem_words_W_L3_out, class W_addr_type_L3,
         class O_partial_type, class I_type, class W_type >
class ccs_intercept
{
  public:
  void capture_THIS( void* _this ) {}
  void capture_IN( ac_channel<packedData<O_partial_type, mem_words_O_L1_in> > & O_data_in, ac_channel<packedData<O_partial_type, mem_words_O_L1_out> > & O_data_out, ac_channel<packedData<I_type, mem_words_I_L1_in> > & I_data_in, ac_channel<packedData<W_type, mem_words_W_L1_in> > & W_data_in, ac_channel<bool> & zero_guard_in, ac_channel<bool> & done_out, ac_channel<loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1, I_addr_type_L3, I_addr_type_L2, I_addr_type_L1, W_addr_type_L3, W_addr_type_L2, W_addr_type_L1, 5> > & layer_instruction_in ) {}
  void capture_OUT(  ac_channel<packedData<O_partial_type, mem_words_O_L1_in> > & O_data_in, ac_channel<packedData<O_partial_type, mem_words_O_L1_out> > & O_data_out, ac_channel<packedData<I_type, mem_words_I_L1_in> > & I_data_in, ac_channel<packedData<W_type, mem_words_W_L1_in> > & W_data_in, ac_channel<bool> & zero_guard_in, ac_channel<bool> & done_out, ac_channel<loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1, I_addr_type_L3, I_addr_type_L2, I_addr_type_L1, W_addr_type_L3, W_addr_type_L2, W_addr_type_L1, 5> > & layer_instruction_in ) {}
  void wait_for_idle_sync() {}
  ccs_intercept() {}
};

template<>
class ccs_intercept<5,32,1,1,O_addr_type_L1,32,1,1,I_addr_type_L1,32,1,1,W_addr_type_L1,5,288,8,8,O_addr_type_L2,312,8,8,I_addr_type_L2,1728,8,8,W_addr_type_L2,5,8640,8,8,O_addr_type_L3,8640,8,8,I_addr_type_L3,55296,8,8,W_addr_type_L3,O_partial_type,I_type,W_type>
{
  public:
  void capture_THIS( void* _this ) {
    if ( dut == NULL ) dut = _this;
    cur_inst = _this;
    if ( capture_msg && dut != NULL && dut == cur_inst ) {
      std::cout << "SCVerify intercepting C++ function 'top<5, 32, 1, 1, O_addr_type_L1, 32, 1, 1, I_addr_type_L1, 32, 1, 1, W_addr_type_L1, 5, 288, 8, 8, O_addr_type_L2, 312, 8, 8, I_addr_type_L2, 1728, 8, 8, W_addr_type_L2, 5, 8640, 8, 8, O_addr_type_L3, 8640, 8, 8, I_addr_type_L3, 55296, 8, 8, W_addr_type_L3, O_partial_type, I_type, W_type>::run' for RTL block 'top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000'" << std::endl;
      capture_msg = false;
    }
  }
  void capture_IN(  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_out,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &I_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &W_data_in,  ac_channel<bool > &zero_guard_in,  ac_channel<bool > &done_out,  ac_channel<loopinstrData<ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<16, false >, ac_int<11, false >, ac_int<5, false >, 5 > > &layer_instruction_in ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_IN(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,done_out,layer_instruction_in);
  }
  void capture_OUT(  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &O_data_out,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &I_data_in,  ac_channel<packedData<ac_fixed<16, 16, false, AC_TRN, AC_WRAP >, 1 > > &W_data_in,  ac_channel<bool > &zero_guard_in,  ac_channel<bool > &done_out,  ac_channel<loopinstrData<ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<14, false >, ac_int<9, false >, ac_int<5, false >, ac_int<16, false >, ac_int<11, false >, ac_int<5, false >, 5 > > &layer_instruction_in ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_OUT(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,done_out,layer_instruction_in);
  }
  void wait_for_idle_sync() {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_wait_for_idle_sync();
  }
  ccs_intercept(): dut(NULL), cur_inst(NULL), capture_msg(true){}
  private:
  void *dut, *cur_inst;
  bool capture_msg;
};

#define ccs_intercept_run_27 \
  run(ac_channel<packedData<O_partial_type, mem_words_O_L1_in> > & O_data_in, ac_channel<packedData<O_partial_type, mem_words_O_L1_out> > & O_data_out, ac_channel<packedData<I_type, mem_words_I_L1_in> > & I_data_in, ac_channel<packedData<W_type, mem_words_W_L1_in> > & W_data_in, ac_channel<bool> & zero_guard_in, ac_channel<bool> & done_out, ac_channel<loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1, I_addr_type_L3, I_addr_type_L2, I_addr_type_L1, W_addr_type_L3, W_addr_type_L2, W_addr_type_L1, 5> > & layer_instruction_in) {\
    static ccs_intercept<nb_counters_L1,mem_size_word_O_L1,mem_words_O_L1_in,mem_words_O_L1_out,O_addr_type_L1,mem_size_word_I_L1,mem_words_I_L1_in,mem_words_I_L1_out,I_addr_type_L1,mem_size_word_W_L1,mem_words_W_L1_in,mem_words_W_L1_out,W_addr_type_L1,nb_counters_L2,mem_size_word_O_L2,mem_words_O_L2_in,mem_words_O_L2_out,O_addr_type_L2,mem_size_word_I_L2,mem_words_I_L2_in,mem_words_I_L2_out,I_addr_type_L2,mem_size_word_W_L2,mem_words_W_L2_in,mem_words_W_L2_out,W_addr_type_L2,nb_counters_L3,mem_size_word_O_L3,mem_words_O_L3_in,mem_words_O_L3_out,O_addr_type_L3,mem_size_word_I_L3,mem_words_I_L3_in,mem_words_I_L3_out,I_addr_type_L3,mem_size_word_W_L3,mem_words_W_L3_in,mem_words_W_L3_out,W_addr_type_L3,O_partial_type,I_type,W_type> ccs_intercept_inst;\
    void* ccs_intercept_this = this;\
    ccs_intercept_this = ccs_class_spec<nb_counters_L1,mem_size_word_O_L1,mem_words_O_L1_in,mem_words_O_L1_out,O_addr_type_L1,mem_size_word_I_L1,mem_words_I_L1_in,mem_words_I_L1_out,I_addr_type_L1,mem_size_word_W_L1,mem_words_W_L1_in,mem_words_W_L1_out,W_addr_type_L1,nb_counters_L2,mem_size_word_O_L2,mem_words_O_L2_in,mem_words_O_L2_out,O_addr_type_L2,mem_size_word_I_L2,mem_words_I_L2_in,mem_words_I_L2_out,I_addr_type_L2,mem_size_word_W_L2,mem_words_W_L2_in,mem_words_W_L2_out,W_addr_type_L2,nb_counters_L3,mem_size_word_O_L3,mem_words_O_L3_in,mem_words_O_L3_out,O_addr_type_L3,mem_size_word_I_L3,mem_words_I_L3_in,mem_words_I_L3_out,I_addr_type_L3,mem_size_word_W_L3,mem_words_W_L3_in,mem_words_W_L3_out,W_addr_type_L3,O_partial_type,I_type,W_type>::get(ccs_intercept_this);\
    ccs_intercept_inst.capture_THIS(ccs_intercept_this);\
    ccs_intercept_inst.capture_IN(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,done_out,layer_instruction_in);\
    ccs_real_run(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,done_out,layer_instruction_in);\
    ccs_intercept_inst.capture_OUT(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,done_out,layer_instruction_in);\
  }\
  void ccs_real_run
#else
#define ccs_intercept_run_27 run
#endif //CCS_DESIGN_FUNC_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_type_I_type_W_type_run
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// top 19 MODULE
#define ccs_intercept_top_19 top
// run 1055 MODULE
#define ccs_intercept_run_1055 run
// rf 1027 MODULE
#define ccs_intercept_rf_1027 rf
// run 304 MODULE
#define ccs_intercept_run_304 run
// O_addr_cnt 297 MODULE
#define ccs_intercept_O_addr_cnt_297 O_addr_cnt
// run 101 MODULE
#define ccs_intercept_run_101 run
// config_control_unit 92 MODULE
#define ccs_intercept_config_control_unit_92 config_control_unit
// run 68 MODULE
#define ccs_intercept_run_68 run
// tiling_unit 62 MODULE
#define ccs_intercept_tiling_unit_62 tiling_unit
// push 19 INLINE
#define ccs_intercept_push_19 push
// run 12 INLINE
#define ccs_intercept_run_12 run
// main 18 INLINE
#define ccs_intercept_main_18 main
