#include "mult_add_array.h"
#include <mc_scverify.h>

#pragma hls_design top
void CCS_BLOCK(mult_add_array)(ac_channel<ac_int<8,false> > a[4][3],
                                  ac_channel<ac_int<8,false> > b[4][3],
                                  ac_channel<ac_int<16,false> > c[4][3],
                                  ac_channel<ac_int<16,false> > result[4][3])
{
#pragma hls_unroll yes
  for (int x=0; x<4; x++){
#pragma hls_unroll yes
    for (int y=0; y<3; y++){
      ac_int<16,false> product = a[x][y].read() * b[x][y].read();
      ac_int<16,false> sum = product + c[x][y].read();
      result[x][y].write(sum);
    }
  }
}
