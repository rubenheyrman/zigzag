//
// Copyright 2003-2019 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
// MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// 
#ifndef _INCLUDED_MEM_BLOCK_REF_H_
#define _INCLUDED_MEM_BLOCK_REF_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include "types.h"
#include <mc_scverify.h>

#pragma hls_design top
class mem_block_ref
{
public:
  mem_block_ref() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<addrData> &write_addr_data, ac_channel<int> &rd_addr, bool read_enable, ac_channel<ac_int<128,false> > &rd_data) {
    ac_int<128,false> read_data;
    int read_addr=0;

    if (read_enable) {
      read_addr = rd_addr.read();
      read_data = mem[read_addr];
      rd_data.write(read_data);
    }

    write_data = write_addr_data.read();
    mem[write_data.addr] = write_data.data;
  }

private: // data
  addrData   write_data;
  ac_int<128,false>        mem[1296];
};

#endif

