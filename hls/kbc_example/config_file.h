#ifndef _INCLUDED_CONFIG_FILE_H_
#define _INCLUDED_CONFIG_FILE_H_

#include <stdint.h>


#include <ac_channel.h>
#include <ac_fixed.h>
#include <ac_int.h>



// DESIGN TIME CONFIGURATION
// Data precision of the different operands
const int precision_bit_W = 8;
const int precision_bit_I = 8;
const int precision_bit_O_partial = 16;
const int precision_bit_O_final = 16;


// 16 bit unsigned fixed point data type with decimal point 16 numbers to the left relative to the MSB
typedef ac_fixed<precision_bit_W ,8,false> W_type;
typedef ac_fixed<precision_bit_I ,8,false> I_type;
typedef ac_fixed<precision_bit_O_partial ,16,false> O_partial_type;
typedef ac_fixed<precision_bit_O_final ,16,false> O_final_type;


// Memory hierarchy
const int mem_size_bit_I_L1 = 512;
const int mem_size_bit_I_L2 = 27648;
const int mem_size_bit_I_L3 = 138240;
const int mem_size_bit_O_L1 = 512;
const int mem_size_bit_O_L2 = 27648;
const int mem_size_bit_O_L3 = 162000;
const int mem_size_bit_W_L1 = 512;
const int mem_size_bit_W_L2 = 27648;
const int mem_size_bit_W_L3 = 162000;

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
typedef ac_int<ac::log2_ceil<mem_size_word_I_L1>::val,false> I_addr_type_L1; 
typedef ac_int<ac::log2_ceil<mem_size_word_I_L2>::val,false> I_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_I_L3>::val,false> I_addr_type_L3;

typedef ac_int<ac::log2_ceil<mem_size_word_W_L1>::val,false> W_addr_type_L1;
typedef ac_int<ac::log2_ceil<mem_size_word_W_L2>::val,false> W_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_W_L3>::val,false> W_addr_type_L3;

typedef ac_int<ac::log2_ceil<mem_size_word_O_L1>::val,false> O_addr_type_L1;
typedef ac_int<ac::log2_ceil<mem_size_word_O_L2>::val,false> O_addr_type_L2;
typedef ac_int<ac::log2_ceil<mem_size_word_O_L3>::val,false> O_addr_type_L3; 

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

// Layer specification
const int OY0 = 1;
const int OX0 = 1;
const int FY0 = 1;
const int FX0 = 1;
const int B1  = 16;
const int C1  = 2;
const int K2  = 4;
const int K1  = 4;
const int C0  = 16;
const int B0  = 4;
const int K0  = 6;

//------------------------ SOFTWARE REFERENCE MODEL ------------------------//
// Layer specification
const int B   = 64;
const int K   = 96;
const int C   = 32;
const int OY  = 1;
const int OX  = 1;
const int IY  = 1;
const int IX  = 1;
const int FY  = 1;
const int FX  = 1;
const int SY  = 1;
const int SX  = 1;
const int SFY = 1;
const int SFX = 1;
const int G   = 1;

// Software precision
typedef uint16_t O_ref_type;
typedef uint8_t I_ref_type;
typedef uint8_t W_ref_type;

// min and max values of weight and input random values
const uint8_t inputMIN = 0;
const uint8_t inputMAX = 255;

const uint8_t weightMIN = 0;
const uint8_t weightMAX = 10;


#endif
