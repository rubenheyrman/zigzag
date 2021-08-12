
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
  bool log_all_outputs = true;

enum {
B = 3136,
K = 128,
C = 128,
OY = 1,
OX = 1,
IY = 1,
IX = 1,
FY = 1,
FX = 1,
SY = 1,
SX = 1,
SFY = 1,
SFX = 1,
G = 1
};

list<int>    layer_iterations  {4, 4, 4, 16, 28, 2, 2, 4, 112};
list<string> layer_dimensions  {"K", "C", "K", "C", "B", "K", "C", "K", "B"};

W_addr_type_L1 W_loop_bound_L1[nb_cnt] = {4, 16, 28, 1, 1};
bool W_loop_relevancy_L1[nb_cnt]       = {1, 1, 0, 1, 1};
W_addr_type_L2 W_loop_bound_L2[nb_cnt] = {2, 1, 1, 1, 1};
bool W_loop_relevancy_L2[nb_cnt]       = {1, 1, 1, 1, 1};
W_addr_type_L3 W_loop_bound_L3[nb_cnt] = {2, 4, 112, 1, 1};
bool W_loop_relevancy_L3[nb_cnt]       = {1, 1, 0, 1, 1};
W_addr_type_L4 W_loop_bound_L4[nb_cnt] = {1, 1, 1, 1, 1};
bool W_loop_relevancy_L4[nb_cnt]       = {1, 1, 1, 1, 1};
list<bool> W_mapped_to_DRAM = {0, 0, 0, 0, 0, 0, 0, 0, 0};

I_addr_type_L1 I_loop_bound_L1[nb_cnt] = {4, 16, 1, 1, 1};
bool I_loop_relevancy_L1[nb_cnt]       = {0, 1, 1, 1, 1};
I_addr_type_L2 I_loop_bound_L2[nb_cnt] = {28, 2, 1, 1, 1};
bool I_loop_relevancy_L2[nb_cnt]       = {1, 0, 1, 1, 1};
I_addr_type_L3 I_loop_bound_L3[nb_cnt] = {2, 4, 1, 1, 1};
bool I_loop_relevancy_L3[nb_cnt]       = {1, 0, 1, 1, 1};
I_addr_type_L4 I_loop_bound_L4[nb_cnt] = {112, 1, 1, 1, 1};
bool I_loop_relevancy_L4[nb_cnt]       = {1, 1, 1, 1, 1};
list<bool> I_mapped_to_DRAM = {0, 0, 0, 0, 0, 0, 0, 0, 1};

O_addr_type_L1 O_loop_bound_L1[nb_cnt] = {4, 16, 1, 1, 1};
bool O_loop_relevancy_L1[nb_cnt]       = {1, 0, 1, 1, 1};
O_addr_type_L2 O_loop_bound_L2[nb_cnt] = {28, 2, 2, 1, 1};
bool O_loop_relevancy_L2[nb_cnt]       = {1, 1, 0, 1, 1};
O_addr_type_L3 O_loop_bound_L3[nb_cnt] = {4, 1, 1, 1, 1};
bool O_loop_relevancy_L3[nb_cnt]       = {1, 1, 1, 1, 1};
O_addr_type_L4 O_loop_bound_L4[nb_cnt] = {112, 1, 1, 1, 1};
bool O_loop_relevancy_L4[nb_cnt]       = {1, 1, 1, 1, 1};
list<bool> O_mapped_to_DRAM = {0, 0, 0, 0, 0, 0, 0, 0, 1};



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
  if (I_cnt != 0)
    I_wr_data.write(I_data_in);
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
  if (W_cnt != 0)
    W_wr_data.write(W_data_in);



  bool HWdone = false;
  cout << endl;
  cout << "Finished loading channels" << endl;
  cout << "Running HW instance" << endl;
  // assuming all loops mapped to DRAM are relevant for the output
  int dram_iterations = 1;
  auto it = layer_iterations.begin();
  for (auto i = O_mapped_to_DRAM.begin(); i != O_mapped_to_DRAM.end(); i++){
    if (*i == 1){
      dram_iterations *= *it;
    }
    it++;
  }
  for (int i=0; i<dram_iterations+1; i++)
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
    } else if (log_all_outputs){
      cout << "Correct output:" << endl;
      cout << "OFMAPhw " << *(*(*(*(output_array_hw+b)+k)+oy)+ox) << " | ";
      cout << "OFMAPsw " << *(*(*(*(output_array_sw+b)+k)+oy)+ox);
      cout << " [iteration = " << its << " of " << B*K*OY*OX << " K = " << k << "]" << endl;
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
  cout << "W: [";
  cout << "[" << W_L1_rd_cnt << ", " << W_L1_wr_cnt << "]";
  cout << "[" << W_L2_rd_cnt << ", " << W_L2_wr_cnt << "]";
  cout << "[" << W_L3_rd_cnt << ", " << W_L3_wr_cnt << "]";
  cout << "]" << endl;
  cout << "I: [";
  cout << "[" << I_L1_rd_cnt << ", " << I_L1_wr_cnt << "]";
  cout << "[" << I_L2_rd_cnt << ", " << I_L2_wr_cnt << "]";
  cout << "[" << I_L3_rd_cnt << ", " << I_L3_wr_cnt << "]";
  cout << "]" << endl;
  cout << "O: [";
  cout << "[(" << O_L1_bot_rd_cnt << ", " << O_L1_bot_wr_cnt << ")(" << O_L1_top_rd_cnt << ", " << O_L1_top_wr_cnt << ")]";
  cout << "[(" << O_L2_bot_rd_cnt << ", " << O_L2_bot_wr_cnt << ")(" << O_L2_top_rd_cnt << ", " << O_L2_top_wr_cnt << ")]";
  cout << "[(" << O_L3_bot_rd_cnt << ", " << O_L3_bot_wr_cnt << ")(" << O_L3_top_rd_cnt << ", " << O_L3_top_wr_cnt << ")]";
  cout << "]" << endl;
  cout << endl << "Memory Access Count: [in words]:" << endl;
  cout << "W: [";
  cout << "[" << W_L1_rd_cnt/mem_words_W_L1_out << ", " << W_L1_wr_cnt/mem_words_W_L1_in << "]";
  cout << "[" << W_L2_rd_cnt/mem_words_W_L2_out << ", " << W_L2_wr_cnt/mem_words_W_L2_in << "]";
  cout << "[" << W_L3_rd_cnt/mem_words_W_L3_out << ", " << W_L3_wr_cnt/mem_words_W_L3_in << "]";
  cout << "]" << endl;
  cout << "I: [";
  cout << "[" << I_L1_rd_cnt/mem_words_I_L1_out << ", " << I_L1_wr_cnt/mem_words_I_L1_in << "]";
  cout << "[" << I_L2_rd_cnt/mem_words_I_L2_out << ", " << I_L2_wr_cnt/mem_words_I_L2_in << "]";
  cout << "[" << I_L3_rd_cnt/mem_words_I_L3_out << ", " << I_L3_wr_cnt/mem_words_I_L3_in << "]";
  cout << "]" << endl;
  cout << "O: [";
  cout << "[(" << O_L1_bot_rd_cnt/mem_words_O_L1_out << ", " << O_L1_bot_wr_cnt/mem_words_O_L1_in << ")(" << O_L1_top_rd_cnt/mem_words_O_L1_out << ", " << O_L1_top_wr_cnt/mem_words_O_L1_in << ")]";
  cout << "[(" << O_L2_bot_rd_cnt/mem_words_O_L2_out << ", " << O_L2_bot_wr_cnt/mem_words_O_L2_in << ")(" << O_L2_top_rd_cnt/mem_words_O_L2_out << ", " << O_L2_top_wr_cnt/mem_words_O_L2_in << ")]";
  cout << "[(" << O_L3_bot_rd_cnt/mem_words_O_L3_out << ", " << O_L3_bot_wr_cnt/mem_words_O_L3_in << ")(" << O_L3_top_rd_cnt/mem_words_O_L3_out << ", " << O_L3_top_wr_cnt/mem_words_O_L3_in << ")]";
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

    