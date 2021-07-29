#ifndef TOP_H_
#define TOP_H_

#include "../core.h"
#include "config_file.h"

template<int nb_counters_L1, int nb_col, int nb_row,
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
         class O_partial_type, class I_type, class W_type>
class top
{
public:
  // Constructor
  top() {}

#pragma hls_design interface top
//#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<packedData<O_partial_type,mem_words_O_L2_in> > &O_data_in,
                      ac_channel<packedData<O_partial_type,mem_words_O_L2_out> > &O_data_out,
                      ac_channel<packedData<I_type,mem_words_I_L3_in> > &I_data_in,
                      ac_channel<packedData<W_type,mem_words_W_L3_in> > &W_data_in,
                      ac_channel<bool> &zero_guard_in,
                      ac_channel<loopinstrData<O_addr_type_L3,O_addr_type_L2,O_addr_type_L1,I_addr_type_L3,I_addr_type_L2,I_addr_type_L1,W_addr_type_L3,W_addr_type_L2,W_addr_type_L1,nb_cnt>
                      > &layer_instruction_in) {

    CCInst.run(layer_instruction_in,O_instr_L1_out,O_instr_L2_out,O_instr_L3_out,I_instr_L1_out,I_instr_L2_out,I_instr_L3_out,W_instr_L1_out,W_instr_L2_out,W_instr_L3_out);

    O_L3.run(O_data_in,O_data_out,O_L2_L3,O_L3_L2,zero_guard_in,zg_L3_L2,O_instr_L3_out);
    I_L3.run(I_data_in,I_L3_L2,I_instr_L3_out);
    W_L3.run(W_data_in,W_L3_L2,W_instr_L3_out);

    O_L2.run(O_L3_L2,O_L2_L3,O_L1_L2_out,O_L2_L1_in,zg_L3_L2,zg_L2_L1,O_instr_L2_out);
    I_L2.run(I_L3_L2,I_L2_L1_in,I_instr_L2_out);
    W_L2.run(W_L3_L2,W_L2_L1_in,W_instr_L2_out);

    NoC_O_L2_L1.run(O_L2_L1_in, O_L2_L1_out, zg_L2_L1, zg_L2_L1_out);
    NoC_I_L2_L1.run(I_L2_L1_in, I_L2_L1_out);
    NoC_W_L2_L1.run(W_L2_L1_in, W_L2_L1_out);
    NoC_O_L1_L2.run(O_L1_L2_in, O_L1_L2_out);

    PE.run(O_L2_L1_out,O_L1_L2_in,I_L2_L1_out,W_L2_L1_out,zg_L2_L1_out,O_instr_L1_out,I_instr_L1_out,W_instr_L1_out);

  }
private:
  // channels to configure every block
  ac_channel<memlevelInstr<O_addr_type_L1, nb_cnt+1> > O_instr_L1_out[nb_col][nb_row];
  ac_channel<memlevelInstr<O_addr_type_L2, nb_cnt+1> > O_instr_L2_out;
  ac_channel<memlevelInstr<O_addr_type_L3, nb_cnt+1> > O_instr_L3_out;

  ac_channel<memlevelInstr<I_addr_type_L1, nb_cnt+1> > I_instr_L1_out[nb_col][nb_row];
  ac_channel<memlevelInstr<I_addr_type_L2, nb_cnt+1> > I_instr_L2_out;
  ac_channel<memlevelInstr<I_addr_type_L3, nb_cnt+1> > I_instr_L3_out;

  ac_channel<memlevelInstr<W_addr_type_L1, nb_cnt+1> > W_instr_L1_out[nb_col][nb_row];
  ac_channel<memlevelInstr<W_addr_type_L2, nb_cnt+1> > W_instr_L2_out;
  ac_channel<memlevelInstr<W_addr_type_L3, nb_cnt+1> > W_instr_L3_out;

  // processing of incoming instruction per layer
  config_control_unit<nb_cnt, nb_col, nb_row,
	 O_addr_type_L1, O_addr_type_L2, O_addr_type_L3,
	 I_addr_type_L1, I_addr_type_L2, I_addr_type_L3,
	 W_addr_type_L1, W_addr_type_L2, W_addr_type_L3> CCInst;

  // interconnecting channels
  ac_channel<bool> zg_L3_L2;
  ac_channel<bool> zg_L2_L1;
  ac_channel<bool> zg_L2_L1_out[nb_col][nb_row];

  ac_channel<packedData<O_partial_type, mem_words_O_L3_out> > O_L3_L2;
  ac_channel<packedData<O_partial_type, mem_words_O_L2_out> > O_L2_L3;
  ac_channel<packedData<I_type, mem_words_I_L3_out> > I_L3_L2;
  ac_channel<packedData<W_type, mem_words_W_L3_out> > W_L3_L2;

  ac_channel<packedData<O_partial_type, mem_words_O_L2_out> > O_L2_L1_in;
  ac_channel<packedData<O_partial_type, mem_words_O_L1_in> > O_L2_L1_out[nb_col][nb_row];
  ac_channel<packedData<I_type, mem_words_I_L2_out> > I_L2_L1_in;
  ac_channel<packedData<I_type, mem_words_I_L1_in> > I_L2_L1_out[nb_col][nb_row];
  ac_channel<packedData<W_type, mem_words_W_L2_out> > W_L2_L1_in;
  ac_channel<packedData<W_type, mem_words_W_L1_in> > W_L2_L1_out[nb_col][nb_row];
  ac_channel<packedData<O_partial_type, mem_words_O_L1_out> > O_L1_L2_in[nb_col][nb_row];
  ac_channel<packedData<O_partial_type, mem_words_O_L2_in> > O_L1_L2_out;

  // interconnecting buffers where BW of blocks doesn't match
  BW_buffer_down<O_partial_type, mem_words_O_L2_out, mem_words_O_L1_in> O_BW_buffer_L2_L1;
  BW_buffer_down<I_type, mem_words_I_L2_out, mem_words_I_L1_in> I_BW_buffer_L2_L1;
  BW_buffer_down<W_type, mem_words_W_L2_out, mem_words_W_L1_in> W_BW_buffer_L2_L1;
  BW_buffer_up<O_partial_type, mem_words_O_L1_out, mem_words_O_L2_in> O_BW_buffer_L1_L2;
  //BW_conv_zero_guard<mem_words_O_L2_out, mem_words_O_L1_in> ZG_L2_L1;

  // Network-on-Chip interconnecting L2 and different PE instances of array for each of the operands
  NoC_O_up<O_partial_type, mem_words_O_L1_out, mem_words_O_L2_in, nb_col, nb_row> NoC_O_L1_L2;
  NoC_O_down<O_partial_type, mem_words_O_L2_out, mem_words_O_L1_in, nb_col, nb_row> NoC_O_L2_L1;
  NoC_W_down<I_type, mem_words_I_L2_out, mem_words_I_L1_in, nb_col, nb_row> NoC_I_L2_L1;
  NoC_W_down<W_type, mem_words_W_L2_out, mem_words_W_L1_in, nb_col, nb_row> NoC_W_L2_L1;

  // output memory hierarchy
  O_dp_sb<nb_counters_L3, mem_size_word_O_L3, mem_words_O_L3_in, mem_words_O_L3_out, O_partial_type, O_addr_type_L3> O_L3;

  O_dp_sb<nb_counters_L2, mem_size_word_O_L2, mem_words_O_L2_in, mem_words_O_L2_out, O_partial_type, O_addr_type_L2> O_L2;

  // input memory hierarchy
  I_dp_sb<nb_counters_L3, mem_size_word_I_L3, mem_words_I_L3_in, mem_words_I_L3_out, I_type, I_addr_type_L3> I_L3;

  I_dp_sb<nb_counters_L2, mem_size_word_I_L2, mem_words_I_L2_in, mem_words_I_L2_out, I_type, I_addr_type_L2> I_L2;

  // weight memory hierarchy
  W_dp_sb<nb_counters_L3, mem_size_word_W_L3, mem_words_W_L3_in, mem_words_W_L3_out, W_type, W_addr_type_L3> W_L3;

  W_dp_sb<nb_counters_L2, mem_size_word_W_L2, mem_words_W_L2_in, mem_words_W_L2_out, W_type, W_addr_type_L2> W_L2;

  // register file and mac execution unit
  pe_array<nb_counters_L1, mem_size_word_O_L1, mem_size_word_I_L1, mem_size_word_W_L1, nb_col, nb_row,
  mem_words_O_L1_in, mem_words_O_L1_out, mem_words_I_L1_in, mem_words_I_L1_out, mem_words_W_L1_in, mem_words_W_L1_out,
  O_partial_type, O_addr_type_L1, I_type, I_addr_type_L1, W_type, W_addr_type_L1> PE;
};


#endif // MH_TOP_H_
