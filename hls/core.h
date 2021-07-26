#ifndef _INCLUDED_CORE_H_
#define _INCLUDED_CORE_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include <mc_scverify.h>

template<typename T, int N>
class fifo
{
public:
  // Constructor
  fifo() : wr_ptr(0), rd_ptr(0), cnt(0) {}

  void push(T &din) {
    regs[wr_ptr] = din;
    wr_ptr++;
    if (wr_ptr == N) {
      wr_ptr = 0;
    }
    cnt++;
  }

  T pop() {
    T tmp;
    tmp = regs[rd_ptr];
    rd_ptr++;
    if (rd_ptr == N) {
      rd_ptr = 0;
    }
    cnt--;
    return tmp;
  }

  T peek() {
    T tmp;
    tmp = regs[rd_ptr];
    return tmp;
  }

  bool full() {
    return cnt == N;
  }

  bool not_empty() {
    return cnt != 0;
  }

private: // data
  T                                    regs[N];
  ac_int<ac::log2_ceil<N>::val,false>  wr_ptr;
  ac_int<ac::log2_ceil<N>::val,false>  rd_ptr;
  ac_int<ac::nbits<N>::val,false>      cnt;
};

// calculates a decrement value when a loop reaches its boundary value and is connected to the address pointer 
template<int nb_counters, class type>
class tiling_unit
{
public:
  tiling_unit(){}
    
#pragma hls_design interface ccore
  void CCS_BLOCK(run)(loopData<type, nb_counters> &loops, type &tile_size, memlevelInstr<type, nb_counters+1> &instr){
    irrel = rel = 1;
    instr.tile[0] = tile_size_int = tile_size;
    instr.bound[0] = 1;
    for (int i=0; i<nb_counters; i++){
      if (loops.relevancy[i] == true) {
        tile_size_int *= loops.bound[i];
        instr.bound[nb_counters+1-rel] = 1;
        rel++;
      } else {
        instr.tile[irrel] = tile_size_int;
        instr.bound[irrel] = loops.bound[i];
        irrel++;
      }
    }
    for (int i=0; i<nb_counters; i++){
      instr.tile[i+1] = (instr.bound[i+1] == 1) ? tile_size_int : instr.tile[i+1];
    }
    tile_size = tile_size_int;
  }
private:
  type tile_size_int;
  ac_int<ac::log2_ceil<nb_counters>::val,false> irrel;
  ac_int<ac::log2_ceil<nb_counters>::val,false> rel;
};

// takes in loop mapping configuration of each of the memory levels and of the network on chip
template<int nb_cnt, 
	 class O_addr_type_L1, class O_addr_type_L2, class O_addr_type_L3,
	 class I_addr_type_L1, class I_addr_type_L2, class I_addr_type_L3,
	 class W_addr_type_L1, class W_addr_type_L2, class W_addr_type_L3> 
class config_control_unit
{
public:
  // Constructor
  config_control_unit() {
    O_tile_size_L1 = I_tile_size_L1 = W_tile_size_L1 = 1;
  }

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1, 
                      I_addr_type_L3, I_addr_type_L2, I_addr_type_L1, 
                      W_addr_type_L3, W_addr_type_L2, W_addr_type_L1, 
                      nb_cnt> > &layer_instruction_in,
                      ac_channel<memlevelInstr<O_addr_type_L1, nb_cnt+1> > &O_instr_L1_out,
                      ac_channel<memlevelInstr<O_addr_type_L2, nb_cnt+1> > &O_instr_L2_out,
                      ac_channel<memlevelInstr<O_addr_type_L3, nb_cnt+1> > &O_instr_L3_out,
                      ac_channel<memlevelInstr<I_addr_type_L1, nb_cnt+1> > &I_instr_L1_out,
                      ac_channel<memlevelInstr<I_addr_type_L2, nb_cnt+1> > &I_instr_L2_out,
                      ac_channel<memlevelInstr<I_addr_type_L3, nb_cnt+1> > &I_instr_L3_out,
                      ac_channel<memlevelInstr<W_addr_type_L1, nb_cnt+1> > &W_instr_L1_out,
                      ac_channel<memlevelInstr<W_addr_type_L2, nb_cnt+1> > &W_instr_L2_out,
                      ac_channel<memlevelInstr<W_addr_type_L3, nb_cnt+1> > &W_instr_L3_out) {

    if (layer_instruction_in.available(1)){
      layer_instruction = layer_instruction_in.read();
      

      O_loops_L1 = layer_instruction.O_loopData_L1;
      O_loops_L2 = layer_instruction.O_loopData_L2;
      O_loops_L3 = layer_instruction.O_loopData_L3;
      I_loops_L1 = layer_instruction.I_loopData_L1;
      I_loops_L2 = layer_instruction.I_loopData_L2;
      I_loops_L3 = layer_instruction.I_loopData_L3;
      W_loops_L1 = layer_instruction.W_loopData_L1;
      W_loops_L2 = layer_instruction.W_loopData_L2;
      W_loops_L3 = layer_instruction.W_loopData_L3;

      O_tiling_unit_L1.run(O_loops_L1, O_tile_size_L1, O_instr_L1);
      O_tile_size_L2 = (O_addr_type_L2) O_tile_size_L1;
      O_tiling_unit_L2.run(O_loops_L2, O_tile_size_L2, O_instr_L2);
      O_tile_size_L3 = (O_addr_type_L3) O_tile_size_L2;
      O_tiling_unit_L3.run(O_loops_L3, O_tile_size_L3, O_instr_L3);

      I_tiling_unit_L1.run(I_loops_L1, I_tile_size_L1, I_instr_L1);
      I_tile_size_L2 = (I_addr_type_L2) I_tile_size_L1;
      I_tiling_unit_L2.run(I_loops_L2, I_tile_size_L2, I_instr_L2);
      I_tile_size_L3 = (I_addr_type_L3) I_tile_size_L2;
      I_tiling_unit_L3.run(I_loops_L3, I_tile_size_L3, I_instr_L3);

      W_tiling_unit_L1.run(W_loops_L1, W_tile_size_L1, W_instr_L1);
      W_tile_size_L2 = (W_addr_type_L2) W_tile_size_L1;
      W_tiling_unit_L2.run(W_loops_L2, W_tile_size_L2, W_instr_L2);
      W_tile_size_L3 = (W_addr_type_L3) W_tile_size_L2;
      W_tiling_unit_L3.run(W_loops_L3, W_tile_size_L3, W_instr_L3);

#ifndef __SYNTHESIS__
      O_L3_tile_small = O_instr_L3.tile[1];
      O_L3_tile_big   = O_instr_L3.tile[5];
      O_L2_tile_small = O_instr_L2.tile[1];
      O_L2_tile_big   = O_instr_L2.tile[5];

      I_L3_tile_small = I_instr_L3.tile[0];
      I_L3_tile_big   = I_instr_L3.tile[5];
      I_L2_tile_small = I_instr_L2.tile[0];
      I_L2_tile_big   = I_instr_L2.tile[5];

      W_L3_tile_small = W_instr_L3.tile[0];
      W_L3_tile_big   = W_instr_L3.tile[5];
      W_L2_tile_small = W_instr_L2.tile[0];
      W_L2_tile_big   = W_instr_L2.tile[5];
#endif

      O_instr_L3_out.write(O_instr_L3);
      I_instr_L3_out.write(I_instr_L3);
      W_instr_L3_out.write(W_instr_L3);

      O_instr_L2_out.write(O_instr_L2);
      I_instr_L2_out.write(I_instr_L2);
      W_instr_L2_out.write(W_instr_L2);

      O_instr_L1_out.write(O_instr_L1);
      I_instr_L1_out.write(I_instr_L1);
      W_instr_L1_out.write(W_instr_L1);

    }
  }

private:
  // tiling units
  tiling_unit<nb_cnt, O_addr_type_L1> O_tiling_unit_L1;
  tiling_unit<nb_cnt, O_addr_type_L2> O_tiling_unit_L2;
  tiling_unit<nb_cnt, O_addr_type_L3> O_tiling_unit_L3;

  tiling_unit<nb_cnt, I_addr_type_L1> I_tiling_unit_L1;
  tiling_unit<nb_cnt, I_addr_type_L2> I_tiling_unit_L2;
  tiling_unit<nb_cnt, I_addr_type_L3> I_tiling_unit_L3;

  tiling_unit<nb_cnt, W_addr_type_L1> W_tiling_unit_L1;
  tiling_unit<nb_cnt, W_addr_type_L2> W_tiling_unit_L2;
  tiling_unit<nb_cnt, W_addr_type_L3> W_tiling_unit_L3;
  
  // interconnections
  loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1, 
	 	      I_addr_type_L3, I_addr_type_L2, I_addr_type_L1, 
	 	      W_addr_type_L3, W_addr_type_L2, W_addr_type_L1, 
	 	      nb_cnt> layer_instruction;
	 	      
  loopData<O_addr_type_L1, nb_cnt> O_loops_L1;
  loopData<O_addr_type_L2, nb_cnt> O_loops_L2;
  loopData<O_addr_type_L3, nb_cnt> O_loops_L3;

  loopData<I_addr_type_L1, nb_cnt> I_loops_L1;
  loopData<I_addr_type_L2, nb_cnt> I_loops_L2;
  loopData<I_addr_type_L3, nb_cnt> I_loops_L3;

  loopData<W_addr_type_L1, nb_cnt> W_loops_L1;
  loopData<W_addr_type_L2, nb_cnt> W_loops_L2;
  loopData<W_addr_type_L3, nb_cnt> W_loops_L3;

  memlevelInstr<O_addr_type_L1, nb_cnt+1> O_instr_L1;
  memlevelInstr<O_addr_type_L2, nb_cnt+1> O_instr_L2;
  memlevelInstr<O_addr_type_L3, nb_cnt+1> O_instr_L3;

  memlevelInstr<I_addr_type_L1, nb_cnt+1> I_instr_L1;
  memlevelInstr<I_addr_type_L2, nb_cnt+1> I_instr_L2;
  memlevelInstr<I_addr_type_L3, nb_cnt+1> I_instr_L3;

  memlevelInstr<W_addr_type_L1, nb_cnt+1> W_instr_L1;
  memlevelInstr<W_addr_type_L2, nb_cnt+1> W_instr_L2;
  memlevelInstr<W_addr_type_L3, nb_cnt+1> W_instr_L3;
  
  O_addr_type_L1 O_tile_size_L1;
  O_addr_type_L2 O_tile_size_L2;
  O_addr_type_L3 O_tile_size_L3;
  
  I_addr_type_L1 I_tile_size_L1;
  I_addr_type_L2 I_tile_size_L2;
  I_addr_type_L3 I_tile_size_L3;
  
  W_addr_type_L1 W_tile_size_L1;
  W_addr_type_L2 W_tile_size_L2;
  W_addr_type_L3 W_tile_size_L3;
};

// update pointer based on tiles that can be reused multiple times
template<int nb_counters, class type, int WORDS>
class W_addr_cnt
{
public:
    W_addr_cnt(){}
#pragma hls_design interface ccore
#pragma hls_ccore_type combinational
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(type loop_bound[nb_counters], type tile_sizes[nb_counters], type &pntr, bool &irrel_at_max, type counter[nb_counters], type tile_bound[nb_counters])
    {   
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
          tile_size[i] = tile_sizes[i];
        }
        pntr = pntr + WORDS;
        
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            update_tile_bound[i] = counter[i] == loop_bound[i]-1;
            reset_tile[i] = (pntr  > tile_bound[i]-1) ? true : false;
            #pragma hls_unroll yes
            for (int j=0; j<i; j++){
                reset_tile[i] = (counter[j] == loop_bound[j]-1) ? reset_tile[i] : false;
            }
        }
        all_at_max = (pntr == tile_size[nb_counters-1] && reset_tile[nb_counters-1] && update_tile_bound[nb_counters-1]);
        update_pntr = false;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            if (reset_tile[i] && !update_tile_bound[i]){
                update_pntr = true;
                counter[i]++;
                tile_pntr = tile_bound[i] - tile_size[i];
                tile_bound[i] = tile_pntr + tile_size[i];
                #pragma hls_unroll yes
                for (int j=0; j<i; j++){
                    counter[j] = 0;
                    tile_bound[j] = tile_pntr + tile_size[j];
                }
            } else if (reset_tile[i] && update_tile_bound[i] && !all_at_max){
                 tile_bound[i] += tile_size[i];
                 counter[i] = 0;
            } else if (all_at_max){
                tile_bound[i] = tile_size[i];
                counter[i] = 0;
                tile_pntr = 0;
            }
        }
        
        pntr = (update_pntr || all_at_max) ? tile_pntr : pntr;
        irrel_at_max = true;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            irrel_at_max = (counter[i] == loop_bound[i]-1) ? irrel_at_max : false;
        }  
    }
private:    
    // control
    bool update_pntr;
    bool all_at_max;
    bool update_tile_bound[nb_counters];
    bool reset_tile[nb_counters]; 
    
    // interconnections
    type tile_pntr;
    type tile_size[nb_counters];
};

// update pointer based on tiles that can be reused multiple times
template<int nb_counters, class type, int WORDS>
class O_addr_cnt
{
public:
    O_addr_cnt(){}
#pragma hls_design interface ccore
#pragma hls_ccore_type combinational
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(type loop_bound[nb_counters], type tile_sizes[nb_counters], type &pntr, bool &irrel_at_max, bool &irrel_at_zero, bool &all_at_max, type counter[nb_counters], type tile_bound[nb_counters])
    {   
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
          tile_size[i] = tile_sizes[i];
        }
        pntr = pntr + WORDS;
        
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            update_tile_bound[i] = counter[i] == loop_bound[i]-1;
            reset_tile[i] = (pntr  > tile_bound[i]-1) ? true : false;
            #pragma hls_unroll yes
            for (int j=0; j<i; j++){
                reset_tile[i] = (counter[j] == loop_bound[j]-1) ? reset_tile[i] : false;
            }
        }
        all_at_max = (pntr == tile_size[nb_counters-1] && reset_tile[nb_counters-1] && update_tile_bound[nb_counters-1]);
        update_pntr = false;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            if (reset_tile[i] && !update_tile_bound[i]){
                update_pntr = true;
                counter[i]++;
                tile_pntr = tile_bound[i] - tile_size[i];
                tile_bound[i] = tile_pntr + tile_size[i];
                #pragma hls_unroll yes
                for (int j=0; j<i; j++){
                    counter[j] = 0;
                    tile_bound[j] = tile_pntr + tile_size[j];
                }
            } else if (reset_tile[i] && update_tile_bound[i] && !all_at_max){
                 tile_bound[i] += tile_size[i];
                 counter[i] = 0;
            } else if (all_at_max){
                tile_bound[i] = tile_size[i];
                counter[i] = 0;
                tile_pntr = 0;
            }
        }
        
        pntr = (update_pntr || all_at_max) ? tile_pntr : pntr;
        irrel_at_max = true;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            irrel_at_max = (counter[i] == loop_bound[i]-1) ? irrel_at_max : false;
        }
        irrel_at_zero = true;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            irrel_at_zero = (counter[i] == 0) ? irrel_at_zero : false;
        }    
    }
private:    
    // control
    bool update_pntr;
    bool all_at_max;
    bool update_tile_bound[nb_counters];
    bool reset_tile[nb_counters]; 
    
    // interconnections
    type tile_pntr;
    type tile_size[nb_counters];
};

// update pointer based on tiles that can be reused multiple times
template<int nb_counters, class type>
class addr_cnt_flex
{
public:
    addr_cnt_flex(){}
#pragma hls_design interface ccore
#pragma hls_ccore_type combinational
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(type loop_bound[nb_counters], type tile_sizes[nb_counters], type &pntr, type &pntr_out, type &cnt, bool &irrel_at_max, bool &irrel_at_zero, bool &all_at_max, type counter[nb_counters], type tile_bound[nb_counters])
    {   
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
          tile_size[i] = tile_sizes[i];
        }
        pntr_out = pntr + cnt;//WORDS;
        
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            update_tile_bound[i] = counter[i] == loop_bound[i]-1;
            reset_tile[i] = (pntr_out  > tile_bound[i]-1) ? true : false;
            #pragma hls_unroll yes
            for (int j=0; j<i; j++){
                reset_tile[i] = (counter[j] == loop_bound[j]-1) ? reset_tile[i] : false;
            }
        }
        all_at_max = (pntr_out == tile_size[nb_counters-1] && reset_tile[nb_counters-1] && update_tile_bound[nb_counters-1]);
        update_pntr = false;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            if (reset_tile[i] && !update_tile_bound[i]){
                update_pntr = true;
                counter[i]++;
                tile_pntr = tile_bound[i] - tile_size[i];
                tile_bound[i] = tile_pntr + tile_size[i];
                #pragma hls_unroll yes
                for (int j=0; j<i; j++){
                    counter[j] = 0;
                    tile_bound[j] = tile_pntr + tile_size[j];
                }
            } else if (reset_tile[i] && update_tile_bound[i] && !all_at_max){
                 tile_bound[i] += tile_size[i];
                 counter[i] = 0;
            } else if (all_at_max){
                tile_bound[i] = tile_size[i];
                counter[i] = 0;
                tile_pntr = 0;
            }
        }
        
        pntr_out = (update_pntr || all_at_max) ? tile_pntr : pntr_out;
        irrel_at_max = true;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            irrel_at_max = (counter[i] == loop_bound[i]-1) ? irrel_at_max : false;
        }
        irrel_at_zero = true;
        #pragma hls_unroll yes
        for (int i=0; i<nb_counters; i++){
            irrel_at_zero = (counter[i] == 0) ? irrel_at_zero : false;
        }    
    }
private:    
    // control
    bool update_pntr;
    bool all_at_max;
    bool update_tile_bound[nb_counters];
    bool reset_tile[nb_counters]; 
    
    // interconnections
    type tile_pntr;
    type tile_size[nb_counters];
};

template<int nb_cnt, int N, int WORDS_in, int WORDS_out, class type, class addr_type> 
class W_dp_sb
{
public:
  // Constructor
    W_dp_sb() : setup(1), irrel_at_max(1), irrel_cnt(0), write_flag(0), read_flag0(0),
                wr_pntr(0), rd_pntr(0), vld_pntr(0), data_vld(0),
                flags(0), skid(0), debug_cnt(0) {
    #pragma hls_unroll yes
    for (int x=0; x<nb_cnt; x++){
      rd_counter[x] = 0;
    }
  }

#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
  void CCS_BLOCK(run)(ac_channel<packedData<type,WORDS_in> > &wr_data, ac_channel<packedData<type,WORDS_out> > &rd_data,
                      ac_channel<memlevelInstr<addr_type, nb_cnt+1> > &instr_in) {



    if (setup){
      if (instr_in.available(1)){
        instr = instr_in.read();
      }
      #pragma hls_unroll yes
      for (int x=0; x<nb_cnt; x++){
        loop_bound[x] = instr.bound[x+1];
        tile_size[x] = instr.tile[x+1];
        rd_tile_bound[x] = tile_size[x];
        irrel_at_max = loop_bound[x] != 1 ? false : irrel_at_max;
      }
      setup = false;
    }
        
    if (!flags[2] && (rd_pntr != wr_pntr || data_vld)) { // Access MSB bit of the flags 4bit variable. Please note the bit access method [].
      read_flag0 = true; 
    } else {
      read_flag0 = false;
    }

    if (read_flag0) {
      rd_pntr = ((rd_pntr/WORDS_out)*WORDS_out);
        
      #pragma hls_unroll yes
      RD_OUT_MEM: for (int i=0; i<WORDS_out; i++){
        read_data.data[i] = mem[rd_pntr+i]; //to prove that the access starts at word bounderies [even: (pntr>>(1))<<1)]
#ifndef __SYNTHESIS__
            if (instr.tile[0] == W_L3_tile_small && instr.tile[nb_cnt-1] == W_L3_tile_big)
              W_L3_rd_cnt++;
            if (instr.tile[0] == W_L2_tile_small && instr.tile[nb_cnt-1] == W_L2_tile_big)
              W_L2_rd_cnt++;
#endif
      }
      //if all irrelevant loops are at their maximum, consumed data in this level can't be reused anymore
      if (irrel_at_max){
        irrel_cnt += WORDS_out;;
      }
      if (irrel_cnt == WORDS_in){
        vld_pntr = rd_pntr;
        data_vld = false;
        irrel_cnt = 0;
      }
      //increment pointer based on wordlength
      addr_cntInst.run(loop_bound, tile_size, rd_pntr, irrel_at_max, rd_counter, rd_tile_bound); 
      
    }

    if (read_flag0 | skid_buf.not_empty()) {
// #ifndef __SYNTHESIS__
//       debug_cnt++;
// #endif
      if (read_flag0 & skid_buf.not_empty()) {
        skid_buf.push(read_data);
        read_data = skid_buf.peek();
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          NB_WRITE_READ_DATA: write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf.not_empty()) {
        read_data = skid_buf.peek();
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop();
        }
      } else if (read_flag0) {
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          write_stall = !rd_data.nb_write(read_data);
        if (write_stall) {
          skid_buf.push(read_data);//Push data into skid buffer if nb_write fails
        }
      }
    }

    flags <<=1;
    flags[0] = skid_buf.not_empty();
    if (!data_vld) {
      NB_READ_WRITE_DATA: write_flag = wr_data.nb_read(write_data);

      if (write_flag) {
        #pragma hls_unroll yes
        WR_IN_MEM: for (int i=0; i<WORDS_in; i++){
          mem[wr_pntr+i] = write_data.data[i];
#ifndef __SYNTHESIS__
            if (instr.tile[0] == W_L3_tile_small && tile_size[nb_cnt-1] == W_L3_tile_big)
              W_L3_wr_cnt++;
            if (instr.tile[0] == W_L2_tile_small && tile_size[nb_cnt-1] == W_L2_tile_big)
              W_L2_wr_cnt++;
#endif
        }
        wr_pntr = (wr_pntr+WORDS_in); 
        if (wr_pntr == tile_size[nb_cnt-1]){
          wr_pntr = 0;
        }
        data_vld = (wr_pntr==vld_pntr);
      }
    }
  }

private: 
  // instruction interconnection
  memlevelInstr<addr_type, nb_cnt+1> instr;
  
  // data
  bool        write_flag;
  packedData<type,WORDS_in> write_data;
  addr_type   wr_pntr;
  bool        read_flag0;
  type        mem[N];
  uint3       flags;
  packedData<type,WORDS_out> read_data;
  addr_type   rd_pntr;
  addr_type   vld_pntr;
  bool        data_vld;
  uint3       skid;
  fifo<packedData<type,WORDS_out>,4> skid_buf;
  bool        write_stall;
  int         debug_cnt;
  addr_type   irrel_cnt;
  
  // counter array mapped to this memory level
  W_addr_cnt<nb_cnt, addr_type, WORDS_out> addr_cntInst;
  bool accumulated[nb_cnt];
  bool all_at_max;
  bool irrel_at_max;
  addr_type rd_counter[nb_cnt];
  addr_type rd_tile_bound[nb_cnt];
  
  // interconnections
  addr_type pointer_value[nb_cnt];
  addr_type loop_bound[nb_cnt];
  addr_type tile_size[nb_cnt];
  
  // control
  bool setup;
};

template<int nb_cnt, int N, int WORDS_in, int WORDS_out, class type, class addr_type>
class I_dp_sb
{
public:
  // Constructor
    I_dp_sb() : setup(1), irrel_at_max(1), irrel_cnt(0), write_flag(0),
                read_flag0(0), wr_pntr(0), rd_pntr(0), vld_pntr(0), data_vld(0),
                flags(0), skid(0), debug_cnt(0) {
    #pragma hls_unroll yes
    for (int x=0; x<nb_cnt; x++){
      rd_counter[x] = 0;
    }
  }

#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
  void CCS_BLOCK(run)(ac_channel<packedData<type,WORDS_in> > &wr_data, ac_channel<packedData<type,WORDS_out> > &rd_data,
                      ac_channel<memlevelInstr<addr_type, nb_cnt+1> > &instr_in) {



    if (setup){
      if (instr_in.available(1)){
        instr = instr_in.read();
      }
      #pragma hls_unroll yes
      for (int x=0; x<nb_cnt; x++){
        loop_bound[x] = instr.bound[x+1];
        tile_size[x] = instr.tile[x+1];
        rd_tile_bound[x] = tile_size[x];
        irrel_at_max = loop_bound[x] != 1 ? false : irrel_at_max;
      }
      setup = false;
    }

    if (!flags[2] && (rd_pntr != wr_pntr || data_vld)) { // Access MSB bit of the flags 4bit variable. Please note the bit access method [].
      read_flag0 = true;
    } else {
      read_flag0 = false;
    }

    if (read_flag0) {
      rd_pntr = ((rd_pntr/WORDS_out)*WORDS_out);

      #pragma hls_unroll yes
      RD_OUT_MEM: for (int i=0; i<WORDS_out; i++){
        read_data.data[i] = mem[rd_pntr+i]; //to prove that the access starts at word bounderies [even: (pntr>>(1))<<1)]
#ifndef __SYNTHESIS__
            if (instr.tile[0] == I_L3_tile_small && tile_size[nb_cnt-1] == I_L3_tile_big)
              I_L3_rd_cnt++;
            if (instr.tile[0] == I_L2_tile_small && tile_size[nb_cnt-1] == I_L2_tile_big)
              I_L2_rd_cnt++;
#endif
      }
      //if all irrelevant loops are at their maximum, consumed data in this level can't be reused anymore
      if (irrel_at_max){
        irrel_cnt += WORDS_out;;
      }
      if (irrel_cnt == WORDS_in){
        vld_pntr = rd_pntr;
        data_vld = false;
        irrel_cnt = 0;
      }
      //increment pointer based on wordlength
      addr_cntInst.run(loop_bound, tile_size, rd_pntr, irrel_at_max, rd_counter, rd_tile_bound);

    }

    if (read_flag0 | skid_buf.not_empty()) {
// #ifndef __SYNTHESIS__
//       debug_cnt++;
// #endif
      if (read_flag0 & skid_buf.not_empty()) {
        skid_buf.push(read_data);
        read_data = skid_buf.peek();
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          NB_WRITE_READ_DATA: write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf.not_empty()) {
        read_data = skid_buf.peek();
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop();
        }
      } else if (read_flag0) {
// #ifndef __SYNTHESIS__
//         if (debug_cnt&1) {
//           write_stall = true;
//         } else
// #endif
          write_stall = !rd_data.nb_write(read_data);
        if (write_stall) {
          skid_buf.push(read_data);//Push data into skid buffer if nb_write fails
        }
      }
    }

    flags <<=1;
    flags[0] = skid_buf.not_empty();
    if (!data_vld) {
      NB_READ_WRITE_DATA: write_flag = wr_data.nb_read(write_data);

      if (write_flag) {
        #pragma hls_unroll yes
        WR_IN_MEM: for (int i=0; i<WORDS_in; i++){
          mem[wr_pntr+i] = write_data.data[i];
#ifndef __SYNTHESIS__
          if (instr.tile[0] == I_L3_tile_small && instr.tile[nb_cnt-1] == I_L3_tile_big)
            I_L3_wr_cnt++;
          if (instr.tile[0] == I_L2_tile_small && instr.tile[nb_cnt-1] == I_L2_tile_big)
            I_L2_wr_cnt++;
#endif
        }
        wr_pntr = (wr_pntr+WORDS_in);
        if (wr_pntr == tile_size[nb_cnt-1]){
          wr_pntr = 0;
        }
        data_vld = (wr_pntr==vld_pntr);
      }
    }
  }

private:
  // instruction interconnection
  memlevelInstr<addr_type, nb_cnt+1> instr;

  // data
  bool        write_flag;
  packedData<type,WORDS_in> write_data;
  addr_type   wr_pntr;
  bool        read_flag0;
  type        mem[N];
  uint3       flags;
  packedData<type,WORDS_out> read_data;
  addr_type   rd_pntr;
  addr_type   vld_pntr;
  bool        data_vld;
  uint3       skid;
  fifo<packedData<type,WORDS_out>,4> skid_buf;
  bool        write_stall;
  int         debug_cnt;
  addr_type   irrel_cnt;

  // counter array mapped to this memory level
  W_addr_cnt<nb_cnt, addr_type, WORDS_out> addr_cntInst;
  bool accumulated[nb_cnt];
  bool all_at_max;
  bool irrel_at_max;
  addr_type rd_counter[nb_cnt];
  addr_type rd_tile_bound[nb_cnt];

  // interconnections
  addr_type pointer_value[nb_cnt];
  addr_type loop_bound[nb_cnt];
  addr_type tile_size[nb_cnt];

  // control
  bool setup;
};


template<int nb_cnt, int N, int WORDS_in, int WORDS_out, class type, class addr_type> 
class O_dp_sb
{
public:
  // Constructor
    O_dp_sb() : setup(1),
                rd_irrel_at_max(1), rd_irrel_at_zero(1), wr_irrel_at_max(1), wr_irrel_at_zero(1),
                write_flag_top(0), write_flag_bot(0),
                zero_guard_top_flag(0), zero_guard(1),
                read_flag0(0), read_flag1(0), read_flag2(0),
                wr_pntr(0), rd_pntr(0), data_vld(1),
                vld_zg_pntr(0), rd_data_zg(1), wr_data_zg(1), refresh_zg(0),
                flags_top(0), flags_bot(0), flags_zero_guard(0), flags_wr_zero_guard(0), skid(0),
                zg_cnt(0), rd_increment(1),
                read_data_top_flag(0),
                debug_cnt0(0), debug_cnt1(0), debug_cnt2(0), flag0cnt(0), flag2cnt(0)
    {
    #pragma hls_unroll yes
      for (int x=0; x<nb_cnt; x++){
        rd_counter[x] = 0;
        wr_counter[x] = 0;
      }
    }

#pragma hls_design top
#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
  void CCS_BLOCK(run)(ac_channel<packedData<type,WORDS_in> > &wr_data_top, ac_channel<packedData<type,WORDS_out> > &rd_data_top,
                      ac_channel<packedData<type,WORDS_in> > &wr_data_bot, ac_channel<packedData<type,WORDS_out> > &rd_data_bot,
                      ac_channel<bool> &wr_data_zero_guard, ac_channel<bool> &rd_data_zero_guard,
                      ac_channel<memlevelInstr<addr_type, nb_cnt+1> > &instr_in) {
    


    // read instruction at the start of a new layer execution
    if (setup){
      if (instr_in.available(1) && wr_data_zero_guard.available(1)){
        instr = instr_in.read();

      wr_data_zero_guard.read(wr_zero_guard);

      skid_buf_wr_zero_guard.push(wr_zero_guard);
      rd_data_zg = skid_buf_wr_zero_guard.peek();

      tile_size_down = instr.tile[0];

      #pragma hls_unroll yes
      for (int x=0; x<nb_cnt; x++){
        loop_bound[x] = instr.bound[x+1];
        tile_size[x] = instr.tile[x+1];
        rd_tile_bound[x] = tile_size[x];
        wr_tile_bound[x] = tile_size[x];
        rd_irrel_at_max = loop_bound[x] != 1 ? false : rd_irrel_at_max;
        wr_irrel_at_max = loop_bound[x] != 1 ? false : wr_irrel_at_max;
      }
      if (tile_size_down == tile_size[nb_cnt-1]){skid_buf_wr_zero_guard.pop();}
        flags_wr_zero_guard <<=1;
        flags_wr_zero_guard[0] = skid_buf_wr_zero_guard.not_empty();
        setup = false;
      }
    } else {

    zero_guard = rd_data_zg && (rd_pntr == vld_zg_pntr);
    // set flags to enable data and zero guard pipeline buffers towards the memory level below and above
    //  --> read_flag0 to read out data from this memory level towards the memory level below
    //  --> read_flag0 and read_flag2 to read out data from this memory level or the level above towards the memory level below and above together with a zero guard = 0
    //  --> read_flag1 to forward data coming from the memory level below towards the memory level above
    //  --> read_flag2 to send out a zero guard flag = 1 to the memory level below
    addr_type largest = (tile_size_down > WORDS_out) ? tile_size_down : (addr_type) WORDS_out;
    addr_type sum_value = (zero_guard) ? largest : (addr_type) WORDS_out;
    addr_type diff = (rd_pntr+sum_value > wr_pntr) ? (addr_type) (rd_pntr + sum_value - wr_pntr) : (addr_type) (wr_pntr - rd_pntr);
    bool in_between = rd_pntr < wr_pntr && wr_pntr < rd_pntr + sum_value;

    if (!flags_bot[2] && (rd_pntr != wr_pntr || data_vld) && !zero_guard && !refresh_zg && (diff <= tile_size[0])){ // Access MSB bit of the flags 2bit variable. Please note the bit access method [].
      read_flag0 = ((!flags_zero_guard[0] && zg_cnt == 0) || (zg_cnt != 0));
    } else {
      read_flag0 = false;
    }
    if (!flags_top[1] && read_data_top_flag) { // Access MSB bit of the flags 2bit variable. Please note the bit access method [].
      read_flag1 = true; 
    } else {
      read_flag1 = false;
    }
    if (!flags_zero_guard[0] && zg_cnt == 0
        && ((!flags_bot[2] && !zero_guard && !refresh_zg) || (zero_guard && !in_between && (tile_size_down != tile_size[nb_cnt-1] || wr_pntr == 0)))
        && (rd_pntr != wr_pntr || data_vld) && (diff <= tile_size[0] || (zero_guard && rd_pntr == 0))){
      read_flag2 = true;
    } else {
      read_flag2 = false;   
    }

    if (read_flag0) {
      rd_pntr = ((rd_pntr/WORDS_out)*WORDS_out);

#pragma hls_unroll yes
    RD_OUT_MEM_BOT: for (int i=0; i<WORDS_out; i++){
        read_data_bot.data[i] = mem[rd_pntr+i]; //to prove that the access starts at word bounderies [even: (pntr>>(1))<<1)]
#ifndef __SYNTHESIS__
            if (tile_size[0] == O_L3_tile_small && tile_size[nb_cnt-1] == O_L3_tile_big)
              O_L3_bot_rd_cnt++;
            if (tile_size[0] == O_L2_tile_small && tile_size[nb_cnt-1] == O_L2_tile_big)
              O_L2_bot_rd_cnt++;
#endif
      }
    }
    
    // data pipeline buffer towards memory level below
    if (read_flag0 | skid_buf_bot.not_empty()) {
#ifndef __SYNTHESIS__
      debug_cnt0++;
#endif
      if (read_flag0 & skid_buf_bot.not_empty()) {
        skid_buf_bot.push(read_data_bot);
        read_data_bot = skid_buf_bot.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt0&1) {
          write_stall_bot = true;
        } else
#endif
          write_stall_bot = !rd_data_bot.nb_write(read_data_bot);
        if (!write_stall_bot) {
          skid_buf_bot.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf_bot.not_empty()) {
        read_data_bot = skid_buf_bot.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt0&1) {
          write_stall_bot = true;
        } else
#endif
          write_stall_bot = !rd_data_bot.nb_write(read_data_bot);
        if (!write_stall_bot) {
          skid_buf_bot.pop();
        }
      } else if (read_flag0) {
#ifndef __SYNTHESIS__
        if (debug_cnt0&1) {
          write_stall_bot = true;
        } else
#endif
          write_stall_bot = !rd_data_bot.nb_write(read_data_bot);
        if (write_stall_bot) {
          skid_buf_bot.push(read_data_bot);//Push data into skid buffer if nb_write fails
        }
      }
    } 
    // data pipeline buffer towards memory level above
    if (read_flag1 | skid_buf_top.not_empty()) {
#ifndef __SYNTHESIS__
      debug_cnt1++;
#endif
      if (read_flag1 & skid_buf_top.not_empty()) {
        skid_buf_top.push(read_data_top);
        read_data_top = skid_buf_top.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt1&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !rd_data_top.nb_write(read_data_top);
        if (!write_stall_top) {
          skid_buf_top.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf_top.not_empty()) {
        read_data_top = skid_buf_top.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt1&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !rd_data_top.nb_write(read_data_top);
        if (!write_stall_top) {
          skid_buf_top.pop();
        }
      } else if (read_flag1) {
#ifndef __SYNTHESIS__
        if (debug_cnt1&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !rd_data_top.nb_write(read_data_top);
        if (write_stall_top) {
          skid_buf_top.push(read_data_top);//Push data into skid buffer if nb_write fails
        }
      }
    }
    // zero guard pipeline buffer towards memory level below
    if (read_flag2 | skid_buf_zero_guard.not_empty()) {
#ifndef __SYNTHESIS__
      debug_cnt2++;
#endif
      if (read_flag2 & skid_buf_zero_guard.not_empty()) {
        skid_buf_zero_guard.push(zero_guard);
        zero_guard = skid_buf_zero_guard.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt2&1) {
          write_stall_zero_guard = true;
        } else
#endif
          write_stall_zero_guard = !rd_data_zero_guard.nb_write(zero_guard);
        if (!write_stall_zero_guard) {
          skid_buf_zero_guard.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf_zero_guard.not_empty()) {
        zero_guard = skid_buf_zero_guard.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt2&1) {
          write_stall_zero_guard = true;
        } else
#endif
          write_stall_zero_guard = !rd_data_zero_guard.nb_write(zero_guard);
        if (!write_stall_zero_guard) {
          skid_buf_zero_guard.pop();
        }
      } else if (read_flag2) {
#ifndef __SYNTHESIS__
        if (debug_cnt2&1) {
          write_stall_zero_guard = true;
        } else
#endif
          write_stall_zero_guard = !rd_data_zero_guard.nb_write(zero_guard);
        if (write_stall_zero_guard) {
          skid_buf_zero_guard.push(zero_guard);//Push data into skid buffer if nb_write fails
        }
      }
    }
    if (read_flag1) {read_data_top_flag = false;}
    if (read_flag0 || (read_flag2 && zero_guard)){
      //increment pointer based on wordlength
      if (zero_guard){
        rd_cnt = largest;
          if (vld_zg_pntr + largest >= tile_size[nb_cnt-1]){
            rd_data_zg = false;
            vld_zg_pntr = 0;
             if (rd_irrel_at_max){refresh_zg = true;}
          } else {
            vld_zg_pntr += largest;
          }
      } else {
        rd_cnt = WORDS_out;
        if (rd_pntr + WORDS_in >= tile_size[nb_cnt-1] && rd_irrel_at_max){
           refresh_zg = true;
        }
      }
      if (zg_cnt + rd_cnt >= tile_size_down){
        zg_cnt = 0;
      } else {
        zg_cnt += rd_cnt;
      }

      rd_pntr_cntInst.run(loop_bound, tile_size, rd_pntr, rd_pntr_out, rd_cnt, rd_irrel_at_max_out, rd_irrel_at_zero_out, rd_all_at_max_out, rd_counter, rd_tile_bound);
      rd_pntr = rd_pntr_out;
      rd_irrel_at_max = rd_irrel_at_max_out;
      rd_all_at_max = rd_all_at_max_out;
      rd_irrel_at_zero = rd_irrel_at_zero_out;


      rd_increment = true;

      data_vld = false;
    }

    flags_bot <<=1;
    flags_bot[0] = skid_buf_bot.not_empty();
    flags_top <<=1;
    flags_top[0] = skid_buf_top.not_empty();
    flags_zero_guard <<=1;
    flags_zero_guard[0] = skid_buf_zero_guard.not_empty();


    if (!flags_wr_zero_guard[1]){
      zero_guard_top_flag = wr_data_zero_guard.nb_read(wr_zero_guard);
      if (zero_guard_top_flag){
        skid_buf_wr_zero_guard.push(wr_zero_guard);
      }
    }


    // if partial sums are read out of the memory, the data at that spot is invalidated and needs to be updated
    if (!data_vld){
      // to prove the pointer is a multiple of the word length of the memory
      wr_pntr = ((wr_pntr/WORDS_in)*WORDS_in);

      // read in data from bot (and top) depending on the reuse opportunities
      if ((wr_irrel_at_max && !flags_top[1] && skid_buf_wr_zero_guard.not_empty() && !read_data_top_flag) || !wr_irrel_at_max){
        if (!write_flag_bot){write_flag_bot = wr_data_bot.nb_read(write_data_bot);}
        if (!write_flag_top && wr_irrel_at_max && !skid_buf_wr_zero_guard.peek()){write_flag_top = wr_data_top.nb_read(write_data_top);}
        wr_data_zg = skid_buf_wr_zero_guard.peek();
        if (refresh_zg){rd_data_zg = wr_data_zg; refresh_zg = false;}
      }
      if (write_flag_bot && ((!wr_irrel_at_max) || (wr_irrel_at_max && ((!skid_buf_wr_zero_guard.peek() && write_flag_top) || skid_buf_wr_zero_guard.peek())))){
        // if data coming from below cannot be reused anymore at this level,
        // forward it to the level above or out of the accelerator
        // read in partial sums if available at higher levels
        if (wr_irrel_at_max){
          read_data_top = write_data_bot;
          read_data_top_flag = true;
          if (!skid_buf_wr_zero_guard.peek()){
#pragma hls_unroll yes
          WR_IN_MEM_FROM_TOP: for (int i=0; i<WORDS_in; i++){
            mem[wr_pntr+i] = write_data_top.data[i];
#ifndef __SYNTHESIS__
            if (tile_size[0] == O_L3_tile_small && tile_size[nb_cnt-1] == O_L3_tile_big)
              O_L3_top_wr_cnt++;
            if (tile_size[0] == O_L2_tile_small && tile_size[nb_cnt-1] == O_L2_tile_big)
              O_L2_top_wr_cnt++;
#endif
            }
          }
          // pop data from buffer if iterated over all relevant mapped loops/coordinates/memory cells
          if (wr_pntr+WORDS_in >= tile_size[nb_cnt-1]){
            skid_buf_wr_zero_guard.pop();
          }
        // write partial sums from the level below in this memory level to be able to reuse in the near future
        } else if (!wr_irrel_at_max){
#pragma hls_unroll yes
          WR_IN_MEM_FROM_BOT: for (int i=0; i<WORDS_in; i++){
            mem[wr_pntr+i] = write_data_bot.data[i];
#ifndef __SYNTHESIS__
            if (tile_size[0] == O_L3_tile_small && tile_size[nb_cnt-1] == O_L3_tile_big)
              O_L3_bot_wr_cnt++;
            if (tile_size[0] == O_L2_tile_small && tile_size[nb_cnt-1] == O_L2_tile_big)
              O_L2_bot_wr_cnt++;
#endif
          }
        }

        // increment pointer based on word length
        wr_cnt = WORDS_in;
        wr_pntr_cntInst.run(loop_bound, tile_size, wr_pntr, wr_pntr_out, wr_cnt, wr_irrel_at_max, wr_irrel_at_zero, wr_all_at_max, wr_counter, wr_tile_bound);
        wr_pntr = wr_pntr_out;
        data_vld = wr_pntr == rd_pntr;
        // clear write_flags for next write iteration
        write_flag_bot = write_flag_top = false;
      }
    }
    flags_wr_zero_guard <<=1;
    flags_wr_zero_guard[0] = skid_buf_wr_zero_guard.not_empty();
    }
  }
private:
  // instruction interconnection
  memlevelInstr<addr_type, nb_cnt+1> instr;
  
  // data
  bool        write_flag_top;
  bool        write_flag_bot;
  bool        zero_guard_top_flag;
  packedData<type,WORDS_in> write_data_top;
  packedData<type,WORDS_in> write_data_bot;
  bool        wr_zero_guard;
  bool        read_flag0;
  bool        read_flag1;
  bool        read_flag2;
  type        mem[N];
  uint2       flags_top;
  uint3       flags_bot;
  uint1       flags_zero_guard;
  uint2       flags_wr_zero_guard;
  packedData<type,WORDS_out> read_data_top;
  packedData<type,WORDS_out> read_data_bot;
  bool        zero_guard;
  addr_type   vld_zg_pntr;
  bool        data_vld;
  uint3       skid;
  fifo<packedData<type,WORDS_out>,3> skid_buf_top;
  fifo<packedData<type,WORDS_out>,4> skid_buf_bot;
  fifo<bool,2> skid_buf_zero_guard;
  fifo<bool,3> skid_buf_wr_zero_guard;
  bool        write_stall_top;
  bool        write_stall_bot;
  bool        write_stall_zero_guard;
  int         debug_cnt0;
  int         debug_cnt1;
  int         debug_cnt2;
  int         flag0cnt;
  int         flag2cnt;
  
  bool        rd_data_zg;
  bool        wr_data_zg;
  bool        refresh_zg;
  bool        start_flag;
  addr_type   zg_cnt;
  bool        reuse;
  
  
  
  // read pointer counter mapped to this memory level
  addr_cnt_flex<nb_cnt, addr_type> rd_pntr_cntInst;
  addr_type   rd_pntr;
  addr_type   rd_pntr_out;
  bool rd_all_at_max;
  bool rd_irrel_at_max;
  bool rd_irrel_at_zero;
  bool rd_all_at_max_out;
  bool rd_irrel_at_max_out;
  bool rd_irrel_at_zero_out;
  addr_type rd_cnt;
  addr_type rd_counter[nb_cnt];
  addr_type rd_tile_bound[nb_cnt];
  bool rd_increment;
  
  // write pointer counter mapped to this memory level
  addr_cnt_flex<nb_cnt, addr_type> wr_pntr_cntInst;
  addr_type   wr_pntr;
  addr_type   wr_pntr_out;
  bool wr_all_at_max;
  bool wr_irrel_at_max;
  bool wr_irrel_at_zero;
  addr_type wr_cnt;
  addr_type wr_counter[nb_cnt];
  addr_type wr_tile_bound[nb_cnt];
  
  // interconnections
  addr_type pointer_value[nb_cnt];
  addr_type loop_bound[nb_cnt];
  addr_type tile_size[nb_cnt];
  addr_type tile_size_down;
  // control
  bool setup;
  addr_type setup_counter;
  bool setup_rd_ac;
  bool top_irrel_done;
  bool bot_irrel_done;
  bool read_data_top_flag;
  
};

template<int nb_cnt, int O_N, int I_N, int W_N,
         int O_WORDS_in, int O_WORDS_out, int I_WORDS_in, int I_WORDS_out, int W_WORDS_in, int W_WORDS_out,
         class O_type, class O_addr_type, class I_type, class I_addr_type, class W_type, class W_addr_type>
class rf
{
public:
  // Constructor
  rf() :           setup(1),
                   O_mac_irrel_at_max(1), O_mac_irrel_at_zero(1), O_mac_all_at_max(0),
                   I_mac_irrel_at_max(1), I_mac_irrel_at_zero(1), I_mac_all_at_max(0),
                   W_mac_irrel_at_max(1), W_mac_irrel_at_zero(1), W_mac_all_at_max(0),
                   O_wr_irrel_at_max(1), O_wr_irrel_at_zero(1),
                   I_irrel_cnt(0), W_irrel_cnt(0),
                   I_mac_irrel_at_maxBuf(1), W_mac_irrel_at_maxBuf(1), O_mac_irrel_at_maxBuf(1),
                   psum_flag(0), psum_top_flag(0), psum_top(0), read_flag(0),
                   write_flag0(0), O_write_flag(0), I_write_flag(0), W_write_flag(0),
                   zero_guard(0), zero_guard_top_flag(0), read_flag0(0), read_flag1(0),
                   I_wr_pntr(0), W_wr_pntr(0), O_mac_pntr(0), I_mac_pntr(0), W_mac_pntr(0),
                   O_vld_zg_pntr(0), O_data_vld(0), I_vld_pntr(0), I_data_vld(0), W_vld_pntr(0), W_data_vld(0),
                   flags_top(0), write_stall_top(1), flags_wr_zero_guard(0), skid(0),
                   debug_cnt(0), flag1cnt(0), flag2cnt(0), psumflagcnt(0) {
    #pragma hls_unroll yes
    for (int x=0; x<nb_cnt; x++){
      O_mac_counter[x] = 0;
      I_mac_counter[x] = 0;
      W_mac_counter[x] = 0;
    }
  }

#pragma hls_design top
#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(ac_channel<packedData<O_type,O_WORDS_in> > &O_wr_data,
                        ac_channel<packedData<O_type,O_WORDS_out> > &O_rd_data,
                        ac_channel<packedData<I_type,I_WORDS_in> > &I_wr_data,
                        ac_channel<packedData<W_type,W_WORDS_in> > &W_wr_data,
                        ac_channel<bool> &wr_data_zero_guard,
                        ac_channel<memlevelInstr<O_addr_type, nb_cnt+1> > &O_instr_in,
                        ac_channel<memlevelInstr<I_addr_type, nb_cnt+1> > &I_instr_in,
                        ac_channel<memlevelInstr<W_addr_type, nb_cnt+1> > &W_instr_in) {
#pragma hls_resource O_mem:rsc variables="O_mem" \
      map_to_module="ram_nangate-45nm-register-file_beh.REGISTER_FILE"
#pragma hls_resource I_mem:rsc variables="I_mem" \
      map_to_module="ram_nangate-45nm-register-file_beh.REGISTER_FILE"
#pragma hls_resource W_mem:rsc variables="W_mem" \
      map_to_module="ram_nangate-45nm-register-file_beh.REGISTER_FILE"

    if (setup){
      if (O_instr_in.available(1) && I_instr_in.available(1) && W_instr_in.available(1) && wr_data_zero_guard.available(1)){
        O_instr = O_instr_in.read();
        I_instr = I_instr_in.read();
        W_instr = W_instr_in.read();
        data_zg = wr_data_zero_guard.read();
        skid_buf_wr_zero_guard.push(data_zg);
      #pragma hls_unroll yes
      for (int x=0; x<nb_cnt; x++){
        O_loop_bound[x] = O_instr.bound[x+1];
        O_tile_size[x] = O_instr.tile[x+1];
        I_loop_bound[x] = I_instr.bound[x+1];
        I_tile_size[x] = I_instr.tile[x+1];
        W_loop_bound[x] = W_instr.bound[x+1];
        W_tile_size[x] = W_instr.tile[x+1];
        O_mac_tile_bound[x] = O_tile_size[x];
        I_mac_tile_bound[x] = I_tile_size[x];
        W_mac_tile_bound[x] = W_tile_size[x];
        O_mac_irrel_at_maxBuf = O_mac_irrel_at_max = O_loop_bound[x] != 1 ? false : O_mac_irrel_at_max;
        I_mac_irrel_at_maxBuf = I_mac_irrel_at_max = I_loop_bound[x] != 1 ? false : I_mac_irrel_at_max;
        W_mac_irrel_at_maxBuf = W_mac_irrel_at_max = W_loop_bound[x] != 1 ? false : W_mac_irrel_at_max;
      }
      if (O_WORDS_in >= O_tile_size[nb_cnt-1]){skid_buf_wr_zero_guard.pop();}
      setup = false;
      }
    } else {

    // set flags which decides if a new partial sum can be calculated
    O_read_flag = (O_data_vld || O_mac_pntr != O_vld_zg_pntr);
    I_read_flag = (I_data_vld || I_mac_pntr != I_wr_pntr);
    W_read_flag = (W_data_vld || W_mac_pntr != W_wr_pntr);
    zero_guard = (data_zg && O_mac_pntr == O_vld_zg_pntr);

    if (((O_mac_irrel_at_max && !flags_top[1]) || !O_mac_irrel_at_max)) { // Access MSB bit of the flags 3bit variable. Please note the bit access method [].
      read_flag0 = true;
    } else {
      read_flag0 = false;
    }

    psum_flag = read_flag0 && (O_read_flag && I_read_flag && W_read_flag && !(psum_top && O_mac_pntr == O_vld_zg_pntr));
    psum_top_flag = read_flag0 && (O_write_flag && I_read_flag && W_read_flag);
    read_flag =  (psum_flag || psum_top_flag);

    // set flag which decides if data is transfered out of the memory level upwards
    if (!flags_top[1] && O_mac_irrel_at_max && read_flag) { // Access MSB bit of the flags 3bit variable. Please note the bit access method [].
      read_flag1 = true;
    } else {
      read_flag1 = false;
    }

    // proof that pointer is multiple of the wordlength
    O_mac_pntr = ((O_mac_pntr/O_WORDS_out)*O_WORDS_out);
    I_mac_pntr = ((I_mac_pntr/I_WORDS_out)*I_WORDS_out);
    W_mac_pntr = ((W_mac_pntr/W_WORDS_out)*W_WORDS_out);

    // update partial sums and guard the fetching when no partial sum is available yet for a certain output coordinate
    // accumulate with partial sum from scratchpad memory
    if (psum_flag && !zero_guard){
      #pragma hls_unroll yes
      UPDATE_PSUM: for (int i=0; i<O_WORDS_out; i++){

        mac_data.data[i] = W_mem[W_mac_pntr+i] * I_mem[I_mac_pntr+i] + O_mem[O_mac_pntr+i];
#ifndef __SYNTHESIS__
        W_L1_rd_cnt++;
        I_L1_rd_cnt++;
#endif
      }
    // guard accumulation
    } else if (psum_flag && zero_guard){
      #pragma hls_unroll yes
      UPDATE_PSUM_ZERO_GUARD: for (int i=0; i<O_WORDS_out; i++){

        mac_data.data[i] = W_mem[W_mac_pntr+i] * I_mem[I_mac_pntr+i];
#ifndef __SYNTHESIS__
        W_L1_rd_cnt++;
        I_L1_rd_cnt++;
#endif
      }
    // accumulate with partial sum coming from memory above
    } else if (psum_top_flag){
      #pragma hls_unroll yes
      UPDATE_PSUM_FROM_TOP: for (int i=0; i<O_WORDS_out; i++){
        mac_data.data[i] = W_mem[W_mac_pntr+i] * I_mem[I_mac_pntr+i] + O_write_data.data[i];
#ifndef __SYNTHESIS__
        W_L1_rd_cnt++;
        I_L1_rd_cnt++;
#endif
      }
    }

    // if data coming from below cannot be reused anymore at this level, forward it to the level above or out of the accelerator
    if (read_flag1){
      O_read_data = mac_data;
#ifndef __SYNTHESIS__
      if (psum_flag && !zero_guard)
        O_L1_top_rd_cnt++;
#endif
    } else if (read_flag) {
      #pragma hls_unroll yes
      WRITE_PSUM_TO_RF: for (int i=0; i<O_WORDS_out; i++){
        O_mem[O_mac_pntr+i] = mac_data.data[i];
#ifndef __SYNTHESIS__
        if (psum_flag && !zero_guard){
          O_L1_bot_rd_cnt++;
        } else if (psum_top_flag) {
          O_L1_top_wr_cnt++;
        }
        O_L1_bot_wr_cnt++;
#endif
      }
    }

    if (read_flag1 | skid_buf_top.not_empty()) {
#ifndef __SYNTHESIS__
      debug_cnt++;
#endif
      if (read_flag1 & skid_buf_top.not_empty()) {
        skid_buf_top.push(O_read_data);
        O_read_data = skid_buf_top.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !O_rd_data.nb_write(O_read_data);
        if (!write_stall_top) {
          skid_buf_top.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf_top.not_empty()) {
        O_read_data = skid_buf_top.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !O_rd_data.nb_write(O_read_data);
        if (!write_stall_top) {
          skid_buf_top.pop();
        }
      } else if (read_flag1) {
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall_top = true;
        } else
#endif
          write_stall_top = !O_rd_data.nb_write(O_read_data);
        if (write_stall_top) {
          skid_buf_top.push(O_read_data);//Push data into skid buffer if nb_write fails
        }
      }
    }

    if (read_flag){
      // remove zero guard tag from memory address
      if (zero_guard){
        O_vld_zg_pntr++;
        if (O_vld_zg_pntr == O_tile_size[nb_cnt-1]){
          O_vld_zg_pntr = 0;
          data_zg = false;
        }
      }
      // accumulated with psum data from level above
      else if (O_write_flag){
        O_write_flag = false;
        O_vld_zg_pntr++;
        // all data in memory is reusable
        if (O_vld_zg_pntr == O_tile_size[nb_cnt-1]){
          O_vld_zg_pntr = 0;
          O_data_vld = true;
          psum_top = false;
        }
      }

      // put old values in the buffer and calculate new ones
      I_mac_irrel_at_maxBuf = I_mac_irrel_at_max;
      W_mac_irrel_at_maxBuf = W_mac_irrel_at_max;
      O_mac_irrel_at_maxBuf = O_mac_irrel_at_max;

      O_mac_pntr_cntInst.run(O_loop_bound, O_tile_size, O_mac_pntr, O_mac_irrel_at_max, O_mac_irrel_at_zero, O_mac_all_at_max, O_mac_counter, O_mac_tile_bound);
      I_mac_pntr_cntInst.run(I_loop_bound, I_tile_size, I_mac_pntr, I_mac_irrel_at_max, I_mac_irrel_at_zero, I_mac_all_at_max, I_mac_counter, I_mac_tile_bound);
      W_mac_pntr_cntInst.run(W_loop_bound, W_tile_size, W_mac_pntr, W_mac_irrel_at_max, W_mac_irrel_at_zero, W_mac_all_at_max, W_mac_counter, W_mac_tile_bound);

      //if all irrelevant loops are at their maximum, consumed data in this level can't be reused anymore
      if (I_mac_irrel_at_maxBuf){
        I_irrel_cnt++;
      }
      if (I_irrel_cnt == I_WORDS_in){
        I_vld_pntr = I_mac_pntr;
        I_data_vld = false;
        I_irrel_cnt = 0;
      }
      //if all irrelevant loops are at their maximum, consumed data in this level can't be reused anymore
      if (W_mac_irrel_at_maxBuf){
        W_irrel_cnt++;
      }
      if (W_irrel_cnt == W_WORDS_in){
        W_vld_pntr = W_mac_pntr;
        W_data_vld = false;
        W_irrel_cnt = 0;
      }

      // data of memory level can't be reused anymore and will be moved to the memory levels above
      if (O_mac_irrel_at_maxBuf && O_mac_pntr == O_vld_zg_pntr && O_vld_zg_pntr == 0){
        O_data_vld = false;
      }
    }

    flags_top <<=1;
    flags_top[0] = skid_buf_top.not_empty();

    // read in zero guard data from level above
    if (!flags_wr_zero_guard[0]){
      zero_guard_top_flag = wr_data_zero_guard.nb_read(wr_zero_guard);
      if (zero_guard_top_flag){
        skid_buf_wr_zero_guard.push(wr_zero_guard);
      }
    }

    // flag to detect if level is at startup or data is not reusable anymore
    start_flag = !O_data_vld && O_mac_pntr == O_vld_zg_pntr && skid_buf_wr_zero_guard.not_empty() && !psum_top;

    // read in partial sum from memory level above or zero guard memory level
    if (!skid_buf_wr_zero_guard.peek() && start_flag){
      psum_top = true;
      data_zg = false;
      skid_buf_wr_zero_guard.pop();
    } else if (skid_buf_wr_zero_guard.peek() && start_flag){
      data_zg = true;
      O_data_vld = true;
      skid_buf_wr_zero_guard.pop();
    }

    if (psum_top && O_mac_pntr == O_vld_zg_pntr && !O_write_flag){
      O_write_flag = O_wr_data.nb_read(O_write_data);
    }
    // write input data to input memory if reusable data is consumed
    if (!I_data_vld) {
      I_write_flag = I_wr_data.nb_read(I_write_data);

      if (I_write_flag) {
        #pragma hls_unroll yes
        I_WR_IN_MEM: for (int i=0; i<I_WORDS_in; i++){
          I_mem[I_wr_pntr+i] = I_write_data.data[i];
#ifndef __SYNTHESIS__
          I_L1_wr_cnt++;
#endif
        }
        I_wr_pntr = (I_wr_pntr+I_WORDS_in);
        if (I_wr_pntr == I_tile_size[nb_cnt-1]){
          I_wr_pntr = 0;
        }
        I_data_vld = (I_wr_pntr==I_vld_pntr);
      }
    }
    // write weight data to weight memory if reusable data is consumed
    if (!W_data_vld) {
      W_write_flag = W_wr_data.nb_read(W_write_data);

      if (W_write_flag) {
        #pragma hls_unroll yes
        W_WR_IN_MEM: for (int i=0; i<W_WORDS_in; i++){
          W_mem[W_wr_pntr+i] = W_write_data.data[i];
#ifndef __SYNTHESIS__
          W_L1_wr_cnt++;
#endif
        }
        W_wr_pntr = (W_wr_pntr+W_WORDS_in);
        if (W_wr_pntr == W_tile_size[nb_cnt-1]){
          W_wr_pntr = 0;
        }
        W_data_vld = (W_wr_pntr==W_vld_pntr);
      }
    }
    flags_wr_zero_guard <<=1;
    flags_wr_zero_guard[0] = skid_buf_wr_zero_guard.not_empty();

  }
  }
private:
  // instruction interconnection
  memlevelInstr<O_addr_type, nb_cnt+1> O_instr;
  memlevelInstr<I_addr_type, nb_cnt+1> I_instr;
  memlevelInstr<W_addr_type, nb_cnt+1> W_instr;
  // data
  bool                                   write_flag0;
  bool                                   write_stall_top;
  bool                                   O_write_flag;
  bool                                   I_write_flag;
  bool                                   W_write_flag;
  bool                                   O_read_flag;
  bool                                   I_read_flag;
  bool                                   W_read_flag;
  bool                                   psum_flag;
  bool                                   psum_top_flag;
  bool                                   psum_top;
  bool                                   read_flag;
  bool                                   start_flag;
  bool                                   wr_zero_guard;
  bool                                   zero_guard_top_flag;
  bool                                   read_flag0;
  bool                                   read_flag1;
  ac_int<2,false>                        flags_top;
  ac_int<1,false>                        flags_wr_zero_guard;
  packedData<O_type,O_WORDS_out>         mac_data;
  bool                                   zero_guard;
  bool                                   zero_guard_top;
  ac_int<2,false>                        skid;
  fifo<packedData<O_type,O_WORDS_out>,3> skid_buf_top;
  fifo<bool,2>                           skid_buf_wr_zero_guard;
  int                                    debug_cnt;

    int flag1cnt;
    int flag2cnt;
    int psumflagcnt;
  // OUTPUT
  // memory level
  O_type        O_mem[O_N];

  // I/O
  packedData<O_type,O_WORDS_in> O_write_data;
  packedData<O_type,O_WORDS_out> O_read_data;

  // mac pointer counter mapped to this memory level
  O_addr_cnt<nb_cnt, O_addr_type, O_WORDS_out> O_mac_pntr_cntInst;
  bool O_mac_all_at_max;
  bool O_mac_irrel_at_max;
  bool O_mac_irrel_at_maxBuf;
  bool O_mac_irrel_at_zero;

  O_addr_type O_mac_counter[nb_cnt];
  O_addr_type O_mac_tile_bound[nb_cnt];

  // pointers
  O_addr_type   O_mac_pntr;
  O_addr_type   O_vld_zg_pntr;
  bool          O_data_vld;
  bool          data_zg;

  // counter
  ac_int<ac::nbits<O_WORDS_in>::val+1, false>   O_irrel_cnt;

  // INPUT
  // memory level
  I_type        I_mem[I_N];

  // I/O
  packedData<I_type,I_WORDS_in> I_write_data;

  // mac pointer counter mapped to this memory level
  O_addr_cnt<nb_cnt, I_addr_type, I_WORDS_out> I_mac_pntr_cntInst;
  bool I_mac_all_at_max;
  bool I_mac_irrel_at_max;
  bool I_mac_irrel_at_maxBuf;
  bool I_mac_irrel_at_zero;

  I_addr_type I_mac_counter[nb_cnt];
  I_addr_type I_mac_tile_bound[nb_cnt];

  // pointers
  I_addr_type   I_mac_pntr;
  I_addr_type   I_wr_pntr;
  I_addr_type   I_vld_pntr;
  bool          I_data_vld;

  // counter
  I_addr_type   I_irrel_cnt;

  // WEIGHT
  // memory level
  W_type        W_mem[W_N];

  // I/O
  packedData<W_type,W_WORDS_in> W_write_data;

  // mac pointer counter mapped to this memory level
  O_addr_cnt<nb_cnt, W_addr_type, W_WORDS_out> W_mac_pntr_cntInst;
  bool W_mac_all_at_max;
  bool W_mac_irrel_at_max;
  bool W_mac_irrel_at_maxBuf;
  bool W_mac_irrel_at_zero;
  W_addr_type W_mac_counter[nb_cnt];
  W_addr_type W_mac_tile_bound[nb_cnt];

  // write pointer counter mapped to this memory level
  O_addr_cnt<nb_cnt, O_addr_type, O_WORDS_in> O_wr_pntr_cntInst;
  bool O_wr_all_at_max;
  bool O_wr_irrel_at_max;
  bool O_wr_irrel_at_zero;

  O_addr_type O_wr_counter[nb_cnt];
  O_addr_type O_wr_tile_bound[nb_cnt];

  // pointers
  W_addr_type   W_mac_pntr;
  W_addr_type   W_wr_pntr;
  W_addr_type   W_vld_pntr;
  bool          W_data_vld;

  // counter
  W_addr_type   W_irrel_cnt; // must be nbits W_words_in!

  // interconnections
  O_addr_type O_loop_bound[nb_cnt];
  O_addr_type O_tile_size[nb_cnt];
  I_addr_type I_loop_bound[nb_cnt];
  I_addr_type I_tile_size[nb_cnt];
  W_addr_type W_loop_bound[nb_cnt];
  W_addr_type W_tile_size[nb_cnt];

  // control
  bool setup;
  bool read_data_top_flag;

};


template<class type, int WORDS_in, int WORDS_out>
class BW_buffer_down
{
public:
    // constructor
    BW_buffer_down() : cnt(false), pntr(0), write_flag(0), read_flag(0), debug_cnt(0) {}
    
#pragma hls_design
#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(ac_channel<packedData<type,WORDS_in> > &data_in,
                        ac_channel<packedData<type,WORDS_out> > &data_out){

          if (cnt == false){
             cnt = data_in.nb_read(data_in_tmp);
             if (cnt){
#pragma hls_unroll yes
              for (int i=0; i<WORDS_in; i++){
                buf[i] = data_in_tmp.data[i];
              }
             }
        }
        if (cnt == true){

#pragma hls_unroll yes
          for (int i=0; i<WORDS_out; i++){
            data_out_tmp.data[i] = buf[pntr+i];
          }
          data_out.write(data_out_tmp);

          ac_int<ac::log2_ceil<WORDS_in>::val,false> pntr_max = WORDS_in-WORDS_out;
          ac_int<ac::log2_ceil<WORDS_in>::val,false> pntr_new = (pntr == pntr_max) ? (ac_int<ac::log2_ceil<WORDS_in>::val,false>) 0 : (ac_int<ac::log2_ceil<WORDS_in>::val,false>) (pntr+WORDS_out);
          cnt  = (pntr == pntr_max) ? false : cnt;
          pntr = pntr_new;
        }
    }

private: 
    //buffer
    type buf[WORDS_in]; // TO DO: write function to dynamically calculate max 
    
    // interconnections
    packedData<type,WORDS_in> data_in_tmp;
    packedData<type,WORDS_out> data_out_tmp;
    
    // control
    ac_int<ac::log2_ceil<WORDS_in>::val,false> pntr;
    bool cnt;
    
    bool write_flag;
    bool read_flag;

    int debug_cnt;
};

template<class type, int WORDS_in, int WORDS_out>
class BW_buffer_up
{
public:
    // constructor
    BW_buffer_up() : cnt(0), pntr(0), write_flag(0), read_flag(0), debug_cnt(0) {}
    
#pragma hls_design
#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(ac_channel<packedData<type,WORDS_in> > &data_in,
                        ac_channel<packedData<type,WORDS_out> > &data_out){
            
      if (data_in.available(1)){
        if (cnt != 1){
          data_in_tmp = data_in.read();

#pragma hls_unroll yes
          for (int i=0; i<WORDS_in; i++){
            buf[pntr+i] = data_in_tmp.data[i];
          }
          if (pntr == WORDS_out-WORDS_in){
            pntr = 0;
            cnt = 1;
          } else {
            pntr += WORDS_in;
          }


        } 
        if (cnt == 1){

#pragma hls_unroll yes
          for (int i=0; i<WORDS_out; i++){
            data_out_tmp.data[i] = buf[i];
          }
          data_out.write(data_out_tmp);
          cnt = 0;
        }
      }
    }

  private:
    // debug
    int debug_cnt;
    //buffer
    type buf[WORDS_out]; // TO DO: write function to dynamically calculate max 
    
    // interconnections
    packedData<type,WORDS_in> data_in_tmp;
    packedData<type,WORDS_out> data_out_tmp;
    
    // control
    ac_int<ac::log2_ceil<WORDS_out>::val,false> pntr;
    bool cnt;
    
    bool write_flag;
    bool read_flag;
};

template<int WORDS_in, int WORDS_out>
class BW_conv_zero_guard
{
public:
    // constructor
    BW_conv_zero_guard() : cnt(0) {}
    
#pragma hls_design
#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void CCS_BLOCK(run)(ac_channel<bool> &data_in,
                        ac_channel<bool> &data_out){
            
            if (cnt == 0){
              if (data_in.available(1)){
                data_in_tmp = data_in.read();
              }
            }
            
            data_out.write(data_in_tmp);
            cnt++;
            
            if (cnt == WORDS_in/WORDS_out) {
              cnt = 0;
            }             
        }

private: 
    //buffer
    bool data_in_tmp;
    
    // interconnections
    
    
    // control
    ac_int<ac::nbits<WORDS_in/WORDS_out>::val, false> cnt;

};

#endif
