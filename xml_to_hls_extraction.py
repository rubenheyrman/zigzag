import os
import sys
import xml.etree.cElementTree as ET
import ast
from PyQt5 import QtCore
Qt = QtCore.Qt

def xml_info_extraction(input_file):
    file_path_and_name = input_file
    if os.path.isfile(file_path_and_name):
        layer_spec_collect =[]
        precision_collect = []
        array_size_collect = []
        mem_size_collect = []
        mem_bw_collect = []
        spatial_unrolling_collect = []
        temporal_mapping_collect = []
        tree = ET.parse(file_path_and_name)
        root = tree.getroot()
        for sim in root:
            layer_spec = ast.literal_eval(sim.find("layer/layer_spec").tail)
            precision = ast.literal_eval(sim.find("hw_spec/PE_array/precision_bit").tail)
            array_size = ast.literal_eval(sim.find("hw_spec/PE_array/array_size").tail)
            mem_size = ast.literal_eval(sim.find("hw_spec/memory_hierarchy/mem_size_bit").tail)
            mem_bw = ast.literal_eval(sim.find("hw_spec/memory_hierarchy/mem_bw_bit_per_cycle_or_mem_wordlength").tail)
            spatial_unrolling_W = ast.literal_eval(sim.find("results/basic_info/spatial_unrolling/W").tail)
            spatial_unrolling_I = ast.literal_eval(sim.find("results/basic_info/spatial_unrolling/I").tail)
            spatial_unrolling_O = ast.literal_eval(sim.find("results/basic_info/spatial_unrolling/O").tail)
            temporal_mapping_W = ast.literal_eval(sim.find("results/basic_info/temporal_mapping/W").tail)
            temporal_mapping_I = ast.literal_eval(sim.find("results/basic_info/temporal_mapping/I").tail)
            temporal_mapping_O = ast.literal_eval(sim.find("results/basic_info/temporal_mapping/O").tail)
            layer_spec_collect.append(layer_spec)
            precision_collect.append(precision)
            array_size_collect.append(array_size)
            mem_size_collect.append(mem_size)
            mem_bw_collect.append(mem_bw)
            spatial_unrolling_collect.append([spatial_unrolling_W, spatial_unrolling_I, spatial_unrolling_O])
            temporal_mapping_collect.extend([temporal_mapping_W, temporal_mapping_I, temporal_mapping_O])
            break
    return layer_spec_collect, precision_collect, array_size_collect, mem_size_collect, mem_bw_collect, spatial_unrolling_collect, temporal_mapping_collect

def make_config_file(precision_bit, array_size, mem_size, mem_bw, nb_cnt):
    newline = "\n"
    config_string = (
                     f"#ifndef _INCLUDED_CONFIG_FILE_H_{newline}"
                     f"#define _INCLUDED_CONFIG_FILE_H_{newline}"
                     f"{newline}"
                     f"#include <stdint.h>{newline}"
                     f"{newline}"
                     f"#include <ac_channel.h>{newline}"
                     f"#include <ac_fixed.h>{newline}"
                     f"#include <ac_int.h>{newline}"
                     f"{newline}"
                     f"// DESIGN TIME CONFIGURATION{newline}"
                     f"// Data precision of the different operands{newline}"
                     f"const int precision_bit_W = {precision_bit['W']};{newline}"
                     f"const int precision_bit_I = {precision_bit['I']};{newline}"
                     f"const int precision_bit_O_partial = {precision_bit['O_partial']};{newline}"
                     f"const int precision_bit_O_final = {precision_bit['O_final']};{newline}"
                     f"{newline}"
                     f"{newline}"
                     f"// 16 bit unsigned fixed point data type with decimal point 16 numbers to the left relative to the MSB{newline}"
                     f"typedef ac_fixed<precision_bit_W,precision_bit_W,false> W_type;{newline}"
                     f"typedef ac_fixed<precision_bit_I,precision_bit_I,false> I_type;{newline}"
                     f"typedef ac_fixed<precision_bit_O_partial,precision_bit_O_partial,false> O_partial_type;{newline}"
                     f"typedef ac_fixed<precision_bit_O_final,precision_bit_O_final,false> O_final_type;{newline}"
                     f"{newline}"
                     f"// PE Array size{newline}"
                     f"const int nb_col = {array_size['Col']};{newline}"
                     f"const int nb_row = {array_size['Row']};{newline}"
                     f"{newline}"
                     f"// Memory hierarchy{newline}"
                     f"const int mem_size_bit_I_L1 = {mem_size['I'][0]};{newline}"
                     f"const int mem_size_bit_I_L2 = {mem_size['I'][1]};{newline}"
                     f"const int mem_size_bit_I_L3 = {mem_size['I'][2]};{newline}"
                     f"const int mem_size_bit_O_L1 = {mem_size['O'][0]};{newline}"
                     f"const int mem_size_bit_O_L2 = {mem_size['O'][1]};{newline}"
                     f"const int mem_size_bit_O_L3 = {mem_size['O'][2]};{newline}"
                     f"const int mem_size_bit_W_L1 = {mem_size['W'][0]};{newline}"
                     f"const int mem_size_bit_W_L2 = {mem_size['W'][1]};{newline}"
                     f"const int mem_size_bit_W_L3 = {mem_size['W'][2]};{newline}"
                     f"{newline}"
                     f"const int mem_size_word_I_L1 = mem_size_bit_I_L1/precision_bit_I; // mem_size_bit/precision_bit{newline}"
                     f"const int mem_size_word_I_L2 = mem_size_bit_I_L2/precision_bit_I; {newline}"
                     f"const int mem_size_word_I_L3 = mem_size_bit_I_L3/precision_bit_I;{newline}"
                     f"const int mem_size_word_O_L1 = mem_size_bit_O_L1/precision_bit_O_partial;{newline}"
                     f"const int mem_size_word_O_L2 = mem_size_bit_O_L2/precision_bit_O_partial;{newline}"
                     f"const int mem_size_word_O_L3 = mem_size_bit_O_L3/precision_bit_O_partial;{newline}"
                     f"const int mem_size_word_W_L1 = mem_size_bit_W_L1/precision_bit_W;{newline}"
                     f"const int mem_size_word_W_L2 = mem_size_bit_W_L2/precision_bit_W;{newline}"
                     f"const int mem_size_word_W_L3 = mem_size_bit_W_L3/precision_bit_W;{newline}"
                     f"{newline}"
                     f"const int mem_wordlength_I_L1_in = {mem_bw['I'][0][0]};{newline}"
                     f"const int mem_wordlength_I_L1_out = {mem_bw['I'][0][1]};{newline}"
                     f"const int mem_wordlength_I_L2_in = {mem_bw['I'][1][0]};{newline}"
                     f"const int mem_wordlength_I_L2_out = {mem_bw['I'][1][1]};{newline}"
                     f"const int mem_wordlength_I_L3_in = {mem_bw['I'][2][0]}; {newline}"
                     f"const int mem_wordlength_I_L3_out = {mem_bw['I'][2][1]}; {newline}"
                     f"const int mem_wordlength_O_L1_in = {mem_bw['O'][0][0]};{newline}"
                     f"const int mem_wordlength_O_L1_out = {mem_bw['O'][0][1]};{newline}"
                     f"const int mem_wordlength_O_L2_in = {mem_bw['O'][1][0]};{newline}"
                     f"const int mem_wordlength_O_L2_out = {mem_bw['O'][1][1]};{newline}"
                     f"const int mem_wordlength_O_L3_in = {mem_bw['O'][2][0]}; {newline}"
                     f"const int mem_wordlength_O_L3_out = {mem_bw['O'][2][1]}; {newline}"
                     f"const int mem_wordlength_W_L1_in = {mem_bw['W'][0][0]};{newline}"
                     f"const int mem_wordlength_W_L1_out = {mem_bw['W'][0][1]};{newline}"
                     f"const int mem_wordlength_W_L2_in = {mem_bw['W'][1][0]};{newline}"
                     f"const int mem_wordlength_W_L2_out = {mem_bw['W'][1][1]};{newline}"
                     f"const int mem_wordlength_W_L3_in = {mem_bw['W'][2][0]}; {newline}"
                     f"const int mem_wordlength_W_L3_out = {mem_bw['W'][2][1]}; {newline}"
                     f"{newline}"
                     f"const int mem_words_MAC_in = 1;{newline}"
                     f"const int mem_words_MAC_out =1;{newline}"
                     f"const int mem_words_I_L1_in = mem_wordlength_I_L1_in/precision_bit_I;{newline}"
                     f"const int mem_words_I_L1_out = mem_wordlength_I_L1_out/precision_bit_I;{newline}"
                     f"const int mem_words_I_L2_in = mem_wordlength_I_L2_in/precision_bit_I;{newline}"
                     f"const int mem_words_I_L2_out =  mem_wordlength_I_L2_out/precision_bit_I;{newline}"
                     f"const int mem_words_I_L3_in =  mem_wordlength_I_L3_in/precision_bit_I;{newline}"
                     f"const int mem_words_I_L3_out =  mem_wordlength_I_L3_out/precision_bit_I;{newline}"
                     f"const int mem_words_O_L1_in = mem_wordlength_O_L1_in/precision_bit_O_partial;{newline}"
                     f"const int mem_words_O_L1_out = mem_wordlength_O_L1_out/precision_bit_O_partial;{newline}"
                     f"const int mem_words_O_L2_in =  mem_wordlength_O_L2_in/precision_bit_O_partial;{newline}"
                     f"const int mem_words_O_L2_out =  mem_wordlength_O_L2_out/precision_bit_O_partial;{newline}"
                     f"const int mem_words_O_L3_in =  mem_wordlength_O_L3_in/precision_bit_O_partial;{newline}"
                     f"const int mem_words_O_L3_out =  mem_wordlength_O_L3_out/precision_bit_O_partial;{newline}"
                     f"const int mem_words_W_L1_in = mem_wordlength_W_L1_in/precision_bit_W;{newline}"
                     f"const int mem_words_W_L1_out = mem_wordlength_W_L1_out/precision_bit_W;{newline}"
                     f"const int mem_words_W_L2_in =  mem_wordlength_W_L2_in/precision_bit_W;{newline}"
                     f"const int mem_words_W_L2_out =  mem_wordlength_W_L2_out/precision_bit_W;{newline}"
                     f"const int mem_words_W_L3_in =  mem_wordlength_W_L3_in/precision_bit_W;{newline}"
                     f"const int mem_words_W_L3_out =  mem_wordlength_W_L3_out/precision_bit_W;{newline}"
                     f"{newline}"
                     f"const int nb_cnt = {nb_cnt};{newline}"
                     f"const int nb_counters_O_L1 = {nb_cnt};{newline}"
                     f"const int nb_counters_I_L1 = {nb_cnt};{newline}"
                     f"const int nb_counters_W_L1 = {nb_cnt};{newline}"
                     f"const int nb_counters_O_L2 = {nb_cnt};{newline}"
                     f"const int nb_counters_I_L2 = {nb_cnt};{newline}"
                     f"const int nb_counters_W_L2 = {nb_cnt};{newline}"
                     f"const int nb_counters_O_L3 = {nb_cnt};{newline}"
                     f"const int nb_counters_I_L3 = {nb_cnt};{newline}"
                     f"const int nb_counters_W_L3 = {nb_cnt};{newline}"
                     f"{newline}"
                     f"{newline}"
                     f"// Precision for memory address pointers, control and program signals {newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_I_L1+1>::val,false> I_addr_type_L1;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_I_L2+1>::val,false> I_addr_type_L2;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_I_L3+1>::val,false> I_addr_type_L3;{newline}"
                     f"typedef int I_addr_type_L4; // Currently not used!{newline}"
                     f"{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_W_L1+1>::val,false> W_addr_type_L1;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_W_L2+1>::val,false> W_addr_type_L2;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_W_L3+1>::val,false> W_addr_type_L3;{newline}"
                     f"typedef int W_addr_type_L4;{newline}"
                     f"{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_O_L1+1>::val,false> O_addr_type_L1;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_O_L2+1>::val,false> O_addr_type_L2;{newline}"
                     f"typedef ac_int<ac::log2_ceil<mem_size_word_O_L3+1>::val,false> O_addr_type_L3;{newline}"
                     f"typedef int O_addr_type_L4;{newline}"
                     f"{newline}"
                     f"// N-wide packed data{newline}"
                     f"template<class type, int N>{newline}"
                     f"struct packedData {{{newline}"
                     f"type data[N];{newline}"
                     f"}};{newline}"
                     f"{newline}"
                     f"// To transfer top level instruction{newline}"
                     f"template<class type, int N>{newline}"
                     f"struct loopData {{{newline}"
                     f"type bound[N];{newline}"
                     f"bool relevancy[N];{newline}"
                     f"}}; {newline}"
                     f"{newline}"
                     f"// To transfer memory level instructions{newline}"
                     f"template<class type, int N>{newline}"
                     f"struct memlevelInstr {{{newline}"
                     f"type bound[N];{newline}"
                     f"type tile[N];{newline}"
                     f"}};{newline}"
                     f"{newline}"
                     f"template<class O_addr_type_L3, class O_addr_type_L2, class O_addr_type_L1,{newline}"
                     f"class I_addr_type_L3, class I_addr_type_L2, class I_addr_type_L1,{newline}"
                     f"class W_addr_type_L3, class W_addr_type_L2, class W_addr_type_L1,{newline}"
                     f"int N>{newline}"
                     f"struct loopinstrData {{{newline}"
                     f"loopData<O_addr_type_L3, N> O_loopData_L3;{newline}"
                     f"loopData<O_addr_type_L2, N> O_loopData_L2;{newline}"
                     f"loopData<O_addr_type_L1, N> O_loopData_L1;{newline}"
                     f"{newline}"
                     f"loopData<I_addr_type_L3, N> I_loopData_L3;{newline}"
                     f"loopData<I_addr_type_L2, N> I_loopData_L2;{newline}"
                     f"loopData<I_addr_type_L1, N> I_loopData_L1;{newline}"
                     f"{newline}"
                     f"loopData<W_addr_type_L3, N> W_loopData_L3;{newline}"
                     f"loopData<W_addr_type_L2, N> W_loopData_L2;{newline}"
                     f"loopData<W_addr_type_L1, N> W_loopData_L1;{newline}"
                     f"}};{newline}"
                     f"{newline}"
                     f"//------------------------ SOFTWARE REFERENCE MODEL ------------------------//{newline}"
                     f"// Software precision{newline}"
                     f"typedef int O_ref_type;{newline}"
                     f"typedef int I_ref_type;{newline}"
                     f"typedef int W_ref_type;{newline}"
                     f"{newline}"
                     f"// min and max values of weight and input random values{newline}"
                     f"const int inputMIN = 0;{newline}"
                     f"const int inputMAX = 255;{newline}"
                     f"{newline}"
                     f"const int weightMIN = 0;{newline}"
                     f"const int weightMAX = 4;{newline}"
                     f"{newline}"
                     f"// variables for high level memory access count calculation{newline}"
                     f"static O_addr_type_L3 O_L3_tile_small;{newline}"
                     f"static O_addr_type_L3 O_L3_tile_big;{newline}"
                     f"static O_addr_type_L2 O_L2_tile_small;{newline}"
                     f"static O_addr_type_L2 O_L2_tile_big;{newline}"
                     f"static I_addr_type_L3 I_L3_tile_small;{newline}"
                     f"static I_addr_type_L3 I_L3_tile_big;{newline}"
                     f"static I_addr_type_L2 I_L2_tile_small;{newline}"
                     f"static I_addr_type_L2 I_L2_tile_big;{newline}"
                     f"static W_addr_type_L3 W_L3_tile_small;{newline}"
                     f"static W_addr_type_L3 W_L3_tile_big;{newline}"
                     f"static W_addr_type_L2 W_L2_tile_small;{newline}"
                     f"static W_addr_type_L2 W_L2_tile_big;{newline}"
                     f"static int O_L3_top_wr_cnt = 0;  static int O_L3_bot_wr_cnt = 0;{newline}"
                     f"static int O_L3_top_rd_cnt = 0;  static int O_L3_bot_rd_cnt = 0;{newline}"
                     f"static int O_L2_top_wr_cnt = 0;  static int O_L2_bot_wr_cnt = 0;{newline}"
                     f"static int O_L2_top_rd_cnt = 0;  static int O_L2_bot_rd_cnt = 0;{newline}"
                     f"static int O_L1_top_wr_cnt = 0;  static int O_L1_bot_wr_cnt = 0;{newline}"
                     f"static int O_L1_top_rd_cnt = 0;  static int O_L1_bot_rd_cnt = 0;{newline}"
                     f"static int I_L3_wr_cnt = 0;{newline}"
                     f"static int I_L3_rd_cnt = 0;{newline}"
                     f"static int I_L2_wr_cnt = 0;{newline}"
                     f"static int I_L2_rd_cnt = 0;{newline}"
                     f"static int I_L1_wr_cnt = 0;{newline}"
                     f"static int I_L1_rd_cnt = 0;{newline}"
                     f"static int W_L3_wr_cnt = 0;{newline}"
                     f"static int W_L3_rd_cnt = 0;{newline}"
                     f"static int W_L2_wr_cnt = 0;{newline}"
                     f"static int W_L2_rd_cnt = 0;{newline}"
                     f"static int W_L1_wr_cnt = 0;{newline}"
                     f"static int W_L1_rd_cnt = 0;{newline}"
                     f"{newline}"
                     f"#endif{newline}"

    )
    return config_string

def make_tb(layer_spec, spatial_unrolling, temporal_mapping, nb_cnt):


    dimensions = {'W': ["K", "C", "FX", "FY"], 'I': ["B", "C", "OX", "OY", "FX", "FY"], 'O': ["B", "K", "OX", "OY"]}
    operands = ["W", "I", "O"]

    mapping_string = ""

    mapping_string += "enum {\n"
    for key in layer_spec:
        mapping_string += key + " = " + str(layer_spec[key]) + ",\n"
    mapping_string = mapping_string[:-2] + "\n"
    mapping_string += "};\n"

    layer_iterations = []
    layer_dimensions = []
    nb_spatial_loops = 0
    for mem_level in spatial_unrolling[0][0]:
        for dimension in mem_level:
            for mapping in dimension:
                layer_dimensions.append(mapping[0])
                layer_iterations.append(mapping[1])
                nb_spatial_loops += 1
    for mem_level in temporal_mapping[0]:
        for mapping in mem_level:
            layer_dimensions.append(mapping[0])
            layer_iterations.append(mapping[1])

    mapping_string += "\n" + "list<int>    layer_iterations  {" + ", ".join( repr(e) for e in layer_iterations ) + "};\n" + \
    "list<string> layer_dimensions  {" +  ", ".join( repr(e) for e in layer_dimensions ).replace("\'", "\"") + "};\n\n"

    for operand in range(len(temporal_mapping)):
        mapped_to_dram = [0]*nb_spatial_loops
        for mem_level in range(len(temporal_mapping[operand])):
            loops     = [1]*nb_cnt
            relevancy = [1]*nb_cnt
            for mapping in range(len(temporal_mapping[operand][mem_level])):
                relevant = False
                for rel in range(len(dimensions[operands[operand]])):
                    if temporal_mapping[operand][mem_level][mapping][0] == dimensions[operands[operand]][rel]:
                        relevant = True
                if relevant == False:
                    relevancy[mapping] = 0
                if mem_level == len(temporal_mapping[operand])-1:
                    mapped_to_dram.append(1)
                else:
                    mapped_to_dram.append(0)
                loops[mapping] = temporal_mapping[operand][mem_level][mapping][1]

            mapping_string += operands[operand] + "_addr_type_L" + str(mem_level+1) + " " + operands[operand] + "_loop_bound_L" + str(mem_level+1) + "[nb_cnt] = {" + ", ".join( repr(e) for e in loops ) + "};\n" + \
                "bool " + operands[operand] + "_loop_relevancy_L" + str(mem_level+1) + "[nb_cnt]       = {" + ", ".join( repr(e) for e in relevancy ) + "};\n"
        mapping_string += "list<bool> " + operands[operand] + "_mapped_to_DRAM = {"  + ", ".join( repr(e) for e in mapped_to_dram) + "};\n\n"

    newline = "\n"
    header_string = \
        """
#include "config_file.h"
#include "top.h"
#include "../DNNlayerSW.h"
#include "../list_coordinates.h"
#include <mc_scverify.h>

#include <stdio.h>
#include <stdlib.h>


using namespace std;

#include <fstream>
#include <iostream>
#include <cstdlib>
#include <random>
#include <list>

CCS_MAIN(int argv, char **argc)
{
  cout << "Initilialization" << endl;
"""

    testing_string = \
    """

  list<string> output_dimensions {"B", "K", "OY", "OX"};
  list<string> input_dimensions  {"B", "C", "OY", "OX", "FY", "FX"};
  list<string> weight_dimensions {"K" , "C", "FY", "FX"};
  list<string> output_irrel_dimensions {"C", "FY", "FX"};

  loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1,
                I_addr_type_L3, I_addr_type_L2, I_addr_type_L1,
                W_addr_type_L3, W_addr_type_L2, W_addr_type_L1,
                nb_cnt> loopinstr;

  loopData<O_addr_type_L1, nb_cnt> O_loops_L1;
  loopData<O_addr_type_L2, nb_cnt> O_loops_L2;
  loopData<O_addr_type_L3, nb_cnt> O_loops_L3;

  loopData<I_addr_type_L1, nb_cnt> I_loops_L1;
  loopData<I_addr_type_L2, nb_cnt> I_loops_L2;
  loopData<I_addr_type_L3, nb_cnt> I_loops_L3;

  loopData<W_addr_type_L1, nb_cnt> W_loops_L1;
  loopData<W_addr_type_L2, nb_cnt> W_loops_L2;
  loopData<W_addr_type_L3, nb_cnt> W_loops_L3;

  for (int i=0; i<nb_cnt; i++){
    O_loops_L1.bound[i]     = O_loop_bound_L1[i];
    O_loops_L1.relevancy[i] = O_loop_relevancy_L1[i];
    O_loops_L2.bound[i]     = O_loop_bound_L2[i];
    O_loops_L2.relevancy[i] = O_loop_relevancy_L2[i];
    O_loops_L3.bound[i]     = O_loop_bound_L3[i];
    O_loops_L3.relevancy[i] = O_loop_relevancy_L3[i];

    I_loops_L1.bound[i]     = I_loop_bound_L1[i];
    I_loops_L1.relevancy[i] = I_loop_relevancy_L1[i];
    I_loops_L2.bound[i]     = I_loop_bound_L2[i];
    I_loops_L2.relevancy[i] = I_loop_relevancy_L2[i];
    I_loops_L3.bound[i]     = I_loop_bound_L3[i];
    I_loops_L3.relevancy[i] = I_loop_relevancy_L3[i];

    W_loops_L1.bound[i]     = W_loop_bound_L1[i];
    W_loops_L1.relevancy[i] = W_loop_relevancy_L1[i];
    W_loops_L2.bound[i]     = W_loop_bound_L2[i];
    W_loops_L2.relevancy[i] = W_loop_relevancy_L2[i];
    W_loops_L3.bound[i]     = W_loop_bound_L3[i];
    W_loops_L3.relevancy[i] = W_loop_relevancy_L3[i];
  }

  loopinstr.O_loopData_L1 = O_loops_L1;
  loopinstr.O_loopData_L2 = O_loops_L2;
  loopinstr.O_loopData_L3 = O_loops_L3;

  loopinstr.I_loopData_L1 = I_loops_L1;
  loopinstr.I_loopData_L2 = I_loops_L2;
  loopinstr.I_loopData_L3 = I_loops_L3;

  loopinstr.W_loopData_L1 = W_loops_L1;
  loopinstr.W_loopData_L2 = W_loops_L2;
  loopinstr.W_loopData_L3 = W_loops_L3;

  ac_channel<loopinstrData<O_addr_type_L3, O_addr_type_L2, O_addr_type_L1,
                           I_addr_type_L3, I_addr_type_L2, I_addr_type_L1,
                           W_addr_type_L3, W_addr_type_L2, W_addr_type_L1,
                           nb_cnt> > layer_instruction_in;

  O_ref_type ****output_array_sw = new O_ref_type***[B]; // output array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<B; i++) {
    output_array_sw[i] = new O_ref_type**[K];
    for (int j=0; j<K; j++) {
      output_array_sw[i][j] = new O_ref_type*[OY];
      for (int k=0; k<OY; k++) {
        output_array_sw[i][j][k] = new O_ref_type[OX];
        for (int l=0; l<OX; l++){
          output_array_sw[i][j][k][l] = (O_ref_type) 0;
        }
      }
    }
  }

  O_final_type ****output_array_hw = new O_final_type***[B]; // output array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<B; i++) {
    output_array_hw[i] = new O_final_type**[K];
    for (int j=0; j<K; j++) {
      output_array_hw[i][j] = new O_final_type*[OY];
      for (int k=0; k<OY; k++) {
        output_array_hw[i][j][k] = new O_final_type[OX];
        for (int l=0; l<OX; l++){
          output_array_hw[i][j][k][l] = 0;
        }
      }
    }
  }

  I_ref_type ****input_array = new I_ref_type***[B]; // input array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<B; i++){
    input_array[i] = new I_ref_type**[C];
    for (int j=0; j<C; j++) {
      input_array[i][j] = new I_ref_type*[IY];
      for (int k=0; k<IY; k++) {
        input_array[i][j][k] = new I_ref_type[IX];
        for (int l=0; l<IX; l++){
          std::random_device rd;
          std::default_random_engine eng(rd());
          std::uniform_real_distribution<double> distr(inputMIN, inputMAX);
          input_array[i][j][k][l] = (I_ref_type) distr(eng);
        }
      }
    }
  }

  W_ref_type ****weight_array = new W_ref_type***[K]; // weight array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<K; i++) {
    weight_array[i] = new W_ref_type**[C];
    for (int j=0; j<C; j++) {
      weight_array[i][j] = new W_ref_type*[FY];
      for (int k=0; k<FY; k++) {
        weight_array[i][j][k] = new W_ref_type[FX];
        for (int l=0; l<FX; l++){
          std::random_device rd;
          std::default_random_engine eng(rd());
          std::uniform_real_distribution<double> distr(weightMIN, weightMAX);
          weight_array[i][j][k][l] = (W_ref_type) distr(eng);
        }
      }
    }
  }

  DNNlayer<B, K, C, OY, OX, IY, IX, FY, FX, SY, SX, SFY, SFX, O_ref_type, I_ref_type, W_ref_type> SWinst;

  top<nb_counters_W_L1, nb_col, nb_row,
              mem_size_word_O_L1, mem_words_O_L1_in, mem_words_O_L1_out, O_addr_type_L1,
              mem_size_word_I_L1, mem_words_I_L1_in, mem_words_I_L1_out, I_addr_type_L1,
              mem_size_word_W_L1, mem_words_W_L1_in, mem_words_W_L1_out, W_addr_type_L1,
              nb_counters_W_L2,
              mem_size_word_O_L2, mem_words_O_L2_in, mem_words_O_L2_out, O_addr_type_L2,
              mem_size_word_I_L2, mem_words_I_L2_in, mem_words_I_L2_out, I_addr_type_L2,
              mem_size_word_W_L2, mem_words_W_L2_in, mem_words_W_L2_out, W_addr_type_L2,
              nb_counters_W_L3,
              mem_size_word_O_L3, mem_words_O_L3_in, mem_words_O_L3_out, O_addr_type_L3,
              mem_size_word_I_L3, mem_words_I_L3_in, mem_words_I_L3_out, I_addr_type_L3,
              mem_size_word_W_L3, mem_words_W_L3_in, mem_words_W_L3_out, W_addr_type_L3,
              O_partial_type, I_type, W_type> HWinst;
  packedData<W_type,mem_words_W_L3_in> W_data_in;
  packedData<I_type,mem_words_I_L3_in> I_data_in;
  packedData<O_final_type,mem_words_O_L3_in> O_data_in;
  packedData<O_final_type,mem_words_O_L3_out> O_data_out;
  bool zero_guard = true;

  ac_channel<packedData<W_type,mem_words_W_L3_in> > W_wr_data;
  ac_channel<packedData<I_type,mem_words_I_L3_in> > I_wr_data;
  ac_channel<packedData<O_final_type,mem_words_O_L3_in> > O_wr_data;
  ac_channel<packedData<O_final_type,mem_words_O_L3_out> > O_rd_data;
  ac_channel<bool> wr_zero_guard;

  cout << "Initilialization done" << endl << endl;

  // ------------------------ Software Reference Model -------------------------
  cout << "Start Sofware Reference Model" << endl;

  SWinst.run(output_array_sw, input_array, weight_array);

  cout << "Finished Sofware Reference Model" << endl << endl;
  // ------------------------ Software Reference Model -------------------------

  // ------------------------ Hardware DUT -------------------------
  cout << "Loading channels DUT" << endl;

  // instruction (configuration) channel
  layer_instruction_in.write(loopinstr);

  list<int> start_coordinate{0,0,0,0,0,0};
  list<list<int>> input_coordinates;
  list_coordinates(layer_iterations, layer_dimensions, I_mapped_to_DRAM, start_coordinate, input_dimensions, input_coordinates);
  int I_cnt = 0;
  // INPUT channel
  for (auto elem = input_coordinates.begin(); elem != input_coordinates.end(); elem++){
    list<int> temp = *elem;
    int b = temp.front();
    temp.pop_front();
    int c = temp.front();
    temp.pop_front();
    int oy = temp.front();
    temp.pop_front();
    int ox = temp.front();
    temp.pop_front();
    int fy = temp.front();
    temp.pop_front();
    int fx = temp.front();
    temp.pop_front();

    if ((oy+fy < IY) && (ox+fx < IX)) {
      I_data_in.data[I_cnt] = *(*(*(*(input_array+b)+c)+(oy+fy))+(ox+fy));
    } else {
      I_data_in.data[I_cnt] = 0;
    }
    I_cnt++;
    if (I_cnt == mem_words_I_L3_in){
      I_cnt = 0;
      I_wr_data.write(I_data_in);
    }
  }
  // make start_coordinate list of same size as weight_coordinates list
  start_coordinate.pop_back();
  start_coordinate.pop_back();
  list<list<int>> weight_coordinates;
  list_coordinates(layer_iterations, layer_dimensions, W_mapped_to_DRAM, start_coordinate, weight_dimensions, weight_coordinates);
  int W_cnt = 0;
  // WEIGHT channel
  for (auto elem = weight_coordinates.begin(); elem != weight_coordinates.end(); elem++){
    list<int> temp = *elem;
    int k = temp.front();
    temp.pop_front();
    int c = temp.front();
    temp.pop_front();
    int fy = temp.front();
    temp.pop_front();
    int fx = temp.front();
    temp.pop_front();

    W_data_in.data[W_cnt] = *(*(*(*(weight_array+k)+c)+fy)+fx);
    W_cnt++;
    if (W_cnt == mem_words_W_L3_in){
      W_cnt = 0;
      W_wr_data.write(W_data_in);
    }
  }

  bool HWdone = false;
  cout << endl;
  cout << "Finished loading channels" << endl;
  cout << "Running HW instance" << endl;
  for (int i=0; i<8; i++)
    wr_zero_guard.write(1);
  int its = 0;
  int O_cnt = 0;
  int O_cnt_wr = 0;
  int max_HW_its = 10000;
  bool failed = false;
  list<list<int>> output_coordinates;
  list_coordinates(layer_iterations, layer_dimensions, O_mapped_to_DRAM, start_coordinate, output_dimensions, output_coordinates);
  // OUTPUT channel
  for (auto elem = output_coordinates.begin(); elem != output_coordinates.end(); elem++){
    list<int> temp = *elem;
    int b = temp.front();
    temp.pop_front();
    int k = temp.front();
    temp.pop_front();
    int oy = temp.front();
    temp.pop_front();
    int ox = temp.front();
    its++;
    int debug_cnt = 0;
    while (!HWdone){
      HWinst.run(O_wr_data,O_rd_data,I_wr_data,W_wr_data,wr_zero_guard,layer_instruction_in);
      if (O_rd_data.available(1)){
        HWdone = true;
        O_data_out = O_rd_data.read();
      }
      debug_cnt++;
      // if (debug_cnt == max_HW_its) { HWdone = true; failed = true;}
    }
    *(*(*(*(output_array_hw+b)+k)+oy)+ox) = O_data_out.data[O_cnt];
    O_cnt++;
    if (O_cnt == mem_words_O_L3_out){
      O_cnt = 0;
      HWdone = false;
    }
    if (*(*(*(*(output_array_hw+b)+k)+oy)+ox) != *(*(*(*(output_array_sw+b)+k)+oy)+ox)){
      cout << "Paused due to wrong output result:" << endl;
      cout << "OFMAPhw " << *(*(*(*(output_array_hw+b)+k)+oy)+ox) << " | ";
      cout << "OFMAPsw " << *(*(*(*(output_array_sw+b)+k)+oy)+ox);
      cout << " [iteration = " << its << " of " << B*K*OY*OX << " K = " << k << "]" << endl;
      failed = true;
      cin.get(); // to pause the console and control by pressing enter
    }
  }
  cout << "Finished Reading output channel" << endl << endl;
  // ------------------------ Hardware DUT ------------------------

  unsigned long int cnt = 0;
  double err = 0.0;

  for (int b=0; b<B; b++) {
    for (int k=0; k<K; k++) {
      for (int oy=0; oy<OY; oy++) {
        for (int ox=0; ox<OX; ox++) {
          err += fabs(output_array_hw[b][k][oy][ox].to_double()-output_array_sw[b][k][oy][ox]);
          cnt++;
        }
      }
    }
  }

  cout << "OUTPUT LAYER (#" << 1 << " of " << 1 << ")" << endl;
  cout << " --> total error:                                 " << err << endl;
  cout << " --> number of outputs:                           " << cnt << endl;
  cout << " --> average error:                               " << err/cnt << endl << endl;

  cout << "Memory Access Count: [in elements]:" << endl;
  cout << "O: [";
  cout << "[(" << O_L1_bot_rd_cnt << ", " << O_L1_bot_wr_cnt << ")(" << O_L1_top_rd_cnt << ", " << O_L1_top_wr_cnt << ")]";
  cout << "[(" << O_L2_bot_rd_cnt << ", " << O_L2_bot_wr_cnt << ")(" << O_L2_top_rd_cnt << ", " << O_L2_top_wr_cnt << ")]";
  cout << "[(" << O_L3_bot_rd_cnt << ", " << O_L3_bot_wr_cnt << ")(" << O_L3_top_rd_cnt << ", " << O_L3_top_wr_cnt << ")]";
  cout << "]" << endl;
  cout << "I: [";
  cout << "[" << I_L1_rd_cnt << ", " << I_L1_wr_cnt << "]";
  cout << "[" << I_L2_rd_cnt << ", " << I_L2_wr_cnt << "]";
  cout << "[" << I_L3_rd_cnt << ", " << I_L3_wr_cnt << "]";
  cout << "]" << endl;
  cout << "W: [";
  cout << "[" << W_L1_rd_cnt << ", " << W_L1_wr_cnt << "]";
  cout << "[" << W_L2_rd_cnt << ", " << W_L2_wr_cnt << "]";
  cout << "[" << W_L3_rd_cnt << ", " << W_L3_wr_cnt << "]";
  cout << "]" << endl;
  cout << "Memory Access Count: [in words]:" << endl;
  cout << "O: [";
  cout << "[(" << O_L1_bot_rd_cnt/mem_words_O_L1_out << ", " << O_L1_bot_wr_cnt/mem_words_O_L1_in << ")(" << O_L1_top_rd_cnt/mem_words_O_L1_out << ", " << O_L1_top_wr_cnt/mem_words_O_L1_in << ")]";
  cout << "[(" << O_L2_bot_rd_cnt/mem_words_O_L2_out << ", " << O_L2_bot_wr_cnt/mem_words_O_L2_in << ")(" << O_L2_top_rd_cnt/mem_words_O_L2_out << ", " << O_L2_top_wr_cnt/mem_words_O_L2_in << ")]";
  cout << "[(" << O_L3_bot_rd_cnt/mem_words_O_L3_out << ", " << O_L3_bot_wr_cnt/mem_words_O_L3_in << ")(" << O_L3_top_rd_cnt/mem_words_O_L3_out << ", " << O_L3_top_wr_cnt/mem_words_O_L3_in << ")]";
  cout << "]" << endl;
  cout << "I: [";
  cout << "[" << I_L1_rd_cnt/mem_words_I_L1_out << ", " << I_L1_wr_cnt/mem_words_I_L1_in << "]";
  cout << "[" << I_L2_rd_cnt/mem_words_I_L2_out << ", " << I_L2_wr_cnt/mem_words_I_L2_in << "]";
  cout << "[" << I_L3_rd_cnt/mem_words_I_L3_out << ", " << I_L3_wr_cnt/mem_words_I_L3_in << "]";
  cout << "]" << endl;
  cout << "W: [";
  cout << "[" << W_L1_rd_cnt/mem_words_W_L1_out << ", " << W_L1_wr_cnt/mem_words_W_L1_in << "]";
  cout << "[" << W_L2_rd_cnt/mem_words_W_L2_out << ", " << W_L2_wr_cnt/mem_words_W_L2_in << "]";
  cout << "[" << W_L3_rd_cnt/mem_words_W_L3_out << ", " << W_L3_wr_cnt/mem_words_W_L3_in << "]";
  cout << "]" << endl;
  // memory is released
  for (int i=0; i<B; i++) {
    for (int j=0; j<K; j++) {
      for (int k=0; k<OY; k++) {
        delete[] output_array_sw[i][j][k];
      }
      delete[] output_array_sw[i][j];
    }
    delete[] output_array_sw[i];
  }
  delete[] output_array_sw;

  for (int i=0; i<B; i++) {
    for (int j=0; j<K; j++) {
      for (int k=0; k<OY; k++) {
        delete[] output_array_hw[i][j][k];
      }
      delete[] output_array_hw[i][j];
    }
    delete[] output_array_hw[i];
  }
  delete[] output_array_hw;

  for (int i=0; i<B; i++) {
    for (int j=0; j<C; j++) {
      for (int k=0; k<IY; k++) {
        delete[] input_array[i][j][k];
      }
      delete[] input_array[i][j];
    }
    delete[] input_array[i];
  }
  delete[] input_array;

  for (int i=0; i<K; i++) {
    for (int j=0; j<C; j++) {
      for (int k=0; k<FY; k++) {
        delete[] weight_array[i][j][k];
      }
      delete[] weight_array[i][j];
    }
    delete[] weight_array[i];
  }
  delete[] weight_array;

  cout << endl;
  if (failed){
    cout << "Testbench Failed: Hardware stuck" << endl;
  } else {
    cout << "Testbench Finished" << endl;
  }

  CCS_RETURN(0);
}

    """
    tb_string = header_string + mapping_string + testing_string
    return tb_string

def main(input_file, output_dir):
    nb_cnt = 5;
    layer_spec_collect, precision_collect, array_size_collect, mem_size_collect, mem_bw_collect, spatial_unrolling_collect, temporal_mapping_collect =  xml_info_extraction(input_file)
    config_string = make_config_file(precision_collect[0], array_size_collect[0], mem_size_collect[0], mem_bw_collect[0], nb_cnt)
    tb_string = make_tb(layer_spec_collect[0], spatial_unrolling_collect, temporal_mapping_collect, nb_cnt)

    config_file = open(output_dir + "config_file.h", "w")
    config_file.write(config_string)
    config_file.close()

    tb_file = open(output_dir + "testbench.cpp", "w")
    tb_file.write(tb_string)
    tb_file.close()

if __name__ == "__main__":
    main(*sys.argv[1:])
