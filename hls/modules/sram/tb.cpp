#include "mem_block_shifted.h"
#include "mem_block_ref.h"
#include <mc_scverify.h>

CCS_MAIN(int argv, char **argc)
{
  ac_channel<addrData> write_addr_data;
  ac_channel<int > rd_addr;
  ac_channel<ac_int<128,false> > rd_data;

  ac_channel<addrData> write_addr_data_ref;
  ac_channel<int > rd_addr_ref;
  ac_channel<ac_int<128,false> > rd_data_ref;
  mem_block inst;
  bool read_enable = false;
  addrData data;
#ifdef CCS_SCVERIFY
  testbench::rd_addr_wait_ctrl.cycles = 216;
#endif

  for (int i=0; i<216; i++) { // initialize memory
    data.addr = i;
    data.data = i+1;
    write_addr_data.write(data);//write same data into DUT and reference
    inst.run(write_addr_data,rd_addr,rd_data);
  }

  int addr=0;
  read_enable = true;
  for (int i=0; i<200; i++) { // read memory
    rd_addr.write(addr+20);
    addr++;

    inst.run(write_addr_data, rd_addr,rd_data);
  }
  /*
  addr=0;
  read_enable = true;
  for (int i=0; i<20; i++) { // read and write memory
    data.addr = addr;
    data.data = addr+100;

    write_addr_data.write(data);
    rd_addr.write(addr+20);
    addr++;

    inst.run(write_addr_data, rd_addr,rd_data);
  }
  */
  CCS_RETURN(0);
}

