scheme_name =: common_enable
scheme_status =: OFF
register_node =: FLOP : D CLK WEN : Q : CPL_MACROFF
register_node =: SYNCH : : Q : SYNCHRONIZER
register_node =: BUF : L : O : CPL_BUF
register_node =: INV : L : O : CPL_INV
instantiate_node =: FLOP_OUT : FLOP : CLK2
instantiate_node =: FLOP_DIFF_DOMAIN : FLOP : CLK1
instantiate_node =: marked_synch : SYNCH : CLK2
scheme_output_port =: FLOP_OUT.Q

#no logic is allowed on any critical connection
make_connection =: pathA   : FLOP_DIFF_DOMAIN.Q  : FLOP_OUT.D  :  BUF-* INV-* : 1
make_connection =: pathB   : marked_synch.Q  : FLOP_OUT.WEN  :  BUF-* INV-*

