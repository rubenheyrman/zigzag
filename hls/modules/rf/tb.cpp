#include "reg.h"
#include <mc_scverify.h>

#include <stdio.h>
#include <fstream>
using namespace std;

CCS_MAIN(int argv, char **argc)
{
    ac_int<16,false>  data_in;
    ac_int<16,false> data_out;
    ac_int<ac::log2_ceil<32>::val,false> addr_in;
    ac_int<ac::log2_ceil<32>::val,false> addr_out;
    bool write = true;
    

    for (int i=0; i<32; i++){
        data_in = i;
	addr_in = i+1;
	addr_out = i;

        reg(data_in, data_out, addr_in, addr_out, write);

        printf("data out = %d\n", data_out.to_uint());
    }
    CCS_RETURN(0);
}
