#include "config_file.h"
#include "mh_top.h"
#include "DNNlayerSW.h"
#include <mc_scverify.h>

#include <stdio.h>
#include <stdlib.h>


using namespace std;

#include <fstream>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <random>

CCS_MAIN(int argv, char **argc)
{
  cout << "Initilialization" << endl;
  // Check if relevant loops do not surpass memory bounds of HW
  //O_addr_type_L1 O_loop_bound_L1[nb_cnt] = {3,3,3,3,1};
  //bool O_loop_relevancy_L1[nb_cnt]       = {1,0,0,1,1};
  //O_addr_type_L2 O_loop_bound_L2[nb_cnt] = {1,2,2,3,5};
  //bool O_loop_relevancy_L2[nb_cnt]       = {1,1,0,0,1};
  //O_addr_type_L3 O_loop_bound_L3[nb_cnt] = {1,1,1,1,1};
  //bool O_loop_relevancy_L3[nb_cnt]       = {1,1,1,1,1};
  O_addr_type_L1 O_loop_bound_L1[nb_cnt] = {1,1,1,1,1};
  bool O_loop_relevancy_L1[nb_cnt]       = {1,1,1,1,1};
  O_addr_type_L2 O_loop_bound_L2[nb_cnt] = {1,3,3,3,3};
  bool O_loop_relevancy_L2[nb_cnt]       = {1,1,0,0,1};
  O_addr_type_L3 O_loop_bound_L3[nb_cnt] = {1,2,2,3,5};
  bool O_loop_relevancy_L3[nb_cnt]       = {1,1,0,0,1};
  //O_addr_type_L1 O_loop_bound_L1[nb_cnt] = {1,3,3,3,3};
  //bool O_loop_relevancy_L1[nb_cnt]       = {1,1,0,0,1};
  //O_addr_type_L2 O_loop_bound_L2[nb_cnt] = {1,1,1,1,1};
  //bool O_loop_relevancy_L2[nb_cnt]       = {1,1,1,1,1};
  //O_addr_type_L3 O_loop_bound_L3[nb_cnt] = {1,2,2,3,5};
  //bool O_loop_relevancy_L3[nb_cnt]       = {1,1,0,0,1};

  I_addr_type_L1 I_loop_bound_L1[nb_cnt] = {3,3,1,1,1};
  bool I_loop_relevancy_L1[nb_cnt]       = {1,1,1,1,1};
  I_addr_type_L2 I_loop_bound_L2[nb_cnt] = {3,1,1,1,1};
  bool I_loop_relevancy_L2[nb_cnt]       = {1,1,1,1,1};
  I_addr_type_L3 I_loop_bound_L3[nb_cnt] = {3,2,2,1,1};
  bool I_loop_relevancy_L3[nb_cnt]       = {1,0,1,1,1};

  W_addr_type_L1 W_loop_bound_L1[nb_cnt] = {3,3,3,3,2};
  bool W_loop_relevancy_L1[nb_cnt]       = {0,1,1,0,1};
  W_addr_type_L2 W_loop_bound_L2[nb_cnt] = {2,3,5,1,1};
  bool W_loop_relevancy_L2[nb_cnt]       = {1,1,1,1,1};
  W_addr_type_L3 W_loop_bound_L3[nb_cnt] = {1,1,1,1,1};
  bool W_loop_relevancy_L3[nb_cnt]       = {1,1,1,1,1};
   


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

  int ia = 1;
  I_ref_type ****input_array = new I_ref_type***[B]; // input array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<B; i++){
    input_array[i] = new I_ref_type**[C];  
    for (int j=0; j<C; j++) {
      input_array[i][j] = new I_ref_type*[IY];
      for (int k=0; k<IY; k++) {
        input_array[i][j][k] = new I_ref_type[IX];
        for (int l=0; l<IX; l++){
          //std::random_device rd;
          //std::default_random_engine eng(rd());
          //std::uniform_real_distribution<double> distr(inputMIN, inputMAX);
          //input_array[i][j][k][l] = (I_ref_type) distr(eng);
          input_array[i][j][k][l] = ia;
        }
      }
    }
  }

  int wa = 1;
  W_ref_type ****weight_array = new W_ref_type***[K]; // weight array for software implementation // 3D array definition // begin of mem allocation
  for (int i=0; i<K; i++) {
    weight_array[i] = new W_ref_type**[C];
    for (int j=0; j<C; j++) {
      weight_array[i][j] = new W_ref_type*[FY];
      for (int k=0; k<FY; k++) {
        weight_array[i][j][k] = new W_ref_type[FX];
        for (int l=0; l<FX; l++){
          //std::random_device rd;
          //std::default_random_engine eng(rd());
          //std::uniform_real_distribution<double> distr(weightMIN, weightMAX);
          //weight_array[i][j][k][l] = (W_ref_type) distr(eng);
          weight_array[i][j][k][l] = wa;
        }
      }
    }
  }

  DNNlayer<B, K, C, OY, OX, IY, IX, FY, FX, SY, SX, SFY, SFX, O_ref_type, I_ref_type, W_ref_type> SWinst;

  top<nb_counters_W_L1, 
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
  
  int I_cnt = 0;
  // INPUT channel
  for (int b0=0; b0<B0; b0++){
    for (int c3=0; c3<C3; c3++){
      for (int k2=0; k2<K2; k2++){
        for (int c2=0; c2<C2; c2++){
          for (int k1=0; k1<K1; k1++){
            for (int fx0=0; fx0<FX0; fx0++){
              for (int c1=0; c1<C1; c1++){
                  for (int ox0=0; ox0<OX0; ox0++){
                    for (int c0=0; c0<C0; c0++){
                      for (int fy0=0; fy0<FY0; fy0++){
                        for (int oy0=0; oy0<OY0; oy0++){
                          if ((oy0+fy0 < IY) && (ox0+fx0 < IX)) {
                            I_data_in.data[I_cnt] = *(*(*(*(input_array+b0)+c3*C2*C1*C0+c2*C1*C0+c1*C0+c0)+(oy0+fy0))+(ox0+fx0));
//cout << *(*(*(*(input_array+b0)+c3*c2*c1*c0)+(oy0+fy0))+(ox0+fx0)) << " =? " << I_data_in.data[I_cnt] << endl;
                          } else {
                            I_data_in.data[I_cnt] = 0;
                          }
                          I_cnt++;
                          if (I_cnt == mem_words_I_L3_in){
                            //printf("Writing Input data: %d\n", I_data_in.data[I_cnt-1].to_uint());
                            I_cnt = 0;
                            I_wr_data.write(I_data_in);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
  }

  int W_cnt = 0;
  // WEIGHT channel
  for (int b0=0; b0<B0; b0++){
    for (int c3=0; c3<C3; c3++){
      for (int k2=0; k2<K2; k2++){
        for (int c2=0; c2<C2; c2++){
          for (int k1=0; k1<K1; k1++){
            for (int fx0=0; fx0<FX0; fx0++){
              for (int c1=0; c1<C1; c1++){
                for (int k0=0; k0<K0; k0++){
                  for (int c0=0; c0<C0; c0++){
                    for (int fy0=0; fy0<FY0; fy0++){
                      W_data_in.data[W_cnt] = *(*(*(*(weight_array+k2*K1*K0+k1*K0+k0)+c3*C2*C1*C0+c2*C1*C0+c1*C0+c0)+fy0)+fx0);// cout << *(*(*(*(weight_array+k2*k1*k0)+c3*c2*c1*c0)+fy0)+fx0) << "	";
                      W_cnt++;
                      if (W_cnt == mem_words_W_L3_in){
                        //printf("Writing Weight data: %d\n\n", W_data_in.data[W_cnt-1].to_uint());
                        W_cnt = 0;
                        W_wr_data.write(W_data_in);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  bool HWdone = false;

  cout << endl;
  cout << "Finished loading channels" << endl;

  //printf("Size: O input channel: %5d, W input channel: %5d, I input channel: %5d, Size zero guard channel: %5d, ", O_wr_data.size(), W_wr_data.size(), I_wr_data.size(), wr_zero_guard.size());
  cout << "Running HW instance" << endl;
  int its = 0;
  int O_cnt = 0;
  int O_cnt_wr = 0;
  for (int b0=0; b0<B0; b0++){
    for (int c3=0; c3<C3; c3++){
      for (int k2=0; k2<K2; k2++){
        for (int c2=0; c2<C2; c2++){
          if (c3==0 && c2==0){
            wr_zero_guard.write(1);
            printf("1 -> ");
          } else {
            wr_zero_guard.write(0);
            printf("0 -> ");
          }
        }
      }
    }
  }
  //for (int i=0; i<50; i++)
    wr_zero_guard.write(1);
  printf("\n");
  //for (int i=0; i<20; i++)
    //wr_zero_guard.write(1);
  for (int b0=0; b0<B0; b0++){
    for (int c3=0; c3<C3; c3++){
      for (int k2=0; k2<K2; k2++){
        for (int c2=0; c2<C2; c2++){
          for (int k1=0; k1<K1; k1++){
            for (int k0=0; k0<K0; k0++){
              for (int ox0=0; ox0<OX0; ox0++){
                for (int oy0=0; oy0<OY0; oy0++){
                  if (*(*(*(*(output_array_hw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0) != 0){
                    O_data_in.data[O_cnt_wr] = *(*(*(*(output_array_hw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0);
                    O_cnt_wr++;
                    if (O_cnt_wr == mem_words_O_L3_out){
                      O_wr_data.write(O_data_in);
                      O_cnt_wr = 0;
                    }
                  }
                }
              }
              for (int ox0=0; ox0<OX0; ox0++){
                for (int oy0=0; oy0<OY0; oy0++){
                  its++;
//printf("O: (%d,%d,%d,%d), W: (%d,%d,%d,%d), I: (%d,%d,%d,%d) => ",
//b0, k2*K1*K0+k1*K0+k0, oy0, ox0,
//k2*K1*K0+k1*K0+k0, c3*C2*C1*C0+c2*C1*C0+c1*C0+c0, fy0, fx0,
//b0, c3*C2*C1*C0+c2*C1*C0+c1*C0+c0, oy0+fy0, ox0+fx0);
//printf("I: (%d,%d,%d,%d)\n",
//b0, c3*C2*C1*C0+c2*C1*C0+c1*C0+c0, oy0+fy0, ox0+fx0);
                  //printf("Size: O input channel: %5d, W input channel: %5d, I input channel: %5d, Size zero guard channel: %5d, ",
                         //O_wr_data.size(), W_wr_data.size(), I_wr_data.size(), wr_zero_guard.size());
                  //printf("\n");
                  int debug_cnt = 0;
                  while (!HWdone){
                    HWinst.run(O_wr_data,O_rd_data,I_wr_data,W_wr_data,wr_zero_guard,layer_instruction_in);
                    if (O_rd_data.available(1)){
                      HWdone = true;
                      O_data_out = O_rd_data.read();
                    }
                    debug_cnt++;
                    //if (debug_cnt == 1000) { break; }
                  }
                  *(*(*(*(output_array_hw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0) = O_data_out.data[O_cnt];
                  O_cnt++;
                  if (O_cnt == mem_words_O_L3_out){
                    O_cnt = 0;
                    HWdone = false;
                  }
                  cout << "OFMAPhw " << *(*(*(*(output_array_hw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0) << " | ";
                  cout << "OFMAPsw " << *(*(*(*(output_array_sw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0);
                  cout << " [iteration = " << its << " of " << B*K*OY*OX << " K = " << k2*K1*K0+k1*K0+k0 << "]" << endl;
                }
              }
            }
          }
        }
      }
    }
  }

  /*cout << "Reading output channel" << endl << endl;
  //printf("Size output channel: %d\n\n", O_rd_data.size());
  int O_cnt = 0;
  // OUTPUT channel
  for (int b0=0; b0<B0; b0++){
    for (int k2=0; k2<K2; k2++){
      for (int k1=0; k1<K1; k1++){
        for (int k0=0; k0<K0; k0++){
          for (int ox0=0; ox0<OX0; ox0++){
            for (int oy0=0; oy0<OY0; oy0++){
              if (O_rd_data.available(1)){
                if (O_cnt == 0) {
                  O_data_out = O_rd_data.read();
                }
                *(*(*(*(output_array_hw+b0)+k2*K1*K0+k1*K0+k0)+oy0)+ox0) += O_data_out.data[O_cnt]; // cout << *(*(*(*(output_array_hw+b0)+k2*k1*k0)+oy0)+ox0) << "	";
                //printf("DATA @ index (%d, %d, %d, %d): %d\n\n", b0, k2*K1*K0+k1*K0+k0, oy0, ox0, O_data_out.data[O_cnt].to_uint());
                O_cnt++;
                if (O_cnt == mem_words_O_L3_out){
                  O_cnt = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  cout << "Finished Reading output channel" << endl << endl;*/
  // ------------------------ Hardware DUT ------------------------

  unsigned long int cnt[K];
  double err[K];
  for (int i=0; i<K; i++) {
    cnt[i] = 0;
    err[i] = 0.0;
  }
  for (int b=0; b<B; b++) {
    for (int k=0; k<K; k++) {
      for (int oy=0; oy<OY; oy++) {
        for (int ox=0; ox<OX; ox++) {
          err[k] += fabs(output_array_hw[b][k][oy][ox].to_double()-output_array_sw[b][k][oy][ox]);
          cnt[k]++;
          //printf("OUTPUT @ (%d, %d, %d, %d)\n", b, k, oy, ox);
          //cout << "OUT HW: " << output_array_hw[b][k][oy][ox].to_double() << "\nOUT SW: " << output_array_sw[b][k][oy][ox] << endl << endl;
        }
      }
      //printf("\n");
    }
  }

  for (int k=0; k<K; k++) {
    cout << "OUTPUT FEATURE MAP (K = " << k+1 << " of " << K << ")" << endl;
    cout << " --> total error:                                 " << err[k] << endl;
    cout << " --> number of outputs per output feature map:    " << cnt[k] << endl;
    cout << " --> average error:                               " << err[k]/cnt[k] << endl << endl;
  }

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
  cout << "Testbench Finished" << endl;

  CCS_RETURN(0);
}

