scheme_name =: common_select
scheme_status =: OFF
register_node =: FLOP : D CLK WEN : Q : CPL_MACROFF
register_node =: SYNCH : : Q : SYNCHRONIZER
register_node =: MUX : s IGNORE IGNORE : O : CPL_MUX
register_node =: BUF : L : O : CPL_BUF
register_node =: INV : L : O : CPL_INV
instantiate_node =: FLOP_OUT : FLOP : CLK2
instantiate_node =: FLOP_DIFF_DOMAIN : FLOP : CLK1
instantiate_node =: mux : MUX : 
instantiate_node =: marked_synch : SYNCH : CLK2
scheme_output_port =: FLOP_OUT.Q

make_connection =: pathA   : FLOP_DIFF_DOMAIN.Q  : mux.IGNORE  :  BUF-* INV-* : 1
make_connection =: feedback   : FLOP_OUT.Q  : mux.IGNORE  :  BUF-* INV-* : 1
make_connection =: pathB   : mux.O  : FLOP_OUT.D  :  BUF-* INV-*
make_connection =: pathC   : marked_synch.Q  : mux.s  :  BUF-* INV-*

