#include "mac.h"


#include <stdio.h>
#include <fstream>
using namespace std;

int main()
{
    ac_int<8,false>  data_in0;
    ac_int<8,false>  data_in1;
    ac_int<16,false> data_psum = 0;
    ac_int<16,false> data_out;

    for (int i=0; i<16; i++){
        data_in0 = i;
        data_in1 = 37-i;

        mac(data_in0, data_in1, data_psum, data_out)

        data_psum = data_out;
        printf("data out = %d\n", data_out.to_uint())
    }
}
