#ifndef TOP_
#define TOP_

#include "core.h"
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
  void CCS_BLOCK(run)(ac_channel<packedData<O_partial_type,mem_words_O_L1_in> > O_data_in[nb_col][nb_row],
                      ac_channel<packedData<O_partial_type,mem_words_O_L1_out> > O_data_out[nb_col][nb_row],
                      ac_channel<packedData<I_type,mem_words_I_L1_in> > I_data_in[nb_col][nb_row],
                      ac_channel<packedData<W_type,mem_words_W_L1_in> > W_data_in[nb_col][nb_row],
                      ac_channel<bool> zero_guard_in[nb_col][nb_row],
                      ac_channel<loopinstrData<O_addr_type_L3,O_addr_type_L2,O_addr_type_L1,I_addr_type_L3,I_addr_type_L2,I_addr_type_L1,W_addr_type_L3,W_addr_type_L2,W_addr_type_L1,nb_cnt>
                      > &layer_instruction_in) {

    CCInst.run(layer_instruction_in,O_instr_L1_out,O_instr_L2_out,O_instr_L3_out,I_instr_L1_out,I_instr_L2_out,I_instr_L3_out,W_instr_L1_out,W_instr_L2_out,W_instr_L3_out);

    PE.run(O_data_in,O_data_out,I_data_in,W_data_in,zero_guard_in,O_instr_L1_out,I_instr_L1_out,W_instr_L1_out);

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


  // register file and mac execution unit
  pe_array<nb_counters_L1, mem_size_word_O_L1, mem_size_word_I_L1, mem_size_word_W_L1, nb_col, nb_row,
  mem_words_O_L1_in, mem_words_O_L1_out, mem_words_I_L1_in, mem_words_I_L1_out, mem_words_W_L1_in, mem_words_W_L1_out,
  O_partial_type, O_addr_type_L1, I_type, I_addr_type_L1, W_type, W_addr_type_L1> PE;
};


#endif // PE_TOP_
