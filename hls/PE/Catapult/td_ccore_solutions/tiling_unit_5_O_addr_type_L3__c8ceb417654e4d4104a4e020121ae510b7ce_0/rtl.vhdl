-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   r0678912@amazone.esat.kuleuven.be
--  Generated date: Tue Jul 13 10:57:58 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    tiling_unit_5_O_addr_type_L3_run
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.ccs_in_pkg_v1.ALL;
USE mgc_hls.mgc_out_dreg_pkg_v2.ALL;


ENTITY tiling_unit_5_O_addr_type_L3_run IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END tiling_unit_5_O_addr_type_L3_run;

ARCHITECTURE v1 OF tiling_unit_5_O_addr_type_L3_run IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat : STD_LOGIC;
  SIGNAL instr_bound_rsci_d_69_56 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_55_42 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_41_28 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_27_14 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_13_0 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_13_9 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_55_51 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_50_42 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_41_37 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_36_28 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_27_23 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_14 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_13_9_cse : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_8_0_cse : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_8_0_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_55_51_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_50_42_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_lpi_1_dfm_13_9_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_41_37_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_36_28_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_27_23_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_14_mx0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_6 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_7 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_8 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_9 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_10 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_and_cse : STD_LOGIC;

  SIGNAL loops_bound_rsci_dat : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 : STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL instr_bound_rsci_z : STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL instr_tile_rsci_d : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL instr_tile_rsci_z : STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z : STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_14_2_2(input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_9_2_2(input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(8 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  loops_bound_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 11,
      width => 70
      )
    PORT MAP(
      dat => loops_bound_rsci_dat,
      idat => loops_bound_rsci_idat_1
    );
  loops_bound_rsci_dat <= loops_bound_rsc_dat;
  loops_bound_rsci_idat <= loops_bound_rsci_idat_1;

  loops_relevancy_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 12,
      width => 5
      )
    PORT MAP(
      dat => loops_relevancy_rsci_dat,
      idat => loops_relevancy_rsci_idat_1
    );
  loops_relevancy_rsci_dat <= loops_relevancy_rsc_dat;
  loops_relevancy_rsci_idat <= loops_relevancy_rsci_idat_1;

  instr_bound_rsci : mgc_hls.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 14,
      width => 70
      )
    PORT MAP(
      d => instr_bound_rsci_d,
      z => instr_bound_rsci_z
    );
  instr_bound_rsci_d <= instr_bound_rsci_d_69_56 & instr_bound_rsci_d_55_42 & instr_bound_rsci_d_41_28
      & instr_bound_rsci_d_27_14 & instr_bound_rsci_d_13_0;
  instr_bound_rsc_z <= instr_bound_rsci_z;

  instr_tile_rsci : mgc_hls.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 15,
      width => 70
      )
    PORT MAP(
      d => instr_tile_rsci_d,
      z => instr_tile_rsci_z
    );
  instr_tile_rsci_d <= reg_tile_size_out_rsci_d_13_9_cse & reg_tile_size_out_rsci_d_8_0_cse
      & instr_tile_rsci_d_55_51 & instr_tile_rsci_d_50_42 & instr_tile_rsci_d_41_37
      & instr_tile_rsci_d_36_28 & instr_tile_rsci_d_27_23 & instr_tile_rsci_d_22_14
      & instr_tile_rsci_d_13_9 & instr_tile_rsci_d_8_0;
  instr_tile_rsc_z <= instr_tile_rsci_z;

  tile_size_in_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 126,
      width => 14
      )
    PORT MAP(
      dat => tile_size_in_rsci_dat,
      idat => tile_size_in_rsci_idat_1
    );
  tile_size_in_rsci_dat <= tile_size_in_rsc_dat;
  tile_size_in_rsci_idat <= tile_size_in_rsci_idat_1;

  tile_size_out_rsci : mgc_hls.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 127,
      width => 14
      )
    PORT MAP(
      d => tile_size_out_rsci_d,
      z => tile_size_out_rsci_z
    );
  tile_size_out_rsci_d <= reg_tile_size_out_rsci_d_13_9_cse & reg_tile_size_out_rsci_d_8_0_cse;
  tile_size_out_rsc_z <= tile_size_out_rsci_z;

  ccs_ccore_start_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 135,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  tile_size_and_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  instr_tile_rsci_d_8_0_mx0 <= MUX_v_9_2_2((tile_size_in_rsci_idat(8 DOWNTO 0)),
      (tile_size_int_sva_6(8 DOWNTO 0)), loops_relevancy_rsci_idat(0));
  instr_tile_rsci_d_55_51_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_41_37_mx0, (tile_size_int_sva_9(13
      DOWNTO 9)), loops_relevancy_rsci_idat(3));
  instr_tile_rsci_d_50_42_mx0 <= MUX_v_9_2_2(instr_tile_rsci_d_36_28_mx0, (tile_size_int_sva_9(8
      DOWNTO 0)), loops_relevancy_rsci_idat(3));
  tile_size_int_lpi_1_dfm_13_9_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), (tile_size_int_sva_6(13
      DOWNTO 9)), (loops_relevancy_rsci_idat(0)));
  instr_tile_rsci_d_41_37_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_27_23_mx0, (tile_size_int_sva_8(13
      DOWNTO 9)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_36_28_mx0 <= MUX_v_9_2_2(instr_tile_rsci_d_22_14_mx0, (tile_size_int_sva_8(8
      DOWNTO 0)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_27_23_mx0 <= MUX_v_5_2_2(tile_size_int_lpi_1_dfm_13_9_1, (tile_size_int_sva_7(13
      DOWNTO 9)), loops_relevancy_rsci_idat(1));
  instr_tile_rsci_d_22_14_mx0 <= MUX_v_9_2_2(instr_tile_rsci_d_8_0_mx0, (tile_size_int_sva_7(8
      DOWNTO 0)), loops_relevancy_rsci_idat(1));
  tile_size_int_sva_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_in_rsci_idat(8
      DOWNTO 0)) * UNSIGNED(loops_bound_rsci_idat(13 DOWNTO 0))), 14));
  tile_size_int_sva_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_int_lpi_1_dfm_13_9_1
      & instr_tile_rsci_d_8_0_mx0) * UNSIGNED(loops_bound_rsci_idat(27 DOWNTO 14))),
      14));
  tile_size_int_sva_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_27_23_mx0
      & instr_tile_rsci_d_22_14_mx0) * UNSIGNED(loops_bound_rsci_idat(41 DOWNTO 28))),
      14));
  tile_size_int_sva_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_41_37_mx0
      & instr_tile_rsci_d_36_28_mx0) * UNSIGNED(loops_bound_rsci_idat(55 DOWNTO 42))),
      14));
  tile_size_int_sva_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_55_51_mx0
      & instr_tile_rsci_d_50_42_mx0) * UNSIGNED(loops_bound_rsci_idat(69 DOWNTO 56))),
      14));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        reg_tile_size_out_rsci_d_13_9_cse <= STD_LOGIC_VECTOR'( "00000");
        reg_tile_size_out_rsci_d_8_0_cse <= STD_LOGIC_VECTOR'( "000000000");
        instr_tile_rsci_d_13_9 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( tile_size_and_cse = '1' ) THEN
        reg_tile_size_out_rsci_d_13_9_cse <= MUX_v_5_2_2(instr_tile_rsci_d_55_51_mx0,
            (tile_size_int_sva_10(13 DOWNTO 9)), loops_relevancy_rsci_idat(4));
        reg_tile_size_out_rsci_d_8_0_cse <= MUX_v_9_2_2(instr_tile_rsci_d_50_42_mx0,
            (tile_size_int_sva_10(8 DOWNTO 0)), loops_relevancy_rsci_idat(4));
        instr_tile_rsci_d_13_9 <= tile_size_int_lpi_1_dfm_13_9_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        instr_bound_rsci_d_69_56 <= STD_LOGIC_VECTOR'( "00000000000000");
        instr_bound_rsci_d_13_0 <= STD_LOGIC_VECTOR'( "00000000000000");
        instr_bound_rsci_d_55_42 <= STD_LOGIC_VECTOR'( "00000000000000");
        instr_bound_rsci_d_27_14 <= STD_LOGIC_VECTOR'( "00000000000000");
        instr_bound_rsci_d_41_28 <= STD_LOGIC_VECTOR'( "00000000000000");
        instr_tile_rsci_d_8_0 <= STD_LOGIC_VECTOR'( "000000000");
        instr_tile_rsci_d_55_51 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_50_42 <= STD_LOGIC_VECTOR'( "000000000");
        instr_tile_rsci_d_41_37 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_36_28 <= STD_LOGIC_VECTOR'( "000000000");
        instr_tile_rsci_d_27_23 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_22_14 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( ccs_ccore_en = '1' ) THEN
        instr_bound_rsci_d_69_56 <= MUX_v_14_2_2((loops_bound_rsci_idat(69 DOWNTO
            56)), STD_LOGIC_VECTOR'( "00000000000001"), loops_relevancy_rsci_idat(4));
        instr_bound_rsci_d_13_0 <= MUX_v_14_2_2((loops_bound_rsci_idat(13 DOWNTO
            0)), STD_LOGIC_VECTOR'( "00000000000001"), loops_relevancy_rsci_idat(0));
        instr_bound_rsci_d_55_42 <= MUX_v_14_2_2((loops_bound_rsci_idat(55 DOWNTO
            42)), STD_LOGIC_VECTOR'( "00000000000001"), loops_relevancy_rsci_idat(3));
        instr_bound_rsci_d_27_14 <= MUX_v_14_2_2((loops_bound_rsci_idat(27 DOWNTO
            14)), STD_LOGIC_VECTOR'( "00000000000001"), loops_relevancy_rsci_idat(1));
        instr_bound_rsci_d_41_28 <= MUX_v_14_2_2((loops_bound_rsci_idat(41 DOWNTO
            28)), STD_LOGIC_VECTOR'( "00000000000001"), loops_relevancy_rsci_idat(2));
        instr_tile_rsci_d_8_0 <= instr_tile_rsci_d_8_0_mx0;
        instr_tile_rsci_d_55_51 <= instr_tile_rsci_d_55_51_mx0;
        instr_tile_rsci_d_50_42 <= instr_tile_rsci_d_50_42_mx0;
        instr_tile_rsci_d_41_37 <= instr_tile_rsci_d_41_37_mx0;
        instr_tile_rsci_d_36_28 <= instr_tile_rsci_d_36_28_mx0;
        instr_tile_rsci_d_27_23 <= instr_tile_rsci_d_27_23_mx0;
        instr_tile_rsci_d_22_14 <= instr_tile_rsci_d_22_14_mx0;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    tiling_unit_5_O_addr_type_L3
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.ccs_in_pkg_v1.ALL;
USE mgc_hls.mgc_out_dreg_pkg_v2.ALL;


ENTITY tiling_unit_5_O_addr_type_L3 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END tiling_unit_5_O_addr_type_L3;

ARCHITECTURE v1 OF tiling_unit_5_O_addr_type_L3 IS
  -- Default Constants

  COMPONENT tiling_unit_5_O_addr_type_L3_run
    PORT(
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (69 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_loops_bound_rsc_dat : STD_LOGIC_VECTOR
      (69 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_tile_size_in_rsc_dat : STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_tile_size_out_rsc_z : STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_instr_bound_rsc_z : STD_LOGIC_VECTOR
      (69 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_instr_tile_rsc_z : STD_LOGIC_VECTOR
      (69 DOWNTO 0);

BEGIN
  tiling_unit_5_O_addr_type_L3_run_inst : tiling_unit_5_O_addr_type_L3_run
    PORT MAP(
      loops_bound_rsc_dat => tiling_unit_5_O_addr_type_L3_run_inst_loops_bound_rsc_dat,
      loops_relevancy_rsc_dat => tiling_unit_5_O_addr_type_L3_run_inst_loops_relevancy_rsc_dat,
      tile_size_in_rsc_dat => tiling_unit_5_O_addr_type_L3_run_inst_tile_size_in_rsc_dat,
      tile_size_out_rsc_z => tiling_unit_5_O_addr_type_L3_run_inst_tile_size_out_rsc_z,
      instr_bound_rsc_z => tiling_unit_5_O_addr_type_L3_run_inst_instr_bound_rsc_z,
      instr_tile_rsc_z => tiling_unit_5_O_addr_type_L3_run_inst_instr_tile_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  tiling_unit_5_O_addr_type_L3_run_inst_loops_bound_rsc_dat <= loops_bound_rsc_dat;
  tiling_unit_5_O_addr_type_L3_run_inst_loops_relevancy_rsc_dat <= loops_relevancy_rsc_dat;
  tiling_unit_5_O_addr_type_L3_run_inst_tile_size_in_rsc_dat <= tile_size_in_rsc_dat;
  tile_size_out_rsc_z <= tiling_unit_5_O_addr_type_L3_run_inst_tile_size_out_rsc_z;
  instr_bound_rsc_z <= tiling_unit_5_O_addr_type_L3_run_inst_instr_bound_rsc_z;
  instr_tile_rsc_z <= tiling_unit_5_O_addr_type_L3_run_inst_instr_tile_rsc_z;

END v1;



