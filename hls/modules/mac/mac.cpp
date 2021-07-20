#include "mac.h"
#include <mc_scverify.h>

#pragma hls_pipeline_init_interval 1
#pragma hls_design top
void CCS_BLOCK(mac)(ac_int<8,false>                    &data_in0,
                     ac_int<8,false>                   &data_in1,
                     ac_int<16,false>                  &data_psum,
                     ac_int<16,false>                  &data_out)
{   
    data_out = data_in0 * data_in1 + data_psum;
}