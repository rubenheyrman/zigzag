scheme_name =: two_flop_synch_2
scheme_status =: OFF
register_node =: FLOP : D CLK EN : Q : CPL_MACROFF
register_node =: BUF : L : O : CPL_BUF
register_node =: INV : L : O : CPL_INV
instantiate_node =: LEVEL_1 : FLOP : CLK2
instantiate_node =: LEVEL_2 : FLOP : CLK2
instantiate_node =: FLOP_DIFF_DOMAIN : FLOP : CLK1

#any number of buffers and inverters are allowed on both critical connection
make_connection =: path1 : LEVEL_2.Q  : LEVEL_1.D  :  BUF-* INV-*
make_connection =: path2 : FLOP_DIFF_DOMAIN.Q  : LEVEL_2.D  :  BUF-* INV-* : 1

scheme_output_port =: LEVEL_1.Q
