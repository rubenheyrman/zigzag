--+-----------------------------------------------------------------------------------+
--|                                                                                   |
--| Generated by PowerPro-10.3c_2/849904   (Jan 10 2020)  linux64  P2001101230        |
--| on Tue Jul 13 11:48:10 2021.                                                      |
--|                                                                                   |
--| This document may be used and distributed without restriction provided that       |
--| this copyright statement is not removed from the file and that any derivative     |
--| work contains this copyright notice.                                              |
--|                                                                                   |
--+-----------------------------------------------------------------------------------+

library ieee;
use ieee.std_logic_1164.all;

package top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package is
  component cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
  port ( 
        O_wr_data_rsci_oswt : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_biwt : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bdwt : in std_logic_vector(0 downto 0);
        run_wen_drv : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bcwt : in std_logic_vector(0 downto 0);
        rst_2 : in std_logic_vector(0 downto 0);
        or_tmp_242 : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
  port ( 
        run_wten_d : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bcwt_d : in std_logic_vector(0 downto 0);
        reg_O_wr_data_rsci_irdy_run_psct_cse_d : in std_logic_vector(0 downto 0);
        E_4802 : in std_logic_vector(0 downto 0);
        reg_O_wr_data_rsci_irdy_run_psct_cse : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
  port ( 
        I_wr_data_rsci_oswt : in std_logic_vector(0 downto 0);
        fsm_output : in std_logic_vector(1 downto 0);
        I_wr_data_rsci_biwt : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_bdwt : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_bcwt : in std_logic_vector(0 downto 0);
        rst_3 : in std_logic_vector(0 downto 0);
        run_wen_drv : in std_logic_vector(0 downto 0);
        and_tmp_80 : in std_logic_vector(0 downto 0);
        mux_360_nl : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
  port ( 
        I_wr_data_rsci_bcwt_d : in std_logic_vector(0 downto 0);
        run_wten_d : in std_logic_vector(0 downto 0);
        reg_I_wr_data_rsci_irdy_run_psct_cse_d : in std_logic_vector(0 downto 0);
        E_4802 : in std_logic_vector(0 downto 0);
        reg_I_wr_data_rsci_irdy_run_psct_cse : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
  port ( 
        rst : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_ivld : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
  port ( 
        W_wr_data_rsci_ivld_bfwt_d : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
  port ( 
        rst : in std_logic_vector(0 downto 0);
        fsm_output : in std_logic_vector(1 downto 0);
        land_9_lpi_1_dfm_1 : in std_logic_vector(0 downto 0);
        O_write_data_data_sva_en : out std_logic_vector(0 downto 0)
       );
  end component;

  component cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
  port ( 
        land_9_lpi_1_dfm_1_1_d : in std_logic_vector(0 downto 0);
        reg_W_instr_in_rsci_oswt_cse_1_d : in std_logic_vector(0 downto 0);
        O_write_data_data_sva_en : out std_logic_vector(0 downto 0)
       );
  end component;

end package;


 -- QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
 --            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.vhdl:2094
 --
 --            Area before justification: 4.788
 --            Area after  justification: 15.162( 216.667% increase )
 --
 --            Signals with hierarchical names need to have new hierarchy ports/signals created.

 -- wire O_wr_data_rsci_idat_bfwt_en ; 

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
  port ( 
        O_wr_data_rsci_oswt : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_biwt : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bdwt : in std_logic_vector(0 downto 0);
        run_wen_drv : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bcwt : in std_logic_vector(0 downto 0);
        rst_2 : in std_logic_vector(0 downto 0);
        or_tmp_242 : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
 signal E_3 : std_logic_vector(0 downto 0);
 signal E_4 : std_logic_vector(0 downto 0);
 signal E_5 : std_logic_vector(0 downto 0);
 signal E_6 : std_logic_vector(0 downto 0);
 signal E_7 : std_logic_vector(0 downto 0);
 signal E_8 : std_logic_vector(0 downto 0);
 signal E_9 : std_logic_vector(0 downto 0);
 signal E_10 : std_logic_vector(0 downto 0);
begin
 inst_cg_db_obs_topless_5comma_32comma_1c : cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
    port map (
              run_wten_d => E_9,
              O_wr_data_rsci_bcwt_d => E_1,
              reg_O_wr_data_rsci_irdy_run_psct_cse_d => E_3,
              E_4802 => E_2,
              reg_O_wr_data_rsci_irdy_run_psct_cse => O_wr_data_rsci_oswt,
              O_wr_data_rsci_idat_bfwt_en => O_wr_data_rsci_idat_bfwt_en
              );
 E_2 <= ( rst_2 or run_wen_drv ) ;

 process (rst_2, or_tmp_242, E_4)
 begin
	case rst_2 is
		when "0" => E_3 <= or_tmp_242;
		when others => E_3 <= E_4;
	end case;
 end process;
 E_4 <= "0";

 process (rst_2, E_5, E_4)
 begin
	case rst_2 is
		when "0" => E_1 <= E_5;
		when others => E_1 <= E_4;
	end case;
 end process;
 E_5 <= ( not (E_6) ) ;
 E_6 <= ( E_7 or O_wr_data_rsci_bdwt ) ;
 E_7 <= ( not (E_8) ) ;
 E_8 <= ( O_wr_data_rsci_bcwt or O_wr_data_rsci_biwt ) ;

 process (rst_2, E_10, E_4)
 begin
	case rst_2 is
		when "0" => E_9 <= E_10;
		when others => E_9 <= E_4;
	end case;
 end process;
 E_10 <= ( not (run_wen_drv) ) ;
end architecture;

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
  port ( 
        run_wten_d : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_bcwt_d : in std_logic_vector(0 downto 0);
        reg_O_wr_data_rsci_irdy_run_psct_cse_d : in std_logic_vector(0 downto 0);
        E_4802 : in std_logic_vector(0 downto 0);
        reg_O_wr_data_rsci_irdy_run_psct_cse : in std_logic_vector(0 downto 0);
        O_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
 signal E_3 : std_logic_vector(0 downto 0);
 signal E_4 : std_logic_vector(0 downto 0);
begin
 O_wr_data_rsci_idat_bfwt_en <= ( run_wten_d or E_1 ) ;
 E_1 <= ( O_wr_data_rsci_bcwt_d or E_2 ) ;
 E_2 <= ( nor_reduce (E_3) ) ;
 E_3 <= ( reg_O_wr_data_rsci_irdy_run_psct_cse_d and E_4 ) ;
 E_4 <= ( E_4802 or reg_O_wr_data_rsci_irdy_run_psct_cse ) ;
end architecture;


 -- QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
 --            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.vhdl:1856
 --
 --            Area before justification: 4.788
 --            Area after  justification: 17.822( 272.222% increase )
 --
 --            Signals with hierarchical names need to have new hierarchy ports/signals created.

 -- wire I_wr_data_rsci_idat_bfwt_en ; 

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
  port ( 
        I_wr_data_rsci_oswt : in std_logic_vector(0 downto 0);
        fsm_output : in std_logic_vector(1 downto 0);
        I_wr_data_rsci_biwt : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_bdwt : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_bcwt : in std_logic_vector(0 downto 0);
        rst_3 : in std_logic_vector(0 downto 0);
        run_wen_drv : in std_logic_vector(0 downto 0);
        and_tmp_80 : in std_logic_vector(0 downto 0);
        mux_360_nl : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
 signal E_3 : std_logic_vector(0 downto 0);
 signal E_4 : std_logic_vector(0 downto 0);
 signal E_5 : std_logic_vector(0 downto 0);
 signal E_6 : std_logic_vector(0 downto 0);
 signal E_7 : std_logic_vector(0 downto 0);
 signal E_8 : std_logic_vector(0 downto 0);
 signal E_9 : std_logic_vector(0 downto 0);
 signal E_10 : std_logic_vector(0 downto 0);
 signal E_11 : std_logic_vector(0 downto 0);
 signal E_12 : std_logic_vector(0 downto 0);
 signal E_13 : std_logic_vector(0 downto 0);
 signal E_14 : std_logic_vector(0 downto 0);
begin
 inst_cg_db_obs_topless_5comma_32comma_1c : cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
    port map (
              I_wr_data_rsci_bcwt_d => E_1,
              run_wten_d => E_9,
              reg_I_wr_data_rsci_irdy_run_psct_cse_d => E_3,
              E_4802 => E_2,
              reg_I_wr_data_rsci_irdy_run_psct_cse => I_wr_data_rsci_oswt,
              I_wr_data_rsci_idat_bfwt_en => I_wr_data_rsci_idat_bfwt_en
              );
 E_2 <= ( rst_3 or run_wen_drv ) ;

 process (rst_3, E_4, E_8)
 begin
	case rst_3 is
		when "0" => E_3 <= E_4;
		when others => E_3 <= E_8;
	end case;
 end process;
 E_4 <= ( E_5 and E_7 ) ;
 E_5 <= ( mux_360_nl or E_6 ) ;
 E_6 <= ( not (and_tmp_80) ) ;
 E_7 <= ( fsm_output(1 downto 1) ) ;
 E_8 <= "0";

 process (rst_3, E_10, E_8)
 begin
	case rst_3 is
		when "0" => E_9 <= E_10;
		when others => E_9 <= E_8;
	end case;
 end process;
 E_10 <= ( not (run_wen_drv) ) ;

 process (rst_3, E_11, E_8)
 begin
	case rst_3 is
		when "0" => E_1 <= E_11;
		when others => E_1 <= E_8;
	end case;
 end process;
 E_11 <= ( not (E_12) ) ;
 E_12 <= ( E_13 or I_wr_data_rsci_bdwt ) ;
 E_13 <= ( not (E_14) ) ;
 E_14 <= ( I_wr_data_rsci_bcwt or I_wr_data_rsci_biwt ) ;
end architecture;

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
  port ( 
        I_wr_data_rsci_bcwt_d : in std_logic_vector(0 downto 0);
        run_wten_d : in std_logic_vector(0 downto 0);
        reg_I_wr_data_rsci_irdy_run_psct_cse_d : in std_logic_vector(0 downto 0);
        E_4802 : in std_logic_vector(0 downto 0);
        reg_I_wr_data_rsci_irdy_run_psct_cse : in std_logic_vector(0 downto 0);
        I_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
 signal E_3 : std_logic_vector(0 downto 0);
 signal E_4 : std_logic_vector(0 downto 0);
begin
 I_wr_data_rsci_idat_bfwt_en <= ( I_wr_data_rsci_bcwt_d or E_1 ) ;
 E_1 <= ( run_wten_d or E_2 ) ;
 E_2 <= ( nor_reduce (E_3) ) ;
 E_3 <= ( reg_I_wr_data_rsci_irdy_run_psct_cse_d and E_4 ) ;
 E_4 <= ( E_4802 or reg_I_wr_data_rsci_irdy_run_psct_cse ) ;
end architecture;


 -- QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
 --            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.vhdl:1724
 --
 --            Area before justification: 0
 --            Area after  justification: 1.862( 100% increase )
 --
 --            Signals with hierarchical names need to have new hierarchy ports/signals created.

 -- wire W_wr_data_rsci_idat_bfwt_en ; 

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
  port ( 
        rst : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_ivld : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
begin
 inst_cg_db_obs_topless_5comma_32comma_1c : cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
    port map (
              W_wr_data_rsci_ivld_bfwt_d => E_1,
              W_wr_data_rsci_idat_bfwt_en => W_wr_data_rsci_idat_bfwt_en
              );

 process (rst, W_wr_data_rsci_ivld, E_2)
 begin
	case rst is
		when "0" => E_1 <= W_wr_data_rsci_ivld;
		when others => E_1 <= E_2;
	end case;
 end process;
 E_2 <= "0";
end architecture;

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
  port ( 
        W_wr_data_rsci_ivld_bfwt_d : in std_logic_vector(0 downto 0);
        W_wr_data_rsci_idat_bfwt_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031 is 
begin
 W_wr_data_rsci_idat_bfwt_en <= W_wr_data_rsci_ivld_bfwt_d ;
end architecture;


 -- QuickLink: Instance: top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001.PE.rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst, Module: topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
 --            Source-relation: power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.vhdl:5044
 --
 --            Area before justification: 1.596
 --            Area after  justification: 5.852( 266.667% increase )
 --
 --            Signals with hierarchical names need to have new hierarchy ports/signals created.

 -- wire O_write_data_data_sva_en ; 

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
  port ( 
        rst : in std_logic_vector(0 downto 0);
        fsm_output : in std_logic_vector(1 downto 0);
        land_9_lpi_1_dfm_1 : in std_logic_vector(0 downto 0);
        O_write_data_data_sva_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
 signal E_1 : std_logic_vector(0 downto 0);
 signal E_2 : std_logic_vector(0 downto 0);
 signal E_3 : std_logic_vector(0 downto 0);
 signal E_4 : std_logic_vector(0 downto 0);
 signal E_5 : std_logic_vector(0 downto 0);
begin
 inst_cg_db_obs_topless_5comma_32comma_1c : cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
    port map (
              land_9_lpi_1_dfm_1_1_d => E_2,
              reg_W_instr_in_rsci_oswt_cse_1_d => E_1,
              O_write_data_data_sva_en => O_write_data_data_sva_en
              );

 process (rst, E_3, E_5)
 begin
	case rst is
		when "0" => E_1 <= E_3;
		when others => E_1 <= E_5;
	end case;
 end process;
 E_3 <= ( not (E_4) ) ;
 E_4 <= ( fsm_output(1 downto 1) ) ;
 E_5 <= "0";

 process (rst, land_9_lpi_1_dfm_1, E_5)
 begin
	case rst is
		when "0" => E_2 <= land_9_lpi_1_dfm_1;
		when others => E_2 <= E_5;
	end case;
 end process;
end architecture;

library ieee, work;
library calypto_lib;
use ieee.std_logic_1164.all;
use calypto_lib.powerpro_cg_package.all;
use calypto_lib.top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000_calypto_package.all;

entity cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
  port ( 
        land_9_lpi_1_dfm_1_1_d : in std_logic_vector(0 downto 0);
        reg_W_instr_in_rsci_oswt_cse_1_d : in std_logic_vector(0 downto 0);
        O_write_data_data_sva_en : out std_logic_vector(0 downto 0)
       );
end entity;

architecture rtl of cg_db_obs_topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003 is 
 signal E_1 : std_logic_vector(0 downto 0);
begin
 O_write_data_data_sva_en <= ( E_1 or reg_W_instr_in_rsci_oswt_cse_1_d ) ;
 E_1 <= ( nor_reduce (land_9_lpi_1_dfm_1_1_d) ) ;
end architecture;

