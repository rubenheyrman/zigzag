#ifndef _INCLUDED_REG_H_
#define _INCLUDED_REG_H_

#include <ac_int.h>         // Algortihmic C integer data types
#include <ac_fixed.h>       // Algortihmic C fixed-point data types
#include <ac_channel.h>     // Algorithmic C channel class

void reg	    (ac_int<16,false>                    &data_in,
                     ac_int<16,false>                  &data_out,
		     ac_int<ac::log2_ceil<32>::val,false> &addr_in,
		     ac_int<ac::log2_ceil<32>::val,false> &addr_out,
		     bool &write);
#endif // REG_H_
