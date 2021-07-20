#include "reg.h"
#include <mc_scverify.h>

#pragma hls_pipeline_init_interval 1
#pragma hls_design top
void CCS_BLOCK(reg)(ac_int<16,false>                    &data_in,
                     ac_int<16,false>                  &data_out,
		     ac_int<ac::log2_ceil<32>::val,false> &addr_in,
		     ac_int<ac::log2_ceil<32>::val,false> &addr_out,
		     bool &write)
{   
    ac_int <16,false> reg[32];
    if (write){
        reg[addr_in] = data_in;
    }
    data_out = reg[addr_out];
}
