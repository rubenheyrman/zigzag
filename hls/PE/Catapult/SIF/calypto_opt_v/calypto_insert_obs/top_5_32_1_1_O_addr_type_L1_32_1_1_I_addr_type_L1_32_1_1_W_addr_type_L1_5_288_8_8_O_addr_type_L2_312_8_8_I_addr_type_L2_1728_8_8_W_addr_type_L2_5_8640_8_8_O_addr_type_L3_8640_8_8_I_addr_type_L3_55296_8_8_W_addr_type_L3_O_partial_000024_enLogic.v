//+-----------------------------------------------------------------------------------+
//|                                                                                   |
//| Generated by PowerPro-10.3c_2/849904   (Jan 10 2020)  linux64  P2001101230        |
//| on Tue Jul 13 11:49:59 2021.                                                      |
//|                                                                                   |
//| This document may be used and distributed without restriction provided that       |
//| this copyright statement is not removed from the file and that any derivative     |
//| work contains this copyright notice.                                              |
//|                                                                                   |
//+-----------------------------------------------------------------------------------+

//This verilog contains verilog 2001 constructs.


 // QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
 //            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.v:1648
 //
 //            Area before justification: 4.788
 //            Area after  justification: 15.162( 216.667% increase )
 //
 //            Signals with hierarchical names need to have new hierarchy ports/signals created.

 // wire O_wr_data_rsci_idat_bfwt_en ; 


module cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 ( O_wr_data_rsci_oswt
 , O_wr_data_rsci_biwt , O_wr_data_rsci_bdwt , O_wr_data_rsci_idat_bfwt_en
 , run_wen_1 , O_wr_data_rsci_bcwt , rst_2 , or_tmp_242 ) ;
 input wire  O_wr_data_rsci_oswt ; 
 input wire  O_wr_data_rsci_biwt ; 
 input wire  O_wr_data_rsci_bdwt ; 
 input wire  run_wen_1 ; 
 input wire  O_wr_data_rsci_bcwt ; 
 input wire  rst_2 ; 
 input wire  or_tmp_242 ; 
 output wire  O_wr_data_rsci_idat_bfwt_en ; 
 wire E_1 ; 
 wire E_2 ; 
 wire E_3 ; 
 wire  [0:0] E_4 ; 
 wire E_5 ; 
 wire E_6 ; 
 wire E_7 ; 
 wire E_8 ; 
 wire E_9 ; 
 wire E_10 ; 
cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016  inst_cg_db_obs_topless_5comma_32comma_1c ( 
		.run_wten_d ( E_9 )  , .O_wr_data_rsci_bcwt_d ( E_1 )  , .reg_O_wr_data_rsci_irdy_run_psct_cse_d ( E_3 )  , 
		.E_6317 ( E_2 )  , .reg_O_wr_data_rsci_irdy_run_psct_cse ( O_wr_data_rsci_oswt )  , 
		.O_wr_data_rsci_idat_bfwt_en ( O_wr_data_rsci_idat_bfwt_en )  );
  assign /* unsigned    bit */  E_2 = (rst_2 | run_wen_1) ;
  assign /* unsigned    bit */  E_3 = ( rst_2 ? E_4 : or_tmp_242 ) ;
  assign /* unsigned  1-bit */  E_4 = 1'h0;
  assign /* unsigned    bit */  E_1 = ( rst_2 ? E_4 : E_5 ) ;
  assign /* unsigned    bit */  E_5 = ( ~E_6 ) ;
  assign /* unsigned    bit */  E_6 = (E_7 | O_wr_data_rsci_bdwt) ;
  assign /* unsigned    bit */  E_7 = ( ~E_8 ) ;
  assign /* unsigned    bit */  E_8 = (O_wr_data_rsci_bcwt | O_wr_data_rsci_biwt) ;
  assign /* unsigned    bit */  E_9 = ( rst_2 ? E_4 : E_10 ) ;
  assign /* unsigned    bit */  E_10 = ( ~run_wen_1 ) ;
endmodule

module cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 ( run_wten_d
 , O_wr_data_rsci_bcwt_d , reg_O_wr_data_rsci_irdy_run_psct_cse_d , E_6317
 , reg_O_wr_data_rsci_irdy_run_psct_cse , O_wr_data_rsci_idat_bfwt_en ) ;
 input wire  run_wten_d ; 
 input wire  O_wr_data_rsci_bcwt_d ; 
 input wire  reg_O_wr_data_rsci_irdy_run_psct_cse_d ; 
 input wire  E_6317 ; 
 input wire  reg_O_wr_data_rsci_irdy_run_psct_cse ; 
 output wire  O_wr_data_rsci_idat_bfwt_en ; 
 wire E_1 ; 
 wire E_2 ; 
 wire E_3 ; 
 wire E_4 ; 
  assign /* unsigned    bit */  O_wr_data_rsci_idat_bfwt_en = (run_wten_d | E_1) ;
  assign /* unsigned    bit */  E_1 = (O_wr_data_rsci_bcwt_d | E_2) ;
  assign /* unsigned    bit */  E_2 = ( !E_3 ) ;
  assign /* unsigned    bit */  E_3 = (reg_O_wr_data_rsci_irdy_run_psct_cse_d & E_4) ;
  assign /* unsigned    bit */  E_4 = (E_6317 | reg_O_wr_data_rsci_irdy_run_psct_cse) ;
  function convertXtoHigh;
   input in_en;
   if(in_en == 1'b0)
     convertXtoHigh = 1'b0;
   else
     convertXtoHigh = 1'b1;
  endfunction
endmodule


 // QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
 //            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.v:1450
 //
 //            Area before justification: 4.788
 //            Area after  justification: 17.822( 272.222% increase )
 //
 //            Signals with hierarchical names need to have new hierarchy ports/signals created.

 // wire I_wr_data_rsci_idat_bfwt_en ; 


module cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 ( I_wr_data_rsci_oswt
 , fsm_output , I_wr_data_rsci_biwt , I_wr_data_rsci_bdwt , I_wr_data_rsci_idat_bfwt_en
 , I_wr_data_rsci_bcwt , rst_3 , run_wen_1 , and_tmp_80 , mux_360_nl ) ;
 input wire  I_wr_data_rsci_oswt ; 
 input wire  [1:0]  fsm_output ; 
 input wire  I_wr_data_rsci_biwt ; 
 input wire  I_wr_data_rsci_bdwt ; 
 input wire  I_wr_data_rsci_bcwt ; 
 input wire  rst_3 ; 
 input wire  run_wen_1 ; 
 input wire  and_tmp_80 ; 
 input wire  [0:0]  mux_360_nl ; 
 output wire  I_wr_data_rsci_idat_bfwt_en ; 
 wire E_1 ; 
 wire E_2 ; 
 wire E_3 ; 
 wire E_4 ; 
 wire E_5 ; 
 wire E_6 ; 
 wire  [0:0] E_7 ; 
 wire  [0:0] E_8 ; 
 wire E_9 ; 
 wire E_10 ; 
 wire E_11 ; 
 wire E_12 ; 
 wire E_13 ; 
 wire E_14 ; 
cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026  inst_cg_db_obs_topless_5comma_32comma_1c ( 
		.I_wr_data_rsci_bcwt_d ( E_1 )  , .run_wten_d ( E_9 )  , .reg_I_wr_data_rsci_irdy_run_psct_cse_d ( E_3 )  , 
		.E_6317 ( E_2 )  , .reg_I_wr_data_rsci_irdy_run_psct_cse ( I_wr_data_rsci_oswt )  , 
		.I_wr_data_rsci_idat_bfwt_en ( I_wr_data_rsci_idat_bfwt_en )  );
  assign /* unsigned    bit */  E_2 = (rst_3 | run_wen_1) ;
  assign /* unsigned    bit */  E_3 = ( rst_3 ? E_8 : E_4 ) ;
  assign /* unsigned    bit */  E_4 = (E_5 & E_7) ;
  assign /* unsigned    bit */  E_5 = (mux_360_nl | E_6) ;
  assign /* unsigned    bit */  E_6 = ( ~and_tmp_80 ) ;
  assign /* unsigned  1-bit */  E_7 = fsm_output [1]  ;
  assign /* unsigned  1-bit */  E_8 = 1'h0;
  assign /* unsigned    bit */  E_9 = ( rst_3 ? E_8 : E_10 ) ;
  assign /* unsigned    bit */  E_10 = ( ~run_wen_1 ) ;
  assign /* unsigned    bit */  E_1 = ( rst_3 ? E_8 : E_11 ) ;
  assign /* unsigned    bit */  E_11 = ( ~E_12 ) ;
  assign /* unsigned    bit */  E_12 = (E_13 | I_wr_data_rsci_bdwt) ;
  assign /* unsigned    bit */  E_13 = ( ~E_14 ) ;
  assign /* unsigned    bit */  E_14 = (I_wr_data_rsci_bcwt | I_wr_data_rsci_biwt) ;
endmodule

module cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 ( I_wr_data_rsci_bcwt_d
 , run_wten_d , reg_I_wr_data_rsci_irdy_run_psct_cse_d , E_6317 , reg_I_wr_data_rsci_irdy_run_psct_cse
 , I_wr_data_rsci_idat_bfwt_en ) ;
 input wire  I_wr_data_rsci_bcwt_d ; 
 input wire  run_wten_d ; 
 input wire  reg_I_wr_data_rsci_irdy_run_psct_cse_d ; 
 input wire  E_6317 ; 
 input wire  reg_I_wr_data_rsci_irdy_run_psct_cse ; 
 output wire  I_wr_data_rsci_idat_bfwt_en ; 
 wire E_1 ; 
 wire E_2 ; 
 wire E_3 ; 
 wire E_4 ; 
  assign /* unsigned    bit */  I_wr_data_rsci_idat_bfwt_en = (I_wr_data_rsci_bcwt_d | E_1) ;
  assign /* unsigned    bit */  E_1 = (run_wten_d | E_2) ;
  assign /* unsigned    bit */  E_2 = ( !E_3 ) ;
  assign /* unsigned    bit */  E_3 = (reg_I_wr_data_rsci_irdy_run_psct_cse_d & E_4) ;
  assign /* unsigned    bit */  E_4 = (E_6317 | reg_I_wr_data_rsci_irdy_run_psct_cse) ;
  function convertXtoHigh;
   input in_en;
   if(in_en == 1'b0)
     convertXtoHigh = 1'b0;
   else
     convertXtoHigh = 1'b1;
  endfunction
endmodule


 // QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
 //            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.v:1336
 //
 //            Area before justification: 0
 //            Area after  justification: 1.862( 100% increase )
 //
 //            Signals with hierarchical names need to have new hierarchy ports/signals created.

 // wire W_wr_data_rsci_idat_bfwt_en ; 


module cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 ( rst
 , W_wr_data_rsci_ivld , W_wr_data_rsci_idat_bfwt_en ) ;
 input wire  rst ; 
 input wire  W_wr_data_rsci_ivld ; 
 output wire  W_wr_data_rsci_idat_bfwt_en ; 
 wire E_1 ; 
 wire E_2 ; 
cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031  inst_cg_db_obs_topless_5comma_32comma_1c ( 
		.W_wr_data_rsci_ivld_bfwt_d ( E_1 )  , .W_wr_data_rsci_idat_bfwt_en ( W_wr_data_rsci_idat_bfwt_en )  );
  assign /* unsigned    bit */  E_1 = ( rst ? E_2 : W_wr_data_rsci_ivld ) ;
  assign /* unsigned    bit */  E_2 = 1'h0;
endmodule

module cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 ( W_wr_data_rsci_ivld_bfwt_d
 , W_wr_data_rsci_idat_bfwt_en ) ;
 input wire  W_wr_data_rsci_ivld_bfwt_d ; 
 output wire  W_wr_data_rsci_idat_bfwt_en ; 
assign W_wr_data_rsci_idat_bfwt_en = W_wr_data_rsci_ivld_bfwt_d ;
  function convertXtoHigh;
   input in_en;
   if(in_en == 1'b0)
     convertXtoHigh = 1'b0;
   else
     convertXtoHigh = 1'b1;
  endfunction
endmodule


 // QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
 //            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.v:3529
 //
 //            Area before justification: 1.596
 //            Area after  justification: 5.852( 266.667% increase )
 //
 //            Signals with hierarchical names need to have new hierarchy ports/signals created.

 // wire O_write_data_data_sva_en ; 


module cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 ( rst
 , fsm_output , O_write_data_data_sva_en , land_9_lpi_1_dfm_1 ) ;
 input wire  rst ; 
 input wire  [1:0]  fsm_output ; 
 input wire  land_9_lpi_1_dfm_1 ; 
 output wire  O_write_data_data_sva_en ; 
 wire E_1 ; 
 wire E_2 ; 
 wire E_3 ; 
 wire  [0:0] E_4 ; 
 wire  [0:0] E_5 ; 
cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003  inst_cg_db_obs_topless_5comma_32comma_1c ( 
		.land_9_lpi_1_dfm_1_1_d ( E_2 )  , .reg_W_instr_in_rsci_oswt_cse_1_d ( E_1 )  , 
		.O_write_data_data_sva_en ( O_write_data_data_sva_en )  );
  assign /* unsigned    bit */  E_1 = ( rst ? E_5 : E_3 ) ;
  assign /* unsigned    bit */  E_3 = ( ~E_4 ) ;
  assign /* unsigned  1-bit */  E_4 = fsm_output [1]  ;
  assign /* unsigned  1-bit */  E_5 = 1'h0;
  assign /* unsigned    bit */  E_2 = ( rst ? E_5 : land_9_lpi_1_dfm_1 ) ;
endmodule

module cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 ( land_9_lpi_1_dfm_1_1_d
 , reg_W_instr_in_rsci_oswt_cse_1_d , O_write_data_data_sva_en ) ;
 input wire  land_9_lpi_1_dfm_1_1_d ; 
 input wire  reg_W_instr_in_rsci_oswt_cse_1_d ; 
 output wire  O_write_data_data_sva_en ; 
 wire E_1 ; 
  assign /* unsigned    bit */  O_write_data_data_sva_en = (E_1 | reg_W_instr_in_rsci_oswt_cse_1_d) ;
  assign /* unsigned    bit */  E_1 = ( !land_9_lpi_1_dfm_1_1_d ) ;
  function convertXtoHigh;
   input in_en;
   if(in_en == 1'b0)
     convertXtoHigh = 1'b0;
   else
     convertXtoHigh = 1'b1;
  endfunction
endmodule

