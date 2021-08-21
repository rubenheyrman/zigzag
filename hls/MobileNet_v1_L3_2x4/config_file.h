#ifndef _INCLUDED_CONFIG_FILE_H_
#define _INCLUDED_CONFIG_FILE_H_

#include <stdint.h>

#include <ac_channel.h>
#include <ac_fixed.h>
#include <ac_int.h>
#include <math.h>

// DESIGN TIME CONFIGURATION
// Data precision of the different operands
const int precision_bit_W = 8;
const int precision_bit_I = 8;
const int precision_bit_O_partial = 16;
const int precision_bit_O_final = 16;


// 16 bit unsigned fixed point data type with decimal point 16 numbers to the left relative to the MSB
typedef ac_fixed<precision_bit_W,precision_bit_W,false> W_type;
typedef ac_fixed<precision_bit_I,precision_bit_I,false> I_type;
typedef ac_fixed<precision_bit_O_partial,precision_bit_O_partial,false> O_partial_type;
typedef ac_fixed<precision_bit_O_final,precision_bit_O_final,false> O_final_type;

// PE Array size
const int nb_col = 2;
const int nb_row = 4;

// Memory hierarchy
const int mem_size_bit_I_L1 = 512;
const int mem_size_bit_I_L2 = 27648;
const int mem_size_bit_I_L3 = 165888;
const int mem_size_bit_O_L1 = 512;
const int mem_size_bit_O_L2 = 27648;
const int mem_size_bit_O_L3 = 165888;
const int mem_size_bit_W_L1 = 512;
const int mem_size_bit_W_L2 = 27648;
const int mem_size_bit_W_L3 = 165888;

const int mem_size_word_I_L1 = mem_size_bit_I_L1/precision_bit_I; // mem_size_bit/precision_bit
const int mem_size_word_I_L2 = mem_size_bit_I_L2/precision_bit_I; 
const int mem_size_word_I_L3 = mem_size_bit_I_L3/precision_bit_I;
const int mem_size_word_O_L1 = mem_size_bit_O_L1/precision_bit_O_partial;
const int mem_size_word_O_L2 = mem_size_bit_O_L2/precision_bit_O_partial;
const int mem_size_word_O_L3 = mem_size_bit_O_L3/precision_bit_O_partial;
const int mem_size_word_W_L1 = mem_size_bit_W_L1/precision_bit_W;
const int mem_size_word_W_L2 = mem_size_bit_W_L2/precision_bit_W;
const int mem_size_word_W_L3 = mem_size_bit_W_L3/precision_bit_W;

const int mem_wordlength_I_L1_in = 8;
const int mem_wordlength_I_L1_out = 8;
const int mem_wordlength_I_L2_in = 128;
const int mem_wordlength_I_L2_out = 128;
const int mem_wordlength_I_L3_in = 128; 
const int mem_wordlength_I_L3_out = 128; 
const int mem_wordlength_O_L1_in = 16;
const int mem_wordlength_O_L1_out = 16;
const int mem_wordlength_O_L2_in = 128;
const int mem_wordlength_O_L2_out = 128;
const int mem_wordlength_O_L3_in = 128; 
const int mem_wordlength_O_L3_out = 128; 
const int mem_wordlength_W_L1_in = 8;
const int mem_wordlength_W_L1_out = 8;
const int mem_wordlength_W_L2_in = 128;
const int mem_wordlength_W_L2_out = 128;
const int mem_wordlength_W_L3_in = 128; 
const int mem_wordlength_W_L3_out = 128; 

const int mem_words_MAC_in = 1;
const int mem_words_MAC_out =1;
const int mem_words_I_L1_in = mem_wordlength_I_L1_in/precision_bit_I;
const int mem_words_I_L1_out = mem_wordlength_I_L1_out/precision_bit_I;
const int mem_words_I_L2_in = mem_wordlength_I_L2_in/precision_bit_I;
const int mem_words_I_L2_out =  mem_wordlength_I_L2_out/precision_bit_I;
const int mem_words_I_L3_in =  mem_wordlength_I_L3_in/precision_bit_I;
const int mem_words_I_L3_out =  mem_wordlength_I_L3_out/precision_bit_I;
const int mem_words_O_L1_in = mem_wordlength_O_L1_in/precision_bit_O_partial;
const int mem_words_O_L1_out = mem_wordlength_O_L1_out/precision_bit_O_partial;
const int mem_words_O_L2_in =  mem_wordlength_O_L2_in/precision_bit_O_partial;
const int mem_words_O_L2_out =  mem_wordlength_O_L2_out/precision_bit_O_partial;
const int mem_words_O_L3_in =  mem_wordlength_O_L3_in/precision_bit_O_partial;
const int mem_words_O_L3_out =  mem_wordlength_O_L3_out/precision_bit_O_partial;
const int mem_words_W_L1_in = mem_wordlength_W_L1_in/precision_bit_W;
const int mem_words_W_L1_out = mem_wordlength_W_L1_out/precision_bit_W;
const int mem_words_W_L2_in =  mem_wordlength_W_L2_in/precision_bit_W;
const int mem_words_W_L2_out =  mem_wordlength_W_L2_out/precision_bit_W;
const int mem_words_W_L3_in =  mem_wordlength_W_L3_in/precision_bit_W;
const int mem_words_W_L3_out =  mem_wordlength_W_L3_out/precision_bit_W;

const int nb_cnt = 5;
const int nb_counters_O_L1 = 5;
const int nb_counters_I_L1 = 5;
const int nb_counters_W_L1 = 5;
const int nb_counters_O_L2 = 5;
const int nb_counters_I_L2 = 5;
const int nb_counters_W_L2 = 5;
const int nb_counters_O_L3 = 5;
const int nb_counters_I_L3 = 5;
const int nb_counters_W_L3 = 5;


// Precision for memory address pointers, control and program signals 
typedef ac_int<ac::log2_ceil<mem_size_word_I_L1+1>::val,false> I_addr_type_L1;
typedef ac_int<ac::log2_ceil<mem_size_word_I_L2+1>::val,false> I_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_I_L3+1>::val,false> I_addr_type_L3;
typedef int I_addr_type_L4; // Currently not used!

typedef ac_int<ac::log2_ceil<mem_size_word_W_L1+1>::val,false> W_addr_type_L1;
typedef ac_int<ac::log2_ceil<mem_size_word_W_L2+1>::val,false> W_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_W_L3+1>::val,false> W_addr_type_L3;
typedef int W_addr_type_L4;

typedef ac_int<ac::log2_ceil<mem_size_word_O_L1+1>::val,false> O_addr_type_L1;
typedef ac_int<ac::log2_ceil<mem_size_word_O_L2+1>::val,false> O_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_O_L3+1>::val,false> O_addr_type_L3;
typedef int O_addr_type_L4;

// N-wide packed data
template<class type, int N>
struct packedData {
type data[N];
};

// To transfer top level instruction
template<class type, int N>
struct loopData {
type bound[N];
bool relevancy[N];
}; 

// To transfer memory level instructions
template<class type, int N>
struct memlevelInstr {
type bound[N];
type tile[N];
};

template<class O_addr_type_L3, class O_addr_type_L2, class O_addr_type_L1,
class I_addr_type_L3, class I_addr_type_L2, class I_addr_type_L1,
class W_addr_type_L3, class W_addr_type_L2, class W_addr_type_L1,
int N>
struct loopinstrData {
loopData<O_addr_type_L3, N> O_loopData_L3;
loopData<O_addr_type_L2, N> O_loopData_L2;
loopData<O_addr_type_L1, N> O_loopData_L1;

loopData<I_addr_type_L3, N> I_loopData_L3;
loopData<I_addr_type_L2, N> I_loopData_L2;
loopData<I_addr_type_L1, N> I_loopData_L1;

loopData<W_addr_type_L3, N> W_loopData_L3;
loopData<W_addr_type_L2, N> W_loopData_L2;
loopData<W_addr_type_L1, N> W_loopData_L1;
};

//------------------------ SOFTWARE REFERENCE MODEL ------------------------//
// Software precision
typedef int O_ref_type;
typedef int I_ref_type;
typedef int W_ref_type;

// min and max values of weight and input random values
const int inputMIN = 0;
const int inputMAX = 255; // pow(2.0, (double) precision_bit_I)-1;

const int weightMIN = 0;
const int weightMAX = 5;

// variables for high level memory access count calculation
static O_addr_type_L3 O_L3_tile_small;
static O_addr_type_L3 O_L3_tile_big;
static O_addr_type_L2 O_L2_tile_small;
static O_addr_type_L2 O_L2_tile_big;
static I_addr_type_L3 I_L3_tile_small;
static I_addr_type_L3 I_L3_tile_big;
static I_addr_type_L2 I_L2_tile_small;
static I_addr_type_L2 I_L2_tile_big;
static W_addr_type_L3 W_L3_tile_small;
static W_addr_type_L3 W_L3_tile_big;
static W_addr_type_L2 W_L2_tile_small;
static W_addr_type_L2 W_L2_tile_big;
static int O_L3_top_wr_cnt = 0;  static int O_L3_bot_wr_cnt = 0;
static int O_L3_top_rd_cnt = 0;  static int O_L3_bot_rd_cnt = 0;
static int O_L2_top_wr_cnt = 0;  static int O_L2_bot_wr_cnt = 0;
static int O_L2_top_rd_cnt = 0;  static int O_L2_bot_rd_cnt = 0;
static int O_L1_top_wr_cnt = 0;  static int O_L1_bot_wr_cnt = 0;
static int O_L1_top_rd_cnt = 0;  static int O_L1_bot_rd_cnt = 0;
static int I_L3_wr_cnt = 0;
static int I_L3_rd_cnt = 0;
static int I_L2_wr_cnt = 0;
static int I_L2_rd_cnt = 0;
static int I_L1_wr_cnt = 0;
static int I_L1_rd_cnt = 0;
static int W_L3_wr_cnt = 0;
static int W_L3_rd_cnt = 0;
static int W_L2_wr_cnt = 0;
static int W_L2_rd_cnt = 0;
static int W_L1_wr_cnt = 0;
static int W_L1_rd_cnt = 0;

#endif
