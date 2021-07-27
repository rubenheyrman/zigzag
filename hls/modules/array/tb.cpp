#include "mult_add_array.h"
#include <stdio.h>
#include <mc_scverify.h>

CCS_MAIN(int argv, char **argc)
{

  ac_int<8,false> a;
  ac_int<8,false> b;
  ac_int<16,false> c;
  ac_channel<ac_int<8,false> > a_chan[4][3];
  ac_channel<ac_int<8,false> > b_chan[4][3];
  ac_channel<ac_int<16,false> > c_chan[4][3];
  ac_channel<ac_int<16,false> > result[4][3];
  ac_int<16,false> res;
  for (int i=0; i<20; i++) {
    a = rand();
    b = rand();
    c = 33554431;
    for (int x=0; x<4; x++){
      for (int y=0; y<3; y++){
        a_chan[x][y].write(a);
        b_chan[x][y].write(b);
        c_chan[x][y].write(c);
      }
    }
    mult_add_array(a_chan,b_chan,c_chan,result);
    for (int x=0; x<4; x++){
      for (int y=0; y<3; y++){
        res = result[x][y].read();
        printf("result[%d][%d]: %d\n", x, y, res.to_uint());
      }
    }
  }
  CCS_RETURN(0);
}

