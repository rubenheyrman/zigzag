#ifndef MAC_H_
#define MAC_H_

#include <ac_int.h>         // Algortihmic C integer data types
#include <ac_fixed.h>       // Algortihmic C fixed-point data types
#include <ac_channel.h>     // Algorithmic C channel class

void test(ac_int<8,false>                   data_in0,
          ac_int<8,false>                   data_in1,
          ac_int<16,false>                  data_psum,
          ac_int<16,false>                  data_out)
{
    data_out = data_in0 * data_in1 + data_psum;
}

#endif // MAC_H_
