-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   r0678912@amazone.esat.kuleuven.be
--  Generated date: Tue Jul 13 10:58:02 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    tiling_unit_5_O_addr_type_L1_run
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.ccs_in_pkg_v1.ALL;
USE mgc_hls.mgc_out_dreg_pkg_v2.ALL;


ENTITY tiling_unit_5_O_addr_type_L1_run IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END tiling_unit_5_O_addr_type_L1_run;

ARCHITECTURE v1 OF tiling_unit_5_O_addr_type_L1_run IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat : STD_LOGIC;
  SIGNAL instr_bound_rsci_d_24_20 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_19_15 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_14_10 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_19_15 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_14_10 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_9_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_cse : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_19_15_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_9_5_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_14_10_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_and_cse : STD_LOGIC;

  SIGNAL for_5_if_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_1_if_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_4_if_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_3_if_mul_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_bound_rsci_dat : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 : STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL instr_bound_rsci_z : STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL instr_tile_rsci_d : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL instr_tile_rsci_z : STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

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

BEGIN
  loops_bound_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 25
      )
    PORT MAP(
      dat => loops_bound_rsci_dat,
      idat => loops_bound_rsci_idat_1
    );
  loops_bound_rsci_dat <= loops_bound_rsc_dat;
  loops_bound_rsci_idat <= loops_bound_rsci_idat_1;

  loops_relevancy_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
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
      rscid => 4,
      width => 25
      )
    PORT MAP(
      d => instr_bound_rsci_d,
      z => instr_bound_rsci_z
    );
  instr_bound_rsci_d <= instr_bound_rsci_d_24_20 & instr_bound_rsci_d_19_15 & instr_bound_rsci_d_14_10
      & instr_bound_rsci_d_9_5 & instr_bound_rsci_d_4_0;
  instr_bound_rsc_z <= instr_bound_rsci_z;

  instr_tile_rsci : mgc_hls.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 5,
      width => 25
      )
    PORT MAP(
      d => instr_tile_rsci_d,
      z => instr_tile_rsci_z
    );
  instr_tile_rsci_d <= reg_tile_size_out_rsci_d_cse & instr_tile_rsci_d_19_15 & instr_tile_rsci_d_14_10
      & instr_tile_rsci_d_9_5 & instr_tile_rsci_d_4_0;
  instr_tile_rsc_z <= instr_tile_rsci_z;

  tile_size_in_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 130,
      width => 5
      )
    PORT MAP(
      dat => tile_size_in_rsci_dat,
      idat => tile_size_in_rsci_idat_1
    );
  tile_size_in_rsci_dat <= tile_size_in_rsc_dat;
  tile_size_in_rsci_idat <= tile_size_in_rsci_idat_1;

  tile_size_out_rsci : mgc_hls.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 131,
      width => 5
      )
    PORT MAP(
      d => tile_size_out_rsci_d,
      z => tile_size_out_rsci_z
    );
  tile_size_out_rsci_d <= reg_tile_size_out_rsci_d_cse;
  tile_size_out_rsc_z <= tile_size_out_rsci_z;

  ccs_ccore_start_rsci : mgc_hls.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 137,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  tile_size_and_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  for_1_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_in_rsci_idat)
      * UNSIGNED(loops_bound_rsci_idat(4 DOWNTO 0))), 5));
  instr_tile_rsci_d_4_0_mx0 <= MUX_v_5_2_2(tile_size_in_rsci_idat, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_1_if_mul_nl),
      5)), loops_relevancy_rsci_idat(0));
  for_4_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_14_10_mx0)
      * UNSIGNED(loops_bound_rsci_idat(19 DOWNTO 15))), 5));
  instr_tile_rsci_d_19_15_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_14_10_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_4_if_mul_nl),
      5)), loops_relevancy_rsci_idat(3));
  for_2_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_4_0_mx0)
      * UNSIGNED(loops_bound_rsci_idat(9 DOWNTO 5))), 5));
  instr_tile_rsci_d_9_5_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_4_0_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_mul_nl),
      5)), loops_relevancy_rsci_idat(1));
  for_3_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_9_5_mx0)
      * UNSIGNED(loops_bound_rsci_idat(14 DOWNTO 10))), 5));
  instr_tile_rsci_d_14_10_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_9_5_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_3_if_mul_nl),
      5)), loops_relevancy_rsci_idat(2));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        reg_tile_size_out_rsci_d_cse <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_4_0 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_19_15 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_9_5 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_14_10 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( tile_size_and_cse = '1' ) THEN
        reg_tile_size_out_rsci_d_cse <= MUX_v_5_2_2(instr_tile_rsci_d_19_15_mx0,
            STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_5_if_mul_nl), 5)), loops_relevancy_rsci_idat(4));
        instr_tile_rsci_d_4_0 <= instr_tile_rsci_d_4_0_mx0;
        instr_tile_rsci_d_19_15 <= instr_tile_rsci_d_19_15_mx0;
        instr_tile_rsci_d_9_5 <= instr_tile_rsci_d_9_5_mx0;
        instr_tile_rsci_d_14_10 <= instr_tile_rsci_d_14_10_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        instr_bound_rsci_d_24_20 <= STD_LOGIC_VECTOR'( "00000");
        instr_bound_rsci_d_4_0 <= STD_LOGIC_VECTOR'( "00000");
        instr_bound_rsci_d_19_15 <= STD_LOGIC_VECTOR'( "00000");
        instr_bound_rsci_d_9_5 <= STD_LOGIC_VECTOR'( "00000");
        instr_bound_rsci_d_14_10 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ccs_ccore_en = '1' ) THEN
        instr_bound_rsci_d_24_20 <= MUX_v_5_2_2((loops_bound_rsci_idat(24 DOWNTO
            20)), STD_LOGIC_VECTOR'( "00001"), loops_relevancy_rsci_idat(4));
        instr_bound_rsci_d_4_0 <= MUX_v_5_2_2((loops_bound_rsci_idat(4 DOWNTO 0)),
            STD_LOGIC_VECTOR'( "00001"), loops_relevancy_rsci_idat(0));
        instr_bound_rsci_d_19_15 <= MUX_v_5_2_2((loops_bound_rsci_idat(19 DOWNTO
            15)), STD_LOGIC_VECTOR'( "00001"), loops_relevancy_rsci_idat(3));
        instr_bound_rsci_d_9_5 <= MUX_v_5_2_2((loops_bound_rsci_idat(9 DOWNTO 5)),
            STD_LOGIC_VECTOR'( "00001"), loops_relevancy_rsci_idat(1));
        instr_bound_rsci_d_14_10 <= MUX_v_5_2_2((loops_bound_rsci_idat(14 DOWNTO
            10)), STD_LOGIC_VECTOR'( "00001"), loops_relevancy_rsci_idat(2));
      END IF;
    END IF;
  END PROCESS;
  for_5_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_19_15_mx0)
      * UNSIGNED(loops_bound_rsci_idat(24 DOWNTO 20))), 5));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    tiling_unit_5_O_addr_type_L1
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.ccs_in_pkg_v1.ALL;
USE mgc_hls.mgc_out_dreg_pkg_v2.ALL;


ENTITY tiling_unit_5_O_addr_type_L1 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END tiling_unit_5_O_addr_type_L1;

ARCHITECTURE v1 OF tiling_unit_5_O_addr_type_L1 IS
  -- Default Constants

  COMPONENT tiling_unit_5_O_addr_type_L1_run
    PORT(
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_loops_bound_rsc_dat : STD_LOGIC_VECTOR
      (24 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_tile_size_in_rsc_dat : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_tile_size_out_rsc_z : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_instr_bound_rsc_z : STD_LOGIC_VECTOR
      (24 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_instr_tile_rsc_z : STD_LOGIC_VECTOR
      (24 DOWNTO 0);

BEGIN
  tiling_unit_5_O_addr_type_L1_run_inst : tiling_unit_5_O_addr_type_L1_run
    PORT MAP(
      loops_bound_rsc_dat => tiling_unit_5_O_addr_type_L1_run_inst_loops_bound_rsc_dat,
      loops_relevancy_rsc_dat => tiling_unit_5_O_addr_type_L1_run_inst_loops_relevancy_rsc_dat,
      tile_size_in_rsc_dat => tiling_unit_5_O_addr_type_L1_run_inst_tile_size_in_rsc_dat,
      tile_size_out_rsc_z => tiling_unit_5_O_addr_type_L1_run_inst_tile_size_out_rsc_z,
      instr_bound_rsc_z => tiling_unit_5_O_addr_type_L1_run_inst_instr_bound_rsc_z,
      instr_tile_rsc_z => tiling_unit_5_O_addr_type_L1_run_inst_instr_tile_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  tiling_unit_5_O_addr_type_L1_run_inst_loops_bound_rsc_dat <= loops_bound_rsc_dat;
  tiling_unit_5_O_addr_type_L1_run_inst_loops_relevancy_rsc_dat <= loops_relevancy_rsc_dat;
  tiling_unit_5_O_addr_type_L1_run_inst_tile_size_in_rsc_dat <= tile_size_in_rsc_dat;
  tile_size_out_rsc_z <= tiling_unit_5_O_addr_type_L1_run_inst_tile_size_out_rsc_z;
  instr_bound_rsc_z <= tiling_unit_5_O_addr_type_L1_run_inst_instr_bound_rsc_z;
  instr_tile_rsc_z <= tiling_unit_5_O_addr_type_L1_run_inst_instr_tile_rsc_z;

END v1;



