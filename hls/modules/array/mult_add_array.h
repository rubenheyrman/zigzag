#ifndef _INCLUDED_MULT_ADD_ARRAY_H_
#define _INCLUDED_MULT_ADD_ARRAY_H_

#include <ac_fixed.h>       // Algortihmic C fixed-point data types
#include <ac_channel.h>     // Algorithmic C channel class

void mult_add_array(ac_channel<ac_int<8,false> >  a[4][3],
                       ac_channel<ac_int<8,false> > b[4][3],
                       ac_channel<ac_int<16,false> > c[4][3],
                       ac_channel<ac_int<16,false> > result[4][3]);

#endif

