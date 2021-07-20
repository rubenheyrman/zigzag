#ifndef _INCLUDED_MAC_H_
#define _INCLUDED_MAC_H_

#include <ac_int.h>         // Algortihmic C integer data types
#include <ac_fixed.h>       // Algortihmic C fixed-point data types
#include <ac_channel.h>     // Algorithmic C channel class

void mac(ac_int<8,false>                    &data_in0,
        ac_int<8,false>                   &data_in1,
        ac_int<16,false>                  &data_psum,
        ac_int<16,false>                  &data_out);

#endif // MAC_H_