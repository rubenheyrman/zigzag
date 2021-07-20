
--------> /esat/micas-data/software/Mentor/catapult_10.5c/pkgs/cds_ppro/rls/platform/common/powerpro/powerpro_cg_package.vhd 
LIBRARY ieee;

use ieee.std_logic_1164.all;

package powerpro_cg_package is
  -- zero extension
  function ext(arg: std_logic_vector; size: natural) return std_logic_vector;

  -- sign extension
  function sxt(arg: std_logic_vector; size: natural) return std_logic_vector;

  -- feed throughs
  function to_bitvector(arg : boolean) return std_logic_vector;

  -- feed throughs
  function to_bitvector(arg : bit) return std_logic_vector;

  -- feed throughs
  function to_bitvector(arg : bit_vector) return std_logic_vector;

  -- feed throughs
  function to_bitvector(arg : std_ulogic) return std_logic_vector;

  -- feed throughs
  function to_bitvector(arg : std_logic_vector) return std_logic_vector;  

  -- feed throughs
  function to_bitvector(arg : std_ulogic_vector) return std_logic_vector;  

  function to_bitvector(arg, size : integer) return std_logic_vector;  
  
  -- reduction operators
  function and_reduce(arg: std_logic_vector) return std_logic_vector;
  function nand_reduce(arg: std_logic_vector) return std_logic_vector;
  function or_reduce(arg: std_logic_vector) return std_logic_vector;
  function nor_reduce(arg: std_logic_vector) return std_logic_vector;
  function xor_reduce(arg: std_logic_vector) return std_logic_vector;
  function xnor_reduce(arg: std_logic_vector) return std_logic_vector;

  -- mathematical operators
  function "+" (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function "-" (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function "-" (l: std_logic_vector) return std_logic_vector;
  function "mod" (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function "*" (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

  --shift operators
  function left_shift (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function right_shift (l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  
  -- comparators
  function unsigned_unsigned_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_unsigned_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_unsigned_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_unsigned_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

  function signed_signed_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_signed_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_signed_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_signed_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

  function unsigned_signed_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_signed_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_signed_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function unsigned_signed_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

  function signed_unsigned_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_unsigned_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_unsigned_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
  function signed_unsigned_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

  function is_enabled(l: std_logic_vector) return boolean;
  function is_enabled(l: std_ulogic) return boolean;
  function is_disabled(l: std_logic_vector) return boolean;
  function is_disabled(l: std_ulogic) return boolean;
  function is_disabled(l: std_logic_vector; r: std_logic_vector) return boolean;
  function is_disabled(l: std_ulogic; r: std_ulogic) return boolean;
  function is_disabled(l1: std_logic_vector; l2: std_logic_vector; l3: std_logic_vector) return boolean;
  function is_disabled(l1: std_ulogic; l2: std_ulogic; l3: std_ulogic) return boolean;
  function is_enabled(l: std_logic_vector; r: std_logic_vector) return boolean;
  function is_enabled(l: std_ulogic; r: std_ulogic) return boolean;
  function is_enabled(l1: std_logic_vector; l2: std_logic_vector; l3: std_logic_vector) return boolean;
  function is_enabled(l1: std_ulogic; l2: std_ulogic; l3: std_ulogic) return boolean;
  
end powerpro_cg_package;


LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

package body powerpro_cg_package is

  function max(l, r: integer) return integer is
  begin
    if l > r then
      return l;
    else
      return r;
    end if;
  end;

  function min(l, r: integer) return integer is
  begin
    if l < r then
      return l;
    else
      return r;
    end if;
  end;

  function ext(arg: std_logic_vector; size: natural) return std_logic_vector is
    -- synopsys built_in SYN_ZERO_EXTEND
  begin
    return ieee.std_logic_arith.ext(arg, size);
  end;

  function sxt(arg: std_logic_vector; size: natural) return std_logic_vector is
    -- synopsys built_in SYN_SIGN_EXTEND
  begin
    return ieee.std_logic_arith.sxt(arg, size);
  end;

  
  function to_bitvector(arg : boolean) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
    variable return_val : std_logic_vector(0 downto 0);
  begin
    if arg = true then
      return_val := "1";
    else
      return_val := "0";
    end if;    
    return return_val;
  end;

  function to_bitvector(arg : bit) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
    variable return_val : std_logic_vector(0 downto 0);
  begin
    if arg = '1' then
      return_val := "1";
    else
      return_val := "0";
    end if;    
    return return_val;
  end;

  function to_bitvector(arg : std_ulogic) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
    variable return_val : std_logic_vector(0 downto 0);
  begin
    return_val(0) := arg;
    return return_val;
  end;  

  function to_bitvector(arg : bit_vector) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
  begin
    return ieee.std_logic_1164.to_stdlogicvector(arg);
  end;

  function to_bitvector(arg : std_logic_vector) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
  begin
    return arg;
  end;      
  
  function to_bitvector(arg : std_ulogic_vector) return std_logic_vector is
    -- pragma built_in SYN_FEED_THRU
  begin
    return ieee.std_logic_1164.to_stdlogicvector(arg);
  end;
  
  function and_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.and_reduce(arg));
  end;

  function nand_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.nand_reduce(arg));
  end;
  
  function or_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.or_reduce(arg));
  end;
  
  function nor_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.nor_reduce(arg));
  end;

  function xor_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.xor_reduce(arg));
  end;

  function xnor_reduce(arg: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector(ieee.std_logic_misc.xnor_reduce(arg));
  end;

  function "+"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(unsigned(l) + unsigned(r));
  end;

  function "-"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(unsigned(l) - unsigned(r));
  end;

  function "-"(l: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector("0" - unsigned(l));
  end;
  
  function "mod"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(unsigned(l) mod unsigned(r));
  end;

  function "*"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(resize((unsigned(l) * unsigned(r)), l'length));
  end;
  
  function left_shift(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(shl(std_logic_vector(l), std_logic_vector(r)));
  end;
  
  function right_shift(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(shr(std_logic_vector(l), std_logic_vector(r)));
  end;
  
-------------------------------------------------------------------------------  
  function unsigned_unsigned_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( unsigned(l) >= unsigned(r));
  end;      

  function unsigned_unsigned_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( unsigned(l) > unsigned(r));
  end;      
  
  function unsigned_unsigned_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( unsigned(l) = unsigned(r));
  end;

  function unsigned_unsigned_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( unsigned(l) /= unsigned(r));
  end;

-------------------------------------------------------------------------------    
  function signed_signed_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( signed(l) >= signed(r));
  end;      

  function signed_signed_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( signed(l) > signed(r));
  end;      

  function signed_signed_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( signed(l) = signed(r));
  end;

  function signed_signed_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
  begin
    return to_bitvector( signed(l) /= signed(r));
  end;

-------------------------------------------------------------------------------  
  function unsigned_signed_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length + 1, r'length);
  begin
    return to_bitvector(signed(ext(l, length)) >= signed(sxt(r,length)));
  end;      

  function unsigned_signed_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length + 1, r'length);
  begin
    return to_bitvector(signed(ext(l, length)) > signed(sxt(r,length)));
  end;      

  function unsigned_signed_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length + 1, r'length);
  begin
    return to_bitvector(signed(ext(l, length)) = signed(sxt(r,length)));
  end;

  function unsigned_signed_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length + 1, r'length);
  begin
    return to_bitvector(signed(ext(l, length)) /= signed(sxt(r,length)));
  end;
  
-------------------------------------------------------------------------------    
  function signed_unsigned_ge(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length, r'length + 1);
  begin
    return to_bitvector(signed(sxt(l,length)) >= signed(ext(r,length)));
  end;      
  
  function signed_unsigned_gt(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length, r'length + 1);
  begin
    return to_bitvector(signed(sxt(l,length)) > signed(ext(r,length)));
  end;      
  
  function signed_unsigned_eq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length, r'length + 1);
  begin
    return to_bitvector(signed(sxt(l,length)) = signed(ext(r,length)));
  end;
  
  function signed_unsigned_neq(l: std_logic_vector; r: std_logic_vector) return std_logic_vector is
    constant length: integer := max(l'length, r'length + 1);
  begin
    return to_bitvector(signed(sxt(l,length)) /= signed(ext(r,length)));
  end;
  
  function to_bitvector(arg, size : integer) return std_logic_vector is
  begin
    return ieee.std_logic_arith.conv_std_logic_vector(arg, size);
  end;
  
  function is_enabled(l: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l) /= '0');
  end;
  
  function is_enabled(l: std_ulogic) return boolean is
  begin
    return (l /= '0');
  end;

  function is_disabled(l: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l) = '0');
  end;
  
  function is_disabled(l: std_ulogic) return boolean is
  begin
    return (l = '0');
  end;

  function is_disabled(l: std_logic_vector; r: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l) = '0' or ieee.std_logic_misc.or_reduce(r) = '0');
  end;

  function is_disabled(l: std_ulogic; r: std_ulogic) return boolean is
  begin
    return (l = '0' or r = '0');
  end;

  function is_disabled(l1: std_logic_vector; l2: std_logic_vector; l3: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l1) = '0' or ieee.std_logic_misc.or_reduce(l2) = '0' or ieee.std_logic_misc.or_reduce(l3) = '0');
  end;

  function is_disabled(l1: std_ulogic; l2: std_ulogic; l3: std_ulogic) return boolean is
  begin
    return (l1 = '0' or l2 = '0' or l3 = '0');
  end;

  function is_enabled(l: std_logic_vector; r: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l) /= '0' and ieee.std_logic_misc.or_reduce(r) /= '0');
  end;

  function is_enabled(l: std_ulogic; r: std_ulogic) return boolean is
  begin
    return (l /= '0' and r /= '0');
  end;
  
  function is_enabled(l1: std_logic_vector; l2: std_logic_vector; l3: std_logic_vector) return boolean is
  begin
    return (ieee.std_logic_misc.or_reduce(l1) /= '0' and ieee.std_logic_misc.or_reduce(l2) /= '0' and ieee.std_logic_misc.or_reduce(l3) /= '0');
  end;

  function is_enabled(l1: std_ulogic; l2: std_ulogic; l3: std_ulogic) return boolean is
  begin
    return (l1 /= '0' and l2 /= '0' and l3 /= '0');
  end;
  

end powerpro_cg_package;

--------> ./top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000024_enLogic.vhd 
LIBRARY ieee;

use ieee.std_logic_1164.all;
package TMP_PLACEHOLDERtop_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000024_calypto_package is
end package;

--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000001.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149 IS

COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
  GENERIC (
    rscid    :  INTEGER;
    width    :  INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy    : OUT std_logic;
    ivld   : OUT std_logic;
    dat    : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy   : IN  std_logic;
    vld    : IN  std_logic
   );
END COMPONENT;

END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150 IS
  GENERIC (
    rscid :  INTEGER;
    width :  INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy   : OUT std_logic;
    ivld  : OUT std_logic;
    dat   : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy  : IN  std_logic;
    vld   : IN  std_logic
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150;

ARCHITECTURE beh OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150 IS
BEGIN

  idat <= dat;
  rdy  <= irdy;
  ivld <= vld;

END beh;


--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000003.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151 IS

COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
  GENERIC (
    rscid    :  INTEGER;
    width    :  INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy   : OUT std_logic;
    vld    : OUT std_logic;
    idat   : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy    : IN  std_logic;
    ivld   : IN  std_logic
  );
END COMPONENT;

END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152 IS
  GENERIC (
    rscid :  INTEGER;
    width :  INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy  : OUT std_logic;
    vld   : OUT std_logic;
    idat  : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy   : IN  std_logic;
    ivld  : IN  std_logic
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152;

ARCHITECTURE beh OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152 IS
BEGIN

  dat  <= idat;
  irdy <= rdy;
  vld  <= ivld;

END beh;


--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:58:05 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     O_addr_cnt_5_O_addr_type_L1_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153 IS
  PORT(
    loop_bound : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    tile_sizes : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    pntr_in : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    pntr_out : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    irrel_at_max_out : OUT STD_LOGIC;
    irrel_at_zero_out : OUT STD_LOGIC;
    all_at_max_1_out : OUT STD_LOGIC;
    counter_in : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    counter_out : OUT STD_LOGIC_VECTOR (24 DOWNTO 0);
    tile_bound_in : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    tile_bound_out : OUT STD_LOGIC_VECTOR (24 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL for_1_unequal_4_tmp :  STD_LOGIC;
  SIGNAL operator_5_false_acc_4_tmp :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_1_unequal_3_tmp :  STD_LOGIC;
  SIGNAL operator_5_false_acc_3_tmp :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_1_unequal_2_tmp :  STD_LOGIC;
  SIGNAL operator_5_false_acc_2_tmp :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_1_unequal_1_tmp :  STD_LOGIC;
  SIGNAL operator_5_false_acc_1_tmp :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_1_for_1_for_1_for_1_nor_tmp :  STD_LOGIC;
  SIGNAL and_dcpl :  STD_LOGIC;
  SIGNAL and_dcpl_3 :  STD_LOGIC;
  SIGNAL and_dcpl_4 :  STD_LOGIC;
  SIGNAL and_dcpl_9 :  STD_LOGIC;
  SIGNAL and_dcpl_10 :  STD_LOGIC;
  SIGNAL and_dcpl_12 :  STD_LOGIC;
  SIGNAL or_tmp_4 :  STD_LOGIC;
  SIGNAL and_tmp :  STD_LOGIC;
  SIGNAL and_dcpl_24 :  STD_LOGIC;
  SIGNAL or_tmp_14 :  STD_LOGIC;
  SIGNAL mux_tmp_24 :  STD_LOGIC;
  SIGNAL mux_tmp_25 :  STD_LOGIC;
  SIGNAL and_dcpl_27 :  STD_LOGIC;
  SIGNAL and_dcpl_28 :  STD_LOGIC;
  SIGNAL or_dcpl_10 :  STD_LOGIC;
  SIGNAL or_tmp_31 :  STD_LOGIC;
  SIGNAL mux_tmp_30 :  STD_LOGIC;
  SIGNAL and_dcpl_35 :  STD_LOGIC;
  SIGNAL or_dcpl_13 :  STD_LOGIC;
  SIGNAL or_tmp_41 :  STD_LOGIC;
  SIGNAL not_tmp_24 :  STD_LOGIC;
  SIGNAL and_dcpl_38 :  STD_LOGIC;
  SIGNAL and_dcpl_46 :  STD_LOGIC;
  SIGNAL or_dcpl_16 :  STD_LOGIC;
  SIGNAL or_dcpl_18 :  STD_LOGIC;
  SIGNAL or_dcpl_21 :  STD_LOGIC;
  SIGNAL and_dcpl_53 :  STD_LOGIC;
  SIGNAL or_dcpl_23 :  STD_LOGIC;
  SIGNAL or_dcpl_25 :  STD_LOGIC;
  SIGNAL or_tmp_48 :  STD_LOGIC;
  SIGNAL and_dcpl_64 :  STD_LOGIC;
  SIGNAL and_dcpl_65 :  STD_LOGIC;
  SIGNAL counter_buf_4_1_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_buf_3_1_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_buf_2_1_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_buf_1_1_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL equal_mdf_1 :  STD_LOGIC;
  SIGNAL operator_5_false_acc_cse_1 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL counter_buf_0_1_mx1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_9_cse :  STD_LOGIC;
  SIGNAL or_89_cse :  STD_LOGIC;
  SIGNAL or_79_cse :  STD_LOGIC;
  SIGNAL or_75_cse :  STD_LOGIC;
  SIGNAL or_82_cse :  STD_LOGIC;
  SIGNAL or_20_cse :  STD_LOGIC;
  SIGNAL nor_16_cse :  STD_LOGIC;
  SIGNAL nand_4_cse :  STD_LOGIC;
  SIGNAL and_84_cse :  STD_LOGIC;
  SIGNAL mux_14_cse :  STD_LOGIC;
  SIGNAL for_1_unequal_itm :  STD_LOGIC;
  SIGNAL and_dcpl_103 :  STD_LOGIC;
  SIGNAL and_dcpl_109 :  STD_LOGIC;
  SIGNAL and_dcpl_113 :  STD_LOGIC;
  SIGNAL and_dcpl_116 :  STD_LOGIC;
  SIGNAL and_dcpl_118 :  STD_LOGIC;
  SIGNAL and_dcpl_121 :  STD_LOGIC;
  SIGNAL z_out_3 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL z_out_6 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL pntr_buf_2 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL or_21_cse :  STD_LOGIC;
  SIGNAL for_1_for_1_for_1_for_1_nor_4_cse :  STD_LOGIC;
  SIGNAL or_100_cse :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_4_itm_5_1 :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_3_itm_5_1 :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_2_itm_5_1 :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_1_itm_5_1 :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_itm_5_1 :  STD_LOGIC;
  SIGNAL mux_53_cse :  STD_LOGIC;
  SIGNAL mux_54_cse :  STD_LOGIC;

  SIGNAL tile_bound_mux1h_4_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_acc_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_mux_6_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_bound_or_nl :  STD_LOGIC;
  SIGNAL tile_bound_mux1h_3_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_acc_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_for_2_if_for_mux_5_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_175_nl :  STD_LOGIC;
  SIGNAL tile_bound_or_1_nl :  STD_LOGIC;
  SIGNAL tile_bound_mux1h_2_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL acc_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_for_2_if_for_mux_7_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_177_nl :  STD_LOGIC;
  SIGNAL tile_bound_or_2_nl :  STD_LOGIC;
  SIGNAL tile_bound_mux1h_1_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_acc_12_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_for_2_if_for_mux_6_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_176_nl :  STD_LOGIC;
  SIGNAL tile_bound_or_3_nl :  STD_LOGIC;
  SIGNAL tile_bound_mux1h_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_acc_13_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_for_2_if_for_mux_4_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_174_nl :  STD_LOGIC;
  SIGNAL mux_52_nl :  STD_LOGIC;
  SIGNAL tile_bound_or_4_nl :  STD_LOGIC;
  SIGNAL tile_pntr_and_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_pntr_nand_nl :  STD_LOGIC;
  SIGNAL mux_44_nl :  STD_LOGIC;
  SIGNAL mux_43_nl :  STD_LOGIC;
  SIGNAL mux_42_nl :  STD_LOGIC;
  SIGNAL mux_41_nl :  STD_LOGIC;
  SIGNAL mux_40_nl :  STD_LOGIC;
  SIGNAL mux_39_nl :  STD_LOGIC;
  SIGNAL mux_8_nl :  STD_LOGIC;
  SIGNAL mux_7_nl :  STD_LOGIC;
  SIGNAL and_88_nl :  STD_LOGIC;
  SIGNAL for_2_if_for_for_2_if_for_and_1_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_for_mux_1_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL nor_24_nl :  STD_LOGIC;
  SIGNAL counter_nand_4_nl :  STD_LOGIC;
  SIGNAL mux_24_nl :  STD_LOGIC;
  SIGNAL mux_23_nl :  STD_LOGIC;
  SIGNAL nor_21_nl :  STD_LOGIC;
  SIGNAL mux_22_nl :  STD_LOGIC;
  SIGNAL mux_21_nl :  STD_LOGIC;
  SIGNAL nand_3_nl :  STD_LOGIC;
  SIGNAL or_26_nl :  STD_LOGIC;
  SIGNAL or_24_nl :  STD_LOGIC;
  SIGNAL mux_20_nl :  STD_LOGIC;
  SIGNAL mux_32_nl :  STD_LOGIC;
  SIGNAL mux_31_nl :  STD_LOGIC;
  SIGNAL nor_18_nl :  STD_LOGIC;
  SIGNAL mux_30_nl :  STD_LOGIC;
  SIGNAL nand_1_nl :  STD_LOGIC;
  SIGNAL or_44_nl :  STD_LOGIC;
  SIGNAL mux_29_nl :  STD_LOGIC;
  SIGNAL nor_5_nl :  STD_LOGIC;
  SIGNAL mux_38_nl :  STD_LOGIC;
  SIGNAL mux_37_nl :  STD_LOGIC;
  SIGNAL mux_36_nl :  STD_LOGIC;
  SIGNAL or_59_nl :  STD_LOGIC;
  SIGNAL mux_35_nl :  STD_LOGIC;
  SIGNAL or_56_nl :  STD_LOGIC;
  SIGNAL mux_34_nl :  STD_LOGIC;
  SIGNAL nor_7_nl :  STD_LOGIC;
  SIGNAL mux_45_nl :  STD_LOGIC;
  SIGNAL nor_30_nl :  STD_LOGIC;
  SIGNAL nand_7_nl :  STD_LOGIC;
  SIGNAL nor_10_nl :  STD_LOGIC;
  SIGNAL mux_13_nl :  STD_LOGIC;
  SIGNAL mux_12_nl :  STD_LOGIC;
  SIGNAL mux_11_nl :  STD_LOGIC;
  SIGNAL mux_10_nl :  STD_LOGIC;
  SIGNAL for_2_if_for_mux_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_nand_3_nl :  STD_LOGIC;
  SIGNAL for_2_if_for_mux_2_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_nand_2_nl :  STD_LOGIC;
  SIGNAL for_2_if_for_mux_3_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_nand_1_nl :  STD_LOGIC;
  SIGNAL for_2_if_for_mux_4_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_or_nl :  STD_LOGIC;
  SIGNAL counter_mux_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL counter_nand_nl :  STD_LOGIC;
  SIGNAL operator_5_false_1_acc_4_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_5_false_1_acc_3_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_5_false_1_acc_2_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_5_false_1_acc_1_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_5_false_1_acc_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL nand_nl :  STD_LOGIC;
  SIGNAL or_34_nl :  STD_LOGIC;
  SIGNAL mux_26_nl :  STD_LOGIC;
  SIGNAL mux_25_nl :  STD_LOGIC;
  SIGNAL or_32_nl :  STD_LOGIC;
  SIGNAL or_31_nl :  STD_LOGIC;
  SIGNAL and_171_nl :  STD_LOGIC;
  SIGNAL acc_3_nl :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_2_if_mux1h_3_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_mux1h_4_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_mux1h_5_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_179_nl :  STD_LOGIC;
  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_5_3_2(input_2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_5_2(input_4 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_3 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 :  STD_LOGIC;
  input_1 :  STD_LOGIC;
  sel :  STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result :  STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

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
  counter_out <= counter_buf_4_1_mx0 & counter_buf_3_1_mx0 & counter_buf_2_1_mx0
      & counter_buf_1_1_mx0 & counter_buf_0_1_mx1;
  for_2_if_mux_6_nl <= MUX_v_5_2_2(z_out_3, (tile_bound_in(24 DOWNTO 20)), for_1_for_1_for_1_for_1_nor_4_cse);
  for_2_if_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_mux_6_nl) +
      UNSIGNED(tile_sizes(24 DOWNTO 20)), 5));
  tile_bound_or_nl <= and_dcpl_53 OR (and_dcpl_64 AND (NOT equal_mdf_1) AND operator_5_false_1_acc_4_itm_5_1
      AND (NOT for_1_unequal_3_tmp) AND and_dcpl);
  tile_bound_mux1h_4_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_acc_nl),
      5)), (tile_sizes(24 DOWNTO 20)), (tile_bound_in(24 DOWNTO 20)), STD_LOGIC_VECTOR'(
      tile_bound_or_nl & and_dcpl_65 & or_dcpl_25));
  and_175_nl <= (NOT(or_82_cse AND operator_5_false_1_acc_4_itm_5_1)) AND and_dcpl_103;
  for_2_if_for_for_2_if_for_mux_5_nl <= MUX_v_5_2_2(z_out_3, (tile_bound_in(19 DOWNTO
      15)), and_175_nl);
  for_2_if_for_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_for_2_if_for_mux_5_nl)
      + UNSIGNED(tile_sizes(19 DOWNTO 15)), 5));
  tile_bound_or_1_nl <= and_dcpl_53 OR and_dcpl_46 OR ((nor_16_cse OR (NOT operator_5_false_1_acc_4_itm_5_1))
      AND and_dcpl_3 AND and_dcpl_12 AND operator_5_false_1_acc_3_itm_5_1 AND and_dcpl_38);
  tile_bound_mux1h_3_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_acc_nl),
      5)), (tile_sizes(19 DOWNTO 15)), (tile_bound_in(19 DOWNTO 15)), STD_LOGIC_VECTOR'(
      tile_bound_or_1_nl & and_dcpl_65 & or_dcpl_21));
  and_177_nl <= (NOT mux_54_cse) AND and_dcpl_12;
  for_2_if_for_for_2_if_for_mux_7_nl <= MUX_v_5_2_2(z_out_3, (tile_bound_in(14 DOWNTO
      10)), and_177_nl);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_for_2_if_for_mux_7_nl)
      + UNSIGNED(tile_sizes(14 DOWNTO 10)), 5));
  tile_bound_or_2_nl <= and_dcpl_53 OR and_dcpl_46 OR and_dcpl_35 OR ((NOT mux_tmp_30)
      AND and_dcpl_4 AND (NOT (operator_5_false_acc_2_tmp(5))) AND operator_5_false_1_acc_2_itm_5_1
      AND for_1_for_1_for_1_for_1_nor_tmp);
  tile_bound_mux1h_2_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_nl),
      5)), (tile_sizes(14 DOWNTO 10)), (tile_bound_in(14 DOWNTO 10)), STD_LOGIC_VECTOR'(
      tile_bound_or_2_nl & and_dcpl_65 & or_dcpl_13));
  and_176_nl <= (NOT mux_53_cse) AND and_dcpl_3;
  for_2_if_for_for_2_if_for_mux_6_nl <= MUX_v_5_2_2(z_out_3, (tile_bound_in(9 DOWNTO
      5)), and_176_nl);
  for_2_if_for_acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_for_2_if_for_mux_6_nl)
      + UNSIGNED(tile_sizes(9 DOWNTO 5)), 5));
  tile_bound_or_3_nl <= and_dcpl_53 OR and_dcpl_46 OR and_dcpl_35 OR and_dcpl_28
      OR ((NOT mux_tmp_25) AND and_dcpl_3 AND and_dcpl_27);
  tile_bound_mux1h_1_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_acc_12_nl),
      5)), (tile_sizes(9 DOWNTO 5)), (tile_bound_in(9 DOWNTO 5)), STD_LOGIC_VECTOR'(
      tile_bound_or_3_nl & and_dcpl_65 & or_dcpl_10));
  mux_52_nl <= MUX_s_1_2_2(mux_53_cse, operator_5_false_1_acc_1_itm_5_1, or_20_cse);
  and_174_nl <= (NOT mux_52_nl) AND for_1_for_1_for_1_for_1_nor_tmp;
  for_2_if_for_for_2_if_for_mux_4_nl <= MUX_v_5_2_2(z_out_3, (tile_bound_in(4 DOWNTO
      0)), and_174_nl);
  for_2_if_for_acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_for_2_if_for_mux_4_nl)
      + UNSIGNED(tile_sizes(4 DOWNTO 0)), 5));
  tile_bound_or_4_nl <= and_dcpl_53 OR and_dcpl_46 OR and_dcpl_35 OR and_dcpl_28
      OR ((NOT for_1_for_1_for_1_for_1_nor_tmp) AND operator_5_false_1_acc_itm_5_1)
      OR ((NOT mux_14_cse) AND for_1_for_1_for_1_for_1_nor_tmp AND operator_5_false_1_acc_itm_5_1);
  tile_bound_mux1h_nl <= MUX1HOT_v_5_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_for_acc_13_nl),
      5)), (tile_sizes(4 DOWNTO 0)), (tile_bound_in(4 DOWNTO 0)), STD_LOGIC_VECTOR'(
      tile_bound_or_4_nl & and_dcpl_65 & and_dcpl_24));
  tile_bound_out <= tile_bound_mux1h_4_nl & tile_bound_mux1h_3_nl & tile_bound_mux1h_2_nl
      & tile_bound_mux1h_1_nl & tile_bound_mux1h_nl;
  or_89_cse <= equal_mdf_1 OR for_1_unequal_4_tmp OR (operator_5_false_acc_4_tmp(5));
  or_79_cse <= for_1_unequal_3_tmp OR (operator_5_false_acc_3_tmp(5));
  or_75_cse <= for_1_unequal_2_tmp OR (operator_5_false_acc_2_tmp(5));
  and_84_cse <= or_89_cse AND operator_5_false_1_acc_4_itm_5_1;
  tile_pntr_nand_nl <= NOT(and_dcpl_10 AND (NOT (operator_5_false_acc_4_tmp(5)))
      AND (NOT for_1_unequal_3_tmp) AND and_dcpl);
  tile_pntr_and_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), z_out_3, tile_pntr_nand_nl);
  mux_41_nl <= MUX_s_1_2_2(and_tmp, or_tmp_48, and_84_cse);
  mux_40_nl <= MUX_s_1_2_2(and_tmp, or_tmp_48, operator_5_false_1_acc_3_itm_5_1);
  mux_42_nl <= MUX_s_1_2_2(mux_41_nl, mux_40_nl, or_79_cse);
  mux_39_nl <= MUX_s_1_2_2(and_tmp, or_tmp_48, operator_5_false_1_acc_2_itm_5_1);
  mux_43_nl <= MUX_s_1_2_2(mux_42_nl, mux_39_nl, or_75_cse);
  mux_44_nl <= MUX_s_1_2_2(operator_5_false_1_acc_itm_5_1, mux_43_nl, for_1_for_1_for_1_for_1_nor_tmp);
  pntr_out <= MUX_v_5_2_2(pntr_buf_2, tile_pntr_and_nl, mux_44_nl);
  and_88_nl <= (equal_mdf_1 OR for_1_unequal_4_tmp) AND operator_5_false_1_acc_4_itm_5_1;
  mux_7_nl <= MUX_s_1_2_2(and_88_nl, operator_5_false_1_acc_3_itm_5_1, for_1_unequal_3_tmp);
  mux_8_nl <= MUX_s_1_2_2(mux_7_nl, operator_5_false_1_acc_2_itm_5_1, for_1_unequal_2_tmp);
  mux_9_cse <= MUX_s_1_2_2(mux_8_nl, operator_5_false_1_acc_1_itm_5_1, for_1_unequal_1_tmp);
  nor_24_nl <= NOT((mux_9_cse AND for_1_for_1_for_1_for_1_nor_tmp) OR operator_5_false_1_acc_itm_5_1);
  for_2_if_for_mux_1_nl <= MUX_v_5_2_2(z_out_6, (counter_in(4 DOWNTO 0)), nor_24_nl);
  counter_nand_4_nl <= NOT((mux_9_cse OR operator_5_false_1_acc_itm_5_1) AND for_1_for_1_for_1_for_1_nor_tmp);
  for_2_if_for_for_2_if_for_and_1_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), for_2_if_for_mux_1_nl,
      counter_nand_4_nl);
  irrel_at_max_out <= (NOT(CONV_SL_1_1(UNSIGNED(for_2_if_for_for_2_if_for_and_1_nl)
      /= UNSIGNED(operator_5_false_acc_cse_1(4 DOWNTO 0))) OR (operator_5_false_acc_cse_1(5))))
      AND (NOT((operator_5_false_acc_1_tmp(5)) OR CONV_SL_1_1(UNSIGNED(counter_buf_1_1_mx0)
      /= UNSIGNED(operator_5_false_acc_1_tmp(4 DOWNTO 0))))) AND (NOT((operator_5_false_acc_2_tmp(5))
      OR CONV_SL_1_1(UNSIGNED(counter_buf_2_1_mx0) /= UNSIGNED(operator_5_false_acc_2_tmp(4
      DOWNTO 0))))) AND (NOT((operator_5_false_acc_3_tmp(5)) OR CONV_SL_1_1(UNSIGNED(counter_buf_3_1_mx0)
      /= UNSIGNED(operator_5_false_acc_3_tmp(4 DOWNTO 0))))) AND (NOT((operator_5_false_acc_4_tmp(5))
      OR CONV_SL_1_1(UNSIGNED(counter_buf_4_1_mx0) /= UNSIGNED(operator_5_false_acc_4_tmp(4
      DOWNTO 0)))));
  or_82_cse <= for_1_unequal_4_tmp OR (operator_5_false_acc_4_tmp(5));
  or_20_cse <= for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5));
  nor_16_cse <= NOT(equal_mdf_1 OR for_1_unequal_4_tmp OR (operator_5_false_acc_4_tmp(5)));
  nand_4_cse <= NOT(or_89_cse AND operator_5_false_1_acc_4_itm_5_1);
  or_21_cse <= CONV_SL_1_1(z_out_6/=STD_LOGIC_VECTOR'("00000"));
  nand_3_nl <= NOT(nand_4_cse AND or_tmp_14);
  or_26_nl <= operator_5_false_1_acc_3_itm_5_1 OR (NOT or_tmp_14);
  mux_21_nl <= MUX_s_1_2_2(nand_3_nl, or_26_nl, or_79_cse);
  or_24_nl <= operator_5_false_1_acc_2_itm_5_1 OR (NOT or_tmp_14);
  mux_22_nl <= MUX_s_1_2_2(mux_21_nl, or_24_nl, or_75_cse);
  nor_21_nl <= NOT(operator_5_false_1_acc_1_itm_5_1 OR mux_22_nl);
  mux_20_nl <= MUX_s_1_2_2(or_tmp_14, or_21_cse, operator_5_false_1_acc_1_itm_5_1);
  mux_23_nl <= MUX_s_1_2_2(nor_21_nl, mux_20_nl, or_20_cse);
  mux_24_nl <= MUX_s_1_2_2(or_tmp_14, mux_23_nl, for_1_for_1_for_1_for_1_nor_tmp);
  nand_1_nl <= NOT(nand_4_cse AND or_tmp_31);
  or_44_nl <= operator_5_false_1_acc_3_itm_5_1 OR (NOT or_tmp_31);
  mux_30_nl <= MUX_s_1_2_2(nand_1_nl, or_44_nl, or_79_cse);
  nor_18_nl <= NOT(operator_5_false_1_acc_2_itm_5_1 OR mux_30_nl);
  mux_29_nl <= MUX_s_1_2_2(or_tmp_31, or_21_cse, operator_5_false_1_acc_2_itm_5_1);
  mux_31_nl <= MUX_s_1_2_2(nor_18_nl, mux_29_nl, or_75_cse);
  nor_5_nl <= NOT(for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5)) OR (NOT
      for_1_for_1_for_1_for_1_nor_tmp));
  mux_32_nl <= MUX_s_1_2_2(or_tmp_31, mux_31_nl, nor_5_nl);
  or_59_nl <= nor_16_cse OR (NOT operator_5_false_1_acc_4_itm_5_1) OR for_1_unequal_2_tmp
      OR (operator_5_false_acc_2_tmp(5)) OR for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5));
  mux_36_nl <= MUX_s_1_2_2(not_tmp_24, or_tmp_41, or_59_nl);
  or_56_nl <= for_1_unequal_2_tmp OR (operator_5_false_acc_2_tmp(5)) OR for_1_unequal_1_tmp
      OR (operator_5_false_acc_1_tmp(5));
  mux_35_nl <= MUX_s_1_2_2(not_tmp_24, or_tmp_41, or_56_nl);
  mux_37_nl <= MUX_s_1_2_2(mux_36_nl, mux_35_nl, operator_5_false_1_acc_3_itm_5_1);
  nor_7_nl <= NOT((NOT operator_5_false_1_acc_3_itm_5_1) OR for_1_unequal_2_tmp OR
      (operator_5_false_acc_2_tmp(5)) OR for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5))
      OR (NOT for_1_for_1_for_1_for_1_nor_tmp));
  mux_34_nl <= MUX_s_1_2_2(or_tmp_41, or_21_cse, nor_7_nl);
  mux_38_nl <= MUX_s_1_2_2(mux_37_nl, mux_34_nl, or_79_cse);
  nor_30_nl <= NOT(CONV_SL_1_1(counter_in(24 DOWNTO 20)/=STD_LOGIC_VECTOR'("00000")));
  nand_7_nl <= NOT(or_82_cse AND or_21_cse);
  nor_10_nl <= NOT((NOT operator_5_false_1_acc_4_itm_5_1) OR for_1_unequal_3_tmp
      OR (operator_5_false_acc_3_tmp(5)) OR for_1_unequal_2_tmp OR (operator_5_false_acc_2_tmp(5))
      OR for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5)) OR (NOT for_1_for_1_for_1_for_1_nor_tmp));
  mux_45_nl <= MUX_s_1_2_2(nor_30_nl, nand_7_nl, nor_10_nl);
  irrel_at_zero_out <= (NOT(CONV_SL_1_1(counter_buf_0_1_mx1/=STD_LOGIC_VECTOR'("00000"))
      OR mux_24_nl OR mux_32_nl OR mux_38_nl)) AND mux_45_nl;
  for_1_for_1_for_1_for_1_nor_4_cse <= NOT(for_1_unequal_4_tmp OR (operator_5_false_acc_4_tmp(5)));
  all_at_max_1_out <= for_1_for_1_for_1_for_1_nor_4_cse AND (NOT(or_dcpl_16 OR (operator_5_false_acc_2_tmp(5))
      OR (NOT equal_mdf_1) OR or_dcpl_23));
  mux_12_nl <= MUX_s_1_2_2(and_tmp, or_tmp_4, and_84_cse);
  mux_11_nl <= MUX_s_1_2_2(and_tmp, or_tmp_4, operator_5_false_1_acc_3_itm_5_1);
  mux_13_nl <= MUX_s_1_2_2(mux_12_nl, mux_11_nl, or_79_cse);
  mux_10_nl <= MUX_s_1_2_2(and_tmp, or_tmp_4, operator_5_false_1_acc_2_itm_5_1);
  mux_14_cse <= MUX_s_1_2_2(mux_13_nl, mux_10_nl, or_75_cse);
  for_2_if_for_mux_nl <= MUX_v_5_2_2(z_out_6, (counter_in(4 DOWNTO 0)), and_dcpl_24);
  counter_nand_3_nl <= NOT((mux_14_cse OR operator_5_false_1_acc_itm_5_1) AND for_1_for_1_for_1_for_1_nor_tmp);
  counter_buf_0_1_mx1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), for_2_if_for_mux_nl,
      counter_nand_3_nl);
  for_2_if_for_mux_2_nl <= MUX_v_5_2_2(z_out_6, (counter_in(9 DOWNTO 5)), or_dcpl_10);
  counter_nand_2_nl <= NOT((mux_tmp_25 OR operator_5_false_1_acc_1_itm_5_1) AND and_dcpl_3
      AND for_1_for_1_for_1_for_1_nor_tmp);
  counter_buf_1_1_mx0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), for_2_if_for_mux_2_nl,
      counter_nand_2_nl);
  pntr_buf_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pntr_in) + UNSIGNED'( "00001"),
      5));
  for_2_if_for_mux_3_nl <= MUX_v_5_2_2(z_out_6, (counter_in(14 DOWNTO 10)), or_dcpl_13);
  counter_nand_1_nl <= NOT((mux_tmp_30 OR operator_5_false_1_acc_2_itm_5_1) AND and_dcpl_4
      AND (NOT (operator_5_false_acc_2_tmp(5))) AND for_1_for_1_for_1_for_1_nor_tmp);
  counter_buf_2_1_mx0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), for_2_if_for_mux_3_nl,
      counter_nand_1_nl);
  for_2_if_for_mux_4_nl <= MUX_v_5_2_2(z_out_6, (counter_in(19 DOWNTO 15)), or_dcpl_21);
  counter_or_nl <= (NOT(and_84_cse OR operator_5_false_1_acc_3_itm_5_1)) OR for_1_unequal_1_tmp
      OR (operator_5_false_acc_1_tmp(5)) OR for_1_unequal_2_tmp OR (operator_5_false_acc_2_tmp(5))
      OR (NOT and_dcpl_38);
  counter_buf_3_1_mx0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), for_2_if_for_mux_4_nl,
      counter_or_nl);
  counter_mux_nl <= MUX_v_5_2_2(z_out_6, (counter_in(24 DOWNTO 20)), or_dcpl_25);
  counter_nand_nl <= NOT(and_dcpl_10 AND (NOT (operator_5_false_acc_4_tmp(5))) AND
      operator_5_false_1_acc_4_itm_5_1 AND (NOT for_1_unequal_3_tmp) AND and_dcpl);
  counter_buf_4_1_mx0 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), counter_mux_nl,
      counter_nand_nl);
  for_1_unequal_4_tmp <= CONV_SL_1_1(UNSIGNED(counter_in(24 DOWNTO 20)) /= UNSIGNED(operator_5_false_acc_4_tmp(4
      DOWNTO 0)));
  operator_5_false_acc_cse_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(loop_bound(4
      DOWNTO 0)), 5), 6) + SIGNED'( "111111"), 6));
  operator_5_false_acc_4_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(loop_bound(24
      DOWNTO 20)), 5), 6) + SIGNED'( "111111"), 6));
  operator_5_false_acc_3_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(loop_bound(19
      DOWNTO 15)), 5), 6) + SIGNED'( "111111"), 6));
  operator_5_false_acc_2_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(loop_bound(14
      DOWNTO 10)), 5), 6) + SIGNED'( "111111"), 6));
  operator_5_false_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(loop_bound(9
      DOWNTO 5)), 5), 6) + SIGNED'( "111111"), 6));
  equal_mdf_1 <= CONV_SL_1_1(UNSIGNED(pntr_buf_2) = UNSIGNED(tile_sizes(24 DOWNTO
      20)));
  operator_5_false_1_acc_4_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (tile_bound_in(24
      DOWNTO 20))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(NOT pntr_buf_2), 5), 6),
      6));
  operator_5_false_1_acc_4_itm_5_1 <= operator_5_false_1_acc_4_nl(5);
  operator_5_false_1_acc_3_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (tile_bound_in(19
      DOWNTO 15))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(NOT pntr_buf_2), 5), 6),
      6));
  operator_5_false_1_acc_3_itm_5_1 <= operator_5_false_1_acc_3_nl(5);
  for_1_unequal_3_tmp <= CONV_SL_1_1(UNSIGNED(counter_in(19 DOWNTO 15)) /= UNSIGNED(operator_5_false_acc_3_tmp(4
      DOWNTO 0)));
  operator_5_false_1_acc_2_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (tile_bound_in(14
      DOWNTO 10))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(NOT pntr_buf_2), 5), 6),
      6));
  operator_5_false_1_acc_2_itm_5_1 <= operator_5_false_1_acc_2_nl(5);
  for_1_unequal_2_tmp <= CONV_SL_1_1(UNSIGNED(counter_in(14 DOWNTO 10)) /= UNSIGNED(operator_5_false_acc_2_tmp(4
      DOWNTO 0)));
  operator_5_false_1_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (tile_bound_in(9
      DOWNTO 5))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(NOT pntr_buf_2), 5), 6), 6));
  operator_5_false_1_acc_1_itm_5_1 <= operator_5_false_1_acc_1_nl(5);
  for_1_unequal_1_tmp <= CONV_SL_1_1(UNSIGNED(counter_in(9 DOWNTO 5)) /= UNSIGNED(operator_5_false_acc_1_tmp(4
      DOWNTO 0)));
  operator_5_false_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (tile_bound_in(4
      DOWNTO 0))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(NOT pntr_buf_2), 5), 6), 6));
  operator_5_false_1_acc_itm_5_1 <= operator_5_false_1_acc_nl(5);
  for_1_unequal_itm <= CONV_SL_1_1(UNSIGNED(counter_in(4 DOWNTO 0)) /= UNSIGNED(operator_5_false_acc_cse_1(4
      DOWNTO 0)));
  for_1_for_1_for_1_for_1_nor_tmp <= NOT(for_1_unequal_itm OR (operator_5_false_acc_cse_1(5)));
  and_dcpl <= (NOT (operator_5_false_acc_3_tmp(5))) AND for_1_for_1_for_1_for_1_nor_tmp;
  and_dcpl_3 <= NOT(for_1_unequal_1_tmp OR (operator_5_false_acc_1_tmp(5)));
  and_dcpl_4 <= and_dcpl_3 AND (NOT for_1_unequal_2_tmp);
  and_dcpl_9 <= NOT((operator_5_false_acc_2_tmp(5)) OR for_1_unequal_4_tmp);
  and_dcpl_10 <= and_dcpl_4 AND and_dcpl_9;
  and_dcpl_12 <= NOT(for_1_unequal_2_tmp OR (operator_5_false_acc_2_tmp(5)));
  or_tmp_4 <= operator_5_false_1_acc_1_itm_5_1 OR (NOT or_20_cse);
  and_tmp <= operator_5_false_1_acc_1_itm_5_1 AND or_20_cse;
  and_dcpl_24 <= NOT((mux_14_cse AND for_1_for_1_for_1_for_1_nor_tmp) OR operator_5_false_1_acc_itm_5_1);
  or_tmp_14 <= CONV_SL_1_1(counter_in(9 DOWNTO 5)/=STD_LOGIC_VECTOR'("00000"));
  nand_nl <= NOT(operator_5_false_1_acc_4_itm_5_1 AND (NOT(nor_16_cse OR (operator_5_false_acc_2_tmp(5))
      OR for_1_unequal_2_tmp)));
  or_34_nl <= (NOT operator_5_false_1_acc_3_itm_5_1) OR (operator_5_false_acc_2_tmp(5))
      OR for_1_unequal_2_tmp;
  mux_tmp_24 <= MUX_s_1_2_2(nand_nl, or_34_nl, or_79_cse);
  or_32_nl <= equal_mdf_1 OR (operator_5_false_acc_4_tmp(5)) OR for_1_unequal_4_tmp
      OR (operator_5_false_acc_2_tmp(5)) OR for_1_unequal_2_tmp;
  mux_25_nl <= MUX_s_1_2_2(or_75_cse, or_32_nl, operator_5_false_1_acc_4_itm_5_1);
  or_31_nl <= operator_5_false_1_acc_3_itm_5_1 OR (operator_5_false_acc_2_tmp(5))
      OR for_1_unequal_2_tmp;
  mux_26_nl <= MUX_s_1_2_2(mux_25_nl, or_31_nl, or_79_cse);
  mux_tmp_25 <= MUX_s_1_2_2((NOT mux_tmp_24), mux_26_nl, operator_5_false_1_acc_2_itm_5_1);
  and_dcpl_27 <= operator_5_false_1_acc_1_itm_5_1 AND for_1_for_1_for_1_for_1_nor_tmp;
  and_dcpl_28 <= or_20_cse AND and_dcpl_27;
  or_dcpl_10 <= NOT(((NOT((NOT mux_tmp_25) OR or_20_cse)) OR operator_5_false_1_acc_1_itm_5_1)
      AND for_1_for_1_for_1_for_1_nor_tmp);
  or_tmp_31 <= CONV_SL_1_1(counter_in(14 DOWNTO 10)/=STD_LOGIC_VECTOR'("00000"));
  mux_tmp_30 <= MUX_s_1_2_2(and_84_cse, operator_5_false_1_acc_3_itm_5_1, or_79_cse);
  and_dcpl_35 <= or_75_cse AND (NOT for_1_unequal_1_tmp) AND (NOT (operator_5_false_acc_1_tmp(5)))
      AND operator_5_false_1_acc_2_itm_5_1 AND for_1_for_1_for_1_for_1_nor_tmp;
  or_dcpl_13 <= (mux_tmp_24 AND (NOT operator_5_false_1_acc_2_itm_5_1)) OR or_20_cse
      OR (NOT for_1_for_1_for_1_for_1_nor_tmp);
  or_tmp_41 <= CONV_SL_1_1(counter_in(19 DOWNTO 15)/=STD_LOGIC_VECTOR'("00000"));
  not_tmp_24 <= NOT(for_1_for_1_for_1_for_1_nor_tmp OR (NOT or_tmp_41));
  and_dcpl_38 <= (NOT for_1_unequal_3_tmp) AND (NOT (operator_5_false_acc_3_tmp(5)))
      AND for_1_for_1_for_1_for_1_nor_tmp;
  and_dcpl_46 <= and_dcpl_3 AND or_79_cse AND and_dcpl_12 AND operator_5_false_1_acc_3_itm_5_1
      AND for_1_for_1_for_1_for_1_nor_tmp;
  or_dcpl_16 <= or_20_cse OR for_1_unequal_2_tmp;
  or_dcpl_18 <= (NOT operator_5_false_1_acc_4_itm_5_1) OR for_1_unequal_3_tmp;
  or_dcpl_21 <= (NOT((NOT(nor_16_cse OR or_dcpl_18 OR (operator_5_false_acc_3_tmp(5))))
      OR operator_5_false_1_acc_3_itm_5_1)) OR or_dcpl_16 OR (operator_5_false_acc_2_tmp(5))
      OR (NOT for_1_for_1_for_1_for_1_nor_tmp);
  and_dcpl_53 <= and_dcpl_4 AND or_82_cse AND (NOT (operator_5_false_acc_2_tmp(5)))
      AND operator_5_false_1_acc_4_itm_5_1 AND (NOT for_1_unequal_3_tmp) AND and_dcpl;
  or_dcpl_23 <= or_dcpl_18 OR (operator_5_false_acc_3_tmp(5)) OR (NOT for_1_for_1_for_1_for_1_nor_tmp);
  or_dcpl_25 <= or_20_cse OR or_75_cse OR or_dcpl_23;
  or_tmp_48 <= and_dcpl_3 OR operator_5_false_1_acc_1_itm_5_1;
  and_dcpl_64 <= and_dcpl_4 AND and_dcpl_9 AND (NOT (operator_5_false_acc_4_tmp(5)));
  and_dcpl_65 <= and_dcpl_64 AND equal_mdf_1 AND operator_5_false_1_acc_4_itm_5_1
      AND (NOT for_1_unequal_3_tmp) AND and_dcpl;
  or_100_cse <= (operator_5_false_acc_cse_1(5)) OR for_1_unequal_itm;
  and_dcpl_103 <= NOT((operator_5_false_acc_3_tmp(5)) OR for_1_unequal_3_tmp);
  and_dcpl_109 <= for_1_for_1_for_1_for_1_nor_tmp AND or_20_cse;
  and_dcpl_113 <= NOT(and_dcpl_12 OR (operator_5_false_acc_cse_1(5)) OR for_1_unequal_itm
      OR (operator_5_false_acc_1_tmp(5)) OR for_1_unequal_1_tmp);
  and_dcpl_116 <= NOT((operator_5_false_acc_2_tmp(5)) OR for_1_unequal_2_tmp OR (operator_5_false_acc_1_tmp(5))
      OR for_1_unequal_1_tmp);
  and_dcpl_118 <= for_1_for_1_for_1_for_1_nor_tmp AND or_79_cse AND and_dcpl_116;
  and_dcpl_121 <= for_1_for_1_for_1_for_1_nor_tmp AND and_dcpl_103 AND and_dcpl_116;
  and_171_nl <= or_82_cse AND operator_5_false_1_acc_4_itm_5_1;
  mux_54_cse <= MUX_s_1_2_2(and_171_nl, operator_5_false_1_acc_3_itm_5_1, or_79_cse);
  mux_53_cse <= MUX_s_1_2_2(mux_54_cse, operator_5_false_1_acc_2_itm_5_1, or_75_cse);
  for_2_if_mux1h_3_nl <= MUX1HOT_v_5_5_2((tile_bound_in(4 DOWNTO 0)), (tile_bound_in(9
      DOWNTO 5)), (tile_bound_in(14 DOWNTO 10)), (tile_bound_in(19 DOWNTO 15)), (tile_bound_in(24
      DOWNTO 20)), STD_LOGIC_VECTOR'( or_100_cse & and_dcpl_109 & and_dcpl_113 &
      and_dcpl_118 & and_dcpl_121));
  for_2_if_mux1h_4_nl <= MUX1HOT_v_5_5_2((NOT (tile_sizes(4 DOWNTO 0))), (NOT (tile_sizes(9
      DOWNTO 5))), (NOT (tile_sizes(14 DOWNTO 10))), (NOT (tile_sizes(19 DOWNTO 15))),
      (NOT (tile_sizes(24 DOWNTO 20))), STD_LOGIC_VECTOR'( or_100_cse & and_dcpl_109
      & and_dcpl_113 & and_dcpl_118 & and_dcpl_121));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_mux1h_3_nl & '1')
      + UNSIGNED(for_2_if_mux1h_4_nl & '1'), 6));
  z_out_3 <= acc_3_nl(5 DOWNTO 1);
  and_179_nl <= (NOT(and_dcpl_12 OR for_1_unequal_itm)) AND (NOT((operator_5_false_acc_cse_1(5))
      OR (operator_5_false_acc_1_tmp(5)) OR for_1_unequal_1_tmp));
  for_2_if_mux1h_5_nl <= MUX1HOT_v_5_5_2((counter_in(4 DOWNTO 0)), (counter_in(9
      DOWNTO 5)), (counter_in(14 DOWNTO 10)), (counter_in(19 DOWNTO 15)), (counter_in(24
      DOWNTO 20)), STD_LOGIC_VECTOR'( or_100_cse & and_dcpl_109 & and_179_nl & and_dcpl_118
      & and_dcpl_121));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_2_if_mux1h_5_nl) + UNSIGNED'(
      "00001"), 5));
END v1;




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000007.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154 IS

COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
  GENERIC (
    rscid    :  INTEGER;
    width    :  INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155 IS
  GENERIC (
    rscid :  INTEGER;
    width :  INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155;

ARCHITECTURE beh OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155 IS
BEGIN

  idat <= dat;

END beh;


--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000009.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156 IS

COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
  GENERIC (
    rscid    :  INTEGER;
    width    :  INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157 IS
  GENERIC (
    rscid    :  INTEGER;
    width    :  INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157;

ARCHITECTURE beh OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157 IS
BEGIN

  z <= d;

END beh;

--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005_1.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:57:37 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_W_addr_type_L3_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000158 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000158;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000158 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat :  STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat :  STD_LOGIC;
  SIGNAL instr_bound_rsci_d_79_64 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_63_48 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_47_32 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_31_16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_15_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_15_11 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_10_0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_63_59 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_58_48 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_47_43 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_42_32 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_31_27 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_16 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_15_11_cse :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_10_0_cse :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_10_0_mx0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_63_59_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_58_48_mx0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_lpi_1_dfm_15_11_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_47_43_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_42_32_mx0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_31_27_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_16_mx0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_sva_6 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_int_sva_7 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_int_sva_8 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_int_sva_9 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_int_sva_10 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_and_cse :  STD_LOGIC;

  SIGNAL loops_bound_rsci_dat :  STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 :  STD_LOGIC_VECTOR (79 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d :  STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL instr_bound_rsci_z :  STD_LOGIC_VECTOR (79 DOWNTO 0);

  SIGNAL instr_tile_rsci_d :  STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL instr_tile_rsci_z :  STD_LOGIC_VECTOR (79 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 :  STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z :  STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat :  STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 :  STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_11_2_2(input_0 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

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
  loops_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 21,
      width => 80
      )
    PORT MAP(
      dat => loops_bound_rsci_dat,
      idat => loops_bound_rsci_idat_1
    );
  loops_bound_rsci_dat <= loops_bound_rsc_dat;
  loops_bound_rsci_idat <= loops_bound_rsci_idat_1;

  loops_relevancy_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 22,
      width => 5
      )
    PORT MAP(
      dat => loops_relevancy_rsci_dat,
      idat => loops_relevancy_rsci_idat_1
    );
  loops_relevancy_rsci_dat <= loops_relevancy_rsc_dat;
  loops_relevancy_rsci_idat <= loops_relevancy_rsci_idat_1;

  instr_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 24,
      width => 80
      )
    PORT MAP(
      d => instr_bound_rsci_d,
      z => instr_bound_rsci_z
    );
  instr_bound_rsci_d <= instr_bound_rsci_d_79_64 & instr_bound_rsci_d_63_48 & instr_bound_rsci_d_47_32
      & instr_bound_rsci_d_31_16 & instr_bound_rsci_d_15_0;
  instr_bound_rsc_z <= instr_bound_rsci_z;

  instr_tile_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 25,
      width => 80
      )
    PORT MAP(
      d => instr_tile_rsci_d,
      z => instr_tile_rsci_z
    );
  instr_tile_rsci_d <= reg_tile_size_out_rsci_d_15_11_cse & reg_tile_size_out_rsci_d_10_0_cse
      & instr_tile_rsci_d_63_59 & instr_tile_rsci_d_58_48 & instr_tile_rsci_d_47_43
      & instr_tile_rsci_d_42_32 & instr_tile_rsci_d_31_27 & instr_tile_rsci_d_26_16
      & instr_tile_rsci_d_15_11 & instr_tile_rsci_d_10_0;
  instr_tile_rsc_z <= instr_tile_rsci_z;

  tile_size_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 122,
      width => 16
      )
    PORT MAP(
      dat => tile_size_in_rsci_dat,
      idat => tile_size_in_rsci_idat_1
    );
  tile_size_in_rsci_dat <= tile_size_in_rsc_dat;
  tile_size_in_rsci_idat <= tile_size_in_rsci_idat_1;

  tile_size_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 123,
      width => 16
      )
    PORT MAP(
      d => tile_size_out_rsci_d,
      z => tile_size_out_rsci_z
    );
  tile_size_out_rsci_d <= reg_tile_size_out_rsci_d_15_11_cse & reg_tile_size_out_rsci_d_10_0_cse;
  tile_size_out_rsc_z <= tile_size_out_rsci_z;

  ccs_ccore_start_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 133,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  tile_size_and_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  instr_tile_rsci_d_10_0_mx0 <= MUX_v_11_2_2((tile_size_in_rsci_idat(10 DOWNTO 0)),
      (tile_size_int_sva_6(10 DOWNTO 0)), loops_relevancy_rsci_idat(0));
  instr_tile_rsci_d_63_59_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_47_43_mx0, (tile_size_int_sva_9(15
      DOWNTO 11)), loops_relevancy_rsci_idat(3));
  instr_tile_rsci_d_58_48_mx0 <= MUX_v_11_2_2(instr_tile_rsci_d_42_32_mx0, (tile_size_int_sva_9(10
      DOWNTO 0)), loops_relevancy_rsci_idat(3));
  tile_size_int_lpi_1_dfm_15_11_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), (tile_size_int_sva_6(15
      DOWNTO 11)), (loops_relevancy_rsci_idat(0)));
  instr_tile_rsci_d_47_43_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_31_27_mx0, (tile_size_int_sva_8(15
      DOWNTO 11)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_42_32_mx0 <= MUX_v_11_2_2(instr_tile_rsci_d_26_16_mx0, (tile_size_int_sva_8(10
      DOWNTO 0)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_31_27_mx0 <= MUX_v_5_2_2(tile_size_int_lpi_1_dfm_15_11_1, (tile_size_int_sva_7(15
      DOWNTO 11)), loops_relevancy_rsci_idat(1));
  instr_tile_rsci_d_26_16_mx0 <= MUX_v_11_2_2(instr_tile_rsci_d_10_0_mx0, (tile_size_int_sva_7(10
      DOWNTO 0)), loops_relevancy_rsci_idat(1));
  tile_size_int_sva_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_in_rsci_idat(10
      DOWNTO 0)) * UNSIGNED(loops_bound_rsci_idat(15 DOWNTO 0))), 16));
  tile_size_int_sva_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_int_lpi_1_dfm_15_11_1
      & instr_tile_rsci_d_10_0_mx0) * UNSIGNED(loops_bound_rsci_idat(31 DOWNTO 16))),
      16));
  tile_size_int_sva_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_31_27_mx0
      & instr_tile_rsci_d_26_16_mx0) * UNSIGNED(loops_bound_rsci_idat(47 DOWNTO 32))),
      16));
  tile_size_int_sva_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_47_43_mx0
      & instr_tile_rsci_d_42_32_mx0) * UNSIGNED(loops_bound_rsci_idat(63 DOWNTO 48))),
      16));
  tile_size_int_sva_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_63_59_mx0
      & instr_tile_rsci_d_58_48_mx0) * UNSIGNED(loops_bound_rsci_idat(79 DOWNTO 64))),
      16));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        reg_tile_size_out_rsci_d_15_11_cse <= STD_LOGIC_VECTOR'( "00000");
        reg_tile_size_out_rsci_d_10_0_cse <= STD_LOGIC_VECTOR'( "00000000000");
        instr_tile_rsci_d_15_11 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( tile_size_and_cse = '1' ) THEN
        reg_tile_size_out_rsci_d_15_11_cse <= MUX_v_5_2_2(instr_tile_rsci_d_63_59_mx0,
            (tile_size_int_sva_10(15 DOWNTO 11)), loops_relevancy_rsci_idat(4));
        reg_tile_size_out_rsci_d_10_0_cse <= MUX_v_11_2_2(instr_tile_rsci_d_58_48_mx0,
            (tile_size_int_sva_10(10 DOWNTO 0)), loops_relevancy_rsci_idat(4));
        instr_tile_rsci_d_15_11 <= tile_size_int_lpi_1_dfm_15_11_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        instr_bound_rsci_d_79_64 <= STD_LOGIC_VECTOR'( "0000000000000000");
        instr_bound_rsci_d_15_0 <= STD_LOGIC_VECTOR'( "0000000000000000");
        instr_bound_rsci_d_63_48 <= STD_LOGIC_VECTOR'( "0000000000000000");
        instr_bound_rsci_d_31_16 <= STD_LOGIC_VECTOR'( "0000000000000000");
        instr_bound_rsci_d_47_32 <= STD_LOGIC_VECTOR'( "0000000000000000");
        instr_tile_rsci_d_10_0 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_tile_rsci_d_63_59 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_58_48 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_tile_rsci_d_47_43 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_42_32 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_tile_rsci_d_31_27 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_26_16 <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( ccs_ccore_en = '1' ) THEN
        instr_bound_rsci_d_79_64 <= MUX_v_16_2_2((loops_bound_rsci_idat(79 DOWNTO
            64)), STD_LOGIC_VECTOR'( "0000000000000001"), loops_relevancy_rsci_idat(4));
        instr_bound_rsci_d_15_0 <= MUX_v_16_2_2((loops_bound_rsci_idat(15 DOWNTO
            0)), STD_LOGIC_VECTOR'( "0000000000000001"), loops_relevancy_rsci_idat(0));
        instr_bound_rsci_d_63_48 <= MUX_v_16_2_2((loops_bound_rsci_idat(63 DOWNTO
            48)), STD_LOGIC_VECTOR'( "0000000000000001"), loops_relevancy_rsci_idat(3));
        instr_bound_rsci_d_31_16 <= MUX_v_16_2_2((loops_bound_rsci_idat(31 DOWNTO
            16)), STD_LOGIC_VECTOR'( "0000000000000001"), loops_relevancy_rsci_idat(1));
        instr_bound_rsci_d_47_32 <= MUX_v_16_2_2((loops_bound_rsci_idat(47 DOWNTO
            32)), STD_LOGIC_VECTOR'( "0000000000000001"), loops_relevancy_rsci_idat(2));
        instr_tile_rsci_d_10_0 <= instr_tile_rsci_d_10_0_mx0;
        instr_tile_rsci_d_63_59 <= instr_tile_rsci_d_63_59_mx0;
        instr_tile_rsci_d_58_48 <= instr_tile_rsci_d_58_48_mx0;
        instr_tile_rsci_d_47_43 <= instr_tile_rsci_d_47_43_mx0;
        instr_tile_rsci_d_42_32 <= instr_tile_rsci_d_42_32_mx0;
        instr_tile_rsci_d_31_27 <= instr_tile_rsci_d_31_27_mx0;
        instr_tile_rsci_d_26_16 <= instr_tile_rsci_d_26_16_mx0;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_W_addr_type_L3
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000159 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000159;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000159 IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000158
    PORT(
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (79 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_loops_bound_rsc_dat :  STD_LOGIC_VECTOR
      (79 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_loops_relevancy_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_tile_size_in_rsc_dat :  STD_LOGIC_VECTOR
      (15 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_tile_size_out_rsc_z :  STD_LOGIC_VECTOR
      (15 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_instr_bound_rsc_z :  STD_LOGIC_VECTOR
      (79 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L3_run_inst_instr_tile_rsc_z :  STD_LOGIC_VECTOR
      (79 DOWNTO 0);

BEGIN
  tiling_unit_5_W_addr_type_L3_run_inst :  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000158
    PORT MAP(
      loops_bound_rsc_dat => tiling_unit_5_W_addr_type_L3_run_inst_loops_bound_rsc_dat,
      loops_relevancy_rsc_dat => tiling_unit_5_W_addr_type_L3_run_inst_loops_relevancy_rsc_dat,
      tile_size_in_rsc_dat => tiling_unit_5_W_addr_type_L3_run_inst_tile_size_in_rsc_dat,
      tile_size_out_rsc_z => tiling_unit_5_W_addr_type_L3_run_inst_tile_size_out_rsc_z,
      instr_bound_rsc_z => tiling_unit_5_W_addr_type_L3_run_inst_instr_bound_rsc_z,
      instr_tile_rsc_z => tiling_unit_5_W_addr_type_L3_run_inst_instr_tile_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  tiling_unit_5_W_addr_type_L3_run_inst_loops_bound_rsc_dat <= loops_bound_rsc_dat;
  tiling_unit_5_W_addr_type_L3_run_inst_loops_relevancy_rsc_dat <= loops_relevancy_rsc_dat;
  tiling_unit_5_W_addr_type_L3_run_inst_tile_size_in_rsc_dat <= tile_size_in_rsc_dat;
  tile_size_out_rsc_z <= tiling_unit_5_W_addr_type_L3_run_inst_tile_size_out_rsc_z;
  instr_bound_rsc_z <= tiling_unit_5_W_addr_type_L3_run_inst_instr_bound_rsc_z;
  instr_tile_rsc_z <= tiling_unit_5_W_addr_type_L3_run_inst_instr_tile_rsc_z;

END v1;




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005_2.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:57:56 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_W_addr_type_L2_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000160 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000160;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000160 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat :  STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat :  STD_LOGIC;
  SIGNAL instr_bound_rsci_d_54_44 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_43_33 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_32_22 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_21_11 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_10_0 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_10_5 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_43_38 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_37_33 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_32_27 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_22 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_21_16 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_15_11 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_10_5_cse :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_4_0_cse :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_43_38_mx0 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_37_33_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_int_lpi_1_dfm_10_5_1 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_32_27_mx0 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_22_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_21_16_mx0 :  STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_15_11_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_int_sva_6 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_sva_7 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_sva_8 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_sva_9 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_int_sva_10 :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_and_cse :  STD_LOGIC;

  SIGNAL loops_bound_rsci_dat :  STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 :  STD_LOGIC_VECTOR (54 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d :  STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL instr_bound_rsci_z :  STD_LOGIC_VECTOR (54 DOWNTO 0);

  SIGNAL instr_tile_rsci_d :  STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL instr_tile_rsci_z :  STD_LOGIC_VECTOR (54 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 :  STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d :  STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z :  STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat :  STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 :  STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_11_2_2(input_0 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_6_2_2(input_0 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(5 DOWNTO 0);

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
  loops_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 16,
      width => 55
      )
    PORT MAP(
      dat => loops_bound_rsci_dat,
      idat => loops_bound_rsci_idat_1
    );
  loops_bound_rsci_dat <= loops_bound_rsc_dat;
  loops_bound_rsci_idat <= loops_bound_rsci_idat_1;

  loops_relevancy_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 17,
      width => 5
      )
    PORT MAP(
      dat => loops_relevancy_rsci_dat,
      idat => loops_relevancy_rsci_idat_1
    );
  loops_relevancy_rsci_dat <= loops_relevancy_rsc_dat;
  loops_relevancy_rsci_idat <= loops_relevancy_rsci_idat_1;

  instr_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 19,
      width => 55
      )
    PORT MAP(
      d => instr_bound_rsci_d,
      z => instr_bound_rsci_z
    );
  instr_bound_rsci_d <= instr_bound_rsci_d_54_44 & instr_bound_rsci_d_43_33 & instr_bound_rsci_d_32_22
      & instr_bound_rsci_d_21_11 & instr_bound_rsci_d_10_0;
  instr_bound_rsc_z <= instr_bound_rsci_z;

  instr_tile_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 20,
      width => 55
      )
    PORT MAP(
      d => instr_tile_rsci_d,
      z => instr_tile_rsci_z
    );
  instr_tile_rsci_d <= reg_tile_size_out_rsci_d_10_5_cse & reg_tile_size_out_rsci_d_4_0_cse
      & instr_tile_rsci_d_43_38 & instr_tile_rsci_d_37_33 & instr_tile_rsci_d_32_27
      & instr_tile_rsci_d_26_22 & instr_tile_rsci_d_21_16 & instr_tile_rsci_d_15_11
      & instr_tile_rsci_d_10_5 & instr_tile_rsci_d_4_0;
  instr_tile_rsc_z <= instr_tile_rsci_z;

  tile_size_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 124,
      width => 11
      )
    PORT MAP(
      dat => tile_size_in_rsci_dat,
      idat => tile_size_in_rsci_idat_1
    );
  tile_size_in_rsci_dat <= tile_size_in_rsc_dat;
  tile_size_in_rsci_idat <= tile_size_in_rsci_idat_1;

  tile_size_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 125,
      width => 11
      )
    PORT MAP(
      d => tile_size_out_rsci_d,
      z => tile_size_out_rsci_z
    );
  tile_size_out_rsci_d <= reg_tile_size_out_rsci_d_10_5_cse & reg_tile_size_out_rsci_d_4_0_cse;
  tile_size_out_rsc_z <= tile_size_out_rsci_z;

  ccs_ccore_start_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 134,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  tile_size_and_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  instr_tile_rsci_d_4_0_mx0 <= MUX_v_5_2_2((tile_size_in_rsci_idat(4 DOWNTO 0)),
      (tile_size_int_sva_6(4 DOWNTO 0)), loops_relevancy_rsci_idat(0));
  instr_tile_rsci_d_43_38_mx0 <= MUX_v_6_2_2(instr_tile_rsci_d_32_27_mx0, (tile_size_int_sva_9(10
      DOWNTO 5)), loops_relevancy_rsci_idat(3));
  instr_tile_rsci_d_37_33_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_26_22_mx0, (tile_size_int_sva_9(4
      DOWNTO 0)), loops_relevancy_rsci_idat(3));
  tile_size_int_lpi_1_dfm_10_5_1 <= MUX_v_6_2_2(STD_LOGIC_VECTOR'("000000"), (tile_size_int_sva_6(10
      DOWNTO 5)), (loops_relevancy_rsci_idat(0)));
  instr_tile_rsci_d_32_27_mx0 <= MUX_v_6_2_2(instr_tile_rsci_d_21_16_mx0, (tile_size_int_sva_8(10
      DOWNTO 5)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_26_22_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_15_11_mx0, (tile_size_int_sva_8(4
      DOWNTO 0)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_21_16_mx0 <= MUX_v_6_2_2(tile_size_int_lpi_1_dfm_10_5_1, (tile_size_int_sva_7(10
      DOWNTO 5)), loops_relevancy_rsci_idat(1));
  instr_tile_rsci_d_15_11_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_4_0_mx0, (tile_size_int_sva_7(4
      DOWNTO 0)), loops_relevancy_rsci_idat(1));
  tile_size_int_sva_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_in_rsci_idat(4
      DOWNTO 0)) * UNSIGNED(loops_bound_rsci_idat(10 DOWNTO 0))), 11));
  tile_size_int_sva_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_int_lpi_1_dfm_10_5_1
      & instr_tile_rsci_d_4_0_mx0) * UNSIGNED(loops_bound_rsci_idat(21 DOWNTO 11))),
      11));
  tile_size_int_sva_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_21_16_mx0
      & instr_tile_rsci_d_15_11_mx0) * UNSIGNED(loops_bound_rsci_idat(32 DOWNTO 22))),
      11));
  tile_size_int_sva_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_32_27_mx0
      & instr_tile_rsci_d_26_22_mx0) * UNSIGNED(loops_bound_rsci_idat(43 DOWNTO 33))),
      11));
  tile_size_int_sva_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_43_38_mx0
      & instr_tile_rsci_d_37_33_mx0) * UNSIGNED(loops_bound_rsci_idat(54 DOWNTO 44))),
      11));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        reg_tile_size_out_rsci_d_10_5_cse <= STD_LOGIC_VECTOR'( "000000");
        reg_tile_size_out_rsci_d_4_0_cse <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_10_5 <= STD_LOGIC_VECTOR'( "000000");
      ELSIF ( tile_size_and_cse = '1' ) THEN
        reg_tile_size_out_rsci_d_10_5_cse <= MUX_v_6_2_2(instr_tile_rsci_d_43_38_mx0,
            (tile_size_int_sva_10(10 DOWNTO 5)), loops_relevancy_rsci_idat(4));
        reg_tile_size_out_rsci_d_4_0_cse <= MUX_v_5_2_2(instr_tile_rsci_d_37_33_mx0,
            (tile_size_int_sva_10(4 DOWNTO 0)), loops_relevancy_rsci_idat(4));
        instr_tile_rsci_d_10_5 <= tile_size_int_lpi_1_dfm_10_5_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        instr_bound_rsci_d_54_44 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_bound_rsci_d_10_0 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_bound_rsci_d_43_33 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_bound_rsci_d_21_11 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_bound_rsci_d_32_22 <= STD_LOGIC_VECTOR'( "00000000000");
        instr_tile_rsci_d_4_0 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_43_38 <= STD_LOGIC_VECTOR'( "000000");
        instr_tile_rsci_d_37_33 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_32_27 <= STD_LOGIC_VECTOR'( "000000");
        instr_tile_rsci_d_26_22 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_21_16 <= STD_LOGIC_VECTOR'( "000000");
        instr_tile_rsci_d_15_11 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ccs_ccore_en = '1' ) THEN
        instr_bound_rsci_d_54_44 <= MUX_v_11_2_2((loops_bound_rsci_idat(54 DOWNTO
            44)), STD_LOGIC_VECTOR'( "00000000001"), loops_relevancy_rsci_idat(4));
        instr_bound_rsci_d_10_0 <= MUX_v_11_2_2((loops_bound_rsci_idat(10 DOWNTO
            0)), STD_LOGIC_VECTOR'( "00000000001"), loops_relevancy_rsci_idat(0));
        instr_bound_rsci_d_43_33 <= MUX_v_11_2_2((loops_bound_rsci_idat(43 DOWNTO
            33)), STD_LOGIC_VECTOR'( "00000000001"), loops_relevancy_rsci_idat(3));
        instr_bound_rsci_d_21_11 <= MUX_v_11_2_2((loops_bound_rsci_idat(21 DOWNTO
            11)), STD_LOGIC_VECTOR'( "00000000001"), loops_relevancy_rsci_idat(1));
        instr_bound_rsci_d_32_22 <= MUX_v_11_2_2((loops_bound_rsci_idat(32 DOWNTO
            22)), STD_LOGIC_VECTOR'( "00000000001"), loops_relevancy_rsci_idat(2));
        instr_tile_rsci_d_4_0 <= instr_tile_rsci_d_4_0_mx0;
        instr_tile_rsci_d_43_38 <= instr_tile_rsci_d_43_38_mx0;
        instr_tile_rsci_d_37_33 <= instr_tile_rsci_d_37_33_mx0;
        instr_tile_rsci_d_32_27 <= instr_tile_rsci_d_32_27_mx0;
        instr_tile_rsci_d_26_22 <= instr_tile_rsci_d_26_22_mx0;
        instr_tile_rsci_d_21_16 <= instr_tile_rsci_d_21_16_mx0;
        instr_tile_rsci_d_15_11 <= instr_tile_rsci_d_15_11_mx0;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_W_addr_type_L2
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000161 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000161;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000161 IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000160
    PORT(
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (54 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_loops_bound_rsc_dat :  STD_LOGIC_VECTOR
      (54 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_loops_relevancy_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_tile_size_in_rsc_dat :  STD_LOGIC_VECTOR
      (10 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_tile_size_out_rsc_z :  STD_LOGIC_VECTOR
      (10 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_instr_bound_rsc_z :  STD_LOGIC_VECTOR
      (54 DOWNTO 0);
  SIGNAL tiling_unit_5_W_addr_type_L2_run_inst_instr_tile_rsc_z :  STD_LOGIC_VECTOR
      (54 DOWNTO 0);

BEGIN
  tiling_unit_5_W_addr_type_L2_run_inst :  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000160
    PORT MAP(
      loops_bound_rsc_dat => tiling_unit_5_W_addr_type_L2_run_inst_loops_bound_rsc_dat,
      loops_relevancy_rsc_dat => tiling_unit_5_W_addr_type_L2_run_inst_loops_relevancy_rsc_dat,
      tile_size_in_rsc_dat => tiling_unit_5_W_addr_type_L2_run_inst_tile_size_in_rsc_dat,
      tile_size_out_rsc_z => tiling_unit_5_W_addr_type_L2_run_inst_tile_size_out_rsc_z,
      instr_bound_rsc_z => tiling_unit_5_W_addr_type_L2_run_inst_instr_bound_rsc_z,
      instr_tile_rsc_z => tiling_unit_5_W_addr_type_L2_run_inst_instr_tile_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  tiling_unit_5_W_addr_type_L2_run_inst_loops_bound_rsc_dat <= loops_bound_rsc_dat;
  tiling_unit_5_W_addr_type_L2_run_inst_loops_relevancy_rsc_dat <= loops_relevancy_rsc_dat;
  tiling_unit_5_W_addr_type_L2_run_inst_tile_size_in_rsc_dat <= tile_size_in_rsc_dat;
  tile_size_out_rsc_z <= tiling_unit_5_W_addr_type_L2_run_inst_tile_size_out_rsc_z;
  instr_bound_rsc_z <= tiling_unit_5_W_addr_type_L2_run_inst_instr_bound_rsc_z;
  instr_tile_rsc_z <= tiling_unit_5_W_addr_type_L2_run_inst_instr_tile_rsc_z;

END v1;




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005_3.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:57:58 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_O_addr_type_L3_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000162 IS
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
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000162;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000162 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat :  STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat :  STD_LOGIC;
  SIGNAL instr_bound_rsci_d_69_56 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_55_42 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_41_28 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_27_14 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_13_0 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_13_9 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_8_0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_55_51 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_50_42 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_41_37 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_36_28 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_27_23 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_14 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_13_9_cse :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_8_0_cse :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_8_0_mx0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_55_51_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_50_42_mx0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_lpi_1_dfm_13_9_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_41_37_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_36_28_mx0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_27_23_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_14_mx0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_6 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_7 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_8 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_9 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_int_sva_10 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_and_cse :  STD_LOGIC;

  SIGNAL loops_bound_rsci_dat :  STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 :  STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d :  STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL instr_bound_rsci_z :  STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL instr_tile_rsci_d :  STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL instr_tile_rsci_z :  STD_LOGIC_VECTOR (69 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 :  STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d :  STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z :  STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat :  STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 :  STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_14_2_2(input_0 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(13 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_9_2_2(input_0 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(8 DOWNTO 0);

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
  loops_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  loops_relevancy_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  instr_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  instr_tile_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  tile_size_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  tile_size_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  ccs_ccore_start_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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
--  Design Unit:     tiling_unit_5_O_addr_type_L3
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000163 IS
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
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000163;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000163 IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000162
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
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_loops_bound_rsc_dat :  STD_LOGIC_VECTOR
      (69 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_loops_relevancy_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_tile_size_in_rsc_dat :  STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_tile_size_out_rsc_z :  STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_instr_bound_rsc_z :  STD_LOGIC_VECTOR
      (69 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L3_run_inst_instr_tile_rsc_z :  STD_LOGIC_VECTOR
      (69 DOWNTO 0);

BEGIN
  tiling_unit_5_O_addr_type_L3_run_inst :  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000162
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




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005_4.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:58:00 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_O_addr_type_L2_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000164 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000164;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000164 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat :  STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat :  STD_LOGIC;
  SIGNAL instr_bound_rsci_d_44_36 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_35_27 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_26_18 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_17_9 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_8_0 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_8_5 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_35_32 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_31_27 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_23 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_18 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_17_14 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_13_9 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_8_5_cse :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_4_0_cse :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_35_32_mx0 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_31_27_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_int_lpi_1_dfm_8_5_1 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_26_23_mx0 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_22_18_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_17_14_mx0 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_13_9_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_int_sva_6 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_7 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_8 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_9 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_int_sva_10 :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_and_cse :  STD_LOGIC;

  SIGNAL loops_bound_rsci_dat :  STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 :  STD_LOGIC_VECTOR (44 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d :  STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL instr_bound_rsci_z :  STD_LOGIC_VECTOR (44 DOWNTO 0);

  SIGNAL instr_tile_rsci_d :  STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL instr_tile_rsci_z :  STD_LOGIC_VECTOR (44 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 :  STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d :  STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z :  STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat :  STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 :  STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_4_2_2(input_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_9_2_2(input_0 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(8 DOWNTO 0);

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
  loops_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 6,
      width => 45
      )
    PORT MAP(
      dat => loops_bound_rsci_dat,
      idat => loops_bound_rsci_idat_1
    );
  loops_bound_rsci_dat <= loops_bound_rsc_dat;
  loops_bound_rsci_idat <= loops_bound_rsci_idat_1;

  loops_relevancy_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 7,
      width => 5
      )
    PORT MAP(
      dat => loops_relevancy_rsci_dat,
      idat => loops_relevancy_rsci_idat_1
    );
  loops_relevancy_rsci_dat <= loops_relevancy_rsc_dat;
  loops_relevancy_rsci_idat <= loops_relevancy_rsci_idat_1;

  instr_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 9,
      width => 45
      )
    PORT MAP(
      d => instr_bound_rsci_d,
      z => instr_bound_rsci_z
    );
  instr_bound_rsci_d <= instr_bound_rsci_d_44_36 & instr_bound_rsci_d_35_27 & instr_bound_rsci_d_26_18
      & instr_bound_rsci_d_17_9 & instr_bound_rsci_d_8_0;
  instr_bound_rsc_z <= instr_bound_rsci_z;

  instr_tile_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 10,
      width => 45
      )
    PORT MAP(
      d => instr_tile_rsci_d,
      z => instr_tile_rsci_z
    );
  instr_tile_rsci_d <= reg_tile_size_out_rsci_d_8_5_cse & reg_tile_size_out_rsci_d_4_0_cse
      & instr_tile_rsci_d_35_32 & instr_tile_rsci_d_31_27 & instr_tile_rsci_d_26_23
      & instr_tile_rsci_d_22_18 & instr_tile_rsci_d_17_14 & instr_tile_rsci_d_13_9
      & instr_tile_rsci_d_8_5 & instr_tile_rsci_d_4_0;
  instr_tile_rsc_z <= instr_tile_rsci_z;

  tile_size_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 128,
      width => 9
      )
    PORT MAP(
      dat => tile_size_in_rsci_dat,
      idat => tile_size_in_rsci_idat_1
    );
  tile_size_in_rsci_dat <= tile_size_in_rsc_dat;
  tile_size_in_rsci_idat <= tile_size_in_rsci_idat_1;

  tile_size_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
    GENERIC MAP(
      rscid => 129,
      width => 9
      )
    PORT MAP(
      d => tile_size_out_rsci_d,
      z => tile_size_out_rsci_z
    );
  tile_size_out_rsci_d <= reg_tile_size_out_rsci_d_8_5_cse & reg_tile_size_out_rsci_d_4_0_cse;
  tile_size_out_rsc_z <= tile_size_out_rsci_z;

  ccs_ccore_start_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
    GENERIC MAP(
      rscid => 136,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  tile_size_and_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  instr_tile_rsci_d_4_0_mx0 <= MUX_v_5_2_2((tile_size_in_rsci_idat(4 DOWNTO 0)),
      (tile_size_int_sva_6(4 DOWNTO 0)), loops_relevancy_rsci_idat(0));
  instr_tile_rsci_d_35_32_mx0 <= MUX_v_4_2_2(instr_tile_rsci_d_26_23_mx0, (tile_size_int_sva_9(8
      DOWNTO 5)), loops_relevancy_rsci_idat(3));
  instr_tile_rsci_d_31_27_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_22_18_mx0, (tile_size_int_sva_9(4
      DOWNTO 0)), loops_relevancy_rsci_idat(3));
  tile_size_int_lpi_1_dfm_8_5_1 <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (tile_size_int_sva_6(8
      DOWNTO 5)), (loops_relevancy_rsci_idat(0)));
  instr_tile_rsci_d_26_23_mx0 <= MUX_v_4_2_2(instr_tile_rsci_d_17_14_mx0, (tile_size_int_sva_8(8
      DOWNTO 5)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_22_18_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_13_9_mx0, (tile_size_int_sva_8(4
      DOWNTO 0)), loops_relevancy_rsci_idat(2));
  instr_tile_rsci_d_17_14_mx0 <= MUX_v_4_2_2(tile_size_int_lpi_1_dfm_8_5_1, (tile_size_int_sva_7(8
      DOWNTO 5)), loops_relevancy_rsci_idat(1));
  instr_tile_rsci_d_13_9_mx0 <= MUX_v_5_2_2(instr_tile_rsci_d_4_0_mx0, (tile_size_int_sva_7(4
      DOWNTO 0)), loops_relevancy_rsci_idat(1));
  tile_size_int_sva_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_in_rsci_idat(4
      DOWNTO 0)) * UNSIGNED(loops_bound_rsci_idat(8 DOWNTO 0))), 9));
  tile_size_int_sva_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(tile_size_int_lpi_1_dfm_8_5_1
      & instr_tile_rsci_d_4_0_mx0) * UNSIGNED(loops_bound_rsci_idat(17 DOWNTO 9))),
      9));
  tile_size_int_sva_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_17_14_mx0
      & instr_tile_rsci_d_13_9_mx0) * UNSIGNED(loops_bound_rsci_idat(26 DOWNTO 18))),
      9));
  tile_size_int_sva_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_26_23_mx0
      & instr_tile_rsci_d_22_18_mx0) * UNSIGNED(loops_bound_rsci_idat(35 DOWNTO 27))),
      9));
  tile_size_int_sva_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(instr_tile_rsci_d_35_32_mx0
      & instr_tile_rsci_d_31_27_mx0) * UNSIGNED(loops_bound_rsci_idat(44 DOWNTO 36))),
      9));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        reg_tile_size_out_rsci_d_8_5_cse <= STD_LOGIC_VECTOR'( "0000");
        reg_tile_size_out_rsci_d_4_0_cse <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_8_5 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( tile_size_and_cse = '1' ) THEN
        reg_tile_size_out_rsci_d_8_5_cse <= MUX_v_4_2_2(instr_tile_rsci_d_35_32_mx0,
            (tile_size_int_sva_10(8 DOWNTO 5)), loops_relevancy_rsci_idat(4));
        reg_tile_size_out_rsci_d_4_0_cse <= MUX_v_5_2_2(instr_tile_rsci_d_31_27_mx0,
            (tile_size_int_sva_10(4 DOWNTO 0)), loops_relevancy_rsci_idat(4));
        instr_tile_rsci_d_8_5 <= tile_size_int_lpi_1_dfm_8_5_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        instr_bound_rsci_d_44_36 <= STD_LOGIC_VECTOR'( "000000000");
        instr_bound_rsci_d_8_0 <= STD_LOGIC_VECTOR'( "000000000");
        instr_bound_rsci_d_35_27 <= STD_LOGIC_VECTOR'( "000000000");
        instr_bound_rsci_d_17_9 <= STD_LOGIC_VECTOR'( "000000000");
        instr_bound_rsci_d_26_18 <= STD_LOGIC_VECTOR'( "000000000");
        instr_tile_rsci_d_4_0 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_35_32 <= STD_LOGIC_VECTOR'( "0000");
        instr_tile_rsci_d_31_27 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_26_23 <= STD_LOGIC_VECTOR'( "0000");
        instr_tile_rsci_d_22_18 <= STD_LOGIC_VECTOR'( "00000");
        instr_tile_rsci_d_17_14 <= STD_LOGIC_VECTOR'( "0000");
        instr_tile_rsci_d_13_9 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( ccs_ccore_en = '1' ) THEN
        instr_bound_rsci_d_44_36 <= MUX_v_9_2_2((loops_bound_rsci_idat(44 DOWNTO
            36)), STD_LOGIC_VECTOR'( "000000001"), loops_relevancy_rsci_idat(4));
        instr_bound_rsci_d_8_0 <= MUX_v_9_2_2((loops_bound_rsci_idat(8 DOWNTO 0)),
            STD_LOGIC_VECTOR'( "000000001"), loops_relevancy_rsci_idat(0));
        instr_bound_rsci_d_35_27 <= MUX_v_9_2_2((loops_bound_rsci_idat(35 DOWNTO
            27)), STD_LOGIC_VECTOR'( "000000001"), loops_relevancy_rsci_idat(3));
        instr_bound_rsci_d_17_9 <= MUX_v_9_2_2((loops_bound_rsci_idat(17 DOWNTO 9)),
            STD_LOGIC_VECTOR'( "000000001"), loops_relevancy_rsci_idat(1));
        instr_bound_rsci_d_26_18 <= MUX_v_9_2_2((loops_bound_rsci_idat(26 DOWNTO
            18)), STD_LOGIC_VECTOR'( "000000001"), loops_relevancy_rsci_idat(2));
        instr_tile_rsci_d_4_0 <= instr_tile_rsci_d_4_0_mx0;
        instr_tile_rsci_d_35_32 <= instr_tile_rsci_d_35_32_mx0;
        instr_tile_rsci_d_31_27 <= instr_tile_rsci_d_31_27_mx0;
        instr_tile_rsci_d_26_23 <= instr_tile_rsci_d_26_23_mx0;
        instr_tile_rsci_d_22_18 <= instr_tile_rsci_d_22_18_mx0;
        instr_tile_rsci_d_17_14 <= instr_tile_rsci_d_17_14_mx0;
        instr_tile_rsci_d_13_9 <= instr_tile_rsci_d_13_9_mx0;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_O_addr_type_L2
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000165 IS
  PORT(
    loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
    instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000165;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000165 IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000164
    PORT(
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR (44 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_loops_bound_rsc_dat :  STD_LOGIC_VECTOR
      (44 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_loops_relevancy_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_tile_size_in_rsc_dat :  STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_tile_size_out_rsc_z :  STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_instr_bound_rsc_z :  STD_LOGIC_VECTOR
      (44 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L2_run_inst_instr_tile_rsc_z :  STD_LOGIC_VECTOR
      (44 DOWNTO 0);

BEGIN
  tiling_unit_5_O_addr_type_L2_run_inst :  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000164
    PORT MAP(
      loops_bound_rsc_dat => tiling_unit_5_O_addr_type_L2_run_inst_loops_bound_rsc_dat,
      loops_relevancy_rsc_dat => tiling_unit_5_O_addr_type_L2_run_inst_loops_relevancy_rsc_dat,
      tile_size_in_rsc_dat => tiling_unit_5_O_addr_type_L2_run_inst_tile_size_in_rsc_dat,
      tile_size_out_rsc_z => tiling_unit_5_O_addr_type_L2_run_inst_tile_size_out_rsc_z,
      instr_bound_rsc_z => tiling_unit_5_O_addr_type_L2_run_inst_instr_bound_rsc_z,
      instr_tile_rsc_z => tiling_unit_5_O_addr_type_L2_run_inst_instr_tile_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  tiling_unit_5_O_addr_type_L2_run_inst_loops_bound_rsc_dat <= loops_bound_rsc_dat;
  tiling_unit_5_O_addr_type_L2_run_inst_loops_relevancy_rsc_dat <= loops_relevancy_rsc_dat;
  tiling_unit_5_O_addr_type_L2_run_inst_tile_size_in_rsc_dat <= tile_size_in_rsc_dat;
  tile_size_out_rsc_z <= tiling_unit_5_O_addr_type_L2_run_inst_tile_size_out_rsc_z;
  instr_bound_rsc_z <= tiling_unit_5_O_addr_type_L2_run_inst_instr_bound_rsc_z;
  instr_tile_rsc_z <= tiling_unit_5_O_addr_type_L2_run_inst_instr_tile_rsc_z;

END v1;




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000005_5.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:         VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:        Sun Sep  6 22:45:38 PDT 2020
--
--  Generated by:    r0678912@amazone.esat.kuleuven.be
--  Generated date:  Tue Jul 13 10:58:02 2021
-- ----------------------------------------------------------------------

--
-- ------------------------------------------------------------------
--  Design Unit:     tiling_unit_5_O_addr_type_L1_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000166 IS
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
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000166;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000166 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL loops_bound_rsci_idat :  STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat :  STD_LOGIC;
  SIGNAL instr_bound_rsci_d_24_20 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_19_15 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_14_10 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_9_5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_bound_rsci_d_4_0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_19_15 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_14_10 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_9_5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL reg_tile_size_out_rsci_d_cse :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_4_0_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_19_15_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_9_5_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL instr_tile_rsci_d_14_10_mx0 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_and_cse :  STD_LOGIC;

  SIGNAL for_5_if_mul_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_1_if_mul_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_4_if_mul_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_2_if_mul_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL for_3_if_mul_nl :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_bound_rsci_dat :  STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL loops_bound_rsci_idat_1 :  STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL loops_relevancy_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL loops_relevancy_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL instr_bound_rsci_d :  STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL instr_bound_rsci_z :  STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL instr_tile_rsci_d :  STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL instr_tile_rsci_z :  STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL tile_size_in_rsci_dat :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_in_rsci_idat_1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL tile_size_out_rsci_d :  STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL tile_size_out_rsci_z :  STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat :  STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 :  STD_LOGIC_VECTOR (0 DOWNTO 0);

  FUNCTION MUX_v_5_2_2(input_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel :  STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result :  STD_LOGIC_VECTOR(4 DOWNTO 0);

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
  loops_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  loops_relevancy_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  instr_bound_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  instr_tile_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  tile_size_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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

  tile_size_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000157
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

  ccs_ccore_start_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000155
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
--  Design Unit:     tiling_unit_5_O_addr_type_L1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000154.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000156.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000167 IS
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
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000167;

ARCHITECTURE v1 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000167 IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000166
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
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_loops_bound_rsc_dat :  STD_LOGIC_VECTOR
      (24 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_loops_relevancy_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_tile_size_in_rsc_dat :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_tile_size_out_rsc_z :  STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_instr_bound_rsc_z :  STD_LOGIC_VECTOR
      (24 DOWNTO 0);
  SIGNAL tiling_unit_5_O_addr_type_L1_run_inst_instr_tile_rsc_z :  STD_LOGIC_VECTOR
      (24 DOWNTO 0);

BEGIN
  tiling_unit_5_O_addr_type_L1_run_inst :  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000166
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




--------> ./power_top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_pa000000.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   r0678912@amazone.esat.kuleuven.be
--  Generated date: Tue Jul 13 11:47:32 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078
    IS
  -- Default Constants

  -- FSM State Type Declaration for topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000131
  TYPE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000168
      IS (run_rlp_C_0, main_C_0, main_C_1, main_C_2, main_C_3, main_C_4, main_C_5,
      main_C_6);

  SIGNAL state_var : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000168;
  SIGNAL state_var_NS : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000168;

BEGIN
  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000131
      : PROCESS (state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= main_C_1;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= main_C_3;
      WHEN main_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= main_C_4;
      WHEN main_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= main_C_5;
      WHEN main_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= main_C_6;
      WHEN main_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= main_C_0;
      -- run_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000131;

  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000169
      : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= run_rlp_C_0;
      ELSE
        IF ( run_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000169;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077
    IS
  PORT(
    run_wen : OUT STD_LOGIC;
    layer_instruction_in_rsci_wen_comp : IN STD_LOGIC;
    O_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
    O_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
    O_instr_L3_out_rsci_wen_comp : IN STD_LOGIC;
    I_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
    I_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
    I_instr_L3_out_rsci_wen_comp : IN STD_LOGIC;
    W_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
    W_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
    W_instr_L3_out_rsci_wen_comp : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077
    IS
  -- Default Constants

BEGIN
  run_wen <= layer_instruction_in_rsci_wen_comp AND O_instr_L1_out_rsci_wen_comp
      AND O_instr_L2_out_rsci_wen_comp AND O_instr_L3_out_rsci_wen_comp AND I_instr_L1_out_rsci_wen_comp
      AND I_instr_L2_out_rsci_wen_comp AND I_instr_L3_out_rsci_wen_comp AND W_instr_L1_out_rsci_wen_comp
      AND W_instr_L2_out_rsci_wen_comp AND W_instr_L3_out_rsci_wen_comp;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076
    IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    W_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_iro_1 : IN STD_LOGIC;
    W_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_iro_2 : IN STD_LOGIC;
    O_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_iro_3 : IN STD_LOGIC;
    O_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_iro_4 : IN STD_LOGIC;
    O_tiling_unit_L1_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    ensig_cgo_1 : IN STD_LOGIC;
    ensig_cgo_2 : IN STD_LOGIC;
    ensig_cgo_3 : IN STD_LOGIC;
    ensig_cgo_4 : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076
    IS
  -- Default Constants

BEGIN
  W_tiling_unit_L3_run_cmp_ccs_ccore_en <= run_wen AND (ensig_cgo OR ensig_cgo_iro);
  W_tiling_unit_L2_run_cmp_ccs_ccore_en <= run_wen AND (ensig_cgo_1 OR ensig_cgo_iro_1);
  O_tiling_unit_L3_run_cmp_ccs_ccore_en <= run_wen AND (ensig_cgo_2 OR ensig_cgo_iro_2);
  O_tiling_unit_L2_run_cmp_ccs_ccore_en <= run_wen AND (ensig_cgo_3 OR ensig_cgo_iro_3);
  O_tiling_unit_L1_run_cmp_ccs_ccore_en <= run_wen AND (ensig_cgo_4 OR ensig_cgo_iro_4);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L3_out_rsci_biwt : IN STD_LOGIC;
    W_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
    W_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL W_instr_L3_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  W_instr_L3_out_rsci_bcwt <= W_instr_L3_out_rsci_bcwt_drv;

  W_instr_L3_out_rsci_wen_comp <= (NOT W_instr_L3_out_rsci_oswt) OR W_instr_L3_out_rsci_biwt
      OR W_instr_L3_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L3_out_rsci_bcwt_drv <= '0';
      ELSE
        W_instr_L3_out_rsci_bcwt_drv <= NOT((NOT(W_instr_L3_out_rsci_bcwt_drv OR
            W_instr_L3_out_rsci_biwt)) OR W_instr_L3_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L3_out_rsci_irdy : IN STD_LOGIC;
    W_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
    W_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
    W_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
    W_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L3_out_rsci_ogwt : STD_LOGIC;

BEGIN
  W_instr_L3_out_rsci_bdwt <= W_instr_L3_out_rsci_oswt AND run_wen;
  W_instr_L3_out_rsci_biwt <= W_instr_L3_out_rsci_ogwt AND W_instr_L3_out_rsci_irdy;
  W_instr_L3_out_rsci_ogwt <= W_instr_L3_out_rsci_oswt AND (NOT W_instr_L3_out_rsci_bcwt);
  W_instr_L3_out_rsci_ivld_run_sct <= W_instr_L3_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L2_out_rsci_biwt : IN STD_LOGIC;
    W_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
    W_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL W_instr_L2_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  W_instr_L2_out_rsci_bcwt <= W_instr_L2_out_rsci_bcwt_drv;

  W_instr_L2_out_rsci_wen_comp <= (NOT W_instr_L2_out_rsci_oswt) OR W_instr_L2_out_rsci_biwt
      OR W_instr_L2_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L2_out_rsci_bcwt_drv <= '0';
      ELSE
        W_instr_L2_out_rsci_bcwt_drv <= NOT((NOT(W_instr_L2_out_rsci_bcwt_drv OR
            W_instr_L2_out_rsci_biwt)) OR W_instr_L2_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L2_out_rsci_irdy : IN STD_LOGIC;
    W_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
    W_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
    W_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
    W_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L2_out_rsci_ogwt : STD_LOGIC;

BEGIN
  W_instr_L2_out_rsci_bdwt <= W_instr_L2_out_rsci_oswt AND run_wen;
  W_instr_L2_out_rsci_biwt <= W_instr_L2_out_rsci_ogwt AND W_instr_L2_out_rsci_irdy;
  W_instr_L2_out_rsci_ogwt <= W_instr_L2_out_rsci_oswt AND (NOT W_instr_L2_out_rsci_bcwt);
  W_instr_L2_out_rsci_ivld_run_sct <= W_instr_L2_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L1_out_rsci_biwt : IN STD_LOGIC;
    W_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
    W_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL W_instr_L1_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  W_instr_L1_out_rsci_bcwt <= W_instr_L1_out_rsci_bcwt_drv;

  W_instr_L1_out_rsci_wen_comp <= (NOT W_instr_L1_out_rsci_oswt) OR W_instr_L1_out_rsci_biwt
      OR W_instr_L1_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L1_out_rsci_bcwt_drv <= '0';
      ELSE
        W_instr_L1_out_rsci_bcwt_drv <= NOT((NOT(W_instr_L1_out_rsci_bcwt_drv OR
            W_instr_L1_out_rsci_biwt)) OR W_instr_L1_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L1_out_rsci_irdy : IN STD_LOGIC;
    W_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
    W_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
    W_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
    W_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L1_out_rsci_ogwt : STD_LOGIC;

BEGIN
  W_instr_L1_out_rsci_bdwt <= W_instr_L1_out_rsci_oswt AND run_wen;
  W_instr_L1_out_rsci_biwt <= W_instr_L1_out_rsci_ogwt AND W_instr_L1_out_rsci_irdy;
  W_instr_L1_out_rsci_ogwt <= W_instr_L1_out_rsci_oswt AND (NOT W_instr_L1_out_rsci_bcwt);
  W_instr_L1_out_rsci_ivld_run_sct <= W_instr_L1_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L3_out_rsci_biwt : IN STD_LOGIC;
    I_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
    I_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL I_instr_L3_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  I_instr_L3_out_rsci_bcwt <= I_instr_L3_out_rsci_bcwt_drv;

  I_instr_L3_out_rsci_wen_comp <= (NOT I_instr_L3_out_rsci_oswt) OR I_instr_L3_out_rsci_biwt
      OR I_instr_L3_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_L3_out_rsci_bcwt_drv <= '0';
      ELSE
        I_instr_L3_out_rsci_bcwt_drv <= NOT((NOT(I_instr_L3_out_rsci_bcwt_drv OR
            I_instr_L3_out_rsci_biwt)) OR I_instr_L3_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L3_out_rsci_irdy : IN STD_LOGIC;
    I_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
    I_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
    I_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
    I_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L3_out_rsci_ogwt : STD_LOGIC;

BEGIN
  I_instr_L3_out_rsci_bdwt <= I_instr_L3_out_rsci_oswt AND run_wen;
  I_instr_L3_out_rsci_biwt <= I_instr_L3_out_rsci_ogwt AND I_instr_L3_out_rsci_irdy;
  I_instr_L3_out_rsci_ogwt <= I_instr_L3_out_rsci_oswt AND (NOT I_instr_L3_out_rsci_bcwt);
  I_instr_L3_out_rsci_ivld_run_sct <= I_instr_L3_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L2_out_rsci_biwt : IN STD_LOGIC;
    I_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
    I_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL I_instr_L2_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  I_instr_L2_out_rsci_bcwt <= I_instr_L2_out_rsci_bcwt_drv;

  I_instr_L2_out_rsci_wen_comp <= (NOT I_instr_L2_out_rsci_oswt) OR I_instr_L2_out_rsci_biwt
      OR I_instr_L2_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_L2_out_rsci_bcwt_drv <= '0';
      ELSE
        I_instr_L2_out_rsci_bcwt_drv <= NOT((NOT(I_instr_L2_out_rsci_bcwt_drv OR
            I_instr_L2_out_rsci_biwt)) OR I_instr_L2_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L2_out_rsci_irdy : IN STD_LOGIC;
    I_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
    I_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
    I_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
    I_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L2_out_rsci_ogwt : STD_LOGIC;

BEGIN
  I_instr_L2_out_rsci_bdwt <= I_instr_L2_out_rsci_oswt AND run_wen;
  I_instr_L2_out_rsci_biwt <= I_instr_L2_out_rsci_ogwt AND I_instr_L2_out_rsci_irdy;
  I_instr_L2_out_rsci_ogwt <= I_instr_L2_out_rsci_oswt AND (NOT I_instr_L2_out_rsci_bcwt);
  I_instr_L2_out_rsci_ivld_run_sct <= I_instr_L2_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L1_out_rsci_biwt : IN STD_LOGIC;
    I_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
    I_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL I_instr_L1_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  I_instr_L1_out_rsci_bcwt <= I_instr_L1_out_rsci_bcwt_drv;

  I_instr_L1_out_rsci_wen_comp <= (NOT I_instr_L1_out_rsci_oswt) OR I_instr_L1_out_rsci_biwt
      OR I_instr_L1_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_L1_out_rsci_bcwt_drv <= '0';
      ELSE
        I_instr_L1_out_rsci_bcwt_drv <= NOT((NOT(I_instr_L1_out_rsci_bcwt_drv OR
            I_instr_L1_out_rsci_biwt)) OR I_instr_L1_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L1_out_rsci_irdy : IN STD_LOGIC;
    I_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
    I_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
    I_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
    I_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L1_out_rsci_ogwt : STD_LOGIC;

BEGIN
  I_instr_L1_out_rsci_bdwt <= I_instr_L1_out_rsci_oswt AND run_wen;
  I_instr_L1_out_rsci_biwt <= I_instr_L1_out_rsci_ogwt AND I_instr_L1_out_rsci_irdy;
  I_instr_L1_out_rsci_ogwt <= I_instr_L1_out_rsci_oswt AND (NOT I_instr_L1_out_rsci_bcwt);
  I_instr_L1_out_rsci_ivld_run_sct <= I_instr_L1_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L3_out_rsci_biwt : IN STD_LOGIC;
    O_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
    O_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL O_instr_L3_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  O_instr_L3_out_rsci_bcwt <= O_instr_L3_out_rsci_bcwt_drv;

  O_instr_L3_out_rsci_wen_comp <= (NOT O_instr_L3_out_rsci_oswt) OR O_instr_L3_out_rsci_biwt
      OR O_instr_L3_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_L3_out_rsci_bcwt_drv <= '0';
      ELSE
        O_instr_L3_out_rsci_bcwt_drv <= NOT((NOT(O_instr_L3_out_rsci_bcwt_drv OR
            O_instr_L3_out_rsci_biwt)) OR O_instr_L3_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L3_out_rsci_irdy : IN STD_LOGIC;
    O_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
    O_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
    O_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
    O_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L3_out_rsci_ogwt : STD_LOGIC;

BEGIN
  O_instr_L3_out_rsci_bdwt <= O_instr_L3_out_rsci_oswt AND run_wen;
  O_instr_L3_out_rsci_biwt <= O_instr_L3_out_rsci_ogwt AND O_instr_L3_out_rsci_irdy;
  O_instr_L3_out_rsci_ogwt <= O_instr_L3_out_rsci_oswt AND (NOT O_instr_L3_out_rsci_bcwt);
  O_instr_L3_out_rsci_ivld_run_sct <= O_instr_L3_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L2_out_rsci_biwt : IN STD_LOGIC;
    O_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
    O_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL O_instr_L2_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  O_instr_L2_out_rsci_bcwt <= O_instr_L2_out_rsci_bcwt_drv;

  O_instr_L2_out_rsci_wen_comp <= (NOT O_instr_L2_out_rsci_oswt) OR O_instr_L2_out_rsci_biwt
      OR O_instr_L2_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_L2_out_rsci_bcwt_drv <= '0';
      ELSE
        O_instr_L2_out_rsci_bcwt_drv <= NOT((NOT(O_instr_L2_out_rsci_bcwt_drv OR
            O_instr_L2_out_rsci_biwt)) OR O_instr_L2_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L2_out_rsci_irdy : IN STD_LOGIC;
    O_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
    O_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
    O_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
    O_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L2_out_rsci_ogwt : STD_LOGIC;

BEGIN
  O_instr_L2_out_rsci_bdwt <= O_instr_L2_out_rsci_oswt AND run_wen;
  O_instr_L2_out_rsci_biwt <= O_instr_L2_out_rsci_ogwt AND O_instr_L2_out_rsci_irdy;
  O_instr_L2_out_rsci_ogwt <= O_instr_L2_out_rsci_oswt AND (NOT O_instr_L2_out_rsci_bcwt);
  O_instr_L2_out_rsci_ivld_run_sct <= O_instr_L2_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L1_out_rsci_biwt : IN STD_LOGIC;
    O_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
    O_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL O_instr_L1_out_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  O_instr_L1_out_rsci_bcwt <= O_instr_L1_out_rsci_bcwt_drv;

  O_instr_L1_out_rsci_wen_comp <= (NOT O_instr_L1_out_rsci_oswt) OR O_instr_L1_out_rsci_biwt
      OR O_instr_L1_out_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_L1_out_rsci_bcwt_drv <= '0';
      ELSE
        O_instr_L1_out_rsci_bcwt_drv <= NOT((NOT(O_instr_L1_out_rsci_bcwt_drv OR
            O_instr_L1_out_rsci_biwt)) OR O_instr_L1_out_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L1_out_rsci_irdy : IN STD_LOGIC;
    O_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
    O_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
    O_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
    O_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L1_out_rsci_ogwt : STD_LOGIC;

BEGIN
  O_instr_L1_out_rsci_bdwt <= O_instr_L1_out_rsci_oswt AND run_wen;
  O_instr_L1_out_rsci_biwt <= O_instr_L1_out_rsci_ogwt AND O_instr_L1_out_rsci_irdy;
  O_instr_L1_out_rsci_ogwt <= O_instr_L1_out_rsci_oswt AND (NOT O_instr_L1_out_rsci_bcwt);
  O_instr_L1_out_rsci_ivld_run_sct <= O_instr_L1_out_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    layer_instruction_in_rsci_oswt : IN STD_LOGIC;
    layer_instruction_in_rsci_wen_comp : OUT STD_LOGIC;
    layer_instruction_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (484 DOWNTO 0);
    layer_instruction_in_rsci_biwt : IN STD_LOGIC;
    layer_instruction_in_rsci_bdwt : IN STD_LOGIC;
    layer_instruction_in_rsci_bcwt : OUT STD_LOGIC;
    layer_instruction_in_rsci_idat : IN STD_LOGIC_VECTOR (484 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL layer_instruction_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL layer_instruction_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (484 DOWNTO 0);

  FUNCTION MUX_v_485_2_2(input_0 : STD_LOGIC_VECTOR(484 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(484 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(484 DOWNTO 0);

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
  -- Output Reader Assignments
  layer_instruction_in_rsci_bcwt <= layer_instruction_in_rsci_bcwt_drv;

  layer_instruction_in_rsci_wen_comp <= (NOT layer_instruction_in_rsci_oswt) OR layer_instruction_in_rsci_biwt
      OR layer_instruction_in_rsci_bcwt_drv;
  layer_instruction_in_rsci_idat_mxwt <= MUX_v_485_2_2(layer_instruction_in_rsci_idat,
      layer_instruction_in_rsci_idat_bfwt, layer_instruction_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        layer_instruction_in_rsci_bcwt_drv <= '0';
      ELSE
        layer_instruction_in_rsci_bcwt_drv <= NOT((NOT(layer_instruction_in_rsci_bcwt_drv
            OR layer_instruction_in_rsci_biwt)) OR layer_instruction_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        layer_instruction_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( layer_instruction_in_rsci_biwt = '1' ) THEN
        layer_instruction_in_rsci_idat_bfwt <= layer_instruction_in_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    layer_instruction_in_rsci_oswt : IN STD_LOGIC;
    layer_instruction_in_rsci_biwt : OUT STD_LOGIC;
    layer_instruction_in_rsci_bdwt : OUT STD_LOGIC;
    layer_instruction_in_rsci_bcwt : IN STD_LOGIC;
    layer_instruction_in_rsci_irdy_run_sct : OUT STD_LOGIC;
    layer_instruction_in_rsci_ivld : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL layer_instruction_in_rsci_ogwt : STD_LOGIC;

BEGIN
  layer_instruction_in_rsci_bdwt <= layer_instruction_in_rsci_oswt AND run_wen;
  layer_instruction_in_rsci_biwt <= layer_instruction_in_rsci_ogwt AND layer_instruction_in_rsci_ivld;
  layer_instruction_in_rsci_ogwt <= layer_instruction_in_rsci_oswt AND (NOT layer_instruction_in_rsci_bcwt);
  layer_instruction_in_rsci_irdy_run_sct <= layer_instruction_in_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014
    IS
  -- Default Constants

  -- FSM State Type Declaration for topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000057
  TYPE topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000170
      IS (run_rlp_C_0, main_C_0);

  SIGNAL state_var : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000170;
  SIGNAL state_var_NS : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000170;

BEGIN
  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000057
      : PROCESS (state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10");
        state_var_NS <= main_C_0;
      -- run_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "01");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000057;

  topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000171
      : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= run_rlp_C_0;
      ELSE
        IF ( run_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000171;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : OUT STD_LOGIC;
    run_wten : OUT STD_LOGIC;
    O_instr_in_rsci_wen_comp : IN STD_LOGIC;
    I_instr_in_rsci_wen_comp : IN STD_LOGIC;
    W_instr_in_rsci_wen_comp : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL run_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  run_wen <= run_wen_drv;

  run_wen_drv <= O_instr_in_rsci_wen_comp AND I_instr_in_rsci_wen_comp AND W_instr_in_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_wten <= '0';
      ELSE
        run_wten <= NOT run_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_in_rsci_oswt : IN STD_LOGIC;
    W_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_in_rsci_biwt : IN STD_LOGIC;
    W_instr_in_rsci_bdwt : IN STD_LOGIC;
    W_instr_in_rsci_bcwt : OUT STD_LOGIC;
    W_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL W_instr_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL W_instr_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (49 DOWNTO 0);

  FUNCTION MUX_v_50_2_2(input_0 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(49 DOWNTO 0);

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
  -- Output Reader Assignments
  W_instr_in_rsci_bcwt <= W_instr_in_rsci_bcwt_drv;

  W_instr_in_rsci_wen_comp <= (NOT W_instr_in_rsci_oswt) OR W_instr_in_rsci_biwt
      OR W_instr_in_rsci_bcwt_drv;
  W_instr_in_rsci_idat_mxwt <= MUX_v_50_2_2(W_instr_in_rsci_idat, W_instr_in_rsci_idat_bfwt,
      W_instr_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_in_rsci_bcwt_drv <= '0';
      ELSE
        W_instr_in_rsci_bcwt_drv <= NOT((NOT(W_instr_in_rsci_bcwt_drv OR W_instr_in_rsci_biwt))
            OR W_instr_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
      ELSIF ( W_instr_in_rsci_biwt = '1' ) THEN
        W_instr_in_rsci_idat_bfwt <= W_instr_in_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    W_instr_in_rsci_oswt : IN STD_LOGIC;
    W_instr_in_rsci_biwt : OUT STD_LOGIC;
    W_instr_in_rsci_bdwt : OUT STD_LOGIC;
    W_instr_in_rsci_bcwt : IN STD_LOGIC;
    W_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
    W_instr_in_rsci_ivld : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_in_rsci_ogwt : STD_LOGIC;

BEGIN
  W_instr_in_rsci_bdwt <= W_instr_in_rsci_oswt AND run_wen;
  W_instr_in_rsci_biwt <= W_instr_in_rsci_ogwt AND W_instr_in_rsci_ivld;
  W_instr_in_rsci_ogwt <= W_instr_in_rsci_oswt AND (NOT W_instr_in_rsci_bcwt);
  W_instr_in_rsci_irdy_run_sct <= W_instr_in_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_in_rsci_oswt : IN STD_LOGIC;
    I_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_in_rsci_biwt : IN STD_LOGIC;
    I_instr_in_rsci_bdwt : IN STD_LOGIC;
    I_instr_in_rsci_bcwt : OUT STD_LOGIC;
    I_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL I_instr_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL I_instr_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (49 DOWNTO 0);

  FUNCTION MUX_v_50_2_2(input_0 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(49 DOWNTO 0);

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
  -- Output Reader Assignments
  I_instr_in_rsci_bcwt <= I_instr_in_rsci_bcwt_drv;

  I_instr_in_rsci_wen_comp <= (NOT I_instr_in_rsci_oswt) OR I_instr_in_rsci_biwt
      OR I_instr_in_rsci_bcwt_drv;
  I_instr_in_rsci_idat_mxwt <= MUX_v_50_2_2(I_instr_in_rsci_idat, I_instr_in_rsci_idat_bfwt,
      I_instr_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_in_rsci_bcwt_drv <= '0';
      ELSE
        I_instr_in_rsci_bcwt_drv <= NOT((NOT(I_instr_in_rsci_bcwt_drv OR I_instr_in_rsci_biwt))
            OR I_instr_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
      ELSIF ( I_instr_in_rsci_biwt = '1' ) THEN
        I_instr_in_rsci_idat_bfwt <= I_instr_in_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    I_instr_in_rsci_oswt : IN STD_LOGIC;
    I_instr_in_rsci_biwt : OUT STD_LOGIC;
    I_instr_in_rsci_bdwt : OUT STD_LOGIC;
    I_instr_in_rsci_bcwt : IN STD_LOGIC;
    I_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
    I_instr_in_rsci_ivld : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_in_rsci_ogwt : STD_LOGIC;

BEGIN
  I_instr_in_rsci_bdwt <= I_instr_in_rsci_oswt AND run_wen;
  I_instr_in_rsci_biwt <= I_instr_in_rsci_ogwt AND I_instr_in_rsci_ivld;
  I_instr_in_rsci_ogwt <= I_instr_in_rsci_oswt AND (NOT I_instr_in_rsci_bcwt);
  I_instr_in_rsci_irdy_run_sct <= I_instr_in_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_in_rsci_oswt : IN STD_LOGIC;
    O_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_in_rsci_biwt : IN STD_LOGIC;
    O_instr_in_rsci_bdwt : IN STD_LOGIC;
    O_instr_in_rsci_bcwt : OUT STD_LOGIC;
    O_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041
    IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL O_instr_in_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL O_instr_in_rsci_idat_bfwt : STD_LOGIC_VECTOR (49 DOWNTO 0);

  FUNCTION MUX_v_50_2_2(input_0 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(49 DOWNTO 0);

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
  -- Output Reader Assignments
  O_instr_in_rsci_bcwt <= O_instr_in_rsci_bcwt_drv;

  O_instr_in_rsci_wen_comp <= (NOT O_instr_in_rsci_oswt) OR O_instr_in_rsci_biwt
      OR O_instr_in_rsci_bcwt_drv;
  O_instr_in_rsci_idat_mxwt <= MUX_v_50_2_2(O_instr_in_rsci_idat, O_instr_in_rsci_idat_bfwt,
      O_instr_in_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_in_rsci_bcwt_drv <= '0';
      ELSE
        O_instr_in_rsci_bcwt_drv <= NOT((NOT(O_instr_in_rsci_bcwt_drv OR O_instr_in_rsci_biwt))
            OR O_instr_in_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_in_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
      ELSIF ( O_instr_in_rsci_biwt = '1' ) THEN
        O_instr_in_rsci_idat_bfwt <= O_instr_in_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    O_instr_in_rsci_oswt : IN STD_LOGIC;
    O_instr_in_rsci_biwt : OUT STD_LOGIC;
    O_instr_in_rsci_bdwt : OUT STD_LOGIC;
    O_instr_in_rsci_bcwt : IN STD_LOGIC;
    O_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
    O_instr_in_rsci_ivld : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_in_rsci_ogwt : STD_LOGIC;

BEGIN
  O_instr_in_rsci_bdwt <= O_instr_in_rsci_oswt AND run_wen;
  O_instr_in_rsci_biwt <= O_instr_in_rsci_ogwt AND O_instr_in_rsci_ivld;
  O_instr_in_rsci_ogwt <= O_instr_in_rsci_oswt AND (NOT O_instr_in_rsci_bcwt);
  O_instr_in_rsci_irdy_run_sct <= O_instr_in_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    wr_data_zero_guard_rsci_ivld_mxwt : OUT STD_LOGIC;
    wr_data_zero_guard_rsci_idat_mxwt : OUT STD_LOGIC;
    wr_data_zero_guard_rsci_biwt : IN STD_LOGIC;
    wr_data_zero_guard_rsci_bdwt : IN STD_LOGIC;
    wr_data_zero_guard_rsci_ivld : IN STD_LOGIC;
    wr_data_zero_guard_rsci_idat : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL wr_data_zero_guard_rsci_bcwt : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_ivld_bfwt : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_idat_gtd : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_idat_bfwt : STD_LOGIC;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

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
  wr_data_zero_guard_rsci_ivld_mxwt <= MUX_s_1_2_2(wr_data_zero_guard_rsci_ivld,
      wr_data_zero_guard_rsci_ivld_bfwt, wr_data_zero_guard_rsci_bcwt);
  wr_data_zero_guard_rsci_idat_gtd <= wr_data_zero_guard_rsci_idat AND wr_data_zero_guard_rsci_ivld;
  wr_data_zero_guard_rsci_idat_mxwt <= MUX_s_1_2_2(wr_data_zero_guard_rsci_idat_gtd,
      wr_data_zero_guard_rsci_idat_bfwt, wr_data_zero_guard_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        wr_data_zero_guard_rsci_bcwt <= '0';
      ELSE
        wr_data_zero_guard_rsci_bcwt <= NOT((NOT(wr_data_zero_guard_rsci_bcwt OR
            wr_data_zero_guard_rsci_biwt)) OR wr_data_zero_guard_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        wr_data_zero_guard_rsci_ivld_bfwt <= '0';
        wr_data_zero_guard_rsci_idat_bfwt <= '0';
      ELSIF ( wr_data_zero_guard_rsci_biwt = '1' ) THEN
        wr_data_zero_guard_rsci_ivld_bfwt <= wr_data_zero_guard_rsci_ivld;
        wr_data_zero_guard_rsci_idat_bfwt <= wr_data_zero_guard_rsci_idat_gtd;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    wr_data_zero_guard_rsci_oswt : IN STD_LOGIC;
    wr_data_zero_guard_rsci_biwt : OUT STD_LOGIC;
    wr_data_zero_guard_rsci_bdwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035
    IS
  -- Default Constants

BEGIN
  wr_data_zero_guard_rsci_bdwt <= wr_data_zero_guard_rsci_oswt AND run_wen;
  wr_data_zero_guard_rsci_biwt <= (NOT run_wten) AND wr_data_zero_guard_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    W_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_wr_data_rsci_biwt : IN STD_LOGIC;
    W_wr_data_rsci_bdwt : IN STD_LOGIC;
    W_wr_data_rsci_ivld : IN STD_LOGIC;
    W_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_wr_data_rsci_bcwt : STD_LOGIC;
  SIGNAL W_wr_data_rsci_ivld_bfwt : STD_LOGIC;
  SIGNAL W_wr_data_rsci_idat_gtd : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_wr_data_rsci_idat_bfwt : STD_LOGIC_VECTOR (15 DOWNTO 0);

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

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
  W_wr_data_rsci_ivld_mxwt <= MUX_s_1_2_2(W_wr_data_rsci_ivld, W_wr_data_rsci_ivld_bfwt,
      W_wr_data_rsci_bcwt);
  W_wr_data_rsci_idat_gtd <= MUX_v_16_2_2(STD_LOGIC_VECTOR'("0000000000000000"),
      W_wr_data_rsci_idat, W_wr_data_rsci_ivld);
  W_wr_data_rsci_idat_mxwt <= MUX_v_16_2_2(W_wr_data_rsci_idat_gtd, W_wr_data_rsci_idat_bfwt,
      W_wr_data_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_wr_data_rsci_bcwt <= '0';
      ELSE
        W_wr_data_rsci_bcwt <= NOT((NOT(W_wr_data_rsci_bcwt OR W_wr_data_rsci_biwt))
            OR W_wr_data_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_wr_data_rsci_ivld_bfwt <= '0';
        W_wr_data_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( W_wr_data_rsci_biwt = '1' ) THEN
        W_wr_data_rsci_ivld_bfwt <= W_wr_data_rsci_ivld;
        W_wr_data_rsci_idat_bfwt <= W_wr_data_rsci_idat_gtd;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    W_wr_data_rsci_oswt : IN STD_LOGIC;
    W_wr_data_rsci_biwt : OUT STD_LOGIC;
    W_wr_data_rsci_bdwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030
    IS
  -- Default Constants

BEGIN
  W_wr_data_rsci_bdwt <= W_wr_data_rsci_oswt AND run_wen;
  W_wr_data_rsci_biwt <= (NOT run_wten) AND W_wr_data_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    I_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_wr_data_rsci_biwt : IN STD_LOGIC;
    I_wr_data_rsci_bdwt : IN STD_LOGIC;
    I_wr_data_rsci_ivld : IN STD_LOGIC;
    I_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_wr_data_rsci_bcwt : STD_LOGIC;
  SIGNAL I_wr_data_rsci_ivld_bfwt : STD_LOGIC;
  SIGNAL I_wr_data_rsci_idat_gtd : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_wr_data_rsci_idat_bfwt : STD_LOGIC_VECTOR (15 DOWNTO 0);

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

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
  I_wr_data_rsci_ivld_mxwt <= MUX_s_1_2_2(I_wr_data_rsci_ivld, I_wr_data_rsci_ivld_bfwt,
      I_wr_data_rsci_bcwt);
  I_wr_data_rsci_idat_gtd <= MUX_v_16_2_2(STD_LOGIC_VECTOR'("0000000000000000"),
      I_wr_data_rsci_idat, I_wr_data_rsci_ivld);
  I_wr_data_rsci_idat_mxwt <= MUX_v_16_2_2(I_wr_data_rsci_idat_gtd, I_wr_data_rsci_idat_bfwt,
      I_wr_data_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_wr_data_rsci_bcwt <= '0';
      ELSE
        I_wr_data_rsci_bcwt <= NOT((NOT(I_wr_data_rsci_bcwt OR I_wr_data_rsci_biwt))
            OR I_wr_data_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_wr_data_rsci_ivld_bfwt <= '0';
        I_wr_data_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( I_wr_data_rsci_biwt = '1' ) THEN
        I_wr_data_rsci_ivld_bfwt <= I_wr_data_rsci_ivld;
        I_wr_data_rsci_idat_bfwt <= I_wr_data_rsci_idat_gtd;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    I_wr_data_rsci_oswt : IN STD_LOGIC;
    I_wr_data_rsci_biwt : OUT STD_LOGIC;
    I_wr_data_rsci_bdwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025
    IS
  -- Default Constants

BEGIN
  I_wr_data_rsci_bdwt <= I_wr_data_rsci_oswt AND run_wen;
  I_wr_data_rsci_biwt <= (NOT run_wten) AND I_wr_data_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_rd_data_rsci_irdy_mxwt : OUT STD_LOGIC;
    O_rd_data_rsci_irdy : IN STD_LOGIC;
    O_rd_data_rsci_biwt : IN STD_LOGIC;
    O_rd_data_rsci_bdwt : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_rd_data_rsci_bcwt : STD_LOGIC;
  SIGNAL O_rd_data_rsci_irdy_bfwt : STD_LOGIC;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

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
  O_rd_data_rsci_irdy_mxwt <= MUX_s_1_2_2(O_rd_data_rsci_irdy, O_rd_data_rsci_irdy_bfwt,
      O_rd_data_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_rd_data_rsci_bcwt <= '0';
      ELSE
        O_rd_data_rsci_bcwt <= NOT((NOT(O_rd_data_rsci_bcwt OR O_rd_data_rsci_biwt))
            OR O_rd_data_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_rd_data_rsci_irdy_bfwt <= '0';
      ELSIF ( O_rd_data_rsci_biwt = '1' ) THEN
        O_rd_data_rsci_irdy_bfwt <= O_rd_data_rsci_irdy;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    O_rd_data_rsci_oswt : IN STD_LOGIC;
    O_rd_data_rsci_biwt : OUT STD_LOGIC;
    O_rd_data_rsci_bdwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020
    IS
  -- Default Constants

BEGIN
  O_rd_data_rsci_bdwt <= O_rd_data_rsci_oswt AND run_wen;
  O_rd_data_rsci_biwt <= (NOT run_wten) AND O_rd_data_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    O_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_wr_data_rsci_biwt : IN STD_LOGIC;
    O_wr_data_rsci_bdwt : IN STD_LOGIC;
    O_wr_data_rsci_ivld : IN STD_LOGIC;
    O_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_wr_data_rsci_bcwt : STD_LOGIC;
  SIGNAL O_wr_data_rsci_ivld_bfwt : STD_LOGIC;
  SIGNAL O_wr_data_rsci_idat_gtd : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_wr_data_rsci_idat_bfwt : STD_LOGIC_VECTOR (15 DOWNTO 0);

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

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
  O_wr_data_rsci_ivld_mxwt <= MUX_s_1_2_2(O_wr_data_rsci_ivld, O_wr_data_rsci_ivld_bfwt,
      O_wr_data_rsci_bcwt);
  O_wr_data_rsci_idat_gtd <= MUX_v_16_2_2(STD_LOGIC_VECTOR'("0000000000000000"),
      O_wr_data_rsci_idat, O_wr_data_rsci_ivld);
  O_wr_data_rsci_idat_mxwt <= MUX_v_16_2_2(O_wr_data_rsci_idat_gtd, O_wr_data_rsci_idat_bfwt,
      O_wr_data_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_wr_data_rsci_bcwt <= '0';
      ELSE
        O_wr_data_rsci_bcwt <= NOT((NOT(O_wr_data_rsci_bcwt OR O_wr_data_rsci_biwt))
            OR O_wr_data_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_wr_data_rsci_ivld_bfwt <= '0';
        O_wr_data_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( O_wr_data_rsci_biwt = '1' ) THEN
        O_wr_data_rsci_ivld_bfwt <= O_wr_data_rsci_ivld;
        O_wr_data_rsci_idat_bfwt <= O_wr_data_rsci_idat_gtd;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015
    IS
  PORT(
    run_wen : IN STD_LOGIC;
    O_wr_data_rsci_oswt : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    O_wr_data_rsci_biwt : OUT STD_LOGIC;
    O_wr_data_rsci_bdwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015
    IS
  -- Default Constants

BEGIN
  O_wr_data_rsci_bdwt <= O_wr_data_rsci_oswt AND run_wen;
  O_wr_data_rsci_biwt <= (NOT run_wten) AND O_wr_data_rsci_oswt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
    W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (159 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L3_out_rsci_irdy : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsci_biwt : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsci_bdwt : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsci_bcwt : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL W_instr_L3_out_rsci_idat_1 : STD_LOGIC_VECTOR (159 DOWNTO 0);
  SIGNAL W_instr_L3_out_rsci_dat : STD_LOGIC_VECTOR (159 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124
    PORT(
      run_wen : IN STD_LOGIC;
      W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L3_out_rsci_irdy : IN STD_LOGIC;
      W_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
      W_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
      W_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
      W_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L3_out_rsci_biwt : IN STD_LOGIC;
      W_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
      W_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  W_instr_L3_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 35,
      width => 160
      )
    PORT MAP(
      irdy => W_instr_L3_out_rsci_irdy,
      ivld => W_instr_L3_out_rsci_ivld_run_sct,
      idat => W_instr_L3_out_rsci_idat_1,
      rdy => W_instr_L3_out_rsc_rdy,
      vld => W_instr_L3_out_rsc_vld,
      dat => W_instr_L3_out_rsci_dat
    );
  W_instr_L3_out_rsci_idat_1 <= W_instr_L3_out_rsci_idat;
  W_instr_L3_out_rsc_dat <= W_instr_L3_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000124
    PORT MAP(
      run_wen => run_wen,
      W_instr_L3_out_rsci_oswt => W_instr_L3_out_rsci_oswt,
      W_instr_L3_out_rsci_irdy => W_instr_L3_out_rsci_irdy,
      W_instr_L3_out_rsci_biwt => W_instr_L3_out_rsci_biwt,
      W_instr_L3_out_rsci_bdwt => W_instr_L3_out_rsci_bdwt,
      W_instr_L3_out_rsci_bcwt => W_instr_L3_out_rsci_bcwt,
      W_instr_L3_out_rsci_ivld_run_sct => W_instr_L3_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_W_instr_L3_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000125
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L3_out_rsci_oswt => W_instr_L3_out_rsci_oswt,
      W_instr_L3_out_rsci_wen_comp => W_instr_L3_out_rsci_wen_comp,
      W_instr_L3_out_rsci_biwt => W_instr_L3_out_rsci_biwt,
      W_instr_L3_out_rsci_bdwt => W_instr_L3_out_rsci_bdwt,
      W_instr_L3_out_rsci_bcwt => W_instr_L3_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
    W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (109 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L2_out_rsci_irdy : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsci_biwt : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsci_bdwt : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsci_bcwt : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL W_instr_L2_out_rsci_idat_1 : STD_LOGIC_VECTOR (109 DOWNTO 0);
  SIGNAL W_instr_L2_out_rsci_dat : STD_LOGIC_VECTOR (109 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119
    PORT(
      run_wen : IN STD_LOGIC;
      W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L2_out_rsci_irdy : IN STD_LOGIC;
      W_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
      W_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
      W_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
      W_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L2_out_rsci_biwt : IN STD_LOGIC;
      W_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
      W_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  W_instr_L2_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 34,
      width => 110
      )
    PORT MAP(
      irdy => W_instr_L2_out_rsci_irdy,
      ivld => W_instr_L2_out_rsci_ivld_run_sct,
      idat => W_instr_L2_out_rsci_idat_1,
      rdy => W_instr_L2_out_rsc_rdy,
      vld => W_instr_L2_out_rsc_vld,
      dat => W_instr_L2_out_rsci_dat
    );
  W_instr_L2_out_rsci_idat_1 <= W_instr_L2_out_rsci_idat;
  W_instr_L2_out_rsc_dat <= W_instr_L2_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000119
    PORT MAP(
      run_wen => run_wen,
      W_instr_L2_out_rsci_oswt => W_instr_L2_out_rsci_oswt,
      W_instr_L2_out_rsci_irdy => W_instr_L2_out_rsci_irdy,
      W_instr_L2_out_rsci_biwt => W_instr_L2_out_rsci_biwt,
      W_instr_L2_out_rsci_bdwt => W_instr_L2_out_rsci_bdwt,
      W_instr_L2_out_rsci_bcwt => W_instr_L2_out_rsci_bcwt,
      W_instr_L2_out_rsci_ivld_run_sct => W_instr_L2_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_W_instr_L2_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000120
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L2_out_rsci_oswt => W_instr_L2_out_rsci_oswt,
      W_instr_L2_out_rsci_wen_comp => W_instr_L2_out_rsci_wen_comp,
      W_instr_L2_out_rsci_biwt => W_instr_L2_out_rsci_biwt,
      W_instr_L2_out_rsci_bdwt => W_instr_L2_out_rsci_bdwt,
      W_instr_L2_out_rsci_bcwt => W_instr_L2_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    W_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_L1_out_rsci_irdy : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsci_biwt : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsci_bdwt : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsci_bcwt : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL W_instr_L1_out_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL W_instr_L1_out_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114
    PORT(
      run_wen : IN STD_LOGIC;
      W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L1_out_rsci_irdy : IN STD_LOGIC;
      W_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
      W_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
      W_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
      W_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L1_out_rsci_biwt : IN STD_LOGIC;
      W_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
      W_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  W_instr_L1_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 33,
      width => 50
      )
    PORT MAP(
      irdy => W_instr_L1_out_rsci_irdy,
      ivld => W_instr_L1_out_rsci_ivld_run_sct,
      idat => W_instr_L1_out_rsci_idat_1,
      rdy => W_instr_L1_out_rsc_rdy,
      vld => W_instr_L1_out_rsc_vld,
      dat => W_instr_L1_out_rsci_dat
    );
  W_instr_L1_out_rsci_idat_1 <= W_instr_L1_out_rsci_idat;
  W_instr_L1_out_rsc_dat <= W_instr_L1_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000114
    PORT MAP(
      run_wen => run_wen,
      W_instr_L1_out_rsci_oswt => W_instr_L1_out_rsci_oswt,
      W_instr_L1_out_rsci_irdy => W_instr_L1_out_rsci_irdy,
      W_instr_L1_out_rsci_biwt => W_instr_L1_out_rsci_biwt,
      W_instr_L1_out_rsci_bdwt => W_instr_L1_out_rsci_bdwt,
      W_instr_L1_out_rsci_bcwt => W_instr_L1_out_rsci_bcwt,
      W_instr_L1_out_rsci_ivld_run_sct => W_instr_L1_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_W_instr_L1_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000115
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L1_out_rsci_oswt => W_instr_L1_out_rsci_oswt,
      W_instr_L1_out_rsci_wen_comp => W_instr_L1_out_rsci_wen_comp,
      W_instr_L1_out_rsci_biwt => W_instr_L1_out_rsci_biwt,
      W_instr_L1_out_rsci_bdwt => W_instr_L1_out_rsci_bdwt,
      W_instr_L1_out_rsci_bcwt => W_instr_L1_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (139 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L3_out_rsci_irdy : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsci_biwt : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsci_bdwt : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsci_bcwt : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL I_instr_L3_out_rsci_idat_1 : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL I_instr_L3_out_rsci_dat : STD_LOGIC_VECTOR (139 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109
    PORT(
      run_wen : IN STD_LOGIC;
      I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L3_out_rsci_irdy : IN STD_LOGIC;
      I_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
      I_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
      I_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
      I_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L3_out_rsci_biwt : IN STD_LOGIC;
      I_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
      I_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  I_instr_L3_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 32,
      width => 140
      )
    PORT MAP(
      irdy => I_instr_L3_out_rsci_irdy,
      ivld => I_instr_L3_out_rsci_ivld_run_sct,
      idat => I_instr_L3_out_rsci_idat_1,
      rdy => I_instr_L3_out_rsc_rdy,
      vld => I_instr_L3_out_rsc_vld,
      dat => I_instr_L3_out_rsci_dat
    );
  I_instr_L3_out_rsci_idat_1 <= I_instr_L3_out_rsci_idat;
  I_instr_L3_out_rsc_dat <= I_instr_L3_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000109
    PORT MAP(
      run_wen => run_wen,
      I_instr_L3_out_rsci_oswt => I_instr_L3_out_rsci_oswt,
      I_instr_L3_out_rsci_irdy => I_instr_L3_out_rsci_irdy,
      I_instr_L3_out_rsci_biwt => I_instr_L3_out_rsci_biwt,
      I_instr_L3_out_rsci_bdwt => I_instr_L3_out_rsci_bdwt,
      I_instr_L3_out_rsci_bcwt => I_instr_L3_out_rsci_bcwt,
      I_instr_L3_out_rsci_ivld_run_sct => I_instr_L3_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_I_instr_L3_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000110
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L3_out_rsci_oswt => I_instr_L3_out_rsci_oswt,
      I_instr_L3_out_rsci_wen_comp => I_instr_L3_out_rsci_wen_comp,
      I_instr_L3_out_rsci_biwt => I_instr_L3_out_rsci_biwt,
      I_instr_L3_out_rsci_bdwt => I_instr_L3_out_rsci_bdwt,
      I_instr_L3_out_rsci_bcwt => I_instr_L3_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (89 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L2_out_rsci_irdy : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsci_biwt : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsci_bdwt : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsci_bcwt : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL I_instr_L2_out_rsci_idat_1 : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL I_instr_L2_out_rsci_dat : STD_LOGIC_VECTOR (89 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104
    PORT(
      run_wen : IN STD_LOGIC;
      I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L2_out_rsci_irdy : IN STD_LOGIC;
      I_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
      I_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
      I_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
      I_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L2_out_rsci_biwt : IN STD_LOGIC;
      I_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
      I_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  I_instr_L2_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 31,
      width => 90
      )
    PORT MAP(
      irdy => I_instr_L2_out_rsci_irdy,
      ivld => I_instr_L2_out_rsci_ivld_run_sct,
      idat => I_instr_L2_out_rsci_idat_1,
      rdy => I_instr_L2_out_rsc_rdy,
      vld => I_instr_L2_out_rsc_vld,
      dat => I_instr_L2_out_rsci_dat
    );
  I_instr_L2_out_rsci_idat_1 <= I_instr_L2_out_rsci_idat;
  I_instr_L2_out_rsc_dat <= I_instr_L2_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000104
    PORT MAP(
      run_wen => run_wen,
      I_instr_L2_out_rsci_oswt => I_instr_L2_out_rsci_oswt,
      I_instr_L2_out_rsci_irdy => I_instr_L2_out_rsci_irdy,
      I_instr_L2_out_rsci_biwt => I_instr_L2_out_rsci_biwt,
      I_instr_L2_out_rsci_bdwt => I_instr_L2_out_rsci_bdwt,
      I_instr_L2_out_rsci_bcwt => I_instr_L2_out_rsci_bcwt,
      I_instr_L2_out_rsci_ivld_run_sct => I_instr_L2_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_I_instr_L2_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000105
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L2_out_rsci_oswt => I_instr_L2_out_rsci_oswt,
      I_instr_L2_out_rsci_wen_comp => I_instr_L2_out_rsci_wen_comp,
      I_instr_L2_out_rsci_biwt => I_instr_L2_out_rsci_biwt,
      I_instr_L2_out_rsci_bdwt => I_instr_L2_out_rsci_bdwt,
      I_instr_L2_out_rsci_bcwt => I_instr_L2_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    I_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_L1_out_rsci_irdy : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsci_biwt : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsci_bdwt : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsci_bcwt : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL I_instr_L1_out_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL I_instr_L1_out_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099
    PORT(
      run_wen : IN STD_LOGIC;
      I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L1_out_rsci_irdy : IN STD_LOGIC;
      I_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
      I_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
      I_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
      I_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L1_out_rsci_biwt : IN STD_LOGIC;
      I_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
      I_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  I_instr_L1_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 30,
      width => 50
      )
    PORT MAP(
      irdy => I_instr_L1_out_rsci_irdy,
      ivld => I_instr_L1_out_rsci_ivld_run_sct,
      idat => I_instr_L1_out_rsci_idat_1,
      rdy => I_instr_L1_out_rsc_rdy,
      vld => I_instr_L1_out_rsc_vld,
      dat => I_instr_L1_out_rsci_dat
    );
  I_instr_L1_out_rsci_idat_1 <= I_instr_L1_out_rsci_idat;
  I_instr_L1_out_rsc_dat <= I_instr_L1_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000099
    PORT MAP(
      run_wen => run_wen,
      I_instr_L1_out_rsci_oswt => I_instr_L1_out_rsci_oswt,
      I_instr_L1_out_rsci_irdy => I_instr_L1_out_rsci_irdy,
      I_instr_L1_out_rsci_biwt => I_instr_L1_out_rsci_biwt,
      I_instr_L1_out_rsci_bdwt => I_instr_L1_out_rsci_bdwt,
      I_instr_L1_out_rsci_bcwt => I_instr_L1_out_rsci_bcwt,
      I_instr_L1_out_rsci_ivld_run_sct => I_instr_L1_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_I_instr_L1_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000100
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L1_out_rsci_oswt => I_instr_L1_out_rsci_oswt,
      I_instr_L1_out_rsci_wen_comp => I_instr_L1_out_rsci_wen_comp,
      I_instr_L1_out_rsci_biwt => I_instr_L1_out_rsci_biwt,
      I_instr_L1_out_rsci_bdwt => I_instr_L1_out_rsci_bdwt,
      I_instr_L1_out_rsci_bcwt => I_instr_L1_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (139 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L3_out_rsci_irdy : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsci_biwt : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsci_bdwt : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsci_bcwt : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL O_instr_L3_out_rsci_idat_1 : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL O_instr_L3_out_rsci_dat : STD_LOGIC_VECTOR (139 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094
    PORT(
      run_wen : IN STD_LOGIC;
      O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L3_out_rsci_irdy : IN STD_LOGIC;
      O_instr_L3_out_rsci_biwt : OUT STD_LOGIC;
      O_instr_L3_out_rsci_bdwt : OUT STD_LOGIC;
      O_instr_L3_out_rsci_bcwt : IN STD_LOGIC;
      O_instr_L3_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L3_out_rsci_biwt : IN STD_LOGIC;
      O_instr_L3_out_rsci_bdwt : IN STD_LOGIC;
      O_instr_L3_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  O_instr_L3_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 29,
      width => 140
      )
    PORT MAP(
      irdy => O_instr_L3_out_rsci_irdy,
      ivld => O_instr_L3_out_rsci_ivld_run_sct,
      idat => O_instr_L3_out_rsci_idat_1,
      rdy => O_instr_L3_out_rsc_rdy,
      vld => O_instr_L3_out_rsc_vld,
      dat => O_instr_L3_out_rsci_dat
    );
  O_instr_L3_out_rsci_idat_1 <= O_instr_L3_out_rsci_idat;
  O_instr_L3_out_rsc_dat <= O_instr_L3_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000094
    PORT MAP(
      run_wen => run_wen,
      O_instr_L3_out_rsci_oswt => O_instr_L3_out_rsci_oswt,
      O_instr_L3_out_rsci_irdy => O_instr_L3_out_rsci_irdy,
      O_instr_L3_out_rsci_biwt => O_instr_L3_out_rsci_biwt,
      O_instr_L3_out_rsci_bdwt => O_instr_L3_out_rsci_bdwt,
      O_instr_L3_out_rsci_bcwt => O_instr_L3_out_rsci_bcwt,
      O_instr_L3_out_rsci_ivld_run_sct => O_instr_L3_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_O_instr_L3_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000095
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L3_out_rsci_oswt => O_instr_L3_out_rsci_oswt,
      O_instr_L3_out_rsci_wen_comp => O_instr_L3_out_rsci_wen_comp,
      O_instr_L3_out_rsci_biwt => O_instr_L3_out_rsci_biwt,
      O_instr_L3_out_rsci_bdwt => O_instr_L3_out_rsci_bdwt,
      O_instr_L3_out_rsci_bcwt => O_instr_L3_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (89 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L2_out_rsci_irdy : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsci_biwt : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsci_bdwt : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsci_bcwt : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL O_instr_L2_out_rsci_idat_1 : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL O_instr_L2_out_rsci_dat : STD_LOGIC_VECTOR (89 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089
    PORT(
      run_wen : IN STD_LOGIC;
      O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L2_out_rsci_irdy : IN STD_LOGIC;
      O_instr_L2_out_rsci_biwt : OUT STD_LOGIC;
      O_instr_L2_out_rsci_bdwt : OUT STD_LOGIC;
      O_instr_L2_out_rsci_bcwt : IN STD_LOGIC;
      O_instr_L2_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L2_out_rsci_biwt : IN STD_LOGIC;
      O_instr_L2_out_rsci_bdwt : IN STD_LOGIC;
      O_instr_L2_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  O_instr_L2_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 28,
      width => 90
      )
    PORT MAP(
      irdy => O_instr_L2_out_rsci_irdy,
      ivld => O_instr_L2_out_rsci_ivld_run_sct,
      idat => O_instr_L2_out_rsci_idat_1,
      rdy => O_instr_L2_out_rsc_rdy,
      vld => O_instr_L2_out_rsc_vld,
      dat => O_instr_L2_out_rsci_dat
    );
  O_instr_L2_out_rsci_idat_1 <= O_instr_L2_out_rsci_idat;
  O_instr_L2_out_rsc_dat <= O_instr_L2_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000089
    PORT MAP(
      run_wen => run_wen,
      O_instr_L2_out_rsci_oswt => O_instr_L2_out_rsci_oswt,
      O_instr_L2_out_rsci_irdy => O_instr_L2_out_rsci_irdy,
      O_instr_L2_out_rsci_biwt => O_instr_L2_out_rsci_biwt,
      O_instr_L2_out_rsci_bdwt => O_instr_L2_out_rsci_bdwt,
      O_instr_L2_out_rsci_bcwt => O_instr_L2_out_rsci_bcwt,
      O_instr_L2_out_rsci_ivld_run_sct => O_instr_L2_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_O_instr_L2_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000090
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L2_out_rsci_oswt => O_instr_L2_out_rsci_oswt,
      O_instr_L2_out_rsci_wen_comp => O_instr_L2_out_rsci_wen_comp,
      O_instr_L2_out_rsci_biwt => O_instr_L2_out_rsci_biwt,
      O_instr_L2_out_rsci_bdwt => O_instr_L2_out_rsci_bdwt,
      O_instr_L2_out_rsci_bcwt => O_instr_L2_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
    O_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_L1_out_rsci_irdy : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsci_biwt : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsci_bdwt : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsci_bcwt : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL O_instr_L1_out_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL O_instr_L1_out_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084
    PORT(
      run_wen : IN STD_LOGIC;
      O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L1_out_rsci_irdy : IN STD_LOGIC;
      O_instr_L1_out_rsci_biwt : OUT STD_LOGIC;
      O_instr_L1_out_rsci_bdwt : OUT STD_LOGIC;
      O_instr_L1_out_rsci_bcwt : IN STD_LOGIC;
      O_instr_L1_out_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L1_out_rsci_biwt : IN STD_LOGIC;
      O_instr_L1_out_rsci_bdwt : IN STD_LOGIC;
      O_instr_L1_out_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  O_instr_L1_out_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 27,
      width => 50
      )
    PORT MAP(
      irdy => O_instr_L1_out_rsci_irdy,
      ivld => O_instr_L1_out_rsci_ivld_run_sct,
      idat => O_instr_L1_out_rsci_idat_1,
      rdy => O_instr_L1_out_rsc_rdy,
      vld => O_instr_L1_out_rsc_vld,
      dat => O_instr_L1_out_rsci_dat
    );
  O_instr_L1_out_rsci_idat_1 <= O_instr_L1_out_rsci_idat;
  O_instr_L1_out_rsc_dat <= O_instr_L1_out_rsci_dat;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000084
    PORT MAP(
      run_wen => run_wen,
      O_instr_L1_out_rsci_oswt => O_instr_L1_out_rsci_oswt,
      O_instr_L1_out_rsci_irdy => O_instr_L1_out_rsci_irdy,
      O_instr_L1_out_rsci_biwt => O_instr_L1_out_rsci_biwt,
      O_instr_L1_out_rsci_bdwt => O_instr_L1_out_rsci_bdwt,
      O_instr_L1_out_rsci_bcwt => O_instr_L1_out_rsci_bcwt,
      O_instr_L1_out_rsci_ivld_run_sct => O_instr_L1_out_rsci_ivld_run_sct
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_O_instr_L1_out_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000085
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L1_out_rsci_oswt => O_instr_L1_out_rsci_oswt,
      O_instr_L1_out_rsci_wen_comp => O_instr_L1_out_rsci_wen_comp,
      O_instr_L1_out_rsci_biwt => O_instr_L1_out_rsci_biwt,
      O_instr_L1_out_rsci_bdwt => O_instr_L1_out_rsci_bdwt,
      O_instr_L1_out_rsci_bcwt => O_instr_L1_out_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
    layer_instruction_in_rsc_vld : IN STD_LOGIC;
    layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    layer_instruction_in_rsci_oswt : IN STD_LOGIC;
    layer_instruction_in_rsci_wen_comp : OUT STD_LOGIC;
    layer_instruction_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (484 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL layer_instruction_in_rsci_biwt : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_bdwt : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_bcwt : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_irdy_run_sct : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_ivld : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_idat : STD_LOGIC_VECTOR (484 DOWNTO 0);

  SIGNAL layer_instruction_in_rsci_dat : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL layer_instruction_in_rsci_idat_1 : STD_LOGIC_VECTOR (484 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079
    PORT(
      run_wen : IN STD_LOGIC;
      layer_instruction_in_rsci_oswt : IN STD_LOGIC;
      layer_instruction_in_rsci_biwt : OUT STD_LOGIC;
      layer_instruction_in_rsci_bdwt : OUT STD_LOGIC;
      layer_instruction_in_rsci_bcwt : IN STD_LOGIC;
      layer_instruction_in_rsci_irdy_run_sct : OUT STD_LOGIC;
      layer_instruction_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      layer_instruction_in_rsci_oswt : IN STD_LOGIC;
      layer_instruction_in_rsci_wen_comp : OUT STD_LOGIC;
      layer_instruction_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (484 DOWNTO 0);
      layer_instruction_in_rsci_biwt : IN STD_LOGIC;
      layer_instruction_in_rsci_bdwt : IN STD_LOGIC;
      layer_instruction_in_rsci_bcwt : OUT STD_LOGIC;
      layer_instruction_in_rsci_idat : IN STD_LOGIC_VECTOR (484 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000000
      : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000001
      : STD_LOGIC_VECTOR (484 DOWNTO 0);

BEGIN
  layer_instruction_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 26,
      width => 485
      )
    PORT MAP(
      rdy => layer_instruction_in_rsc_rdy,
      vld => layer_instruction_in_rsc_vld,
      dat => layer_instruction_in_rsci_dat,
      irdy => layer_instruction_in_rsci_irdy_run_sct,
      ivld => layer_instruction_in_rsci_ivld,
      idat => layer_instruction_in_rsci_idat_1
    );
  layer_instruction_in_rsci_dat <= layer_instruction_in_rsc_dat;
  layer_instruction_in_rsci_idat <= layer_instruction_in_rsci_idat_1;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000079
    PORT MAP(
      run_wen => run_wen,
      layer_instruction_in_rsci_oswt => layer_instruction_in_rsci_oswt,
      layer_instruction_in_rsci_biwt => layer_instruction_in_rsci_biwt,
      layer_instruction_in_rsci_bdwt => layer_instruction_in_rsci_bdwt,
      layer_instruction_in_rsci_bcwt => layer_instruction_in_rsci_bcwt,
      layer_instruction_in_rsci_irdy_run_sct => layer_instruction_in_rsci_irdy_run_sct,
      layer_instruction_in_rsci_ivld => layer_instruction_in_rsci_ivld
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000080
    PORT MAP(
      clk => clk,
      rst => rst,
      layer_instruction_in_rsci_oswt => layer_instruction_in_rsci_oswt,
      layer_instruction_in_rsci_wen_comp => layer_instruction_in_rsci_wen_comp,
      layer_instruction_in_rsci_idat_mxwt => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000000,
      layer_instruction_in_rsci_biwt => layer_instruction_in_rsci_biwt,
      layer_instruction_in_rsci_bdwt => layer_instruction_in_rsci_bdwt,
      layer_instruction_in_rsci_bcwt => layer_instruction_in_rsci_bcwt,
      layer_instruction_in_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000001
    );
  layer_instruction_in_rsci_idat_mxwt <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000000;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_layer_instruction_in_wait_dp_inst_layer_in000001
      <= layer_instruction_in_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_in_rsc_vld : IN STD_LOGIC;
    W_instr_in_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    W_instr_in_rsci_oswt : IN STD_LOGIC;
    W_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    W_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_instr_in_rsci_biwt : STD_LOGIC;
  SIGNAL W_instr_in_rsci_bdwt : STD_LOGIC;
  SIGNAL W_instr_in_rsci_bcwt : STD_LOGIC;
  SIGNAL W_instr_in_rsci_irdy_run_sct : STD_LOGIC;
  SIGNAL W_instr_in_rsci_ivld : STD_LOGIC;
  SIGNAL W_instr_in_rsci_idat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  SIGNAL W_instr_in_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL W_instr_in_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050
    PORT(
      run_wen : IN STD_LOGIC;
      W_instr_in_rsci_oswt : IN STD_LOGIC;
      W_instr_in_rsci_biwt : OUT STD_LOGIC;
      W_instr_in_rsci_bdwt : OUT STD_LOGIC;
      W_instr_in_rsci_bcwt : IN STD_LOGIC;
      W_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
      W_instr_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_in_rsci_oswt : IN STD_LOGIC;
      W_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_in_rsci_biwt : IN STD_LOGIC;
      W_instr_in_rsci_bdwt : IN STD_LOGIC;
      W_instr_in_rsci_bcwt : OUT STD_LOGIC;
      W_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

BEGIN
  W_instr_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 75,
      width => 50
      )
    PORT MAP(
      rdy => W_instr_in_rsc_rdy,
      vld => W_instr_in_rsc_vld,
      dat => W_instr_in_rsci_dat,
      irdy => W_instr_in_rsci_irdy_run_sct,
      ivld => W_instr_in_rsci_ivld,
      idat => W_instr_in_rsci_idat_1
    );
  W_instr_in_rsci_dat <= W_instr_in_rsc_dat;
  W_instr_in_rsci_idat <= W_instr_in_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000050
    PORT MAP(
      run_wen => run_wen,
      W_instr_in_rsci_oswt => W_instr_in_rsci_oswt,
      W_instr_in_rsci_biwt => W_instr_in_rsci_biwt,
      W_instr_in_rsci_bdwt => W_instr_in_rsci_bdwt,
      W_instr_in_rsci_bcwt => W_instr_in_rsci_bcwt,
      W_instr_in_rsci_irdy_run_sct => W_instr_in_rsci_irdy_run_sct,
      W_instr_in_rsci_ivld => W_instr_in_rsci_ivld
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000051
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_in_rsci_oswt => W_instr_in_rsci_oswt,
      W_instr_in_rsci_wen_comp => W_instr_in_rsci_wen_comp,
      W_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat_mxwt,
      W_instr_in_rsci_biwt => W_instr_in_rsci_biwt,
      W_instr_in_rsci_bdwt => W_instr_in_rsci_bdwt,
      W_instr_in_rsci_bcwt => W_instr_in_rsci_bcwt,
      W_instr_in_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat
    );
  W_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_W_instr_in_wait_dp_inst_W_instr_in_rsci_idat
      <= W_instr_in_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_in_rsc_vld : IN STD_LOGIC;
    I_instr_in_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    I_instr_in_rsci_oswt : IN STD_LOGIC;
    I_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    I_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_instr_in_rsci_biwt : STD_LOGIC;
  SIGNAL I_instr_in_rsci_bdwt : STD_LOGIC;
  SIGNAL I_instr_in_rsci_bcwt : STD_LOGIC;
  SIGNAL I_instr_in_rsci_irdy_run_sct : STD_LOGIC;
  SIGNAL I_instr_in_rsci_ivld : STD_LOGIC;
  SIGNAL I_instr_in_rsci_idat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  SIGNAL I_instr_in_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL I_instr_in_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045
    PORT(
      run_wen : IN STD_LOGIC;
      I_instr_in_rsci_oswt : IN STD_LOGIC;
      I_instr_in_rsci_biwt : OUT STD_LOGIC;
      I_instr_in_rsci_bdwt : OUT STD_LOGIC;
      I_instr_in_rsci_bcwt : IN STD_LOGIC;
      I_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
      I_instr_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_in_rsci_oswt : IN STD_LOGIC;
      I_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_in_rsci_biwt : IN STD_LOGIC;
      I_instr_in_rsci_bdwt : IN STD_LOGIC;
      I_instr_in_rsci_bcwt : OUT STD_LOGIC;
      I_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

BEGIN
  I_instr_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 74,
      width => 50
      )
    PORT MAP(
      rdy => I_instr_in_rsc_rdy,
      vld => I_instr_in_rsc_vld,
      dat => I_instr_in_rsci_dat,
      irdy => I_instr_in_rsci_irdy_run_sct,
      ivld => I_instr_in_rsci_ivld,
      idat => I_instr_in_rsci_idat_1
    );
  I_instr_in_rsci_dat <= I_instr_in_rsc_dat;
  I_instr_in_rsci_idat <= I_instr_in_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000045
    PORT MAP(
      run_wen => run_wen,
      I_instr_in_rsci_oswt => I_instr_in_rsci_oswt,
      I_instr_in_rsci_biwt => I_instr_in_rsci_biwt,
      I_instr_in_rsci_bdwt => I_instr_in_rsci_bdwt,
      I_instr_in_rsci_bcwt => I_instr_in_rsci_bcwt,
      I_instr_in_rsci_irdy_run_sct => I_instr_in_rsci_irdy_run_sct,
      I_instr_in_rsci_ivld => I_instr_in_rsci_ivld
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000046
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_in_rsci_oswt => I_instr_in_rsci_oswt,
      I_instr_in_rsci_wen_comp => I_instr_in_rsci_wen_comp,
      I_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat_mxwt,
      I_instr_in_rsci_biwt => I_instr_in_rsci_biwt,
      I_instr_in_rsci_bdwt => I_instr_in_rsci_bdwt,
      I_instr_in_rsci_bcwt => I_instr_in_rsci_bcwt,
      I_instr_in_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat
    );
  I_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_I_instr_in_wait_dp_inst_I_instr_in_rsci_idat
      <= I_instr_in_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_in_rsc_vld : IN STD_LOGIC;
    O_instr_in_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    O_instr_in_rsci_oswt : IN STD_LOGIC;
    O_instr_in_rsci_wen_comp : OUT STD_LOGIC;
    O_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_instr_in_rsci_biwt : STD_LOGIC;
  SIGNAL O_instr_in_rsci_bdwt : STD_LOGIC;
  SIGNAL O_instr_in_rsci_bcwt : STD_LOGIC;
  SIGNAL O_instr_in_rsci_irdy_run_sct : STD_LOGIC;
  SIGNAL O_instr_in_rsci_ivld : STD_LOGIC;
  SIGNAL O_instr_in_rsci_idat : STD_LOGIC_VECTOR (49 DOWNTO 0);

  SIGNAL O_instr_in_rsci_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL O_instr_in_rsci_idat_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040
    PORT(
      run_wen : IN STD_LOGIC;
      O_instr_in_rsci_oswt : IN STD_LOGIC;
      O_instr_in_rsci_biwt : OUT STD_LOGIC;
      O_instr_in_rsci_bdwt : OUT STD_LOGIC;
      O_instr_in_rsci_bcwt : IN STD_LOGIC;
      O_instr_in_rsci_irdy_run_sct : OUT STD_LOGIC;
      O_instr_in_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_in_rsci_oswt : IN STD_LOGIC;
      O_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_in_rsci_biwt : IN STD_LOGIC;
      O_instr_in_rsci_bdwt : IN STD_LOGIC;
      O_instr_in_rsci_bcwt : OUT STD_LOGIC;
      O_instr_in_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

BEGIN
  O_instr_in_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 73,
      width => 50
      )
    PORT MAP(
      rdy => O_instr_in_rsc_rdy,
      vld => O_instr_in_rsc_vld,
      dat => O_instr_in_rsci_dat,
      irdy => O_instr_in_rsci_irdy_run_sct,
      ivld => O_instr_in_rsci_ivld,
      idat => O_instr_in_rsci_idat_1
    );
  O_instr_in_rsci_dat <= O_instr_in_rsc_dat;
  O_instr_in_rsci_idat <= O_instr_in_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000040
    PORT MAP(
      run_wen => run_wen,
      O_instr_in_rsci_oswt => O_instr_in_rsci_oswt,
      O_instr_in_rsci_biwt => O_instr_in_rsci_biwt,
      O_instr_in_rsci_bdwt => O_instr_in_rsci_bdwt,
      O_instr_in_rsci_bcwt => O_instr_in_rsci_bcwt,
      O_instr_in_rsci_irdy_run_sct => O_instr_in_rsci_irdy_run_sct,
      O_instr_in_rsci_ivld => O_instr_in_rsci_ivld
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000041
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_in_rsci_oswt => O_instr_in_rsci_oswt,
      O_instr_in_rsci_wen_comp => O_instr_in_rsci_wen_comp,
      O_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat_mxwt,
      O_instr_in_rsci_biwt => O_instr_in_rsci_biwt,
      O_instr_in_rsci_bdwt => O_instr_in_rsci_bdwt,
      O_instr_in_rsci_bcwt => O_instr_in_rsci_bcwt,
      O_instr_in_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat
    );
  O_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_O_instr_in_wait_dp_inst_O_instr_in_rsci_idat
      <= O_instr_in_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
    wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
    wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    wr_data_zero_guard_rsci_oswt : IN STD_LOGIC;
    wr_data_zero_guard_rsci_ivld_mxwt : OUT STD_LOGIC;
    wr_data_zero_guard_rsci_idat_mxwt : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL wr_data_zero_guard_rsci_biwt : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_bdwt : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_ivld : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_idat : STD_LOGIC;

  SIGNAL wr_data_zero_guard_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL wr_data_zero_guard_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035
    PORT(
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      wr_data_zero_guard_rsci_oswt : IN STD_LOGIC;
      wr_data_zero_guard_rsci_biwt : OUT STD_LOGIC;
      wr_data_zero_guard_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      wr_data_zero_guard_rsci_ivld_mxwt : OUT STD_LOGIC;
      wr_data_zero_guard_rsci_idat_mxwt : OUT STD_LOGIC;
      wr_data_zero_guard_rsci_biwt : IN STD_LOGIC;
      wr_data_zero_guard_rsci_bdwt : IN STD_LOGIC;
      wr_data_zero_guard_rsci_ivld : IN STD_LOGIC;
      wr_data_zero_guard_rsci_idat : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  wr_data_zero_guard_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 72,
      width => 1
      )
    PORT MAP(
      rdy => wr_data_zero_guard_rsc_rdy,
      vld => wr_data_zero_guard_rsc_vld,
      dat => wr_data_zero_guard_rsci_dat,
      irdy => wr_data_zero_guard_rsci_biwt,
      ivld => wr_data_zero_guard_rsci_ivld,
      idat => wr_data_zero_guard_rsci_idat_1
    );
  wr_data_zero_guard_rsci_dat(0) <= wr_data_zero_guard_rsc_dat;
  wr_data_zero_guard_rsci_idat <= wr_data_zero_guard_rsci_idat_1(0);

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_wr_data_zero_guard_rsci_wr_data_zero_guard_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000035
    PORT MAP(
      run_wen => run_wen,
      run_wten => run_wten,
      wr_data_zero_guard_rsci_oswt => wr_data_zero_guard_rsci_oswt,
      wr_data_zero_guard_rsci_biwt => wr_data_zero_guard_rsci_biwt,
      wr_data_zero_guard_rsci_bdwt => wr_data_zero_guard_rsci_bdwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_wr_data_zero_guard_rsci_wr_data_zero_guard_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000036
    PORT MAP(
      clk => clk,
      rst => rst,
      wr_data_zero_guard_rsci_ivld_mxwt => wr_data_zero_guard_rsci_ivld_mxwt,
      wr_data_zero_guard_rsci_idat_mxwt => wr_data_zero_guard_rsci_idat_mxwt,
      wr_data_zero_guard_rsci_biwt => wr_data_zero_guard_rsci_biwt,
      wr_data_zero_guard_rsci_bdwt => wr_data_zero_guard_rsci_bdwt,
      wr_data_zero_guard_rsci_ivld => wr_data_zero_guard_rsci_ivld,
      wr_data_zero_guard_rsci_idat => wr_data_zero_guard_rsci_idat
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_wr_data_rsc_vld : IN STD_LOGIC;
    W_wr_data_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    W_wr_data_rsci_oswt : IN STD_LOGIC;
    W_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    W_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_wr_data_rsci_biwt : STD_LOGIC;
  SIGNAL W_wr_data_rsci_bdwt : STD_LOGIC;
  SIGNAL W_wr_data_rsci_ivld : STD_LOGIC;
  SIGNAL W_wr_data_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL W_wr_data_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_wr_data_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030
    PORT(
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      W_wr_data_rsci_oswt : IN STD_LOGIC;
      W_wr_data_rsci_biwt : OUT STD_LOGIC;
      W_wr_data_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      W_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      W_wr_data_rsci_biwt : IN STD_LOGIC;
      W_wr_data_rsci_bdwt : IN STD_LOGIC;
      W_wr_data_rsci_ivld : IN STD_LOGIC;
      W_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
  W_wr_data_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 71,
      width => 16
      )
    PORT MAP(
      rdy => W_wr_data_rsc_rdy,
      vld => W_wr_data_rsc_vld,
      dat => W_wr_data_rsci_dat,
      irdy => W_wr_data_rsci_biwt,
      ivld => W_wr_data_rsci_ivld,
      idat => W_wr_data_rsci_idat_1
    );
  W_wr_data_rsci_dat <= W_wr_data_rsc_dat;
  W_wr_data_rsci_idat <= W_wr_data_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000030
    PORT MAP(
      run_wen => run_wen,
      run_wten => run_wten,
      W_wr_data_rsci_oswt => W_wr_data_rsci_oswt,
      W_wr_data_rsci_biwt => W_wr_data_rsci_biwt,
      W_wr_data_rsci_bdwt => W_wr_data_rsci_bdwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000031
    PORT MAP(
      clk => clk,
      rst => rst,
      W_wr_data_rsci_ivld_mxwt => W_wr_data_rsci_ivld_mxwt,
      W_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat_mxwt,
      W_wr_data_rsci_biwt => W_wr_data_rsci_biwt,
      W_wr_data_rsci_bdwt => W_wr_data_rsci_bdwt,
      W_wr_data_rsci_ivld => W_wr_data_rsci_ivld,
      W_wr_data_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat
    );
  W_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_W_wr_data_wait_dp_inst_W_wr_data_rsci_idat
      <= W_wr_data_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_wr_data_rsc_vld : IN STD_LOGIC;
    I_wr_data_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    I_wr_data_rsci_oswt : IN STD_LOGIC;
    I_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    I_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL I_wr_data_rsci_biwt : STD_LOGIC;
  SIGNAL I_wr_data_rsci_bdwt : STD_LOGIC;
  SIGNAL I_wr_data_rsci_ivld : STD_LOGIC;
  SIGNAL I_wr_data_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL I_wr_data_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_wr_data_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025
    PORT(
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      I_wr_data_rsci_oswt : IN STD_LOGIC;
      I_wr_data_rsci_biwt : OUT STD_LOGIC;
      I_wr_data_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      I_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      I_wr_data_rsci_biwt : IN STD_LOGIC;
      I_wr_data_rsci_bdwt : IN STD_LOGIC;
      I_wr_data_rsci_ivld : IN STD_LOGIC;
      I_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
  I_wr_data_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 70,
      width => 16
      )
    PORT MAP(
      rdy => I_wr_data_rsc_rdy,
      vld => I_wr_data_rsc_vld,
      dat => I_wr_data_rsci_dat,
      irdy => I_wr_data_rsci_biwt,
      ivld => I_wr_data_rsci_ivld,
      idat => I_wr_data_rsci_idat_1
    );
  I_wr_data_rsci_dat <= I_wr_data_rsc_dat;
  I_wr_data_rsci_idat <= I_wr_data_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000025
    PORT MAP(
      run_wen => run_wen,
      run_wten => run_wten,
      I_wr_data_rsci_oswt => I_wr_data_rsci_oswt,
      I_wr_data_rsci_biwt => I_wr_data_rsci_biwt,
      I_wr_data_rsci_bdwt => I_wr_data_rsci_bdwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000026
    PORT MAP(
      clk => clk,
      rst => rst,
      I_wr_data_rsci_ivld_mxwt => I_wr_data_rsci_ivld_mxwt,
      I_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat_mxwt,
      I_wr_data_rsci_biwt => I_wr_data_rsci_biwt,
      I_wr_data_rsci_bdwt => I_wr_data_rsci_bdwt,
      I_wr_data_rsci_ivld => I_wr_data_rsci_ivld,
      I_wr_data_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat
    );
  I_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_I_wr_data_wait_dp_inst_I_wr_data_rsci_idat
      <= I_wr_data_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_rd_data_rsc_vld : OUT STD_LOGIC;
    O_rd_data_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    O_rd_data_rsci_oswt : IN STD_LOGIC;
    O_rd_data_rsci_irdy_mxwt : OUT STD_LOGIC;
    O_rd_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_rd_data_rsci_irdy : STD_LOGIC;
  SIGNAL O_rd_data_rsci_biwt : STD_LOGIC;
  SIGNAL O_rd_data_rsci_bdwt : STD_LOGIC;

  SIGNAL O_rd_data_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_rd_data_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020
    PORT(
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      O_rd_data_rsci_oswt : IN STD_LOGIC;
      O_rd_data_rsci_biwt : OUT STD_LOGIC;
      O_rd_data_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_rd_data_rsci_irdy_mxwt : OUT STD_LOGIC;
      O_rd_data_rsci_irdy : IN STD_LOGIC;
      O_rd_data_rsci_biwt : IN STD_LOGIC;
      O_rd_data_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  O_rd_data_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000152
    GENERIC MAP(
      rscid => 69,
      width => 16
      )
    PORT MAP(
      irdy => O_rd_data_rsci_irdy,
      ivld => O_rd_data_rsci_biwt,
      idat => O_rd_data_rsci_idat_1,
      rdy => O_rd_data_rsc_rdy,
      vld => O_rd_data_rsc_vld,
      dat => O_rd_data_rsci_dat
    );
  O_rd_data_rsci_idat_1 <= O_rd_data_rsci_idat;
  O_rd_data_rsc_dat <= O_rd_data_rsci_dat;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_O_rd_data_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000020
    PORT MAP(
      run_wen => run_wen,
      run_wten => run_wten,
      O_rd_data_rsci_oswt => O_rd_data_rsci_oswt,
      O_rd_data_rsci_biwt => O_rd_data_rsci_biwt,
      O_rd_data_rsci_bdwt => O_rd_data_rsci_bdwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_O_rd_data_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000021
    PORT MAP(
      clk => clk,
      rst => rst,
      O_rd_data_rsci_irdy_mxwt => O_rd_data_rsci_irdy_mxwt,
      O_rd_data_rsci_irdy => O_rd_data_rsci_irdy,
      O_rd_data_rsci_biwt => O_rd_data_rsci_biwt,
      O_rd_data_rsci_bdwt => O_rd_data_rsci_bdwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_wr_data_rsc_vld : IN STD_LOGIC;
    O_wr_data_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    O_wr_data_rsci_oswt : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    O_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
    O_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL O_wr_data_rsci_biwt : STD_LOGIC;
  SIGNAL O_wr_data_rsci_bdwt : STD_LOGIC;
  SIGNAL O_wr_data_rsci_ivld : STD_LOGIC;
  SIGNAL O_wr_data_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL O_wr_data_rsci_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_wr_data_rsci_idat_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015
    PORT(
      run_wen : IN STD_LOGIC;
      O_wr_data_rsci_oswt : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      O_wr_data_rsci_biwt : OUT STD_LOGIC;
      O_wr_data_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      O_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_wr_data_rsci_biwt : IN STD_LOGIC;
      O_wr_data_rsci_bdwt : IN STD_LOGIC;
      O_wr_data_rsci_ivld : IN STD_LOGIC;
      O_wr_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
  O_wr_data_rsci : work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000150
    GENERIC MAP(
      rscid => 68,
      width => 16
      )
    PORT MAP(
      rdy => O_wr_data_rsc_rdy,
      vld => O_wr_data_rsc_vld,
      dat => O_wr_data_rsci_dat,
      irdy => O_wr_data_rsci_biwt,
      ivld => O_wr_data_rsci_ivld,
      idat => O_wr_data_rsci_idat_1
    );
  O_wr_data_rsci_dat <= O_wr_data_rsc_dat;
  O_wr_data_rsci_idat <= O_wr_data_rsci_idat_1;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_ctrl_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000015
    PORT MAP(
      run_wen => run_wen,
      O_wr_data_rsci_oswt => O_wr_data_rsci_oswt,
      run_wten => run_wten,
      O_wr_data_rsci_biwt => O_wr_data_rsci_biwt,
      O_wr_data_rsci_bdwt => O_wr_data_rsci_bdwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000016
    PORT MAP(
      clk => clk,
      rst => rst,
      O_wr_data_rsci_ivld_mxwt => O_wr_data_rsci_ivld_mxwt,
      O_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat_mxwt,
      O_wr_data_rsci_biwt => O_wr_data_rsci_biwt,
      O_wr_data_rsci_bdwt => O_wr_data_rsci_bdwt,
      O_wr_data_rsci_ivld => O_wr_data_rsci_ivld,
      O_wr_data_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat
    );
  O_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat_mxwt;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_O_wr_data_wait_dp_inst_O_wr_data_rsci_idat
      <= O_wr_data_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
    layer_instruction_in_rsc_vld : IN STD_LOGIC;
    layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
    O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
    W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
    W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (79 DOWNTO
        0);
    W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO
        0);
    W_tiling_unit_L3_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
    W_tiling_unit_L3_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
    W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
    W_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_iro_1 : IN STD_LOGIC;
    CGHpart_irsig_1 : OUT STD_LOGIC;
    W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (54 DOWNTO
        0);
    W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (10 DOWNTO
        0);
    W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (10 DOWNTO
        0);
    W_tiling_unit_L2_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
    W_tiling_unit_L2_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
    W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
    W_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (69 DOWNTO
        0);
    O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (13 DOWNTO
        0);
    O_tiling_unit_L3_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    O_tiling_unit_L3_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    O_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (44 DOWNTO
        0);
    O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (8 DOWNTO
        0);
    O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (8 DOWNTO
        0);
    O_tiling_unit_L2_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    O_tiling_unit_L2_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
    O_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
    O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (24 DOWNTO
        0);
    O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
        0);
    O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (4 DOWNTO
        0);
    O_tiling_unit_L1_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    O_tiling_unit_L1_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
    O_tiling_unit_L1_run_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_wen : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL layer_instruction_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL O_instr_L1_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsci_wen_comp : STD_LOGIC;
  SIGNAL ensig_cgo : STD_LOGIC;
  SIGNAL ensig_cgo_1 : STD_LOGIC;
  SIGNAL ensig_cgo_2 : STD_LOGIC;
  SIGNAL ensig_cgo_3 : STD_LOGIC;
  SIGNAL ensig_cgo_4 : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsci_idat_49_25 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_instr_L1_out_rsci_idat_24_0 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_instr_L2_out_rsci_idat_89_45 : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL O_instr_L2_out_rsci_idat_44_0 : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL O_instr_L3_out_rsci_idat_139_70 : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL O_instr_L3_out_rsci_idat_69_0 : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL I_instr_L1_out_rsci_idat_49_25 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_instr_L1_out_rsci_idat_24_0 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_instr_L2_out_rsci_idat_89_45 : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL I_instr_L2_out_rsci_idat_44_0 : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL I_instr_L3_out_rsci_idat_139_70 : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL I_instr_L3_out_rsci_idat_69_0 : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL W_instr_L1_out_rsci_idat_49_25 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_instr_L1_out_rsci_idat_24_0 : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_instr_L2_out_rsci_idat_109_55 : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL W_instr_L2_out_rsci_idat_54_0 : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL W_instr_L3_out_rsci_idat_159_80 : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL W_instr_L3_out_rsci_idat_79_0 : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL or_dcpl_1 : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL ensig_cgo_1_mx0 : STD_LOGIC;
  SIGNAL ensig_cgo_2_mx0 : STD_LOGIC;
  SIGNAL ensig_cgo_3_mx0 : STD_LOGIC;
  SIGNAL ensig_cgo_4_mx0 : STD_LOGIC;
  SIGNAL layer_instruction_in_crt_sva : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL O_tile_size_L1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_tile_size_L1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_tile_size_L1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_and_cse : STD_LOGIC;
  SIGNAL if_and_2_cse : STD_LOGIC;
  SIGNAL if_and_4_cse : STD_LOGIC;
  SIGNAL if_and_10_cse : STD_LOGIC;
  SIGNAL if_and_16_cse : STD_LOGIC;
  SIGNAL reg_W_instr_L3_out_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_W_instr_L2_out_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_W_instr_L1_out_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_I_instr_L1_out_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_O_instr_L1_out_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_layer_instruction_in_rsci_irdy_run_psct_cse : STD_LOGIC;

  SIGNAL if_mux_18_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
      layer_instruction_in_rsc_vld : IN STD_LOGIC;
      layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      layer_instruction_in_rsci_oswt : IN STD_LOGIC;
      layer_instruction_in_rsci_wen_comp : OUT STD_LOGIC;
      layer_instruction_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (484 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsc_dat
      : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (484 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      O_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      O_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (89 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsci_idat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      O_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      O_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (139 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsci_idat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      I_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      I_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (89 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsci_idat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      I_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      I_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (139 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsci_idat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      W_instr_L1_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L1_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L1_out_rsci_idat : IN STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsci_idat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
      W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      W_instr_L2_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L2_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L2_out_rsci_idat : IN STD_LOGIC_VECTOR (109 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (109 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsci_idat
      : STD_LOGIC_VECTOR (109 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
      W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      W_instr_L3_out_rsci_oswt : IN STD_LOGIC;
      W_instr_L3_out_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_L3_out_rsci_idat : IN STD_LOGIC_VECTOR (159 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (159 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsci_idat
      : STD_LOGIC_VECTOR (159 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      W_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_iro_1 : IN STD_LOGIC;
      W_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_iro_2 : IN STD_LOGIC;
      O_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_iro_3 : IN STD_LOGIC;
      O_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_iro_4 : IN STD_LOGIC;
      O_tiling_unit_L1_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      ensig_cgo_1 : IN STD_LOGIC;
      ensig_cgo_2 : IN STD_LOGIC;
      ensig_cgo_3 : IN STD_LOGIC;
      ensig_cgo_4 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077
    PORT(
      run_wen : OUT STD_LOGIC;
      layer_instruction_in_rsci_wen_comp : IN STD_LOGIC;
      O_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
      O_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
      O_instr_L3_out_rsci_wen_comp : IN STD_LOGIC;
      I_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
      I_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
      I_instr_L3_out_rsci_wen_comp : IN STD_LOGIC;
      W_instr_L1_out_rsci_wen_comp : IN STD_LOGIC;
      W_instr_L2_out_rsci_wen_comp : IN STD_LOGIC;
      W_instr_L3_out_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_run_fsm_inst_fsm_output
      : STD_LOGIC_VECTOR (7 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_25_3_2(input_2 : STD_LOGIC_VECTOR(24 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(24 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(24 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(24 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(24 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_3_2(input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_v_45_2_2(input_0 : STD_LOGIC_VECTOR(44 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(44 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(44 DOWNTO 0);

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

  FUNCTION MUX_v_70_2_2(input_0 : STD_LOGIC_VECTOR(69 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(69 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(69 DOWNTO 0);

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
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000066
    PORT MAP(
      clk => clk,
      rst => rst,
      layer_instruction_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsc_dat,
      layer_instruction_in_rsc_vld => layer_instruction_in_rsc_vld,
      layer_instruction_in_rsc_rdy => layer_instruction_in_rsc_rdy,
      run_wen => run_wen,
      layer_instruction_in_rsci_oswt => reg_layer_instruction_in_rsci_irdy_run_psct_cse,
      layer_instruction_in_rsci_wen_comp => layer_instruction_in_rsci_wen_comp,
      layer_instruction_in_rsci_idat_mxwt => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsci_idat_mxwt
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsc_dat
      <= layer_instruction_in_rsc_dat;
  layer_instruction_in_rsci_idat_mxwt <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_layer_instruction_in_rsci_inst_layer_instruction_in_rsci_idat_mxwt;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000067
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsc_dat,
      O_instr_L1_out_rsc_vld => O_instr_L1_out_rsc_vld,
      O_instr_L1_out_rsc_rdy => O_instr_L1_out_rsc_rdy,
      run_wen => run_wen,
      O_instr_L1_out_rsci_oswt => reg_O_instr_L1_out_rsci_ivld_run_psct_cse,
      O_instr_L1_out_rsci_wen_comp => O_instr_L1_out_rsci_wen_comp,
      O_instr_L1_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsci_idat
    );
  O_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L1_out_rsci_inst_O_instr_L1_out_rsci_idat
      <= O_instr_L1_out_rsci_idat_49_25 & O_instr_L1_out_rsci_idat_24_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000068
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsc_dat,
      O_instr_L2_out_rsc_vld => O_instr_L2_out_rsc_vld,
      O_instr_L2_out_rsc_rdy => O_instr_L2_out_rsc_rdy,
      run_wen => run_wen,
      O_instr_L2_out_rsci_oswt => reg_W_instr_L1_out_rsci_ivld_run_psct_cse,
      O_instr_L2_out_rsci_wen_comp => O_instr_L2_out_rsci_wen_comp,
      O_instr_L2_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsci_idat
    );
  O_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L2_out_rsci_inst_O_instr_L2_out_rsci_idat
      <= O_instr_L2_out_rsci_idat_89_45 & O_instr_L2_out_rsci_idat_44_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000069
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsc_dat,
      O_instr_L3_out_rsc_vld => O_instr_L3_out_rsc_vld,
      O_instr_L3_out_rsc_rdy => O_instr_L3_out_rsc_rdy,
      run_wen => run_wen,
      O_instr_L3_out_rsci_oswt => reg_W_instr_L2_out_rsci_ivld_run_psct_cse,
      O_instr_L3_out_rsci_wen_comp => O_instr_L3_out_rsci_wen_comp,
      O_instr_L3_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsci_idat
    );
  O_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_O_instr_L3_out_rsci_inst_O_instr_L3_out_rsci_idat
      <= O_instr_L3_out_rsci_idat_139_70 & O_instr_L3_out_rsci_idat_69_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000070
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsc_dat,
      I_instr_L1_out_rsc_vld => I_instr_L1_out_rsc_vld,
      I_instr_L1_out_rsc_rdy => I_instr_L1_out_rsc_rdy,
      run_wen => run_wen,
      I_instr_L1_out_rsci_oswt => reg_I_instr_L1_out_rsci_ivld_run_psct_cse,
      I_instr_L1_out_rsci_wen_comp => I_instr_L1_out_rsci_wen_comp,
      I_instr_L1_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsci_idat
    );
  I_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L1_out_rsci_inst_I_instr_L1_out_rsci_idat
      <= I_instr_L1_out_rsci_idat_49_25 & I_instr_L1_out_rsci_idat_24_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000071
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsc_dat,
      I_instr_L2_out_rsc_vld => I_instr_L2_out_rsc_vld,
      I_instr_L2_out_rsc_rdy => I_instr_L2_out_rsc_rdy,
      run_wen => run_wen,
      I_instr_L2_out_rsci_oswt => reg_W_instr_L2_out_rsci_ivld_run_psct_cse,
      I_instr_L2_out_rsci_wen_comp => I_instr_L2_out_rsci_wen_comp,
      I_instr_L2_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsci_idat
    );
  I_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L2_out_rsci_inst_I_instr_L2_out_rsci_idat
      <= I_instr_L2_out_rsci_idat_89_45 & I_instr_L2_out_rsci_idat_44_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000072
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsc_dat,
      I_instr_L3_out_rsc_vld => I_instr_L3_out_rsc_vld,
      I_instr_L3_out_rsc_rdy => I_instr_L3_out_rsc_rdy,
      run_wen => run_wen,
      I_instr_L3_out_rsci_oswt => reg_W_instr_L3_out_rsci_ivld_run_psct_cse,
      I_instr_L3_out_rsci_wen_comp => I_instr_L3_out_rsci_wen_comp,
      I_instr_L3_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsci_idat
    );
  I_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_I_instr_L3_out_rsci_inst_I_instr_L3_out_rsci_idat
      <= I_instr_L3_out_rsci_idat_139_70 & I_instr_L3_out_rsci_idat_69_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000073
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsc_dat,
      W_instr_L1_out_rsc_vld => W_instr_L1_out_rsc_vld,
      W_instr_L1_out_rsc_rdy => W_instr_L1_out_rsc_rdy,
      run_wen => run_wen,
      W_instr_L1_out_rsci_oswt => reg_W_instr_L1_out_rsci_ivld_run_psct_cse,
      W_instr_L1_out_rsci_wen_comp => W_instr_L1_out_rsci_wen_comp,
      W_instr_L1_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsci_idat
    );
  W_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L1_out_rsci_inst_W_instr_L1_out_rsci_idat
      <= W_instr_L1_out_rsci_idat_49_25 & W_instr_L1_out_rsci_idat_24_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000074
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsc_dat,
      W_instr_L2_out_rsc_vld => W_instr_L2_out_rsc_vld,
      W_instr_L2_out_rsc_rdy => W_instr_L2_out_rsc_rdy,
      run_wen => run_wen,
      W_instr_L2_out_rsci_oswt => reg_W_instr_L2_out_rsci_ivld_run_psct_cse,
      W_instr_L2_out_rsci_wen_comp => W_instr_L2_out_rsci_wen_comp,
      W_instr_L2_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsci_idat
    );
  W_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L2_out_rsci_inst_W_instr_L2_out_rsci_idat
      <= W_instr_L2_out_rsci_idat_109_55 & W_instr_L2_out_rsci_idat_54_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000075
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsc_dat,
      W_instr_L3_out_rsc_vld => W_instr_L3_out_rsc_vld,
      W_instr_L3_out_rsc_rdy => W_instr_L3_out_rsc_rdy,
      run_wen => run_wen,
      W_instr_L3_out_rsci_oswt => reg_W_instr_L3_out_rsci_ivld_run_psct_cse,
      W_instr_L3_out_rsci_wen_comp => W_instr_L3_out_rsci_wen_comp,
      W_instr_L3_out_rsci_idat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsci_idat
    );
  W_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_W_instr_L3_out_rsci_inst_W_instr_L3_out_rsci_idat
      <= W_instr_L3_out_rsci_idat_159_80 & W_instr_L3_out_rsci_idat_79_0;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_wait_dp_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000076
    PORT MAP(
      ensig_cgo_iro => or_dcpl_5,
      W_tiling_unit_L3_run_cmp_ccs_ccore_en => W_tiling_unit_L3_run_cmp_ccs_ccore_en,
      ensig_cgo_iro_1 => ensig_cgo_iro_1,
      W_tiling_unit_L2_run_cmp_ccs_ccore_en => W_tiling_unit_L2_run_cmp_ccs_ccore_en,
      ensig_cgo_iro_2 => ensig_cgo_2_mx0,
      O_tiling_unit_L3_run_cmp_ccs_ccore_en => O_tiling_unit_L3_run_cmp_ccs_ccore_en,
      ensig_cgo_iro_3 => ensig_cgo_3_mx0,
      O_tiling_unit_L2_run_cmp_ccs_ccore_en => O_tiling_unit_L2_run_cmp_ccs_ccore_en,
      ensig_cgo_iro_4 => ensig_cgo_4_mx0,
      O_tiling_unit_L1_run_cmp_ccs_ccore_en => O_tiling_unit_L1_run_cmp_ccs_ccore_en,
      run_wen => run_wen,
      ensig_cgo => ensig_cgo,
      ensig_cgo_1 => ensig_cgo_1,
      ensig_cgo_2 => ensig_cgo_2,
      ensig_cgo_3 => ensig_cgo_3,
      ensig_cgo_4 => ensig_cgo_4
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_staller_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000077
    PORT MAP(
      run_wen => run_wen,
      layer_instruction_in_rsci_wen_comp => layer_instruction_in_rsci_wen_comp,
      O_instr_L1_out_rsci_wen_comp => O_instr_L1_out_rsci_wen_comp,
      O_instr_L2_out_rsci_wen_comp => O_instr_L2_out_rsci_wen_comp,
      O_instr_L3_out_rsci_wen_comp => O_instr_L3_out_rsci_wen_comp,
      I_instr_L1_out_rsci_wen_comp => I_instr_L1_out_rsci_wen_comp,
      I_instr_L2_out_rsci_wen_comp => I_instr_L2_out_rsci_wen_comp,
      I_instr_L3_out_rsci_wen_comp => I_instr_L3_out_rsci_wen_comp,
      W_instr_L1_out_rsci_wen_comp => W_instr_L1_out_rsci_wen_comp,
      W_instr_L2_out_rsci_wen_comp => W_instr_L2_out_rsci_wen_comp,
      W_instr_L3_out_rsci_wen_comp => W_instr_L3_out_rsci_wen_comp
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_run_fsm_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000078
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      fsm_output => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_run_fsm_inst_fsm_output
    );
  fsm_output <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_run_fsm_inst_fsm_output;

  if_and_cse <= run_wen AND (fsm_output(6));
  if_and_2_cse <= run_wen AND (fsm_output(5));
  if_and_4_cse <= run_wen AND (fsm_output(4));
  if_and_10_cse <= run_wen AND (fsm_output(3));
  if_and_16_cse <= run_wen AND (fsm_output(2));
  ensig_cgo_4_mx0 <= or_dcpl_1 OR (fsm_output(1)) OR (fsm_output(4));
  ensig_cgo_3_mx0 <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  ensig_cgo_2_mx0 <= or_dcpl_5 OR (fsm_output(4));
  ensig_cgo_1_mx0 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_1 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_5 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat <= layer_instruction_in_crt_sva(389
      DOWNTO 310);
  W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat <= layer_instruction_in_crt_sva(394
      DOWNTO 390);
  W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat <= STD_LOGIC_VECTOR(UNSIGNED'( "00000")
      & UNSIGNED(W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z));
  W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat <= fsm_output(5);
  W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat <= layer_instruction_in_crt_sva(449
      DOWNTO 395);
  W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat <= layer_instruction_in_crt_sva(454
      DOWNTO 450);
  W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat <= STD_LOGIC_VECTOR(UNSIGNED'( "000000")
      & UNSIGNED(O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z));
  W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat <= fsm_output(4);
  O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat <= MUX_v_70_2_2((layer_instruction_in_crt_sva(69
      DOWNTO 0)), (layer_instruction_in_crt_sva(224 DOWNTO 155)), fsm_output(5));
  O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat <= MUX_v_5_2_2((layer_instruction_in_crt_sva(74
      DOWNTO 70)), (layer_instruction_in_crt_sva(229 DOWNTO 225)), fsm_output(5));
  O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat <= STD_LOGIC_VECTOR(UNSIGNED'( "00000")
      & UNSIGNED(O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z));
  O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat <= MUX_v_45_2_2((layer_instruction_in_crt_sva(119
      DOWNTO 75)), (layer_instruction_in_crt_sva(274 DOWNTO 230)), fsm_output(4));
  O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat <= MUX_v_5_2_2((layer_instruction_in_crt_sva(124
      DOWNTO 120)), (layer_instruction_in_crt_sva(279 DOWNTO 275)), fsm_output(4));
  if_mux_18_nl <= MUX_v_5_2_2(O_tile_size_L1_sva, I_tile_size_L1_sva, fsm_output(4));
  O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat <= STD_LOGIC_VECTOR(UNSIGNED'( "0000")
      & UNSIGNED(if_mux_18_nl));
  O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat <= CONV_SL_1_1(fsm_output(4 DOWNTO
      3)/=STD_LOGIC_VECTOR'("00"));
  O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat <= MUX1HOT_v_25_3_2((layer_instruction_in_rsci_idat_mxwt(149
      DOWNTO 125)), (layer_instruction_in_crt_sva(304 DOWNTO 280)), (layer_instruction_in_crt_sva(479
      DOWNTO 455)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3))));
  O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat <= MUX1HOT_v_5_3_2((layer_instruction_in_rsci_idat_mxwt(154
      DOWNTO 150)), (layer_instruction_in_crt_sva(309 DOWNTO 305)), (layer_instruction_in_crt_sva(484
      DOWNTO 480)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3))));
  O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat <= MUX1HOT_v_5_3_2(O_tile_size_L1_sva,
      I_tile_size_L1_sva, W_tile_size_L1_sva, STD_LOGIC_VECTOR'( (fsm_output(1))
      & (fsm_output(2)) & (fsm_output(3))));
  O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat <= or_dcpl_1 OR (fsm_output(1));
  CGHpart_irsig_1 <= ensig_cgo_1_mx0;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L3_out_rsci_idat_79_0 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000");
        W_instr_L3_out_rsci_idat_159_80 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000");
        I_instr_L3_out_rsci_idat_69_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000000000");
        I_instr_L3_out_rsci_idat_139_70 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( if_and_cse = '1' ) THEN
        W_instr_L3_out_rsci_idat_79_0 <= W_tiling_unit_L3_run_cmp_instr_bound_rsc_z;
        W_instr_L3_out_rsci_idat_159_80 <= W_tiling_unit_L3_run_cmp_instr_tile_rsc_z;
        I_instr_L3_out_rsci_idat_69_0 <= O_tiling_unit_L3_run_cmp_instr_bound_rsc_z;
        I_instr_L3_out_rsci_idat_139_70 <= O_tiling_unit_L3_run_cmp_instr_tile_rsc_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L2_out_rsci_idat_54_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000");
        W_instr_L2_out_rsci_idat_109_55 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000");
        I_instr_L2_out_rsci_idat_44_0 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000");
        I_instr_L2_out_rsci_idat_89_45 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000");
        O_instr_L3_out_rsci_idat_69_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000000000");
        O_instr_L3_out_rsci_idat_139_70 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( if_and_2_cse = '1' ) THEN
        W_instr_L2_out_rsci_idat_54_0 <= W_tiling_unit_L2_run_cmp_instr_bound_rsc_z;
        W_instr_L2_out_rsci_idat_109_55 <= W_tiling_unit_L2_run_cmp_instr_tile_rsc_z;
        I_instr_L2_out_rsci_idat_44_0 <= O_tiling_unit_L2_run_cmp_instr_bound_rsc_z;
        I_instr_L2_out_rsci_idat_89_45 <= O_tiling_unit_L2_run_cmp_instr_tile_rsc_z;
        O_instr_L3_out_rsci_idat_69_0 <= O_tiling_unit_L3_run_cmp_instr_bound_rsc_z;
        O_instr_L3_out_rsci_idat_139_70 <= O_tiling_unit_L3_run_cmp_instr_tile_rsc_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_instr_L1_out_rsci_idat_24_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        W_instr_L1_out_rsci_idat_49_25 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        O_instr_L2_out_rsci_idat_44_0 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000");
        O_instr_L2_out_rsci_idat_89_45 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000");
        W_tile_size_L1_sva <= STD_LOGIC_VECTOR'( "00001");
      ELSIF ( if_and_4_cse = '1' ) THEN
        W_instr_L1_out_rsci_idat_24_0 <= O_tiling_unit_L1_run_cmp_instr_bound_rsc_z;
        W_instr_L1_out_rsci_idat_49_25 <= O_tiling_unit_L1_run_cmp_instr_tile_rsc_z;
        O_instr_L2_out_rsci_idat_44_0 <= O_tiling_unit_L2_run_cmp_instr_bound_rsc_z;
        O_instr_L2_out_rsci_idat_89_45 <= O_tiling_unit_L2_run_cmp_instr_tile_rsc_z;
        W_tile_size_L1_sva <= O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_instr_L1_out_rsci_idat_24_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        I_instr_L1_out_rsci_idat_49_25 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        I_tile_size_L1_sva <= STD_LOGIC_VECTOR'( "00001");
      ELSIF ( if_and_10_cse = '1' ) THEN
        I_instr_L1_out_rsci_idat_24_0 <= O_tiling_unit_L1_run_cmp_instr_bound_rsc_z;
        I_instr_L1_out_rsci_idat_49_25 <= O_tiling_unit_L1_run_cmp_instr_tile_rsc_z;
        I_tile_size_L1_sva <= O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_L1_out_rsci_idat_24_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        O_instr_L1_out_rsci_idat_49_25 <= STD_LOGIC_VECTOR'( "0000000000000000000000000");
        O_tile_size_L1_sva <= STD_LOGIC_VECTOR'( "00001");
      ELSIF ( if_and_16_cse = '1' ) THEN
        O_instr_L1_out_rsci_idat_24_0 <= O_tiling_unit_L1_run_cmp_instr_bound_rsc_z;
        O_instr_L1_out_rsci_idat_49_25 <= O_tiling_unit_L1_run_cmp_instr_tile_rsc_z;
        O_tile_size_L1_sva <= O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        ensig_cgo_4 <= '0';
        ensig_cgo_3 <= '0';
        ensig_cgo_2 <= '0';
        ensig_cgo_1 <= '0';
        ensig_cgo <= '0';
        reg_W_instr_L3_out_rsci_ivld_run_psct_cse <= '0';
        reg_W_instr_L2_out_rsci_ivld_run_psct_cse <= '0';
        reg_W_instr_L1_out_rsci_ivld_run_psct_cse <= '0';
        reg_I_instr_L1_out_rsci_ivld_run_psct_cse <= '0';
        reg_O_instr_L1_out_rsci_ivld_run_psct_cse <= '0';
        reg_layer_instruction_in_rsci_irdy_run_psct_cse <= '0';
      ELSIF ( run_wen = '1' ) THEN
        ensig_cgo_4 <= ensig_cgo_4_mx0;
        ensig_cgo_3 <= ensig_cgo_3_mx0;
        ensig_cgo_2 <= ensig_cgo_2_mx0;
        ensig_cgo_1 <= ensig_cgo_1_mx0;
        ensig_cgo <= or_dcpl_5;
        reg_W_instr_L3_out_rsci_ivld_run_psct_cse <= fsm_output(6);
        reg_W_instr_L2_out_rsci_ivld_run_psct_cse <= fsm_output(5);
        reg_W_instr_L1_out_rsci_ivld_run_psct_cse <= fsm_output(4);
        reg_I_instr_L1_out_rsci_ivld_run_psct_cse <= fsm_output(3);
        reg_O_instr_L1_out_rsci_ivld_run_psct_cse <= fsm_output(2);
        reg_layer_instruction_in_rsci_irdy_run_psct_cse <= (fsm_output(7)) OR (fsm_output(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        layer_instruction_in_crt_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (run_wen AND (fsm_output(1))) = '1' ) THEN
        layer_instruction_in_crt_sva <= layer_instruction_in_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_wr_data_rsc_vld : IN STD_LOGIC;
    O_wr_data_rsc_rdy : OUT STD_LOGIC;
    O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_rd_data_rsc_vld : OUT STD_LOGIC;
    O_rd_data_rsc_rdy : IN STD_LOGIC;
    I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_wr_data_rsc_vld : IN STD_LOGIC;
    I_wr_data_rsc_rdy : OUT STD_LOGIC;
    W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_wr_data_rsc_vld : IN STD_LOGIC;
    W_wr_data_rsc_rdy : OUT STD_LOGIC;
    wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
    wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
    wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
    O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_in_rsc_vld : IN STD_LOGIC;
    O_instr_in_rsc_rdy : OUT STD_LOGIC;
    I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_in_rsc_vld : IN STD_LOGIC;
    I_instr_in_rsc_rdy : OUT STD_LOGIC;
    W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_in_rsc_vld : IN STD_LOGIC;
    W_instr_in_rsc_rdy : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_wen : STD_LOGIC;
  SIGNAL run_wten : STD_LOGIC;
  SIGNAL O_wr_data_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL O_wr_data_rsci_idat_mxwt : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_rd_data_rsci_irdy_mxwt : STD_LOGIC;
  SIGNAL O_rd_data_rsci_idat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_wr_data_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL I_wr_data_rsci_idat_mxwt : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_wr_data_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL W_wr_data_rsci_idat_mxwt : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL wr_data_zero_guard_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsci_idat_mxwt : STD_LOGIC;
  SIGNAL O_instr_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL O_instr_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL I_instr_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL I_instr_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL W_instr_in_rsci_wen_comp : STD_LOGIC;
  SIGNAL W_instr_in_rsci_idat_mxwt : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux1h_1_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL aif_7_equal_tmp : STD_LOGIC;
  SIGNAL mux_188_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL if_6_aif_equal_tmp : STD_LOGIC;
  SIGNAL if_6_if_3_acc_tmp : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_6_if_1_acc_tmp : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_6_if_6_mux1h_tmp : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_6_else_if_equal_tmp : STD_LOGIC;
  SIGNAL aif_equal_tmp : STD_LOGIC;
  SIGNAL oif_2_unequal_tmp : STD_LOGIC;
  SIGNAL oif_1_unequal_tmp : STD_LOGIC;
  SIGNAL oif_unequal_tmp : STD_LOGIC;
  SIGNAL if_for_if_for_and_26_tmp : STD_LOGIC;
  SIGNAL if_for_if_for_and_28_tmp : STD_LOGIC;
  SIGNAL if_for_if_for_and_27_tmp : STD_LOGIC;
  SIGNAL if_5_else_or_tmp_2 : STD_LOGIC;
  SIGNAL if_10_if_equal_1_tmp : STD_LOGIC;
  SIGNAL if_9_if_equal_1_tmp : STD_LOGIC;
  SIGNAL mux1h_7_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL and_tmp_1 : STD_LOGIC;
  SIGNAL or_tmp_5 : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL mux_tmp_6 : STD_LOGIC;
  SIGNAL or_tmp_10 : STD_LOGIC;
  SIGNAL mux_tmp_11 : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_tmp_14 : STD_LOGIC;
  SIGNAL mux_tmp_14 : STD_LOGIC;
  SIGNAL nor_tmp_8 : STD_LOGIC;
  SIGNAL not_tmp_8 : STD_LOGIC;
  SIGNAL not_tmp_9 : STD_LOGIC;
  SIGNAL mux_tmp_24 : STD_LOGIC;
  SIGNAL not_tmp_14 : STD_LOGIC;
  SIGNAL not_tmp_15 : STD_LOGIC;
  SIGNAL mux_tmp_34 : STD_LOGIC;
  SIGNAL or_tmp_51 : STD_LOGIC;
  SIGNAL nor_tmp_25 : STD_LOGIC;
  SIGNAL and_tmp_40 : STD_LOGIC;
  SIGNAL nor_tmp_26 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL not_tmp_25 : STD_LOGIC;
  SIGNAL or_tmp_73 : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL nor_tmp_39 : STD_LOGIC;
  SIGNAL nor_tmp_43 : STD_LOGIC;
  SIGNAL or_tmp_93 : STD_LOGIC;
  SIGNAL mux_tmp_67 : STD_LOGIC;
  SIGNAL or_tmp_96 : STD_LOGIC;
  SIGNAL or_tmp_97 : STD_LOGIC;
  SIGNAL or_tmp_98 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL or_dcpl_19 : STD_LOGIC;
  SIGNAL or_dcpl_21 : STD_LOGIC;
  SIGNAL or_dcpl_22 : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL or_dcpl_27 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_dcpl_31 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_33 : STD_LOGIC;
  SIGNAL or_dcpl_34 : STD_LOGIC;
  SIGNAL or_dcpl_35 : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL or_dcpl_37 : STD_LOGIC;
  SIGNAL or_dcpl_38 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL or_dcpl_40 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL or_dcpl_44 : STD_LOGIC;
  SIGNAL or_dcpl_45 : STD_LOGIC;
  SIGNAL or_dcpl_47 : STD_LOGIC;
  SIGNAL or_dcpl_48 : STD_LOGIC;
  SIGNAL or_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_50 : STD_LOGIC;
  SIGNAL or_dcpl_51 : STD_LOGIC;
  SIGNAL or_dcpl_52 : STD_LOGIC;
  SIGNAL or_dcpl_53 : STD_LOGIC;
  SIGNAL or_dcpl_54 : STD_LOGIC;
  SIGNAL or_dcpl_55 : STD_LOGIC;
  SIGNAL or_dcpl_56 : STD_LOGIC;
  SIGNAL or_dcpl_57 : STD_LOGIC;
  SIGNAL or_dcpl_58 : STD_LOGIC;
  SIGNAL or_dcpl_59 : STD_LOGIC;
  SIGNAL or_dcpl_60 : STD_LOGIC;
  SIGNAL or_dcpl_61 : STD_LOGIC;
  SIGNAL or_dcpl_62 : STD_LOGIC;
  SIGNAL or_dcpl_63 : STD_LOGIC;
  SIGNAL or_dcpl_64 : STD_LOGIC;
  SIGNAL or_dcpl_65 : STD_LOGIC;
  SIGNAL or_dcpl_66 : STD_LOGIC;
  SIGNAL or_dcpl_67 : STD_LOGIC;
  SIGNAL or_dcpl_68 : STD_LOGIC;
  SIGNAL or_dcpl_69 : STD_LOGIC;
  SIGNAL or_dcpl_70 : STD_LOGIC;
  SIGNAL or_dcpl_71 : STD_LOGIC;
  SIGNAL or_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_73 : STD_LOGIC;
  SIGNAL not_tmp_47 : STD_LOGIC;
  SIGNAL mux_tmp_76 : STD_LOGIC;
  SIGNAL or_dcpl_78 : STD_LOGIC;
  SIGNAL or_dcpl_80 : STD_LOGIC;
  SIGNAL or_dcpl_81 : STD_LOGIC;
  SIGNAL or_dcpl_82 : STD_LOGIC;
  SIGNAL or_dcpl_84 : STD_LOGIC;
  SIGNAL or_dcpl_87 : STD_LOGIC;
  SIGNAL or_dcpl_88 : STD_LOGIC;
  SIGNAL or_dcpl_89 : STD_LOGIC;
  SIGNAL or_dcpl_90 : STD_LOGIC;
  SIGNAL or_dcpl_91 : STD_LOGIC;
  SIGNAL or_dcpl_92 : STD_LOGIC;
  SIGNAL or_dcpl_94 : STD_LOGIC;
  SIGNAL or_dcpl_95 : STD_LOGIC;
  SIGNAL or_dcpl_97 : STD_LOGIC;
  SIGNAL or_dcpl_98 : STD_LOGIC;
  SIGNAL or_dcpl_99 : STD_LOGIC;
  SIGNAL or_dcpl_100 : STD_LOGIC;
  SIGNAL or_dcpl_101 : STD_LOGIC;
  SIGNAL or_dcpl_102 : STD_LOGIC;
  SIGNAL or_dcpl_103 : STD_LOGIC;
  SIGNAL or_dcpl_104 : STD_LOGIC;
  SIGNAL or_dcpl_105 : STD_LOGIC;
  SIGNAL or_dcpl_106 : STD_LOGIC;
  SIGNAL or_dcpl_107 : STD_LOGIC;
  SIGNAL or_dcpl_108 : STD_LOGIC;
  SIGNAL or_dcpl_109 : STD_LOGIC;
  SIGNAL or_dcpl_110 : STD_LOGIC;
  SIGNAL or_dcpl_111 : STD_LOGIC;
  SIGNAL or_dcpl_112 : STD_LOGIC;
  SIGNAL or_dcpl_113 : STD_LOGIC;
  SIGNAL or_dcpl_114 : STD_LOGIC;
  SIGNAL or_dcpl_115 : STD_LOGIC;
  SIGNAL or_dcpl_116 : STD_LOGIC;
  SIGNAL or_dcpl_117 : STD_LOGIC;
  SIGNAL or_dcpl_118 : STD_LOGIC;
  SIGNAL or_dcpl_119 : STD_LOGIC;
  SIGNAL or_dcpl_120 : STD_LOGIC;
  SIGNAL or_dcpl_121 : STD_LOGIC;
  SIGNAL or_dcpl_122 : STD_LOGIC;
  SIGNAL or_dcpl_123 : STD_LOGIC;
  SIGNAL or_dcpl_124 : STD_LOGIC;
  SIGNAL or_dcpl_125 : STD_LOGIC;
  SIGNAL or_dcpl_126 : STD_LOGIC;
  SIGNAL or_dcpl_127 : STD_LOGIC;
  SIGNAL or_dcpl_128 : STD_LOGIC;
  SIGNAL or_dcpl_129 : STD_LOGIC;
  SIGNAL or_dcpl_130 : STD_LOGIC;
  SIGNAL or_dcpl_131 : STD_LOGIC;
  SIGNAL or_dcpl_132 : STD_LOGIC;
  SIGNAL and_tmp_56 : STD_LOGIC;
  SIGNAL or_tmp_105 : STD_LOGIC;
  SIGNAL mux_tmp_77 : STD_LOGIC;
  SIGNAL or_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_78 : STD_LOGIC;
  SIGNAL and_tmp_57 : STD_LOGIC;
  SIGNAL mux_tmp_79 : STD_LOGIC;
  SIGNAL not_tmp_56 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL or_dcpl_136 : STD_LOGIC;
  SIGNAL or_dcpl_137 : STD_LOGIC;
  SIGNAL or_dcpl_138 : STD_LOGIC;
  SIGNAL or_dcpl_139 : STD_LOGIC;
  SIGNAL nor_tmp_65 : STD_LOGIC;
  SIGNAL mux_tmp_89 : STD_LOGIC;
  SIGNAL mux_tmp_91 : STD_LOGIC;
  SIGNAL or_dcpl_142 : STD_LOGIC;
  SIGNAL or_dcpl_143 : STD_LOGIC;
  SIGNAL or_dcpl_146 : STD_LOGIC;
  SIGNAL or_dcpl_147 : STD_LOGIC;
  SIGNAL or_dcpl_150 : STD_LOGIC;
  SIGNAL or_dcpl_151 : STD_LOGIC;
  SIGNAL or_dcpl_154 : STD_LOGIC;
  SIGNAL or_dcpl_155 : STD_LOGIC;
  SIGNAL or_dcpl_158 : STD_LOGIC;
  SIGNAL or_dcpl_161 : STD_LOGIC;
  SIGNAL or_dcpl_164 : STD_LOGIC;
  SIGNAL or_dcpl_167 : STD_LOGIC;
  SIGNAL or_dcpl_168 : STD_LOGIC;
  SIGNAL or_dcpl_171 : STD_LOGIC;
  SIGNAL or_dcpl_174 : STD_LOGIC;
  SIGNAL or_dcpl_177 : STD_LOGIC;
  SIGNAL or_dcpl_180 : STD_LOGIC;
  SIGNAL or_dcpl_181 : STD_LOGIC;
  SIGNAL or_dcpl_184 : STD_LOGIC;
  SIGNAL or_dcpl_187 : STD_LOGIC;
  SIGNAL or_dcpl_190 : STD_LOGIC;
  SIGNAL or_dcpl_193 : STD_LOGIC;
  SIGNAL or_dcpl_226 : STD_LOGIC;
  SIGNAL mux_tmp_94 : STD_LOGIC;
  SIGNAL mux_tmp_96 : STD_LOGIC;
  SIGNAL mux_tmp_98 : STD_LOGIC;
  SIGNAL or_dcpl_237 : STD_LOGIC;
  SIGNAL or_tmp_143 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL or_tmp_162 : STD_LOGIC;
  SIGNAL not_tmp_93 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL nand_tmp_25 : STD_LOGIC;
  SIGNAL nand_tmp_27 : STD_LOGIC;
  SIGNAL mux_tmp_134 : STD_LOGIC;
  SIGNAL or_tmp_171 : STD_LOGIC;
  SIGNAL nand_tmp_28 : STD_LOGIC;
  SIGNAL nor_tmp_110 : STD_LOGIC;
  SIGNAL mux_tmp_143 : STD_LOGIC;
  SIGNAL nand_tmp_29 : STD_LOGIC;
  SIGNAL mux_tmp_144 : STD_LOGIC;
  SIGNAL nand_tmp_30 : STD_LOGIC;
  SIGNAL mux_tmp_153 : STD_LOGIC;
  SIGNAL nand_tmp_31 : STD_LOGIC;
  SIGNAL nand_tmp_32 : STD_LOGIC;
  SIGNAL mux_tmp_161 : STD_LOGIC;
  SIGNAL nand_tmp_33 : STD_LOGIC;
  SIGNAL mux_tmp_170 : STD_LOGIC;
  SIGNAL nand_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL nand_tmp_35 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL or_tmp_200 : STD_LOGIC;
  SIGNAL mux_tmp_189 : STD_LOGIC;
  SIGNAL and_tmp_80 : STD_LOGIC;
  SIGNAL or_tmp_204 : STD_LOGIC;
  SIGNAL mux_tmp_202 : STD_LOGIC;
  SIGNAL and_tmp_81 : STD_LOGIC;
  SIGNAL or_dcpl_246 : STD_LOGIC;
  SIGNAL or_dcpl_248 : STD_LOGIC;
  SIGNAL and_tmp_93 : STD_LOGIC;
  SIGNAL mux_tmp_224 : STD_LOGIC;
  SIGNAL mux_tmp_226 : STD_LOGIC;
  SIGNAL mux_tmp_231 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL and_tmp_98 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL or_tmp_242 : STD_LOGIC;
  SIGNAL land_8_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_peek_slc_skid_buf_wr_zero_guard_regs_skid_buf_wr_zero_guard_rd_ptr_1_0_cse_sva_mx0
      : STD_LOGIC;
  SIGNAL O_data_vld_sva_dfm_4_mx0 : STD_LOGIC;
  SIGNAL W_data_vld_sva_mx0 : STD_LOGIC;
  SIGNAL if_6_unequal_tmp_2 : STD_LOGIC;
  SIGNAL I_data_vld_sva_mx0 : STD_LOGIC;
  SIGNAL if_6_unequal_tmp_3 : STD_LOGIC;
  SIGNAL O_data_vld_sva : STD_LOGIC;
  SIGNAL O_write_flag_sva_mx0 : STD_LOGIC;
  SIGNAL land_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL W_irrel_cnt_sva_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_irrel_cnt_sva_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_top_rd_ptr_sva_1_mx1 : STD_LOGIC;
  SIGNAL skid_buf_top_rd_ptr_sva_0_mx1 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_0_mx1 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_1_mx1 : STD_LOGIC;
  SIGNAL land_5_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1 :
      STD_LOGIC;
  SIGNAL land_2_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL lor_4_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL O_mac_irrel_at_max_sva_dfm_mx0 : STD_LOGIC;
  SIGNAL flags_top_1_1_sva : STD_LOGIC;
  SIGNAL lor_2_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL aif_3_land_lpi_1_dfm_mx0 : STD_LOGIC;
  SIGNAL lor_3_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL lor_1_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL aif_2_land_1_lpi_1_dfm_mx0 : STD_LOGIC;
  SIGNAL data_zg_sva : STD_LOGIC;
  SIGNAL W_write_flag_sva_mx0 : STD_LOGIC;
  SIGNAL W_data_vld_sva_dfm_1_1 : STD_LOGIC;
  SIGNAL I_write_flag_sva_mx0 : STD_LOGIC;
  SIGNAL I_data_vld_sva_dfm_1_1 : STD_LOGIC;
  SIGNAL skid_buf_top_rd_ptr_sva_1 : STD_LOGIC;
  SIGNAL skid_buf_top_rd_ptr_sva_0 : STD_LOGIC;
  SIGNAL if_5_if_nbw_stat_sva_mx1 : STD_LOGIC;
  SIGNAL and_17_m1c_1 : STD_LOGIC;
  SIGNAL and_16_m1c_1 : STD_LOGIC;
  SIGNAL or_svs_1 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_1 : STD_LOGIC;
  SIGNAL skid_buf_top_push_1_xor_psp_1 : STD_LOGIC;
  SIGNAL skid_buf_top_push_1_skid_buf_top_push_1_nand_seb_1 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_dfm_1_1 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_0 : STD_LOGIC;
  SIGNAL skid_buf_top_push_nor_psp : STD_LOGIC;
  SIGNAL W_instr_in_crt_lpi_1_dfm_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL I_instr_in_crt_lpi_1_dfm_1 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      : STD_LOGIC;
  SIGNAL if_5_and_svs_1 : STD_LOGIC;
  SIGNAL skid_buf_top_pop_1_xor_psp_1 : STD_LOGIC;
  SIGNAL else_8_land_lpi_1_dfm_mx1 : STD_LOGIC;
  SIGNAL land_9_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_wr_ptr_sva : STD_LOGIC;
  SIGNAL skid_buf_top_cnt_sva : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL mux_124_itm_1 : STD_LOGIC;
  SIGNAL land_9_lpi_1_dfm_1_1 : STD_LOGIC;
  SIGNAL O_mac_irrel_at_max_sva : STD_LOGIC;
  SIGNAL W_irrel_cnt_sva_4_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL W_irrel_cnt_sva_0 : STD_LOGIC;
  SIGNAL W_mac_irrel_at_maxBuf_sva : STD_LOGIC;
  SIGNAL I_irrel_cnt_sva_4_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL I_irrel_cnt_sva_0 : STD_LOGIC;
  SIGNAL I_mac_irrel_at_maxBuf_sva : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_rd_ptr_sva : STD_LOGIC;
  SIGNAL W_wr_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_wr_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_top_push_and_psp : STD_LOGIC;
  SIGNAL skid_buf_top_push_and_1_psp : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_regs_0_sva_dfm_1 : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_regs_1_sva_dfm_1 : STD_LOGIC;
  SIGNAL flags_wr_zero_guard_sva : STD_LOGIC;
  SIGNAL if_10_if_ac_int_cctor_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_9_if_ac_int_cctor_sva_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_top_cnt_sva_mx1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL skid_buf_top_pop_1_skid_buf_top_pop_1_nand_seb_1 : STD_LOGIC;
  SIGNAL nand_11_ssc_1 : STD_LOGIC;
  SIGNAL and_47_ssc_1 : STD_LOGIC;
  SIGNAL or_360_tmp : STD_LOGIC;
  SIGNAL skid_buf_top_peek_and_m1c : STD_LOGIC;
  SIGNAL or_364_tmp : STD_LOGIC;
  SIGNAL skid_buf_top_peek_and_4_m1c : STD_LOGIC;
  SIGNAL or_368_tmp : STD_LOGIC;
  SIGNAL skid_buf_top_peek_and_5_m1c : STD_LOGIC;
  SIGNAL if_5_if_and_3_m1c : STD_LOGIC;
  SIGNAL if_5_if_and_4_m1c : STD_LOGIC;
  SIGNAL if_5_if_and_5_m1c : STD_LOGIC;
  SIGNAL reg_wr_data_zero_guard_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_W_wr_data_rsci_irdy_run_psct_cse : STD_LOGIC;
  SIGNAL reg_I_wr_data_rsci_irdy_run_psct_cse : STD_LOGIC;
  SIGNAL reg_O_rd_data_rsci_ivld_run_psct_cse : STD_LOGIC;
  SIGNAL reg_O_wr_data_rsci_irdy_run_psct_cse : STD_LOGIC;
  SIGNAL W_mac_pntr_and_cse : STD_LOGIC;
  SIGNAL flags_wr_zero_guard_and_cse : STD_LOGIC;
  SIGNAL nor_108_cse : STD_LOGIC;
  SIGNAL W_mac_irrel_at_maxBuf_and_cse : STD_LOGIC;
  SIGNAL skid_buf_top_push_and_2_cse : STD_LOGIC;
  SIGNAL operator_2_false_5_operator_2_false_5_operator_2_false_5_or_cse : STD_LOGIC;
  SIGNAL or_570_cse : STD_LOGIC;
  SIGNAL mux_420_cse : STD_LOGIC;
  SIGNAL mux_124_cse : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL or_1_cse : STD_LOGIC;
  SIGNAL or_558_cse : STD_LOGIC;
  SIGNAL and_295_cse : STD_LOGIC;
  SIGNAL or_18_cse : STD_LOGIC;
  SIGNAL or_569_cse : STD_LOGIC;
  SIGNAL nor_110_cse : STD_LOGIC;
  SIGNAL or_359_cse : STD_LOGIC;
  SIGNAL or_363_cse : STD_LOGIC;
  SIGNAL or_367_cse : STD_LOGIC;
  SIGNAL mux_554_cse : STD_LOGIC;
  SIGNAL and_306_cse : STD_LOGIC;
  SIGNAL mux_396_cse : STD_LOGIC;
  SIGNAL or_557_cse : STD_LOGIC;
  SIGNAL mux_342_cse : STD_LOGIC;
  SIGNAL nand_78_cse : STD_LOGIC;
  SIGNAL mux_343_cse : STD_LOGIC;
  SIGNAL mux_346_cse : STD_LOGIC;
  SIGNAL or_399_cse : STD_LOGIC;
  SIGNAL or_400_cse : STD_LOGIC;
  SIGNAL or_401_cse : STD_LOGIC;
  SIGNAL mux_405_cse : STD_LOGIC;
  SIGNAL mux_460_cse : STD_LOGIC;
  SIGNAL else_3_land_lpi_1_dfm_mx0w0 : STD_LOGIC;
  SIGNAL else_3_land_lpi_1_dfm : STD_LOGIC;
  SIGNAL if_6_if_if_6_if_and_1_itm : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_6_or_itm : STD_LOGIC;
  SIGNAL mux_426_itm : STD_LOGIC;
  SIGNAL mux_571_itm : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL O_mac_tile_bound_0_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_0_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_0_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_1_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_1_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_1_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_2_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_2_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_2_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_3_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_3_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_3_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_4_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_4_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_4_lpi_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_top_regs_data_1_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_top_regs_data_0_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_top_regs_data_2_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_wr_zero_guard_cnt_sva : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL O_mem_15_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_16_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_14_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_17_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_13_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_18_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_12_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_19_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_11_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_20_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_10_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_21_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_9_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_22_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_8_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_23_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_7_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_24_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_6_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_25_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_5_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_26_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_4_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_27_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_3_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_28_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_2_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_29_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_1_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_30_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_mem_31_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_write_data_data_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL O_vld_zg_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mem_15_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_16_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_14_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_17_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_13_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_18_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_12_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_19_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_11_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_20_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_10_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_21_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_9_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_22_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_8_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_23_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_7_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_24_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_6_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_25_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_5_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_26_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_4_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_27_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_3_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_28_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_2_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_29_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_1_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_30_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mem_31_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_mac_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mem_15_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_16_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_14_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_17_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_13_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_18_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_12_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_19_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_11_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_20_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_10_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_21_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_9_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_22_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_8_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_23_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_7_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_24_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_6_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_25_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_5_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_26_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_4_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_27_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_3_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_28_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_2_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_29_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_1_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_30_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mem_31_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL W_mac_pntr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_counter_2_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_counter_1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_counter_3_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_counter_0_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_counter_4_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_counter_2_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_counter_1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_counter_3_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_counter_0_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_counter_4_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_counter_2_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_counter_1_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_counter_3_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_counter_0_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_counter_4_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_instr_in_crt_lpi_1_dfm : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL aif_2_land_1_lpi_1_dfm : STD_LOGIC;
  SIGNAL aif_3_land_lpi_1_dfm : STD_LOGIC;
  SIGNAL if_5_if_nbw_stat_sva : STD_LOGIC;
  SIGNAL else_8_land_lpi_1_dfm : STD_LOGIC;
  SIGNAL I_write_flag_sva : STD_LOGIC;
  SIGNAL W_write_flag_sva : STD_LOGIC;
  SIGNAL skid_buf_top_cnt_sva_1_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mac_data_data_sva_dfm_2_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL I_vld_pntr_sva_dfm_1_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_vld_pntr_sva_dfm_1_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_rd_data_rsci_idat_mx0c0 : STD_LOGIC;
  SIGNAL O_rd_data_rsci_idat_mx0c1 : STD_LOGIC;
  SIGNAL O_rd_data_rsci_idat_mx0c2 : STD_LOGIC;
  SIGNAL O_write_data_data_sva_mx0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_top_wr_ptr_sva_0_mx0w0 : STD_LOGIC;
  SIGNAL skid_buf_top_wr_ptr_sva_1_mx0w0 : STD_LOGIC;
  SIGNAL O_instr_in_crt_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL O_data_vld_sva_mx0c1 : STD_LOGIC;
  SIGNAL else_8_land_lpi_1_dfm_mx0w0 : STD_LOGIC;
  SIGNAL mac_data_data_sva_dfm_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_top_push_and_psp_1 : STD_LOGIC;
  SIGNAL I_instr_in_crt_lpi_1_dfm_1_mx0 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL W_instr_in_crt_lpi_1_dfm_1_mx0 : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL flags_top_1_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL skid_buf_top_push_nor_psp_mx0w0 : STD_LOGIC;
  SIGNAL skid_buf_top_push_and_1_psp_mx0w0 : STD_LOGIC;
  SIGNAL O_mac_tile_bound_4_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_tile_bound_0_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_vld_zg_pntr_sva_4 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_top_peek_nor_m1c_1 : STD_LOGIC;
  SIGNAL skid_buf_top_peek_and_m1c_2 : STD_LOGIC;
  SIGNAL skid_buf_top_peek_and_m1c_3 : STD_LOGIC;
  SIGNAL O_data_vld_sva_dfm_4_mx0w0 : STD_LOGIC;
  SIGNAL if_5_and_1_m1c_1 : STD_LOGIC;
  SIGNAL if_5_if_5_nor_m1c_1 : STD_LOGIC;
  SIGNAL I_wr_pntr_sva_dfm_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_wr_pntr_sva_dfm_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL skid_buf_wr_zero_guard_cnt_sva_5 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL W_mac_tile_bound_4_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_tile_bound_0_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_4_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_tile_bound_0_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_18
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_22
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_23
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_19
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_26
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_27
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_28
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_20
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_31
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_32
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_33
      : STD_LOGIC;
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL reg_W_instr_in_rsci_oswt_cse_1 : STD_LOGIC;
  SIGNAL skid_buf_top_cnt_and_1_cse : STD_LOGIC;
  SIGNAL nand_73_cse : STD_LOGIC;
  SIGNAL and_331_cse : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL skid_buf_top_push_1_acc_1_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL or_tmp_299 : STD_LOGIC;
  SIGNAL or_tmp_300 : STD_LOGIC;
  SIGNAL not_tmp_156 : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL mux_tmp_245 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL not_tmp_165 : STD_LOGIC;
  SIGNAL nand_tmp_39 : STD_LOGIC;
  SIGNAL not_tmp_172 : STD_LOGIC;
  SIGNAL nand_tmp_46 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL nor_tmp_182 : STD_LOGIC;
  SIGNAL and_tmp_102 : STD_LOGIC;
  SIGNAL and_tmp_103 : STD_LOGIC;
  SIGNAL and_tmp_104 : STD_LOGIC;
  SIGNAL nor_tmp_189 : STD_LOGIC;
  SIGNAL and_tmp_107 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL not_tmp_191 : STD_LOGIC;
  SIGNAL not_tmp_193 : STD_LOGIC;
  SIGNAL nor_tmp_217 : STD_LOGIC;
  SIGNAL mux_404_tmp : STD_LOGIC;
  SIGNAL and_370_cse : STD_LOGIC;
  SIGNAL and_541_cse : STD_LOGIC;
  SIGNAL nand_129_cse : STD_LOGIC;
  SIGNAL and_526_cse : STD_LOGIC;
  SIGNAL and_432_cse : STD_LOGIC;
  SIGNAL and_544_cse : STD_LOGIC;
  SIGNAL nor_215_cse : STD_LOGIC;
  SIGNAL or_756_cse : STD_LOGIC;
  SIGNAL or_601_cse : STD_LOGIC;
  SIGNAL or_600_cse : STD_LOGIC;
  SIGNAL or_598_cse : STD_LOGIC;
  SIGNAL nor_303_cse : STD_LOGIC;
  SIGNAL or_620_cse : STD_LOGIC;
  SIGNAL and_395_cse : STD_LOGIC;
  SIGNAL and_426_cse : STD_LOGIC;
  SIGNAL skid_buf_top_pop_skid_buf_top_pop_and_4_itm : STD_LOGIC;
  SIGNAL skid_buf_top_pop_skid_buf_top_pop_and_2_itm : STD_LOGIC;
  SIGNAL mux_530_itm : STD_LOGIC;
  SIGNAL mux_543_itm : STD_LOGIC;
  SIGNAL mux_642_itm : STD_LOGIC;
  SIGNAL mux_663_itm : STD_LOGIC;
  SIGNAL skid_buf_top_rd_ptr_and_cse : STD_LOGIC;

  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_182_nl : STD_LOGIC;
  SIGNAL nor_183_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL nor_184_nl : STD_LOGIC;
  SIGNAL nor_185_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL if_5_if_or_nl : STD_LOGIC;
  SIGNAL if_5_if_or_2_nl : STD_LOGIC;
  SIGNAL if_5_if_or_3_nl : STD_LOGIC;
  SIGNAL if_5_if_or_4_nl : STD_LOGIC;
  SIGNAL if_5_if_or_5_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL or_97_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL and_293_nl : STD_LOGIC;
  SIGNAL and_294_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL nand_37_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL and_302_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL and_301_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL and_300_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL or_593_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL and_537_nl : STD_LOGIC;
  SIGNAL nor_302_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL nand_101_nl : STD_LOGIC;
  SIGNAL nand_100_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL and_533_nl : STD_LOGIC;
  SIGNAL nor_299_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL nand_108_nl : STD_LOGIC;
  SIGNAL nand_107_nl : STD_LOGIC;
  SIGNAL mux_614_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL and_388_nl : STD_LOGIC;
  SIGNAL and_387_nl : STD_LOGIC;
  SIGNAL mux_612_nl : STD_LOGIC;
  SIGNAL mux_611_nl : STD_LOGIC;
  SIGNAL mux_610_nl : STD_LOGIC;
  SIGNAL mux_609_nl : STD_LOGIC;
  SIGNAL and_385_nl : STD_LOGIC;
  SIGNAL and_384_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL else_8_else_8_or_2_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL mux_488_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL mux_517_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL mux_515_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL mux_618_nl : STD_LOGIC;
  SIGNAL and_393_nl : STD_LOGIC;
  SIGNAL mux_617_nl : STD_LOGIC;
  SIGNAL and_392_nl : STD_LOGIC;
  SIGNAL if_6_if_6_and_3_nl : STD_LOGIC;
  SIGNAL if_6_if_6_and_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL and_52_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL and_49_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL if_6_if_6_and_9_nl : STD_LOGIC;
  SIGNAL mux_647_nl : STD_LOGIC;
  SIGNAL mux_646_nl : STD_LOGIC;
  SIGNAL mux_645_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL mux_644_nl : STD_LOGIC;
  SIGNAL mux_720_nl : STD_LOGIC;
  SIGNAL mux_643_nl : STD_LOGIC;
  SIGNAL or_531_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL or_555_nl : STD_LOGIC;
  SIGNAL or_556_nl : STD_LOGIC;
  SIGNAL mux_672_nl : STD_LOGIC;
  SIGNAL mux_671_nl : STD_LOGIC;
  SIGNAL mux_670_nl : STD_LOGIC;
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL mux_669_nl : STD_LOGIC;
  SIGNAL mux_668_nl : STD_LOGIC;
  SIGNAL mux_667_nl : STD_LOGIC;
  SIGNAL mux_666_nl : STD_LOGIC;
  SIGNAL mux_721_nl : STD_LOGIC;
  SIGNAL mux_665_nl : STD_LOGIC;
  SIGNAL mux_722_nl : STD_LOGIC;
  SIGNAL mux_664_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL or_757_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL if_6_mux_3_nl : STD_LOGIC;
  SIGNAL if_6_if_if_6_if_and_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL and_172_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL and_169_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL mux_717_nl : STD_LOGIC;
  SIGNAL mux_718_nl : STD_LOGIC;
  SIGNAL skid_buf_top_push_1_skid_buf_top_push_1_and_nl : STD_LOGIC;
  SIGNAL skid_buf_top_push_1_skid_buf_top_push_1_and_1_nl : STD_LOGIC;
  SIGNAL nand_85_nl : STD_LOGIC;
  SIGNAL UPDATE_PSUM_acc_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_mux_8_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_mux_9_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL and_550_nl : STD_LOGIC;
  SIGNAL and_3_nl : STD_LOGIC;
  SIGNAL else_3_aelse_mux_1_nl : STD_LOGIC;
  SIGNAL and_125_nl : STD_LOGIC;
  SIGNAL aelse_2_aelse_2_and_2_nl : STD_LOGIC;
  SIGNAL aelse_3_aelse_3_and_nl : STD_LOGIC;
  SIGNAL skid_buf_wr_zero_guard_pop_acc_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL if_if_mux_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL if_6_if_if_not_5_nl : STD_LOGIC;
  SIGNAL if_6_mux_4_nl : STD_LOGIC;
  SIGNAL if_6_else_mux_2_nl : STD_LOGIC;
  SIGNAL if_6_else_if_if_6_else_if_or_nl : STD_LOGIC;
  SIGNAL if_7_mux_3_nl : STD_LOGIC;
  SIGNAL if_7_mux_1_nl : STD_LOGIC;
  SIGNAL O_mac_pntr_mux_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_vld_zg_pntr_mux_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_vld_zg_pntr_and_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL asn_I_wr_pntr_sva_nand_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL nand_91_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL or_590_nl : STD_LOGIC;
  SIGNAL if_5_and_5_nl : STD_LOGIC;
  SIGNAL if_5_and_4_nl : STD_LOGIC;
  SIGNAL and_51_nl : STD_LOGIC;
  SIGNAL and_50_nl : STD_LOGIC;
  SIGNAL and_54_nl : STD_LOGIC;
  SIGNAL and_53_nl : STD_LOGIC;
  SIGNAL and_58_nl : STD_LOGIC;
  SIGNAL and_56_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL nand_83_nl : STD_LOGIC;
  SIGNAL nand_84_nl : STD_LOGIC;
  SIGNAL and_64_nl : STD_LOGIC;
  SIGNAL and_63_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL and_75_nl : STD_LOGIC;
  SIGNAL and_74_nl : STD_LOGIC;
  SIGNAL and_92_nl : STD_LOGIC;
  SIGNAL and_91_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL nand_14_nl : STD_LOGIC;
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL and_305_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL or_119_nl : STD_LOGIC;
  SIGNAL or_117_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL nand_75_nl : STD_LOGIC;
  SIGNAL or_192_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL nand_31_nl : STD_LOGIC;
  SIGNAL nand_32_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL nand_35_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL and_128_nl : STD_LOGIC;
  SIGNAL and_127_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL and_129_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL and_126_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL nor_201_nl : STD_LOGIC;
  SIGNAL nor_200_nl : STD_LOGIC;
  SIGNAL nor_199_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL nor_195_nl : STD_LOGIC;
  SIGNAL nor_196_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL or_394_nl : STD_LOGIC;
  SIGNAL or_392_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL or_422_nl : STD_LOGIC;
  SIGNAL or_421_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL nor_191_nl : STD_LOGIC;
  SIGNAL nor_192_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL and_299_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL or_428_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL or_425_nl : STD_LOGIC;
  SIGNAL mux_485_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL or_434_nl : STD_LOGIC;
  SIGNAL mux_483_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL or_431_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL or_445_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL mux_495_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL or_451_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL or_448_nl : STD_LOGIC;
  SIGNAL and_153_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL and_171_nl : STD_LOGIC;
  SIGNAL and_170_nl : STD_LOGIC;
  SIGNAL and_296_nl : STD_LOGIC;
  SIGNAL and_297_nl : STD_LOGIC;
  SIGNAL mux_570_nl : STD_LOGIC;
  SIGNAL mux_569_nl : STD_LOGIC;
  SIGNAL and_175_nl : STD_LOGIC;
  SIGNAL and_174_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL or_493_nl : STD_LOGIC;
  SIGNAL mux_572_nl : STD_LOGIC;
  SIGNAL nor_188_nl : STD_LOGIC;
  SIGNAL nor_189_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL and_95_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL nand_16_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL nand_57_nl : STD_LOGIC;
  SIGNAL nand_58_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL nor_138_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL nor_136_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL nor_134_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL nor_149_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL nor_147_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL nor_140_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL mux_587_nl : STD_LOGIC;
  SIGNAL nor_307_nl : STD_LOGIC;
  SIGNAL and_365_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL nand_96_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL mux_593_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL and_539_nl : STD_LOGIC;
  SIGNAL nor_304_nl : STD_LOGIC;
  SIGNAL and_535_nl : STD_LOGIC;
  SIGNAL nor_301_nl : STD_LOGIC;
  SIGNAL mux_638_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL and_516_nl : STD_LOGIC;
  SIGNAL and_425_nl : STD_LOGIC;
  SIGNAL mux_640_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL mux_661_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_FROM_TOP_mux_5_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_FROM_TOP_or_2_nl : STD_LOGIC;
  SIGNAL if_10_mux_97_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_98_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_99_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_100_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_101_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_102_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_103_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_104_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_105_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_106_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_107_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_108_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_109_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_110_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_111_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_112_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_113_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_114_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_115_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_116_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_117_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_118_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_119_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_120_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_121_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_122_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_123_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_124_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_125_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_126_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_10_mux_127_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_724_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_FROM_TOP_mux_6_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL UPDATE_PSUM_FROM_TOP_or_3_nl : STD_LOGIC;
  SIGNAL if_9_mux_97_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_98_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_99_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_100_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_101_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_102_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_103_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_104_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_105_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_106_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_107_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_108_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_109_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_110_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_111_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_112_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_113_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_114_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_115_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_116_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_117_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_118_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_119_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_120_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_121_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_122_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_123_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_124_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_125_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_126_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL if_9_mux_127_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL skid_buf_top_pop_1_mux_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_549_nl : STD_LOGIC;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153
    PORT (
      loop_bound : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      tile_sizes : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pntr_in : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      pntr_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      irrel_at_max_out : OUT STD_LOGIC;
      irrel_at_zero_out : OUT STD_LOGIC;
      all_at_max_1_out : OUT STD_LOGIC;
      counter_in : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      counter_out : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      tile_bound_in : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      tile_bound_out : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL O_mac_pntr_cntInst_run_rg_loop_bound : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_tile_sizes : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_pntr_in : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_pntr_out : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_counter_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_counter_out : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_tile_bound_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL O_mac_pntr_cntInst_run_rg_tile_bound_out : STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL W_mac_pntr_cntInst_run_rg_loop_bound : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_tile_sizes : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_pntr_in : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_pntr_out : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_counter_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_counter_out : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_tile_bound_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL W_mac_pntr_cntInst_run_rg_tile_bound_out : STD_LOGIC_VECTOR (24 DOWNTO 0);

  SIGNAL I_mac_pntr_cntInst_run_rg_loop_bound : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_tile_sizes : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_pntr_in : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_pntr_out : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_counter_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_counter_out : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_tile_bound_in : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL I_mac_pntr_cntInst_run_rg_tile_bound_out : STD_LOGIC_VECTOR (24 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_wr_data_rsc_vld : IN STD_LOGIC;
      O_wr_data_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      O_wr_data_rsci_oswt : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      O_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      O_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_rd_data_rsc_vld : OUT STD_LOGIC;
      O_rd_data_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      O_rd_data_rsci_oswt : IN STD_LOGIC;
      O_rd_data_rsci_irdy_mxwt : OUT STD_LOGIC;
      O_rd_data_rsci_idat : IN STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsci_idat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      I_wr_data_rsc_vld : IN STD_LOGIC;
      I_wr_data_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      I_wr_data_rsci_oswt : IN STD_LOGIC;
      I_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      I_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      W_wr_data_rsc_vld : IN STD_LOGIC;
      W_wr_data_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      W_wr_data_rsci_oswt : IN STD_LOGIC;
      W_wr_data_rsci_ivld_mxwt : OUT STD_LOGIC;
      W_wr_data_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
      wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
      wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      wr_data_zero_guard_rsci_oswt : IN STD_LOGIC;
      wr_data_zero_guard_rsci_ivld_mxwt : OUT STD_LOGIC;
      wr_data_zero_guard_rsci_idat_mxwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_in_rsc_vld : IN STD_LOGIC;
      O_instr_in_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      O_instr_in_rsci_oswt : IN STD_LOGIC;
      O_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      O_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_in_rsc_vld : IN STD_LOGIC;
      I_instr_in_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      I_instr_in_rsci_oswt : IN STD_LOGIC;
      I_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      I_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_in_rsc_vld : IN STD_LOGIC;
      W_instr_in_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      W_instr_in_rsci_oswt : IN STD_LOGIC;
      W_instr_in_rsci_wen_comp : OUT STD_LOGIC;
      W_instr_in_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (49 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsci_idat_mxwt
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : OUT STD_LOGIC;
      run_wten : OUT STD_LOGIC;
      O_instr_in_rsci_wen_comp : IN STD_LOGIC;
      I_instr_in_rsci_wen_comp : IN STD_LOGIC;
      W_instr_in_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_run_fsm_inst_fsm_output
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_s_1_3_2(input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_16_5_2(input_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_4_2(input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_2_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_16_32_2(input_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00000" =>
          result := input_0;
        WHEN "00001" =>
          result := input_1;
        WHEN "00010" =>
          result := input_2;
        WHEN "00011" =>
          result := input_3;
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "00110" =>
          result := input_6;
        WHEN "00111" =>
          result := input_7;
        WHEN "01000" =>
          result := input_8;
        WHEN "01001" =>
          result := input_9;
        WHEN "01010" =>
          result := input_10;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "01110" =>
          result := input_14;
        WHEN "01111" =>
          result := input_15;
        WHEN "10000" =>
          result := input_16;
        WHEN "10001" =>
          result := input_17;
        WHEN "10010" =>
          result := input_18;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN "10101" =>
          result := input_21;
        WHEN "10110" =>
          result := input_22;
        WHEN "10111" =>
          result := input_23;
        WHEN "11000" =>
          result := input_24;
        WHEN "11001" =>
          result := input_25;
        WHEN "11010" =>
          result := input_26;
        WHEN "11011" =>
          result := input_27;
        WHEN "11100" =>
          result := input_28;
        WHEN "11101" =>
          result := input_29;
        WHEN "11110" =>
          result := input_30;
        WHEN others =>
          result := input_31;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_2_2_2(input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_50_2_2(input_0 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(49 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(49 DOWNTO 0);

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

BEGIN
  O_mac_pntr_cntInst_run_rg : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153
    PORT MAP(
      loop_bound => O_mac_pntr_cntInst_run_rg_loop_bound,
      tile_sizes => O_mac_pntr_cntInst_run_rg_tile_sizes,
      pntr_in => O_mac_pntr_cntInst_run_rg_pntr_in,
      pntr_out => O_mac_pntr_cntInst_run_rg_pntr_out,
      irrel_at_max_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21,
      irrel_at_zero_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_22,
      all_at_max_1_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_23,
      counter_in => O_mac_pntr_cntInst_run_rg_counter_in,
      counter_out => O_mac_pntr_cntInst_run_rg_counter_out,
      tile_bound_in => O_mac_pntr_cntInst_run_rg_tile_bound_in,
      tile_bound_out => O_mac_pntr_cntInst_run_rg_tile_bound_out
    );
  O_mac_pntr_cntInst_run_rg_loop_bound <= O_instr_in_crt_lpi_1_dfm_mx0(24 DOWNTO
      0);
  O_mac_pntr_cntInst_run_rg_tile_sizes <= O_instr_in_crt_lpi_1_dfm_mx0(49 DOWNTO
      25);
  O_mac_pntr_cntInst_run_rg_pntr_in <= O_mac_pntr_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_18
      <= O_mac_pntr_cntInst_run_rg_pntr_out;
  O_mac_pntr_cntInst_run_rg_counter_in <= O_mac_counter_4_sva & O_mac_counter_3_sva
      & O_mac_counter_2_sva & O_mac_counter_1_sva & O_mac_counter_0_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24
      <= O_mac_pntr_cntInst_run_rg_counter_out;
  O_mac_pntr_cntInst_run_rg_tile_bound_in <= O_mac_tile_bound_4_lpi_1_dfm_mx0 & O_mac_tile_bound_3_lpi_1_dfm_mx0
      & O_mac_tile_bound_2_lpi_1_dfm_mx0 & O_mac_tile_bound_1_lpi_1_dfm_mx0 & O_mac_tile_bound_0_lpi_1_dfm_mx0;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25
      <= O_mac_pntr_cntInst_run_rg_tile_bound_out;

  W_mac_pntr_cntInst_run_rg : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153
    PORT MAP(
      loop_bound => W_mac_pntr_cntInst_run_rg_loop_bound,
      tile_sizes => W_mac_pntr_cntInst_run_rg_tile_sizes,
      pntr_in => W_mac_pntr_cntInst_run_rg_pntr_in,
      pntr_out => W_mac_pntr_cntInst_run_rg_pntr_out,
      irrel_at_max_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_26,
      irrel_at_zero_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_27,
      all_at_max_1_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_28,
      counter_in => W_mac_pntr_cntInst_run_rg_counter_in,
      counter_out => W_mac_pntr_cntInst_run_rg_counter_out,
      tile_bound_in => W_mac_pntr_cntInst_run_rg_tile_bound_in,
      tile_bound_out => W_mac_pntr_cntInst_run_rg_tile_bound_out
    );
  W_mac_pntr_cntInst_run_rg_loop_bound <= W_instr_in_crt_lpi_1_dfm_1_mx0(24 DOWNTO
      0);
  W_mac_pntr_cntInst_run_rg_tile_sizes <= W_instr_in_crt_lpi_1_dfm_1_mx0(49 DOWNTO
      25);
  W_mac_pntr_cntInst_run_rg_pntr_in <= W_mac_pntr_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_19
      <= W_mac_pntr_cntInst_run_rg_pntr_out;
  W_mac_pntr_cntInst_run_rg_counter_in <= W_mac_counter_4_sva & W_mac_counter_3_sva
      & W_mac_counter_2_sva & W_mac_counter_1_sva & W_mac_counter_0_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29
      <= W_mac_pntr_cntInst_run_rg_counter_out;
  W_mac_pntr_cntInst_run_rg_tile_bound_in <= W_mac_tile_bound_4_lpi_1_dfm_mx0 & W_mac_tile_bound_3_lpi_1_dfm_mx0
      & W_mac_tile_bound_2_lpi_1_dfm_mx0 & W_mac_tile_bound_1_lpi_1_dfm_mx0 & W_mac_tile_bound_0_lpi_1_dfm_mx0;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30
      <= W_mac_pntr_cntInst_run_rg_tile_bound_out;

  I_mac_pntr_cntInst_run_rg : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000153
    PORT MAP(
      loop_bound => I_mac_pntr_cntInst_run_rg_loop_bound,
      tile_sizes => I_mac_pntr_cntInst_run_rg_tile_sizes,
      pntr_in => I_mac_pntr_cntInst_run_rg_pntr_in,
      pntr_out => I_mac_pntr_cntInst_run_rg_pntr_out,
      irrel_at_max_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_31,
      irrel_at_zero_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_32,
      all_at_max_1_out => libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_33,
      counter_in => I_mac_pntr_cntInst_run_rg_counter_in,
      counter_out => I_mac_pntr_cntInst_run_rg_counter_out,
      tile_bound_in => I_mac_pntr_cntInst_run_rg_tile_bound_in,
      tile_bound_out => I_mac_pntr_cntInst_run_rg_tile_bound_out
    );
  I_mac_pntr_cntInst_run_rg_loop_bound <= I_instr_in_crt_lpi_1_dfm_1_mx0(24 DOWNTO
      0);
  I_mac_pntr_cntInst_run_rg_tile_sizes <= I_instr_in_crt_lpi_1_dfm_1_mx0(49 DOWNTO
      25);
  I_mac_pntr_cntInst_run_rg_pntr_in <= I_mac_pntr_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_20
      <= I_mac_pntr_cntInst_run_rg_pntr_out;
  I_mac_pntr_cntInst_run_rg_counter_in <= I_mac_counter_4_sva & I_mac_counter_3_sva
      & I_mac_counter_2_sva & I_mac_counter_1_sva & I_mac_counter_0_sva;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34
      <= I_mac_pntr_cntInst_run_rg_counter_out;
  I_mac_pntr_cntInst_run_rg_tile_bound_in <= I_mac_tile_bound_4_lpi_1_dfm_mx0 & I_mac_tile_bound_3_lpi_1_dfm_mx0
      & I_mac_tile_bound_2_lpi_1_dfm_mx0 & I_mac_tile_bound_1_lpi_1_dfm_mx0 & I_mac_tile_bound_0_lpi_1_dfm_mx0;
  libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35
      <= I_mac_pntr_cntInst_run_rg_tile_bound_out;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000005
    PORT MAP(
      clk => clk,
      rst => rst,
      O_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsc_dat,
      O_wr_data_rsc_vld => O_wr_data_rsc_vld,
      O_wr_data_rsc_rdy => O_wr_data_rsc_rdy,
      run_wen => run_wen,
      O_wr_data_rsci_oswt => reg_O_wr_data_rsci_irdy_run_psct_cse,
      run_wten => run_wten,
      O_wr_data_rsci_ivld_mxwt => O_wr_data_rsci_ivld_mxwt,
      O_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsc_dat
      <= O_wr_data_rsc_dat;
  O_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_wr_data_rsci_inst_O_wr_data_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000006
    PORT MAP(
      clk => clk,
      rst => rst,
      O_rd_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsc_dat,
      O_rd_data_rsc_vld => O_rd_data_rsc_vld,
      O_rd_data_rsc_rdy => O_rd_data_rsc_rdy,
      run_wen => run_wen,
      run_wten => run_wten,
      O_rd_data_rsci_oswt => reg_O_rd_data_rsci_ivld_run_psct_cse,
      O_rd_data_rsci_irdy_mxwt => O_rd_data_rsci_irdy_mxwt,
      O_rd_data_rsci_idat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsci_idat
    );
  O_rd_data_rsc_dat <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_rd_data_rsci_inst_O_rd_data_rsci_idat
      <= O_rd_data_rsci_idat;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000007
    PORT MAP(
      clk => clk,
      rst => rst,
      I_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsc_dat,
      I_wr_data_rsc_vld => I_wr_data_rsc_vld,
      I_wr_data_rsc_rdy => I_wr_data_rsc_rdy,
      run_wen => run_wen,
      run_wten => run_wten,
      I_wr_data_rsci_oswt => reg_I_wr_data_rsci_irdy_run_psct_cse,
      I_wr_data_rsci_ivld_mxwt => I_wr_data_rsci_ivld_mxwt,
      I_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsc_dat
      <= I_wr_data_rsc_dat;
  I_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_wr_data_rsci_inst_I_wr_data_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000008
    PORT MAP(
      clk => clk,
      rst => rst,
      W_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsc_dat,
      W_wr_data_rsc_vld => W_wr_data_rsc_vld,
      W_wr_data_rsc_rdy => W_wr_data_rsc_rdy,
      run_wen => run_wen,
      run_wten => run_wten,
      W_wr_data_rsci_oswt => reg_W_wr_data_rsci_irdy_run_psct_cse,
      W_wr_data_rsci_ivld_mxwt => W_wr_data_rsci_ivld_mxwt,
      W_wr_data_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsc_dat
      <= W_wr_data_rsc_dat;
  W_wr_data_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_wr_data_rsci_inst_W_wr_data_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_wr_data_zero_guard_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000009
    PORT MAP(
      clk => clk,
      rst => rst,
      wr_data_zero_guard_rsc_dat => wr_data_zero_guard_rsc_dat,
      wr_data_zero_guard_rsc_vld => wr_data_zero_guard_rsc_vld,
      wr_data_zero_guard_rsc_rdy => wr_data_zero_guard_rsc_rdy,
      run_wen => run_wen,
      run_wten => run_wten,
      wr_data_zero_guard_rsci_oswt => reg_wr_data_zero_guard_rsci_oswt_cse,
      wr_data_zero_guard_rsci_ivld_mxwt => wr_data_zero_guard_rsci_ivld_mxwt,
      wr_data_zero_guard_rsci_idat_mxwt => wr_data_zero_guard_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000010
    PORT MAP(
      clk => clk,
      rst => rst,
      O_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsc_dat,
      O_instr_in_rsc_vld => O_instr_in_rsc_vld,
      O_instr_in_rsc_rdy => O_instr_in_rsc_rdy,
      run_wen => run_wen,
      O_instr_in_rsci_oswt => reg_W_instr_in_rsci_oswt_cse_1,
      O_instr_in_rsci_wen_comp => O_instr_in_rsci_wen_comp,
      O_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsc_dat
      <= O_instr_in_rsc_dat;
  O_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_O_instr_in_rsci_inst_O_instr_in_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000011
    PORT MAP(
      clk => clk,
      rst => rst,
      I_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsc_dat,
      I_instr_in_rsc_vld => I_instr_in_rsc_vld,
      I_instr_in_rsc_rdy => I_instr_in_rsc_rdy,
      run_wen => run_wen,
      I_instr_in_rsci_oswt => reg_W_instr_in_rsci_oswt_cse_1,
      I_instr_in_rsci_wen_comp => I_instr_in_rsci_wen_comp,
      I_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsc_dat
      <= I_instr_in_rsc_dat;
  I_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_I_instr_in_rsci_inst_I_instr_in_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000012
    PORT MAP(
      clk => clk,
      rst => rst,
      W_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsc_dat,
      W_instr_in_rsc_vld => W_instr_in_rsc_vld,
      W_instr_in_rsc_rdy => W_instr_in_rsc_rdy,
      run_wen => run_wen,
      W_instr_in_rsci_oswt => reg_W_instr_in_rsci_oswt_cse_1,
      W_instr_in_rsci_wen_comp => W_instr_in_rsci_wen_comp,
      W_instr_in_rsci_idat_mxwt => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsci_idat_mxwt
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsc_dat
      <= W_instr_in_rsc_dat;
  W_instr_in_rsci_idat_mxwt <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_W_instr_in_rsci_inst_W_instr_in_rsci_idat_mxwt;

  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_staller_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000013
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      run_wten => run_wten,
      O_instr_in_rsci_wen_comp => O_instr_in_rsci_wen_comp,
      I_instr_in_rsci_wen_comp => I_instr_in_rsci_wen_comp,
      W_instr_in_rsci_wen_comp => W_instr_in_rsci_wen_comp
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_run_fsm_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000014
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      fsm_output => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_run_fsm_inst_fsm_output
    );
  fsm_output <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_run_fsm_inst_fsm_output;

  or_557_cse <= and_295_cse OR I_data_vld_sva_dfm_1_1;
  flags_wr_zero_guard_and_cse <= run_wen AND (NOT (fsm_output(0)));
  operator_2_false_5_operator_2_false_5_operator_2_false_5_or_cse <= CONV_SL_1_1(mux1h_1_tmp/=STD_LOGIC_VECTOR'("00"));
  W_mac_pntr_and_cse <= run_wen AND (NOT(mux_tmp_76 OR (fsm_output(0))));
  and_302_nl <= if_5_and_svs_1 AND skid_buf_top_push_nor_psp;
  mux_428_nl <= MUX_s_1_2_2(mux_tmp_94, and_302_nl, if_5_else_or_tmp_2);
  or_359_cse <= (NOT mux_428_nl) OR or_dcpl_226;
  and_301_nl <= if_5_and_svs_1 AND skid_buf_top_push_and_psp;
  mux_430_nl <= MUX_s_1_2_2(mux_tmp_96, and_301_nl, if_5_else_or_tmp_2);
  or_363_cse <= (NOT mux_430_nl) OR or_dcpl_226;
  and_300_nl <= if_5_and_svs_1 AND skid_buf_top_push_and_1_psp;
  mux_432_nl <= MUX_s_1_2_2(mux_tmp_98, and_300_nl, if_5_else_or_tmp_2);
  or_367_cse <= (NOT mux_432_nl) OR or_dcpl_226;
  skid_buf_top_rd_ptr_and_cse <= or_dcpl AND O_rd_data_rsci_irdy_mxwt AND and_dcpl_34
      AND run_wen AND or_570_cse;
  and_541_cse <= W_wr_data_rsci_ivld_mxwt AND if_10_if_equal_1_tmp;
  and_370_cse <= ((NOT(operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      OR O_rd_data_rsci_irdy_mxwt)) OR if_5_and_svs_1) AND and_dcpl_34 AND run_wen;
  nor_303_cse <= NOT(and_541_cse OR W_data_vld_sva_dfm_1_1 OR oif_2_unequal_tmp);
  and_526_cse <= O_mac_irrel_at_max_sva AND flags_top_1_1_sva;
  or_620_cse <= and_541_cse OR W_data_vld_sva_dfm_1_1 OR oif_2_unequal_tmp;
  mux_459_nl <= MUX_s_1_2_2(or_400_cse, or_401_cse, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_457_nl <= MUX_s_1_2_2(or_399_cse, or_401_cse, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_456_nl <= MUX_s_1_2_2(or_400_cse, or_399_cse, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, mux_456_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_460_cse <= MUX_s_1_2_2(mux_459_nl, mux_458_nl, nor_tmp_39);
  nor_108_cse <= NOT(land_lpi_1_dfm_1 OR (NOT if_6_else_if_equal_tmp));
  W_mac_irrel_at_maxBuf_and_cse <= run_wen AND (NOT((NOT reg_W_instr_in_rsci_oswt_cse_1)
      AND mux_tmp_76));
  nand_129_cse <= NOT(O_mac_irrel_at_max_sva AND flags_top_1_1_sva);
  and_393_nl <= oif_2_unequal_tmp AND or_1_cse AND oif_1_unequal_tmp;
  and_392_nl <= W_wr_data_rsci_ivld_mxwt AND if_10_if_equal_1_tmp AND mux_343_cse;
  mux_617_nl <= MUX_s_1_2_2(and_392_nl, mux_343_cse, or_tmp_300);
  mux_618_nl <= MUX_s_1_2_2(and_393_nl, mux_617_nl, main_stage_0_2);
  and_395_cse <= ((mux_618_nl AND nand_129_cse) OR reg_W_instr_in_rsci_oswt_cse_1)
      AND run_wen;
  skid_buf_top_cnt_and_1_cse <= run_wen AND and_dcpl;
  mux_719_nl <= MUX_s_1_2_2(not_tmp_193, mux_642_itm, or_620_cse);
  mux_645_nl <= MUX_s_1_2_2(not_tmp_193, mux_719_nl, mux_124_itm_1);
  mux_720_nl <= MUX_s_1_2_2(not_tmp_193, mux_642_itm, or_620_cse);
  mux_644_nl <= MUX_s_1_2_2(not_tmp_193, mux_720_nl, O_wr_data_rsci_ivld_mxwt);
  mux_646_nl <= MUX_s_1_2_2(mux_645_nl, mux_644_nl, land_9_lpi_1_dfm_1_1);
  mux_643_nl <= MUX_s_1_2_2(not_tmp_193, mux_642_itm, or_620_cse);
  mux_647_nl <= MUX_s_1_2_2(mux_646_nl, mux_643_nl, or_1_cse);
  and_426_cse <= mux_647_nl AND run_wen AND main_stage_0_2;
  and_544_cse <= or_1_cse AND oif_1_unequal_tmp;
  and_432_cse <= wr_data_zero_guard_rsci_ivld_mxwt AND (NOT flags_wr_zero_guard_sva);
  mux_554_cse <= MUX_s_1_2_2(or_18_cse, or_tmp_2, main_stage_0_2);
  and_172_nl <= or_558_cse AND mux_tmp_226;
  mux_560_nl <= MUX_s_1_2_2(and_172_nl, mux_tmp_226, oif_2_unequal_tmp);
  and_169_nl <= or_558_cse AND mux_tmp_224;
  mux_555_nl <= MUX_s_1_2_2(and_tmp_93, and_tmp, I_data_vld_sva_dfm_1_1);
  mux_556_nl <= MUX_s_1_2_2(mux_555_nl, mux_554_cse, oif_1_unequal_tmp);
  mux_558_nl <= MUX_s_1_2_2(and_169_nl, mux_556_nl, oif_2_unequal_tmp);
  mux_561_nl <= MUX_s_1_2_2(mux_560_nl, mux_558_nl, or_1_cse);
  skid_buf_top_push_and_2_cse <= run_wen AND (NOT((NOT mux_561_nl) OR or_dcpl_11
      OR (fsm_output(0))));
  or_558_cse <= and_541_cse OR W_data_vld_sva_dfm_1_1;
  and_295_cse <= if_9_if_equal_1_tmp AND I_wr_data_rsci_ivld_mxwt;
  else_3_land_lpi_1_dfm_mx0w0 <= land_lpi_1_dfm_1 AND land_2_lpi_1_dfm_2;
  mux_420_cse <= MUX_s_1_2_2(mux_124_itm_1, O_wr_data_rsci_ivld_mxwt, land_9_lpi_1_dfm_1_1);
  O_write_data_data_sva_mx0 <= MUX_v_16_2_2(O_write_data_data_sva, O_wr_data_rsci_idat_mxwt,
      land_9_lpi_1_dfm_1_1);
  or_570_cse <= (O_rd_data_rsci_irdy_mxwt AND operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      AND and_16_m1c_1) OR (if_5_if_nbw_stat_sva_mx1 AND and_17_m1c_1);
  skid_buf_top_pop_skid_buf_top_pop_and_4_itm <= (NOT skid_buf_top_rd_ptr_sva_0)
      AND skid_buf_top_pop_1_skid_buf_top_pop_1_nand_seb_1;
  mux_717_nl <= MUX_s_1_2_2(skid_buf_top_rd_ptr_sva_0, skid_buf_top_pop_skid_buf_top_pop_and_4_itm,
      or_570_cse);
  skid_buf_top_rd_ptr_sva_0_mx1 <= MUX_s_1_2_2(skid_buf_top_rd_ptr_sva_0, mux_717_nl,
      main_stage_0_2);
  skid_buf_top_pop_skid_buf_top_pop_and_2_itm <= skid_buf_top_pop_1_xor_psp_1 AND
      skid_buf_top_pop_1_skid_buf_top_pop_1_nand_seb_1;
  mux_718_nl <= MUX_s_1_2_2(skid_buf_top_rd_ptr_sva_1, skid_buf_top_pop_skid_buf_top_pop_and_2_itm,
      or_570_cse);
  skid_buf_top_rd_ptr_sva_1_mx1 <= MUX_s_1_2_2(skid_buf_top_rd_ptr_sva_1, mux_718_nl,
      main_stage_0_2);
  skid_buf_top_cnt_sva_mx1 <= MUX_v_2_2_2(skid_buf_top_cnt_sva, mux1h_7_tmp, main_stage_0_2);
  skid_buf_top_push_1_skid_buf_top_push_1_and_nl <= (NOT skid_buf_top_wr_ptr_sva_0)
      AND skid_buf_top_push_1_skid_buf_top_push_1_nand_seb_1;
  skid_buf_top_wr_ptr_sva_0_mx0w0 <= MUX1HOT_s_1_3_2(skid_buf_top_wr_ptr_sva_0, skid_buf_top_push_1_skid_buf_top_push_1_and_nl,
      skid_buf_top_push_nor_psp, STD_LOGIC_VECTOR'( nand_11_ssc_1 & and_47_ssc_1
      & and_17_m1c_1));
  skid_buf_top_wr_ptr_sva_0_mx1 <= MUX_s_1_2_2(skid_buf_top_wr_ptr_sva_0, skid_buf_top_wr_ptr_sva_0_mx0w0,
      main_stage_0_2);
  skid_buf_top_push_1_skid_buf_top_push_1_and_1_nl <= skid_buf_top_push_1_xor_psp_1
      AND skid_buf_top_push_1_skid_buf_top_push_1_nand_seb_1;
  skid_buf_top_wr_ptr_sva_1_mx0w0 <= MUX1HOT_s_1_3_2(skid_buf_top_wr_ptr_sva_1, skid_buf_top_push_1_skid_buf_top_push_1_and_1_nl,
      skid_buf_top_wr_ptr_sva_dfm_1_1, STD_LOGIC_VECTOR'( nand_11_ssc_1 & and_47_ssc_1
      & and_17_m1c_1));
  skid_buf_top_wr_ptr_sva_1_mx1 <= MUX_s_1_2_2(skid_buf_top_wr_ptr_sva_1, skid_buf_top_wr_ptr_sva_1_mx0w0,
      main_stage_0_2);
  O_instr_in_crt_lpi_1_dfm_mx0 <= MUX_v_50_2_2(O_instr_in_crt_lpi_1_dfm, O_instr_in_rsci_idat_mxwt,
      reg_W_instr_in_rsci_oswt_cse_1);
  O_write_flag_sva_mx0 <= mux_420_cse AND main_stage_0_2;
  W_data_vld_sva_mx0 <= ((if_10_if_equal_1_tmp AND W_write_flag_sva_mx0) OR W_data_vld_sva_dfm_1_1)
      AND main_stage_0_2;
  I_data_vld_sva_mx0 <= ((if_9_if_equal_1_tmp AND I_write_flag_sva_mx0) OR I_data_vld_sva_dfm_1_1)
      AND main_stage_0_2;
  else_8_land_lpi_1_dfm_mx0w0 <= land_8_lpi_1_dfm_1 AND skid_buf_wr_zero_guard_peek_slc_skid_buf_wr_zero_guard_regs_skid_buf_wr_zero_guard_rd_ptr_1_0_cse_sva_mx0;
  else_8_land_lpi_1_dfm_mx1 <= MUX_s_1_2_2(else_8_land_lpi_1_dfm_mx0w0, else_8_land_lpi_1_dfm,
      and_dcpl_19);
  W_write_flag_sva_mx0 <= MUX_s_1_2_2(W_wr_data_rsci_ivld_mxwt, W_write_flag_sva,
      W_data_vld_sva_dfm_1_1);
  I_write_flag_sva_mx0 <= MUX_s_1_2_2(I_wr_data_rsci_ivld_mxwt, I_write_flag_sva,
      I_data_vld_sva_dfm_1_1);
  land_9_lpi_1_dfm_1 <= land_8_lpi_1_dfm_1 AND (NOT skid_buf_wr_zero_guard_peek_slc_skid_buf_wr_zero_guard_regs_skid_buf_wr_zero_guard_rd_ptr_1_0_cse_sva_mx0);
  skid_buf_top_pop_1_skid_buf_top_pop_1_nand_seb_1 <= NOT(skid_buf_top_pop_1_xor_psp_1
      AND (NOT skid_buf_top_rd_ptr_sva_0));
  skid_buf_top_pop_1_xor_psp_1 <= skid_buf_top_rd_ptr_sva_0 XOR skid_buf_top_rd_ptr_sva_1;
  nand_85_nl <= NOT(or_svs_1 AND if_5_and_svs_1);
  if_5_if_nbw_stat_sva_mx1 <= MUX_s_1_2_2(O_rd_data_rsci_irdy_mxwt, if_5_if_nbw_stat_sva,
      nand_85_nl);
  skid_buf_top_push_1_skid_buf_top_push_1_nand_seb_1 <= NOT(skid_buf_top_push_1_xor_psp_1
      AND (NOT skid_buf_top_wr_ptr_sva_0));
  skid_buf_top_push_1_xor_psp_1 <= skid_buf_top_wr_ptr_sva_0 XOR skid_buf_top_wr_ptr_sva_1;
  nand_73_cse <= NOT(mux_420_cse AND main_stage_0_2);
  UPDATE_PSUM_mux_9_nl <= MUX_v_16_32_2(O_mem_0_sva, O_mem_1_sva, O_mem_2_sva, O_mem_3_sva,
      O_mem_4_sva, O_mem_5_sva, O_mem_6_sva, O_mem_7_sva, O_mem_8_sva, O_mem_9_sva,
      O_mem_10_sva, O_mem_11_sva, O_mem_12_sva, O_mem_13_sva, O_mem_14_sva, O_mem_15_sva,
      O_mem_16_sva, O_mem_17_sva, O_mem_18_sva, O_mem_19_sva, O_mem_20_sva, O_mem_21_sva,
      O_mem_22_sva, O_mem_23_sva, O_mem_24_sva, O_mem_25_sva, O_mem_26_sva, O_mem_27_sva,
      O_mem_28_sva, O_mem_29_sva, O_mem_30_sva, O_mem_31_sva, O_mac_pntr_sva);
  and_550_nl <= mux_420_cse AND main_stage_0_2 AND (fsm_output(1));
  UPDATE_PSUM_mux_8_nl <= MUX_v_16_2_2(UPDATE_PSUM_mux_9_nl, O_write_data_data_sva_mx0,
      and_550_nl);
  UPDATE_PSUM_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_2) + UNSIGNED(UPDATE_PSUM_mux_8_nl),
      16));
  and_125_nl <= nand_73_cse AND (NOT(data_zg_sva AND aif_equal_tmp));
  else_3_aelse_mux_1_nl <= MUX_s_1_2_2(else_3_land_lpi_1_dfm_mx0w0, else_3_land_lpi_1_dfm,
      and_125_nl);
  and_3_nl <= else_3_aelse_mux_1_nl AND (land_lpi_1_dfm_1 OR (NOT land_2_lpi_1_dfm_2));
  mac_data_data_sva_dfm_3 <= MUX_v_16_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(UPDATE_PSUM_acc_nl),
      16)), z_out_2, and_3_nl);
  operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1 <= CONV_SL_1_1(skid_buf_top_cnt_sva_mx1/=STD_LOGIC_VECTOR'("00"));
  skid_buf_top_push_and_psp_1 <= skid_buf_top_wr_ptr_sva_0_mx1 AND (NOT skid_buf_top_wr_ptr_sva_1_mx1);
  I_instr_in_crt_lpi_1_dfm_1_mx0 <= MUX_v_50_2_2(I_instr_in_crt_lpi_1_dfm_1, I_instr_in_rsci_idat_mxwt,
      reg_W_instr_in_rsci_oswt_cse_1);
  W_instr_in_crt_lpi_1_dfm_1_mx0 <= MUX_v_50_2_2(W_instr_in_crt_lpi_1_dfm_1, W_instr_in_rsci_idat_mxwt,
      reg_W_instr_in_rsci_oswt_cse_1);
  or_1_cse <= oif_unequal_tmp OR O_data_vld_sva;
  aelse_2_aelse_2_and_2_nl <= lor_2_lpi_1_dfm_1 AND lor_1_lpi_1_dfm_1 AND or_1_cse;
  aif_2_land_1_lpi_1_dfm_mx0 <= MUX_s_1_2_2(aelse_2_aelse_2_and_2_nl, aif_2_land_1_lpi_1_dfm,
      and_tmp_56);
  aelse_3_aelse_3_and_nl <= lor_1_lpi_1_dfm_1 AND O_write_flag_sva_mx0;
  aif_3_land_lpi_1_dfm_mx0 <= MUX_s_1_2_2(aelse_3_aelse_3_and_nl, aif_3_land_lpi_1_dfm,
      and_tmp_56);
  mux_124_cse <= MUX_v_2_2_2(skid_buf_wr_zero_guard_cnt_sva_5, skid_buf_wr_zero_guard_cnt_sva,
      or_tmp_162);
  skid_buf_wr_zero_guard_pop_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mux_124_cse)
      + UNSIGNED'( "11"), 2));
  nor_nl <= NOT(else_8_land_lpi_1_dfm_mx1 OR land_9_lpi_1_dfm_1);
  mux1h_1_tmp <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(skid_buf_wr_zero_guard_pop_acc_nl),
      2)), mux_124_cse, nor_nl);
  skid_buf_top_push_nor_psp_mx0w0 <= NOT(skid_buf_top_wr_ptr_sva_0_mx1 OR skid_buf_top_wr_ptr_sva_1_mx1);
  skid_buf_top_push_and_1_psp_mx0w0 <= (NOT skid_buf_top_wr_ptr_sva_0_mx1) AND skid_buf_top_wr_ptr_sva_1_mx1;
  if_6_if_3_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(W_irrel_cnt_sva_4_1
      & W_irrel_cnt_sva_0) + UNSIGNED'( "00001"), 5));
  mux_562_nl <= MUX_s_1_2_2(W_mac_irrel_at_maxBuf_sva, if_for_if_for_and_28_tmp,
      reg_W_instr_in_rsci_oswt_cse_1);
  W_irrel_cnt_sva_dfm_mx0 <= MUX_v_5_2_2((W_irrel_cnt_sva_4_1 & W_irrel_cnt_sva_0),
      if_6_if_3_acc_tmp, mux_562_nl);
  if_6_if_1_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(I_irrel_cnt_sva_4_1
      & I_irrel_cnt_sva_0) + UNSIGNED'( "00001"), 5));
  mux_563_nl <= MUX_s_1_2_2(I_mac_irrel_at_maxBuf_sva, if_for_if_for_and_27_tmp,
      reg_W_instr_in_rsci_oswt_cse_1);
  I_irrel_cnt_sva_dfm_mx0 <= MUX_v_5_2_2((I_irrel_cnt_sva_4_1 & I_irrel_cnt_sva_0),
      if_6_if_1_acc_tmp, mux_563_nl);
  O_mac_tile_bound_4_lpi_1_dfm_mx0 <= MUX_v_5_2_2(O_mac_tile_bound_4_lpi_1, (O_instr_in_rsci_idat_mxwt(49
      DOWNTO 45)), reg_W_instr_in_rsci_oswt_cse_1);
  O_mac_tile_bound_3_lpi_1_dfm_mx0 <= MUX_v_5_2_2(O_mac_tile_bound_3_lpi_1, (O_instr_in_rsci_idat_mxwt(44
      DOWNTO 40)), reg_W_instr_in_rsci_oswt_cse_1);
  O_mac_tile_bound_2_lpi_1_dfm_mx0 <= MUX_v_5_2_2(O_mac_tile_bound_2_lpi_1, (O_instr_in_rsci_idat_mxwt(39
      DOWNTO 35)), reg_W_instr_in_rsci_oswt_cse_1);
  O_mac_tile_bound_1_lpi_1_dfm_mx0 <= MUX_v_5_2_2(O_mac_tile_bound_1_lpi_1, (O_instr_in_rsci_idat_mxwt(34
      DOWNTO 30)), reg_W_instr_in_rsci_oswt_cse_1);
  O_mac_tile_bound_0_lpi_1_dfm_mx0 <= MUX_v_5_2_2(O_mac_tile_bound_0_lpi_1, (O_instr_in_rsci_idat_mxwt(29
      DOWNTO 25)), reg_W_instr_in_rsci_oswt_cse_1);
  land_lpi_1_dfm_1 <= aif_equal_tmp AND data_zg_sva;
  O_vld_zg_pntr_sva_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(O_vld_zg_pntr_sva)
      + UNSIGNED'( "00001"), 5));
  if_if_mux_1_nl <= MUX_v_5_2_2((O_instr_in_crt_lpi_1_dfm(49 DOWNTO 45)), (O_instr_in_rsci_idat_mxwt(49
      DOWNTO 45)), reg_W_instr_in_rsci_oswt_cse_1);
  if_6_else_if_equal_tmp <= CONV_SL_1_1(UNSIGNED(O_vld_zg_pntr_sva_4) = UNSIGNED(if_if_mux_1_nl));
  if_6_if_if_not_5_nl <= NOT if_6_else_if_equal_tmp;
  if_6_if_if_6_if_and_1_itm <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), O_vld_zg_pntr_sva_4,
      if_6_if_if_not_5_nl);
  if_6_or_itm <= O_write_flag_sva_mx0 OR land_lpi_1_dfm_1;
  if_6_if_6_mux1h_tmp <= MUX_v_5_2_2(O_vld_zg_pntr_sva, if_6_if_if_6_if_and_1_itm,
      if_6_or_itm);
  land_2_lpi_1_dfm_2 <= (NOT O_write_flag_sva_mx0) AND aif_2_land_1_lpi_1_dfm_mx0
      AND lor_3_lpi_1_dfm_1;
  lor_4_lpi_1_dfm_1 <= (lor_2_lpi_1_dfm_1 AND aif_3_land_lpi_1_dfm_mx0 AND lor_3_lpi_1_dfm_1)
      OR land_2_lpi_1_dfm_2;
  skid_buf_top_peek_nor_m1c_1 <= NOT(skid_buf_top_rd_ptr_sva_1_mx1 OR skid_buf_top_rd_ptr_sva_0_mx1);
  skid_buf_top_peek_and_m1c_2 <= skid_buf_top_rd_ptr_sva_0_mx1 AND (NOT skid_buf_top_rd_ptr_sva_1_mx1);
  skid_buf_top_peek_and_m1c_3 <= skid_buf_top_rd_ptr_sva_1_mx1 AND (NOT skid_buf_top_rd_ptr_sva_0_mx1);
  land_5_lpi_1_dfm_1 <= lor_4_lpi_1_dfm_1 AND O_mac_irrel_at_max_sva_dfm_mx0;
  if_6_else_if_if_6_else_if_or_nl <= O_data_vld_sva OR if_6_else_if_equal_tmp;
  if_6_else_mux_2_nl <= MUX_s_1_2_2(O_data_vld_sva, if_6_else_if_if_6_else_if_or_nl,
      O_write_flag_sva_mx0);
  if_6_mux_4_nl <= MUX_s_1_2_2(if_6_else_mux_2_nl, O_data_vld_sva, land_lpi_1_dfm_1);
  O_data_vld_sva_dfm_4_mx0w0 <= if_6_mux_4_nl AND (CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000"))
      OR (NOT(if_6_aif_equal_tmp AND libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)));
  O_data_vld_sva_dfm_4_mx0 <= MUX_s_1_2_2(O_data_vld_sva_dfm_4_mx0w0, O_data_vld_sva,
      mux_tmp_76);
  if_6_aif_equal_tmp <= CONV_SL_1_1(UNSIGNED(libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_18)
      = UNSIGNED(if_6_if_6_mux1h_tmp));
  if_6_unequal_tmp_2 <= NOT(CONV_SL_1_1(W_irrel_cnt_sva_dfm_mx0=STD_LOGIC_VECTOR'("00001")));
  if_6_unequal_tmp_3 <= NOT(CONV_SL_1_1(I_irrel_cnt_sva_dfm_mx0=STD_LOGIC_VECTOR'("00001")));
  land_8_lpi_1_dfm_1 <= (CONV_SL_1_1(mux_124_cse/=STD_LOGIC_VECTOR'("00"))) AND aif_7_equal_tmp
      AND (NOT O_data_vld_sva_dfm_4_mx0);
  if_7_mux_3_nl <= MUX_s_1_2_2(wr_data_zero_guard_rsci_idat_mxwt, skid_buf_wr_zero_guard_regs_0_sva_dfm_1,
      or_dcpl_248);
  if_7_mux_1_nl <= MUX_s_1_2_2(wr_data_zero_guard_rsci_idat_mxwt, skid_buf_wr_zero_guard_regs_1_sva_dfm_1,
      or_dcpl_246);
  skid_buf_wr_zero_guard_peek_slc_skid_buf_wr_zero_guard_regs_skid_buf_wr_zero_guard_rd_ptr_1_0_cse_sva_mx0
      <= MUX_s_1_2_2(if_7_mux_3_nl, if_7_mux_1_nl, skid_buf_wr_zero_guard_rd_ptr_sva);
  O_mac_pntr_mux_1_nl <= MUX_v_5_2_2(libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_18,
      O_mac_pntr_sva, and_dcpl_28);
  O_vld_zg_pntr_and_nl <= if_6_or_itm AND (NOT and_dcpl_28);
  O_vld_zg_pntr_mux_1_nl <= MUX_v_5_2_2(O_vld_zg_pntr_sva, if_6_if_if_6_if_and_1_itm,
      O_vld_zg_pntr_and_nl);
  aif_7_equal_tmp <= CONV_SL_1_1(UNSIGNED(O_mac_pntr_mux_1_nl) = UNSIGNED(O_vld_zg_pntr_mux_1_nl));
  if_for_if_for_and_28_tmp <= CONV_SL_1_1(W_instr_in_rsci_idat_mxwt(24 DOWNTO 0)=STD_LOGIC_VECTOR'("0000100001000010000100001"));
  if_for_if_for_and_27_tmp <= CONV_SL_1_1(I_instr_in_rsci_idat_mxwt(24 DOWNTO 0)=STD_LOGIC_VECTOR'("0000100001000010000100001"));
  asn_I_wr_pntr_sva_nand_nl <= NOT(I_wr_data_rsci_ivld_mxwt AND main_stage_0_2);
  mux_5_nl <= MUX_v_5_2_2(I_wr_pntr_sva_dfm_1, I_wr_pntr_sva, asn_I_wr_pntr_sva_nand_nl);
  oif_1_unequal_tmp <= CONV_SL_1_1(UNSIGNED(I_mac_pntr_sva) /= UNSIGNED(mux_5_nl));
  nand_91_nl <= NOT(W_wr_data_rsci_ivld_mxwt AND main_stage_0_2);
  mux_3_nl <= MUX_v_5_2_2(W_wr_pntr_sva_dfm_1, W_wr_pntr_sva, nand_91_nl);
  oif_2_unequal_tmp <= CONV_SL_1_1(UNSIGNED(W_mac_pntr_sva) /= UNSIGNED(mux_3_nl));
  if_5_and_1_m1c_1 <= operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      AND (NOT if_5_and_svs_1);
  if_5_if_5_nor_m1c_1 <= NOT(operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      OR if_5_and_svs_1);
  and_17_m1c_1 <= if_5_and_svs_1 AND or_svs_1;
  and_16_m1c_1 <= (NOT if_5_and_svs_1) AND or_svs_1;
  nand_11_ssc_1 <= NOT(or_svs_1 AND (NOT(if_5_else_or_tmp_2 AND and_16_m1c_1)));
  and_47_ssc_1 <= (NOT if_5_else_or_tmp_2) AND and_16_m1c_1;
  if_5_else_or_tmp_2 <= O_rd_data_rsci_irdy_mxwt OR operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1;
  I_wr_pntr_sva_dfm_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), if_9_if_ac_int_cctor_sva_1,
      CONV_SL_1_1(UNSIGNED(if_9_if_ac_int_cctor_sva_1) /= UNSIGNED(I_instr_in_crt_lpi_1_dfm_1(49
      DOWNTO 45))));
  if_9_if_equal_1_tmp <= CONV_SL_1_1(UNSIGNED(I_wr_pntr_sva_dfm_1) = UNSIGNED(I_vld_pntr_sva_dfm_1_1));
  if_9_if_ac_int_cctor_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(I_wr_pntr_sva)
      + SIGNED'( "00001"), 5));
  W_wr_pntr_sva_dfm_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), if_10_if_ac_int_cctor_sva_1,
      CONV_SL_1_1(UNSIGNED(if_10_if_ac_int_cctor_sva_1) /= UNSIGNED(W_instr_in_crt_lpi_1_dfm_1(49
      DOWNTO 45))));
  if_10_if_equal_1_tmp <= CONV_SL_1_1(UNSIGNED(W_wr_pntr_sva_dfm_1) = UNSIGNED(W_vld_pntr_sva_dfm_1_1));
  if_10_if_ac_int_cctor_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(W_wr_pntr_sva)
      + SIGNED'( "00001"), 5));
  skid_buf_top_push_1_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(skid_buf_top_cnt_sva)
      + UNSIGNED'( "01"), 2));
  nand_nl <= NOT(or_svs_1 AND (NOT(((NOT O_rd_data_rsci_irdy_mxwt) AND if_5_and_1_m1c_1)
      OR (O_rd_data_rsci_irdy_mxwt AND if_5_if_5_nor_m1c_1))));
  or_590_nl <= (O_rd_data_rsci_irdy_mxwt AND if_5_and_1_m1c_1 AND or_svs_1) OR (if_5_if_nbw_stat_sva_mx1
      AND if_5_and_svs_1 AND or_svs_1);
  if_5_and_5_nl <= (NOT O_rd_data_rsci_irdy_mxwt) AND if_5_if_5_nor_m1c_1 AND or_svs_1;
  if_5_and_4_nl <= (NOT if_5_if_nbw_stat_sva_mx1) AND if_5_and_svs_1 AND or_svs_1;
  mux1h_7_tmp <= MUX1HOT_v_2_4_2(skid_buf_top_cnt_sva, z_out_3, skid_buf_top_push_1_acc_1_tmp,
      skid_buf_top_cnt_sva_1_1, STD_LOGIC_VECTOR'( nand_nl & or_590_nl & if_5_and_5_nl
      & if_5_and_4_nl));
  oif_unequal_tmp <= CONV_SL_1_1(UNSIGNED(O_mac_pntr_sva) /= UNSIGNED(O_vld_zg_pntr_sva));
  lor_2_lpi_1_dfm_1 <= oif_2_unequal_tmp OR W_data_vld_sva_mx0;
  lor_1_lpi_1_dfm_1 <= oif_1_unequal_tmp OR I_data_vld_sva_mx0;
  if_for_if_for_and_26_tmp <= O_mac_irrel_at_max_sva AND CONV_SL_1_1(O_instr_in_rsci_idat_mxwt(24
      DOWNTO 0)=STD_LOGIC_VECTOR'("0000100001000010000100001"));
  O_mac_irrel_at_max_sva_dfm_mx0 <= MUX_s_1_2_2(O_mac_irrel_at_max_sva, if_for_if_for_and_26_tmp,
      reg_W_instr_in_rsci_oswt_cse_1);
  aif_equal_tmp <= CONV_SL_1_1(UNSIGNED(O_mac_pntr_sva) = UNSIGNED(O_vld_zg_pntr_sva));
  skid_buf_wr_zero_guard_cnt_sva_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(skid_buf_wr_zero_guard_cnt_sva)
      + UNSIGNED'( "01"), 2));
  lor_3_lpi_1_dfm_1 <= NOT(O_mac_irrel_at_max_sva_dfm_mx0 AND flags_top_1_1_sva);
  W_mac_tile_bound_4_lpi_1_dfm_mx0 <= MUX_v_5_2_2(W_mac_tile_bound_4_lpi_1, (W_instr_in_rsci_idat_mxwt(49
      DOWNTO 45)), reg_W_instr_in_rsci_oswt_cse_1);
  W_mac_tile_bound_3_lpi_1_dfm_mx0 <= MUX_v_5_2_2(W_mac_tile_bound_3_lpi_1, (W_instr_in_rsci_idat_mxwt(44
      DOWNTO 40)), reg_W_instr_in_rsci_oswt_cse_1);
  W_mac_tile_bound_2_lpi_1_dfm_mx0 <= MUX_v_5_2_2(W_mac_tile_bound_2_lpi_1, (W_instr_in_rsci_idat_mxwt(39
      DOWNTO 35)), reg_W_instr_in_rsci_oswt_cse_1);
  W_mac_tile_bound_1_lpi_1_dfm_mx0 <= MUX_v_5_2_2(W_mac_tile_bound_1_lpi_1, (W_instr_in_rsci_idat_mxwt(34
      DOWNTO 30)), reg_W_instr_in_rsci_oswt_cse_1);
  W_mac_tile_bound_0_lpi_1_dfm_mx0 <= MUX_v_5_2_2(W_mac_tile_bound_0_lpi_1, (W_instr_in_rsci_idat_mxwt(29
      DOWNTO 25)), reg_W_instr_in_rsci_oswt_cse_1);
  I_mac_tile_bound_4_lpi_1_dfm_mx0 <= MUX_v_5_2_2(I_mac_tile_bound_4_lpi_1, (I_instr_in_rsci_idat_mxwt(49
      DOWNTO 45)), reg_W_instr_in_rsci_oswt_cse_1);
  I_mac_tile_bound_3_lpi_1_dfm_mx0 <= MUX_v_5_2_2(I_mac_tile_bound_3_lpi_1, (I_instr_in_rsci_idat_mxwt(44
      DOWNTO 40)), reg_W_instr_in_rsci_oswt_cse_1);
  I_mac_tile_bound_2_lpi_1_dfm_mx0 <= MUX_v_5_2_2(I_mac_tile_bound_2_lpi_1, (I_instr_in_rsci_idat_mxwt(39
      DOWNTO 35)), reg_W_instr_in_rsci_oswt_cse_1);
  I_mac_tile_bound_1_lpi_1_dfm_mx0 <= MUX_v_5_2_2(I_mac_tile_bound_1_lpi_1, (I_instr_in_rsci_idat_mxwt(34
      DOWNTO 30)), reg_W_instr_in_rsci_oswt_cse_1);
  I_mac_tile_bound_0_lpi_1_dfm_mx0 <= MUX_v_5_2_2(I_mac_tile_bound_0_lpi_1, (I_instr_in_rsci_idat_mxwt(29
      DOWNTO 25)), reg_W_instr_in_rsci_oswt_cse_1);
  mux_188_tmp <= MUX_v_2_2_2(skid_buf_wr_zero_guard_cnt_sva, skid_buf_wr_zero_guard_cnt_sva_5,
      and_432_cse);
  or_tmp_2 <= CONV_SL_1_1(mux1h_7_tmp/=STD_LOGIC_VECTOR'("00"));
  and_tmp <= main_stage_0_2 AND or_tmp_2;
  and_tmp_1 <= if_9_if_equal_1_tmp AND I_wr_data_rsci_ivld_mxwt AND main_stage_0_2
      AND or_tmp_2;
  or_tmp_5 <= oif_1_unequal_tmp OR I_data_vld_sva_dfm_1_1;
  mux_tmp_4 <= MUX_s_1_2_2(and_tmp_1, and_tmp, or_tmp_5);
  and_51_nl <= mux_124_itm_1 AND mux_tmp_4;
  and_50_nl <= O_wr_data_rsci_ivld_mxwt AND mux_tmp_4;
  mux_tmp_6 <= MUX_s_1_2_2(and_51_nl, and_50_nl, land_9_lpi_1_dfm_1_1);
  or_18_cse <= CONV_SL_1_1(skid_buf_top_cnt_sva/=STD_LOGIC_VECTOR'("00"));
  or_tmp_10 <= and_295_cse OR I_data_vld_sva_dfm_1_1 OR oif_1_unequal_tmp;
  and_54_nl <= mux_124_itm_1 AND or_tmp_10;
  and_53_nl <= O_wr_data_rsci_ivld_mxwt AND or_tmp_10;
  mux_342_cse <= MUX_s_1_2_2(and_54_nl, and_53_nl, land_9_lpi_1_dfm_1_1);
  mux_343_cse <= MUX_s_1_2_2(mux_342_cse, or_tmp_10, or_1_cse);
  and_58_nl <= oif_2_unequal_tmp AND or_1_cse AND oif_1_unequal_tmp AND or_18_cse;
  and_56_nl <= or_tmp_2 AND or_620_cse AND mux_343_cse;
  mux_tmp_11 <= MUX_s_1_2_2(and_58_nl, and_56_nl, main_stage_0_2);
  nand_83_nl <= NOT(O_mac_irrel_at_max_sva AND mux_tmp_11);
  nand_84_nl <= NOT(if_for_if_for_and_26_tmp AND mux_tmp_11);
  mux_345_nl <= MUX_s_1_2_2(nand_83_nl, nand_84_nl, reg_W_instr_in_rsci_oswt_cse_1);
  and_dcpl <= NOT(mux_345_nl OR flags_top_1_1_sva);
  and_tmp_14 <= or_620_cse AND or_tmp_10;
  and_64_nl <= mux_124_itm_1 AND and_tmp_14;
  and_63_nl <= O_wr_data_rsci_ivld_mxwt AND and_tmp_14;
  mux_346_cse <= MUX_s_1_2_2(and_64_nl, and_63_nl, land_9_lpi_1_dfm_1_1);
  mux_tmp_14 <= MUX_s_1_2_2(mux_346_cse, and_tmp_14, or_1_cse);
  nor_tmp_8 <= if_for_if_for_and_26_tmp AND flags_top_1_1_sva;
  not_tmp_8 <= NOT((if_6_if_3_acc_tmp(0)) AND mux_343_cse);
  not_tmp_9 <= NOT(W_irrel_cnt_sva_0 AND mux_343_cse);
  and_75_nl <= mux_124_itm_1 AND or_620_cse;
  and_74_nl <= O_wr_data_rsci_ivld_mxwt AND or_620_cse;
  mux_356_nl <= MUX_s_1_2_2(and_75_nl, and_74_nl, land_9_lpi_1_dfm_1_1);
  mux_tmp_24 <= MUX_s_1_2_2(mux_356_nl, or_620_cse, or_1_cse);
  not_tmp_14 <= NOT((if_6_if_1_acc_tmp(0)) AND mux_tmp_24);
  not_tmp_15 <= NOT(I_irrel_cnt_sva_0 AND mux_tmp_24);
  and_92_nl <= O_mac_irrel_at_max_sva AND mux_tmp_14;
  and_91_nl <= if_for_if_for_and_26_tmp AND mux_tmp_14;
  mux_tmp_34 <= MUX_s_1_2_2(and_92_nl, and_91_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_tmp_51 <= (NOT or_tmp_10) OR flags_top_1_1_sva;
  nand_14_nl <= NOT(mux_124_itm_1 AND (NOT or_tmp_51));
  nand_13_nl <= NOT(O_wr_data_rsci_ivld_mxwt AND (NOT or_tmp_51));
  mux_368_nl <= MUX_s_1_2_2(nand_14_nl, nand_13_nl, land_9_lpi_1_dfm_1_1);
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, or_tmp_51, or_1_cse);
  and_306_cse <= or_620_cse AND (NOT mux_369_nl);
  nor_tmp_25 <= if_for_if_for_and_26_tmp AND oif_2_unequal_tmp;
  and_tmp_40 <= ((NOT or_1_cse) OR (NOT oif_1_unequal_tmp) OR flags_top_1_1_sva)
      AND or_18_cse;
  nor_tmp_26 <= O_mac_irrel_at_max_sva AND oif_2_unequal_tmp;
  or_dcpl_11 <= (NOT O_mac_irrel_at_max_sva_dfm_mx0) OR flags_top_1_1_sva;
  nand_78_cse <= NOT(or_620_cse AND mux_343_cse);
  and_305_nl <= oif_2_unequal_tmp AND (NOT((NOT or_1_cse) OR (NOT oif_1_unequal_tmp)
      OR CONV_SL_1_1(skid_buf_top_cnt_sva/=STD_LOGIC_VECTOR'("00"))));
  nor_208_nl <= NOT(CONV_SL_1_1(mux1h_7_tmp/=STD_LOGIC_VECTOR'("00")) OR nand_78_cse);
  not_tmp_25 <= MUX_s_1_2_2(and_305_nl, nor_208_nl, main_stage_0_2);
  or_tmp_73 <= (NOT((NOT or_1_cse) OR (NOT oif_1_unequal_tmp) OR flags_top_1_1_sva))
      OR CONV_SL_1_1(skid_buf_top_cnt_sva/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_14 <= CONV_SL_1_1(mux_188_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_tmp_39 <= NOT(flags_wr_zero_guard_sva OR (NOT wr_data_zero_guard_rsci_ivld_mxwt));
  nor_tmp_43 <= oif_2_unequal_tmp AND oif_1_unequal_tmp;
  mux_396_cse <= MUX_s_1_2_2(nor_tmp_43, and_tmp_14, main_stage_0_2);
  or_569_cse <= (NOT if_6_aif_equal_tmp) OR (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000"));
  or_tmp_93 <= land_lpi_1_dfm_1 OR (NOT(or_569_cse AND main_stage_0_2 AND or_620_cse
      AND if_6_else_if_equal_tmp AND mux_342_cse));
  nor_203_nl <= NOT(and_526_cse OR or_tmp_93);
  nor_204_nl <= NOT(nor_tmp_8 OR or_tmp_93);
  mux_399_nl <= MUX_s_1_2_2(nor_203_nl, nor_204_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_119_nl <= and_526_cse OR (NOT if_6_aif_equal_tmp) OR (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT mux_396_cse);
  or_117_nl <= nor_tmp_8 OR (NOT if_6_aif_equal_tmp) OR (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT mux_396_cse);
  mux_397_nl <= MUX_s_1_2_2(or_119_nl, or_117_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_tmp_67 <= MUX_s_1_2_2(mux_399_nl, mux_397_nl, O_data_vld_sva);
  or_tmp_96 <= wr_data_zero_guard_rsci_idat_mxwt OR mux_tmp_67;
  or_tmp_97 <= skid_buf_wr_zero_guard_regs_0_sva_dfm_1 OR mux_tmp_67;
  or_tmp_98 <= skid_buf_wr_zero_guard_regs_1_sva_dfm_1 OR mux_tmp_67;
  mux_404_tmp <= MUX_s_1_2_2(or_tmp_97, or_tmp_98, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_402_nl <= MUX_s_1_2_2(or_tmp_96, or_tmp_98, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_401_nl <= MUX_s_1_2_2(or_tmp_97, or_tmp_96, skid_buf_wr_zero_guard_rd_ptr_sva);
  mux_403_nl <= MUX_s_1_2_2(mux_402_nl, mux_401_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_405_cse <= MUX_s_1_2_2(mux_404_tmp, mux_403_nl, nor_tmp_39);
  and_dcpl_19 <= (NOT mux_405_cse) AND or_dcpl_14 AND aif_7_equal_tmp;
  or_dcpl_19 <= (NOT W_wr_data_rsci_ivld_mxwt) OR W_data_vld_sva_dfm_1_1;
  or_dcpl_21 <= or_dcpl_19 OR (NOT main_stage_0_2) OR CONV_SL_1_1(W_wr_pntr_sva/=STD_LOGIC_VECTOR'("00000"));
  or_dcpl_22 <= (W_wr_pntr_sva(0)) OR (W_wr_pntr_sva(2));
  or_dcpl_23 <= or_dcpl_22 OR (W_wr_pntr_sva(4));
  or_dcpl_25 <= or_dcpl_19 OR (W_wr_pntr_sva(3)) OR (W_wr_pntr_sva(1));
  or_dcpl_27 <= (NOT (W_wr_pntr_sva(0))) OR (W_wr_pntr_sva(2));
  or_dcpl_28 <= or_dcpl_27 OR (W_wr_pntr_sva(4));
  or_dcpl_29 <= or_dcpl_25 OR or_dcpl_28;
  or_dcpl_31 <= or_dcpl_19 OR (W_wr_pntr_sva(3)) OR (NOT (W_wr_pntr_sva(1)));
  or_dcpl_32 <= or_dcpl_31 OR or_dcpl_23;
  or_dcpl_33 <= or_dcpl_31 OR or_dcpl_28;
  or_dcpl_34 <= (W_wr_pntr_sva(0)) OR (NOT (W_wr_pntr_sva(2)));
  or_dcpl_35 <= or_dcpl_34 OR (W_wr_pntr_sva(4));
  or_dcpl_36 <= or_dcpl_25 OR or_dcpl_35;
  or_dcpl_37 <= NOT((W_wr_pntr_sva(0)) AND (W_wr_pntr_sva(2)));
  or_dcpl_38 <= or_dcpl_37 OR (W_wr_pntr_sva(4));
  or_dcpl_39 <= or_dcpl_25 OR or_dcpl_38;
  or_dcpl_40 <= or_dcpl_31 OR or_dcpl_35;
  or_dcpl_41 <= or_dcpl_31 OR or_dcpl_38;
  or_dcpl_43 <= or_dcpl_19 OR (NOT (W_wr_pntr_sva(3))) OR (W_wr_pntr_sva(1));
  or_dcpl_44 <= or_dcpl_43 OR or_dcpl_23;
  or_dcpl_45 <= or_dcpl_43 OR or_dcpl_28;
  or_dcpl_47 <= or_dcpl_19 OR (NOT (W_wr_pntr_sva(3))) OR (NOT (W_wr_pntr_sva(1)));
  or_dcpl_48 <= or_dcpl_47 OR or_dcpl_23;
  or_dcpl_49 <= or_dcpl_47 OR or_dcpl_28;
  or_dcpl_50 <= or_dcpl_43 OR or_dcpl_35;
  or_dcpl_51 <= or_dcpl_43 OR or_dcpl_38;
  or_dcpl_52 <= or_dcpl_47 OR or_dcpl_35;
  or_dcpl_53 <= or_dcpl_47 OR or_dcpl_38;
  or_dcpl_54 <= or_dcpl_22 OR (NOT (W_wr_pntr_sva(4)));
  or_dcpl_55 <= or_dcpl_25 OR or_dcpl_54;
  or_dcpl_56 <= or_dcpl_27 OR (NOT (W_wr_pntr_sva(4)));
  or_dcpl_57 <= or_dcpl_25 OR or_dcpl_56;
  or_dcpl_58 <= or_dcpl_31 OR or_dcpl_54;
  or_dcpl_59 <= or_dcpl_31 OR or_dcpl_56;
  or_dcpl_60 <= or_dcpl_34 OR (NOT (W_wr_pntr_sva(4)));
  or_dcpl_61 <= or_dcpl_25 OR or_dcpl_60;
  or_dcpl_62 <= or_dcpl_37 OR (NOT (W_wr_pntr_sva(4)));
  or_dcpl_63 <= or_dcpl_25 OR or_dcpl_62;
  or_dcpl_64 <= or_dcpl_31 OR or_dcpl_60;
  or_dcpl_65 <= or_dcpl_31 OR or_dcpl_62;
  or_dcpl_66 <= or_dcpl_43 OR or_dcpl_54;
  or_dcpl_67 <= or_dcpl_43 OR or_dcpl_56;
  or_dcpl_68 <= or_dcpl_47 OR or_dcpl_54;
  or_dcpl_69 <= or_dcpl_47 OR or_dcpl_56;
  or_dcpl_70 <= or_dcpl_43 OR or_dcpl_60;
  or_dcpl_71 <= or_dcpl_43 OR or_dcpl_62;
  or_dcpl_72 <= or_dcpl_47 OR or_dcpl_60;
  or_dcpl_73 <= or_dcpl_47 OR or_dcpl_62;
  nand_75_nl <= NOT(oif_2_unequal_tmp AND or_1_cse AND oif_1_unequal_tmp);
  not_tmp_47 <= MUX_s_1_2_2(nand_75_nl, nand_78_cse, main_stage_0_2);
  or_192_nl <= and_526_cse OR not_tmp_47;
  or_191_nl <= nor_tmp_8 OR not_tmp_47;
  mux_tmp_76 <= MUX_s_1_2_2(or_192_nl, or_191_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_dcpl_78 <= (NOT I_wr_data_rsci_ivld_mxwt) OR I_data_vld_sva_dfm_1_1;
  or_dcpl_80 <= or_dcpl_78 OR (NOT main_stage_0_2) OR CONV_SL_1_1(I_wr_pntr_sva/=STD_LOGIC_VECTOR'("00000"));
  or_dcpl_81 <= (I_wr_pntr_sva(1)) OR (I_wr_pntr_sva(3));
  or_dcpl_82 <= or_dcpl_81 OR (I_wr_pntr_sva(4));
  or_dcpl_84 <= or_dcpl_78 OR (I_wr_pntr_sva(0)) OR (I_wr_pntr_sva(2));
  or_dcpl_87 <= or_dcpl_78 OR (NOT (I_wr_pntr_sva(0))) OR (I_wr_pntr_sva(2));
  or_dcpl_88 <= or_dcpl_87 OR or_dcpl_82;
  or_dcpl_89 <= (NOT (I_wr_pntr_sva(1))) OR (I_wr_pntr_sva(3));
  or_dcpl_90 <= or_dcpl_89 OR (I_wr_pntr_sva(4));
  or_dcpl_91 <= or_dcpl_84 OR or_dcpl_90;
  or_dcpl_92 <= or_dcpl_87 OR or_dcpl_90;
  or_dcpl_94 <= or_dcpl_78 OR (I_wr_pntr_sva(0)) OR (NOT (I_wr_pntr_sva(2)));
  or_dcpl_95 <= or_dcpl_94 OR or_dcpl_82;
  or_dcpl_97 <= or_dcpl_78 OR (NOT (I_wr_pntr_sva(0))) OR (NOT (I_wr_pntr_sva(2)));
  or_dcpl_98 <= or_dcpl_97 OR or_dcpl_82;
  or_dcpl_99 <= or_dcpl_94 OR or_dcpl_90;
  or_dcpl_100 <= or_dcpl_97 OR or_dcpl_90;
  or_dcpl_101 <= (I_wr_pntr_sva(1)) OR (NOT (I_wr_pntr_sva(3)));
  or_dcpl_102 <= or_dcpl_101 OR (I_wr_pntr_sva(4));
  or_dcpl_103 <= or_dcpl_84 OR or_dcpl_102;
  or_dcpl_104 <= or_dcpl_87 OR or_dcpl_102;
  or_dcpl_105 <= NOT((I_wr_pntr_sva(1)) AND (I_wr_pntr_sva(3)));
  or_dcpl_106 <= or_dcpl_105 OR (I_wr_pntr_sva(4));
  or_dcpl_107 <= or_dcpl_84 OR or_dcpl_106;
  or_dcpl_108 <= or_dcpl_87 OR or_dcpl_106;
  or_dcpl_109 <= or_dcpl_94 OR or_dcpl_102;
  or_dcpl_110 <= or_dcpl_97 OR or_dcpl_102;
  or_dcpl_111 <= or_dcpl_94 OR or_dcpl_106;
  or_dcpl_112 <= or_dcpl_97 OR or_dcpl_106;
  or_dcpl_113 <= or_dcpl_81 OR (NOT (I_wr_pntr_sva(4)));
  or_dcpl_114 <= or_dcpl_84 OR or_dcpl_113;
  or_dcpl_115 <= or_dcpl_87 OR or_dcpl_113;
  or_dcpl_116 <= or_dcpl_89 OR (NOT (I_wr_pntr_sva(4)));
  or_dcpl_117 <= or_dcpl_84 OR or_dcpl_116;
  or_dcpl_118 <= or_dcpl_87 OR or_dcpl_116;
  or_dcpl_119 <= or_dcpl_94 OR or_dcpl_113;
  or_dcpl_120 <= or_dcpl_97 OR or_dcpl_113;
  or_dcpl_121 <= or_dcpl_94 OR or_dcpl_116;
  or_dcpl_122 <= or_dcpl_97 OR or_dcpl_116;
  or_dcpl_123 <= or_dcpl_101 OR (NOT (I_wr_pntr_sva(4)));
  or_dcpl_124 <= or_dcpl_84 OR or_dcpl_123;
  or_dcpl_125 <= or_dcpl_87 OR or_dcpl_123;
  or_dcpl_126 <= or_dcpl_105 OR (NOT (I_wr_pntr_sva(4)));
  or_dcpl_127 <= or_dcpl_84 OR or_dcpl_126;
  or_dcpl_128 <= or_dcpl_87 OR or_dcpl_126;
  or_dcpl_129 <= or_dcpl_94 OR or_dcpl_123;
  or_dcpl_130 <= or_dcpl_97 OR or_dcpl_123;
  or_dcpl_131 <= or_dcpl_94 OR or_dcpl_126;
  or_dcpl_132 <= or_dcpl_97 OR or_dcpl_126;
  and_tmp_56 <= flags_top_1_1_sva AND O_mac_irrel_at_max_sva_dfm_mx0;
  or_tmp_105 <= and_541_cse OR oif_2_unequal_tmp;
  nand_31_nl <= NOT(or_tmp_105 AND (NOT and_tmp_56));
  mux_tmp_77 <= MUX_s_1_2_2(nand_31_nl, and_tmp_56, W_data_vld_sva_dfm_1_1);
  or_tmp_106 <= and_295_cse OR oif_1_unequal_tmp;
  nand_32_nl <= NOT(or_tmp_106 AND (NOT mux_tmp_77));
  mux_tmp_78 <= MUX_s_1_2_2(nand_32_nl, mux_tmp_77, I_data_vld_sva_dfm_1_1);
  and_tmp_57 <= O_data_vld_sva AND mux_tmp_78;
  nand_34_nl <= NOT(or_tmp_105 AND oif_unequal_tmp AND (NOT and_tmp_56));
  nand_33_nl <= NOT(oif_unequal_tmp AND (NOT and_tmp_56));
  mux_tmp_79 <= MUX_s_1_2_2(nand_34_nl, nand_33_nl, W_data_vld_sva_dfm_1_1);
  nand_35_nl <= NOT(or_tmp_106 AND (NOT mux_tmp_79));
  mux_413_nl <= MUX_s_1_2_2(nand_35_nl, mux_tmp_79, I_data_vld_sva_dfm_1_1);
  mux_414_nl <= MUX_s_1_2_2(mux_413_nl, mux_tmp_78, O_data_vld_sva);
  not_tmp_56 <= NOT(land_lpi_1_dfm_1 OR mux_414_nl);
  mux_416_nl <= MUX_s_1_2_2(not_tmp_56, and_tmp_57, mux_124_itm_1);
  mux_415_nl <= MUX_s_1_2_2(not_tmp_56, and_tmp_57, O_wr_data_rsci_ivld_mxwt);
  mux_tmp_84 <= MUX_s_1_2_2(mux_416_nl, mux_415_nl, land_9_lpi_1_dfm_1_1);
  or_dcpl_136 <= CONV_SL_1_1(O_mac_pntr_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_137 <= CONV_SL_1_1(O_mac_pntr_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_138 <= or_dcpl_137 OR or_dcpl_136;
  or_dcpl_139 <= O_mac_irrel_at_max_sva_dfm_mx0 OR (O_mac_pntr_sva(4));
  nor_tmp_65 <= if_9_if_equal_1_tmp AND I_wr_data_rsci_ivld_mxwt AND main_stage_0_2;
  mux_tmp_89 <= MUX_s_1_2_2(nor_tmp_65, main_stage_0_2, or_tmp_5);
  and_128_nl <= mux_124_itm_1 AND mux_tmp_89;
  and_127_nl <= O_wr_data_rsci_ivld_mxwt AND mux_tmp_89;
  mux_tmp_91 <= MUX_s_1_2_2(and_128_nl, and_127_nl, land_9_lpi_1_dfm_1_1);
  and_129_nl <= or_558_cse AND mux_tmp_91;
  mux_425_nl <= MUX_s_1_2_2(and_129_nl, mux_tmp_91, oif_2_unequal_tmp);
  and_126_nl <= or_558_cse AND mux_tmp_89;
  mux_421_nl <= MUX_s_1_2_2(nor_tmp_65, main_stage_0_2, I_data_vld_sva_dfm_1_1);
  or_267_nl <= oif_1_unequal_tmp OR mux_421_nl;
  mux_423_nl <= MUX_s_1_2_2(and_126_nl, or_267_nl, oif_2_unequal_tmp);
  mux_426_itm <= MUX_s_1_2_2(mux_425_nl, mux_423_nl, or_1_cse);
  or_dcpl_142 <= CONV_SL_1_1(O_mac_pntr_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_143 <= or_dcpl_137 OR or_dcpl_142;
  or_dcpl_146 <= CONV_SL_1_1(O_mac_pntr_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_147 <= or_dcpl_137 OR or_dcpl_146;
  or_dcpl_150 <= NOT(CONV_SL_1_1(O_mac_pntr_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_151 <= or_dcpl_137 OR or_dcpl_150;
  or_dcpl_154 <= CONV_SL_1_1(O_mac_pntr_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_155 <= or_dcpl_154 OR or_dcpl_136;
  or_dcpl_158 <= or_dcpl_154 OR or_dcpl_142;
  or_dcpl_161 <= or_dcpl_154 OR or_dcpl_146;
  or_dcpl_164 <= or_dcpl_154 OR or_dcpl_150;
  or_dcpl_167 <= CONV_SL_1_1(O_mac_pntr_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_168 <= or_dcpl_167 OR or_dcpl_136;
  or_dcpl_171 <= or_dcpl_167 OR or_dcpl_142;
  or_dcpl_174 <= or_dcpl_167 OR or_dcpl_146;
  or_dcpl_177 <= or_dcpl_167 OR or_dcpl_150;
  or_dcpl_180 <= NOT(CONV_SL_1_1(O_mac_pntr_sva(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_181 <= or_dcpl_180 OR or_dcpl_136;
  or_dcpl_184 <= or_dcpl_180 OR or_dcpl_142;
  or_dcpl_187 <= or_dcpl_180 OR or_dcpl_146;
  or_dcpl_190 <= or_dcpl_180 OR or_dcpl_150;
  or_dcpl_193 <= O_mac_irrel_at_max_sva_dfm_mx0 OR (NOT (O_mac_pntr_sva(4)));
  or_dcpl_226 <= NOT(main_stage_0_2 AND or_svs_1);
  nor_201_nl <= NOT(skid_buf_top_wr_ptr_sva_1 OR skid_buf_top_wr_ptr_sva_0);
  mux_tmp_94 <= MUX_s_1_2_2(nor_201_nl, skid_buf_top_push_nor_psp, if_5_and_svs_1);
  nor_200_nl <= NOT(skid_buf_top_wr_ptr_sva_1 OR (NOT skid_buf_top_wr_ptr_sva_0));
  mux_tmp_96 <= MUX_s_1_2_2(nor_200_nl, skid_buf_top_push_and_psp, if_5_and_svs_1);
  nor_199_nl <= NOT((NOT skid_buf_top_wr_ptr_sva_1) OR skid_buf_top_wr_ptr_sva_0);
  mux_tmp_98 <= MUX_s_1_2_2(nor_199_nl, skid_buf_top_push_and_1_psp, if_5_and_svs_1);
  or_dcpl_237 <= NOT(or_dcpl_14 AND aif_7_equal_tmp);
  or_tmp_143 <= land_lpi_1_dfm_1 OR (NOT(or_569_cse AND if_6_else_if_equal_tmp AND
      mux_346_cse));
  nor_195_nl <= NOT(and_526_cse OR or_tmp_143);
  nor_196_nl <= NOT(nor_tmp_8 OR or_tmp_143);
  mux_445_nl <= MUX_s_1_2_2(nor_195_nl, nor_196_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_394_nl <= and_526_cse OR (NOT if_6_aif_equal_tmp) OR (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT and_tmp_14);
  or_392_nl <= nor_tmp_8 OR (NOT if_6_aif_equal_tmp) OR (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT and_tmp_14);
  mux_443_nl <= MUX_s_1_2_2(or_394_nl, or_392_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_tmp_113 <= MUX_s_1_2_2(mux_445_nl, mux_443_nl, O_data_vld_sva);
  or_399_cse <= wr_data_zero_guard_rsci_idat_mxwt OR mux_tmp_113;
  or_400_cse <= skid_buf_wr_zero_guard_regs_0_sva_dfm_1 OR mux_tmp_113;
  or_401_cse <= skid_buf_wr_zero_guard_regs_1_sva_dfm_1 OR mux_tmp_113;
  or_tmp_162 <= (NOT wr_data_zero_guard_rsci_ivld_mxwt) OR flags_wr_zero_guard_sva;
  not_tmp_93 <= NOT(or_620_cse AND or_tmp_10);
  or_422_nl <= O_mac_irrel_at_max_sva OR not_tmp_93;
  or_421_nl <= if_for_if_for_and_26_tmp OR not_tmp_93;
  mux_461_nl <= MUX_s_1_2_2(or_422_nl, or_421_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_tmp_129 <= MUX_s_1_2_2(not_tmp_93, mux_461_nl, flags_top_1_1_sva);
  nor_110_cse <= NOT((NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT if_6_aif_equal_tmp));
  nor_191_nl <= NOT(O_mac_irrel_at_max_sva OR (NOT nor_tmp_43));
  nor_192_nl <= NOT(if_for_if_for_and_26_tmp OR (NOT nor_tmp_43));
  mux_463_nl <= MUX_s_1_2_2(nor_191_nl, nor_192_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_464_nl <= MUX_s_1_2_2(nor_tmp_43, mux_463_nl, flags_top_1_1_sva);
  mux_465_nl <= MUX_s_1_2_2(mux_464_nl, (NOT mux_tmp_129), main_stage_0_2);
  nand_tmp_25 <= NOT(nor_110_cse AND mux_465_nl);
  and_299_nl <= or_569_cse AND main_stage_0_2 AND (NOT mux_tmp_129);
  mux_466_nl <= MUX_s_1_2_2(and_299_nl, nand_tmp_25, O_data_vld_sva);
  nand_tmp_27 <= NOT(or_dcpl_14 AND aif_7_equal_tmp AND (NOT mux_466_nl));
  mux_tmp_134 <= MUX_s_1_2_2((NOT nand_tmp_27), nand_tmp_27, skid_buf_wr_zero_guard_rd_ptr_sva);
  or_tmp_171 <= (NOT skid_buf_wr_zero_guard_regs_0_sva_dfm_1) OR skid_buf_wr_zero_guard_rd_ptr_sva;
  nand_tmp_28 <= NOT(or_tmp_171 AND (NOT nand_tmp_27));
  nor_tmp_110 <= skid_buf_wr_zero_guard_regs_1_sva_dfm_1 AND skid_buf_wr_zero_guard_rd_ptr_sva;
  or_428_nl <= nor_tmp_110 OR nand_tmp_27;
  mux_474_nl <= MUX_s_1_2_2(or_428_nl, nand_tmp_28, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_473_nl <= MUX_s_1_2_2(mux_tmp_134, (NOT mux_tmp_134), skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_475_nl <= MUX_s_1_2_2(mux_474_nl, mux_473_nl, wr_data_zero_guard_rsci_idat_mxwt);
  mux_471_nl <= MUX_s_1_2_2(nand_tmp_28, (NOT mux_tmp_134), skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_469_nl <= MUX_s_1_2_2((NOT nand_tmp_27), nand_tmp_27, or_tmp_171);
  or_425_nl <= skid_buf_wr_zero_guard_rd_ptr_sva OR nand_tmp_27;
  mux_468_nl <= MUX_s_1_2_2(or_425_nl, mux_tmp_134, skid_buf_wr_zero_guard_regs_0_sva_dfm_1);
  mux_470_nl <= MUX_s_1_2_2(mux_469_nl, mux_468_nl, skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_472_nl <= MUX_s_1_2_2(mux_471_nl, mux_470_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_tmp_143 <= MUX_s_1_2_2(mux_475_nl, mux_472_nl, or_tmp_162);
  nand_tmp_29 <= NOT(or_dcpl_14 AND aif_7_equal_tmp AND (NOT(O_data_vld_sva AND nand_tmp_25)));
  mux_tmp_144 <= MUX_s_1_2_2((NOT nand_tmp_29), nand_tmp_29, skid_buf_wr_zero_guard_rd_ptr_sva);
  nand_tmp_30 <= NOT(or_tmp_171 AND (NOT nand_tmp_29));
  or_434_nl <= nor_tmp_110 OR nand_tmp_29;
  mux_484_nl <= MUX_s_1_2_2(or_434_nl, nand_tmp_30, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_483_nl <= MUX_s_1_2_2(mux_tmp_144, (NOT mux_tmp_144), skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_485_nl <= MUX_s_1_2_2(mux_484_nl, mux_483_nl, wr_data_zero_guard_rsci_idat_mxwt);
  mux_481_nl <= MUX_s_1_2_2(nand_tmp_30, (NOT mux_tmp_144), skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_479_nl <= MUX_s_1_2_2((NOT nand_tmp_29), nand_tmp_29, or_tmp_171);
  or_431_nl <= skid_buf_wr_zero_guard_rd_ptr_sva OR nand_tmp_29;
  mux_478_nl <= MUX_s_1_2_2(or_431_nl, mux_tmp_144, skid_buf_wr_zero_guard_regs_0_sva_dfm_1);
  mux_480_nl <= MUX_s_1_2_2(mux_479_nl, mux_478_nl, skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_482_nl <= MUX_s_1_2_2(mux_481_nl, mux_480_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_tmp_153 <= MUX_s_1_2_2(mux_485_nl, mux_482_nl, or_tmp_162);
  nand_tmp_31 <= (NOT libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21)
      OR CONV_SL_1_1(if_6_if_6_mux1h_tmp/=STD_LOGIC_VECTOR'("00000")) OR (NOT if_6_aif_equal_tmp)
      OR mux_tmp_129;
  nor_190_nl <= NOT(nor_110_cse OR mux_tmp_129);
  mux_493_nl <= MUX_s_1_2_2(nor_190_nl, nand_tmp_31, O_data_vld_sva);
  nand_tmp_32 <= NOT(or_dcpl_14 AND aif_7_equal_tmp AND (NOT mux_493_nl));
  mux_tmp_161 <= MUX_s_1_2_2((NOT nand_tmp_32), nand_tmp_32, skid_buf_wr_zero_guard_rd_ptr_sva);
  nand_tmp_33 <= NOT(or_tmp_171 AND (NOT nand_tmp_32));
  or_445_nl <= nor_tmp_110 OR nand_tmp_32;
  mux_501_nl <= MUX_s_1_2_2(or_445_nl, nand_tmp_33, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_500_nl <= MUX_s_1_2_2(mux_tmp_161, (NOT mux_tmp_161), skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_502_nl <= MUX_s_1_2_2(mux_501_nl, mux_500_nl, wr_data_zero_guard_rsci_idat_mxwt);
  mux_498_nl <= MUX_s_1_2_2(nand_tmp_33, (NOT mux_tmp_161), skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_496_nl <= MUX_s_1_2_2((NOT nand_tmp_32), nand_tmp_32, or_tmp_171);
  or_442_nl <= skid_buf_wr_zero_guard_rd_ptr_sva OR nand_tmp_32;
  mux_495_nl <= MUX_s_1_2_2(or_442_nl, mux_tmp_161, skid_buf_wr_zero_guard_regs_0_sva_dfm_1);
  mux_497_nl <= MUX_s_1_2_2(mux_496_nl, mux_495_nl, skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_499_nl <= MUX_s_1_2_2(mux_498_nl, mux_497_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_tmp_170 <= MUX_s_1_2_2(mux_502_nl, mux_499_nl, or_tmp_162);
  nand_tmp_34 <= NOT(or_dcpl_14 AND aif_7_equal_tmp AND (NOT(O_data_vld_sva AND nand_tmp_31)));
  mux_tmp_171 <= MUX_s_1_2_2((NOT nand_tmp_34), nand_tmp_34, skid_buf_wr_zero_guard_rd_ptr_sva);
  nand_tmp_35 <= NOT(or_tmp_171 AND (NOT nand_tmp_34));
  or_451_nl <= nor_tmp_110 OR nand_tmp_34;
  mux_511_nl <= MUX_s_1_2_2(or_451_nl, nand_tmp_35, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_510_nl <= MUX_s_1_2_2(mux_tmp_171, (NOT mux_tmp_171), skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_512_nl <= MUX_s_1_2_2(mux_511_nl, mux_510_nl, wr_data_zero_guard_rsci_idat_mxwt);
  mux_508_nl <= MUX_s_1_2_2(nand_tmp_35, (NOT mux_tmp_171), skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_506_nl <= MUX_s_1_2_2((NOT nand_tmp_34), nand_tmp_34, or_tmp_171);
  or_448_nl <= skid_buf_wr_zero_guard_rd_ptr_sva OR nand_tmp_34;
  mux_505_nl <= MUX_s_1_2_2(or_448_nl, mux_tmp_171, skid_buf_wr_zero_guard_regs_0_sva_dfm_1);
  mux_507_nl <= MUX_s_1_2_2(mux_506_nl, mux_505_nl, skid_buf_wr_zero_guard_regs_1_sva_dfm_1);
  mux_509_nl <= MUX_s_1_2_2(mux_508_nl, mux_507_nl, skid_buf_wr_zero_guard_wr_ptr_sva);
  mux_tmp_180 <= MUX_s_1_2_2(mux_512_nl, mux_509_nl, or_tmp_162);
  or_tmp_200 <= or_620_cse OR or_557_cse;
  mux_520_nl <= MUX_s_1_2_2(or_557_cse, or_tmp_200, mux_124_itm_1);
  mux_519_nl <= MUX_s_1_2_2(or_557_cse, or_tmp_200, O_wr_data_rsci_ivld_mxwt);
  mux_521_nl <= MUX_s_1_2_2(mux_520_nl, mux_519_nl, land_9_lpi_1_dfm_1_1);
  and_153_nl <= main_stage_0_2 AND mux_521_nl;
  mux_518_nl <= MUX_s_1_2_2(oif_2_unequal_tmp, or_tmp_200, main_stage_0_2);
  mux_tmp_189 <= MUX_s_1_2_2(and_153_nl, mux_518_nl, or_1_cse);
  and_tmp_80 <= main_stage_0_2 AND or_557_cse;
  or_tmp_204 <= or_tmp_10 OR or_558_cse;
  mux_532_nl <= MUX_s_1_2_2(or_558_cse, or_tmp_204, mux_124_itm_1);
  mux_531_nl <= MUX_s_1_2_2(or_558_cse, or_tmp_204, O_wr_data_rsci_ivld_mxwt);
  mux_533_nl <= MUX_s_1_2_2(mux_532_nl, mux_531_nl, land_9_lpi_1_dfm_1_1);
  mux_534_nl <= MUX_s_1_2_2(mux_533_nl, or_tmp_204, or_1_cse);
  mux_tmp_202 <= MUX_s_1_2_2(and_544_cse, mux_534_nl, main_stage_0_2);
  and_tmp_81 <= main_stage_0_2 AND or_558_cse;
  or_dcpl_246 <= (NOT skid_buf_wr_zero_guard_wr_ptr_sva) OR flags_wr_zero_guard_sva
      OR (NOT wr_data_zero_guard_rsci_ivld_mxwt);
  or_dcpl_248 <= skid_buf_wr_zero_guard_wr_ptr_sva OR flags_wr_zero_guard_sva OR
      (NOT wr_data_zero_guard_rsci_ivld_mxwt);
  and_tmp_93 <= nor_tmp_65 AND or_tmp_2;
  mux_tmp_224 <= MUX_s_1_2_2(and_tmp_93, and_tmp, or_tmp_5);
  and_171_nl <= mux_124_itm_1 AND mux_tmp_224;
  and_170_nl <= O_wr_data_rsci_ivld_mxwt AND mux_tmp_224;
  mux_tmp_226 <= MUX_s_1_2_2(and_171_nl, and_170_nl, land_9_lpi_1_dfm_1_1);
  and_296_nl <= mux_124_itm_1 AND main_stage_0_2;
  and_297_nl <= O_wr_data_rsci_ivld_mxwt AND main_stage_0_2;
  mux_tmp_231 <= MUX_s_1_2_2(and_296_nl, and_297_nl, land_9_lpi_1_dfm_1_1);
  mux_tmp_232 <= MUX_s_1_2_2(mux_tmp_231, main_stage_0_2, oif_unequal_tmp);
  and_tmp_98 <= and_295_cse AND mux_tmp_232;
  and_175_nl <= W_data_vld_sva_dfm_1_1 AND if_9_if_equal_1_tmp AND I_wr_data_rsci_ivld_mxwt
      AND mux_tmp_232;
  and_174_nl <= W_data_vld_sva_dfm_1_1 AND mux_tmp_232;
  mux_569_nl <= MUX_s_1_2_2(and_175_nl, and_174_nl, or_tmp_5);
  mux_568_nl <= MUX_s_1_2_2(and_tmp_98, mux_tmp_232, or_tmp_5);
  mux_570_nl <= MUX_s_1_2_2(mux_569_nl, mux_568_nl, and_541_cse);
  mux_566_nl <= MUX_s_1_2_2(and_tmp_98, mux_tmp_232, I_data_vld_sva_dfm_1_1);
  or_493_nl <= oif_unequal_tmp OR mux_tmp_231;
  mux_567_nl <= MUX_s_1_2_2(mux_566_nl, or_493_nl, oif_1_unequal_tmp);
  mux_571_itm <= MUX_s_1_2_2(mux_570_nl, mux_567_nl, oif_2_unequal_tmp);
  nor_188_nl <= NOT(and_526_cse OR (NOT mux_571_itm));
  nor_189_nl <= NOT(nor_tmp_8 OR (NOT mux_571_itm));
  mux_572_nl <= MUX_s_1_2_2(nor_188_nl, nor_189_nl, reg_W_instr_in_rsci_oswt_cse_1);
  and_dcpl_28 <= NOT(mux_572_nl OR O_data_vld_sva);
  or_tmp_242 <= and_dcpl_19 AND (fsm_output(1));
  O_rd_data_rsci_idat_mx0c0 <= (and_dcpl AND (fsm_output(1))) OR (mux_tmp_34 AND
      or_tmp_2 AND (NOT flags_top_1_1_sva) AND main_stage_0_2);
  mux_372_nl <= MUX_s_1_2_2(or_18_cse, and_tmp_40, nor_tmp_26);
  mux_371_nl <= MUX_s_1_2_2(or_18_cse, and_tmp_40, nor_tmp_25);
  mux_373_nl <= MUX_s_1_2_2(mux_372_nl, mux_371_nl, reg_W_instr_in_rsci_oswt_cse_1);
  nand_17_nl <= NOT(O_mac_irrel_at_max_sva AND and_306_cse);
  nand_16_nl <= NOT(if_for_if_for_and_26_tmp AND and_306_cse);
  mux_370_nl <= MUX_s_1_2_2(nand_17_nl, nand_16_nl, reg_W_instr_in_rsci_oswt_cse_1);
  and_95_nl <= or_tmp_2 AND mux_370_nl;
  mux_374_nl <= MUX_s_1_2_2(mux_373_nl, and_95_nl, main_stage_0_2);
  O_rd_data_rsci_idat_mx0c1 <= (mux_374_nl AND (fsm_output(1))) OR (((NOT mux_tmp_14)
      OR or_dcpl_11) AND or_tmp_2 AND main_stage_0_2);
  nand_57_nl <= NOT(O_mac_irrel_at_max_sva AND not_tmp_25);
  nand_58_nl <= NOT(if_for_if_for_and_26_tmp AND not_tmp_25);
  mux_381_nl <= MUX_s_1_2_2(nand_57_nl, nand_58_nl, reg_W_instr_in_rsci_oswt_cse_1);
  O_rd_data_rsci_idat_mx0c2 <= ((NOT(mux_381_nl OR flags_top_1_1_sva)) AND (fsm_output(1)))
      OR (mux_tmp_34 AND (NOT flags_top_1_1_sva) AND CONV_SL_1_1(mux1h_7_tmp=STD_LOGIC_VECTOR'("00"))
      AND main_stage_0_2);
  O_data_vld_sva_mx0c1 <= ((mux_405_cse OR or_dcpl_237) AND (fsm_output(1))) OR ((mux_460_cse
      OR or_dcpl_237) AND main_stage_0_2);
  nor_138_nl <= NOT(and_526_cse OR CONV_SL_1_1(I_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT I_irrel_cnt_sva_0));
  mux_527_nl <= MUX_s_1_2_2(and_tmp_80, mux_tmp_189, nor_138_nl);
  nor_136_nl <= NOT(and_526_cse OR CONV_SL_1_1(if_6_if_1_acc_tmp/=STD_LOGIC_VECTOR'("00001")));
  mux_526_nl <= MUX_s_1_2_2(and_tmp_80, mux_tmp_189, nor_136_nl);
  mux_528_nl <= MUX_s_1_2_2(mux_527_nl, mux_526_nl, I_mac_irrel_at_maxBuf_sva);
  nor_134_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(I_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT I_irrel_cnt_sva_0));
  mux_524_nl <= MUX_s_1_2_2(and_tmp_80, mux_tmp_189, nor_134_nl);
  nor_130_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(if_6_if_1_acc_tmp/=STD_LOGIC_VECTOR'("00001")));
  mux_523_nl <= MUX_s_1_2_2(and_tmp_80, mux_tmp_189, nor_130_nl);
  mux_525_nl <= MUX_s_1_2_2(mux_524_nl, mux_523_nl, if_for_if_for_and_27_tmp);
  mux_529_nl <= MUX_s_1_2_2(mux_528_nl, mux_525_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_530_itm <= MUX_s_1_2_2(and_tmp_80, mux_529_nl, oif_1_unequal_tmp);
  nor_149_nl <= NOT(and_526_cse OR CONV_SL_1_1(W_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT W_irrel_cnt_sva_0));
  mux_540_nl <= MUX_s_1_2_2(and_tmp_81, mux_tmp_202, nor_149_nl);
  nor_147_nl <= NOT(and_526_cse OR CONV_SL_1_1(if_6_if_3_acc_tmp/=STD_LOGIC_VECTOR'("00001")));
  mux_539_nl <= MUX_s_1_2_2(and_tmp_81, mux_tmp_202, nor_147_nl);
  mux_541_nl <= MUX_s_1_2_2(mux_540_nl, mux_539_nl, W_mac_irrel_at_maxBuf_sva);
  nor_145_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(W_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT W_irrel_cnt_sva_0));
  mux_537_nl <= MUX_s_1_2_2(and_tmp_81, mux_tmp_202, nor_145_nl);
  nor_140_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(if_6_if_3_acc_tmp/=STD_LOGIC_VECTOR'("00001")));
  mux_536_nl <= MUX_s_1_2_2(and_tmp_81, mux_tmp_202, nor_140_nl);
  mux_538_nl <= MUX_s_1_2_2(mux_537_nl, mux_536_nl, if_for_if_for_and_28_tmp);
  mux_542_nl <= MUX_s_1_2_2(mux_541_nl, mux_538_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_543_itm <= MUX_s_1_2_2(and_tmp_81, mux_542_nl, oif_2_unequal_tmp);
  flags_top_1_1_sva_mx0c1 <= (NOT main_stage_0_2) AND (fsm_output(1));
  or_360_tmp <= (NOT mux_tmp_94) OR or_dcpl_226;
  skid_buf_top_peek_and_m1c <= (NOT skid_buf_top_push_nor_psp_mx0w0) AND skid_buf_top_peek_nor_m1c_1;
  or_364_tmp <= (NOT mux_tmp_96) OR or_dcpl_226;
  skid_buf_top_peek_and_4_m1c <= (NOT skid_buf_top_push_and_psp_1) AND skid_buf_top_peek_and_m1c_2;
  or_368_tmp <= (NOT mux_tmp_98) OR or_dcpl_226;
  skid_buf_top_peek_and_5_m1c <= (NOT skid_buf_top_push_and_1_psp_mx0w0) AND skid_buf_top_peek_and_m1c_3;
  if_5_if_and_3_m1c <= skid_buf_top_peek_nor_m1c_1 AND O_rd_data_rsci_idat_mx0c1;
  if_5_if_and_4_m1c <= skid_buf_top_rd_ptr_sva_0_mx1 AND (NOT skid_buf_top_rd_ptr_sva_1_mx1)
      AND O_rd_data_rsci_idat_mx0c1;
  if_5_if_and_5_m1c <= skid_buf_top_rd_ptr_sva_1_mx1 AND (NOT skid_buf_top_rd_ptr_sva_0_mx1)
      AND O_rd_data_rsci_idat_mx0c1;
  and_331_cse <= nand_73_cse AND (fsm_output(1));
  and_dcpl_34 <= or_svs_1 AND main_stage_0_2;
  or_dcpl <= operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1
      OR if_5_and_svs_1;
  mux_585_nl <= MUX_s_1_2_2((NOT O_rd_data_rsci_irdy_mxwt), O_rd_data_rsci_irdy_mxwt,
      operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1);
  or_tmp_299 <= if_5_and_svs_1 OR mux_585_nl;
  or_tmp_300 <= oif_2_unequal_tmp OR W_data_vld_sva_dfm_1_1;
  or_756_cse <= CONV_SL_1_1(O_instr_in_rsci_idat_mxwt(24 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000100001000010000100001"));
  not_tmp_156 <= NOT(or_756_cse AND reg_W_instr_in_rsci_oswt_cse_1);
  or_598_cse <= CONV_SL_1_1(z_out_3/=STD_LOGIC_VECTOR'("00"));
  nand_tmp <= NOT(or_598_cse AND not_tmp_156);
  or_601_cse <= CONV_SL_1_1(skid_buf_top_push_1_acc_1_tmp/=STD_LOGIC_VECTOR'("00"));
  or_600_cse <= CONV_SL_1_1(skid_buf_top_cnt_sva_1_1/=STD_LOGIC_VECTOR'("00"));
  nor_307_nl <= NOT(O_rd_data_rsci_irdy_mxwt OR (or_601_cse AND not_tmp_156));
  and_365_nl <= O_rd_data_rsci_irdy_mxwt AND nand_tmp;
  mux_587_nl <= MUX_s_1_2_2(nor_307_nl, and_365_nl, operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1);
  nand_96_nl <= NOT(or_600_cse AND not_tmp_156);
  mux_586_nl <= MUX_s_1_2_2(nand_96_nl, nand_tmp, O_rd_data_rsci_irdy_mxwt);
  mux_tmp_245 <= MUX_s_1_2_2(mux_587_nl, mux_586_nl, if_5_and_svs_1);
  mux_589_nl <= MUX_s_1_2_2(or_tmp_299, mux_tmp_245, and_295_cse);
  mux_tmp_247 <= MUX_s_1_2_2(mux_589_nl, mux_tmp_245, or_tmp_5);
  mux_592_nl <= MUX_s_1_2_2(or_tmp_299, mux_tmp_247, mux_124_itm_1);
  mux_591_nl <= MUX_s_1_2_2(or_tmp_299, mux_tmp_247, O_wr_data_rsci_ivld_mxwt);
  mux_593_nl <= MUX_s_1_2_2(mux_592_nl, mux_591_nl, land_9_lpi_1_dfm_1_1);
  mux_tmp_251 <= MUX_s_1_2_2(mux_593_nl, mux_tmp_247, or_1_cse);
  nor_215_cse <= NOT(CONV_SL_1_1(O_instr_in_rsci_idat_mxwt(24 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000100001000010000100001"))
      OR (NOT O_mac_irrel_at_max_sva) OR (NOT flags_top_1_1_sva));
  and_539_nl <= W_mac_irrel_at_maxBuf_sva AND nand_129_cse;
  nor_304_nl <= NOT(nor_215_cse OR CONV_SL_1_1(W_instr_in_rsci_idat_mxwt(24 DOWNTO
      0)/=STD_LOGIC_VECTOR'("0000100001000010000100001")));
  not_tmp_165 <= MUX_s_1_2_2(and_539_nl, nor_304_nl, reg_W_instr_in_rsci_oswt_cse_1);
  nand_tmp_39 <= NOT(or_tmp_10 AND not_tmp_165);
  and_535_nl <= I_mac_irrel_at_maxBuf_sva AND nand_129_cse;
  nor_301_nl <= NOT(nor_215_cse OR CONV_SL_1_1(I_instr_in_rsci_idat_mxwt(24 DOWNTO
      0)/=STD_LOGIC_VECTOR'("0000100001000010000100001")));
  not_tmp_172 <= MUX_s_1_2_2(and_535_nl, nor_301_nl, reg_W_instr_in_rsci_oswt_cse_1);
  nand_tmp_46 <= NOT(or_tmp_10 AND not_tmp_172);
  and_dcpl_58 <= reg_W_instr_in_rsci_oswt_cse_1 AND run_wen;
  nor_tmp_182 <= or_756_cse AND reg_W_instr_in_rsci_oswt_cse_1;
  and_tmp_102 <= or_tmp_10 AND nor_tmp_182;
  and_tmp_103 <= or_1_cse AND aif_equal_tmp AND data_zg_sva AND nor_tmp_182;
  and_tmp_104 <= or_tmp_10 AND and_tmp_103;
  nor_tmp_189 <= or_1_cse AND aif_equal_tmp AND data_zg_sva;
  and_tmp_107 <= or_tmp_10 AND nor_tmp_189;
  mux_636_nl <= MUX_s_1_2_2(or_601_cse, or_18_cse, operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1);
  mux_637_nl <= MUX_s_1_2_2(mux_636_nl, or_600_cse, if_5_and_svs_1);
  mux_635_nl <= MUX_s_1_2_2(or_18_cse, or_598_cse, or_dcpl);
  mux_638_nl <= MUX_s_1_2_2(mux_637_nl, mux_635_nl, O_rd_data_rsci_irdy_mxwt);
  mux_tmp_296 <= MUX_s_1_2_2(or_18_cse, mux_638_nl, or_svs_1);
  not_tmp_191 <= nand_129_cse AND mux_tmp_296;
  not_tmp_193 <= NOT(nor_tmp_182 OR (NOT O_mac_irrel_at_max_sva) OR flags_top_1_1_sva
      OR (NOT mux_tmp_296));
  and_516_nl <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21
      AND not_tmp_191;
  mux_640_nl <= MUX_s_1_2_2(not_tmp_191, mux_tmp_296, reg_W_instr_in_rsci_oswt_cse_1);
  and_425_nl <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21
      AND mux_640_nl;
  mux_641_nl <= MUX_s_1_2_2(and_516_nl, and_425_nl, or_756_cse);
  mux_642_itm <= MUX_s_1_2_2(not_tmp_193, mux_641_nl, or_tmp_10);
  nor_tmp_217 <= (fsm_output(1)) AND reg_W_instr_in_rsci_oswt_cse_1;
  mux_662_nl <= MUX_s_1_2_2((fsm_output(1)), reg_W_instr_in_rsci_oswt_cse_1, and_526_cse);
  mux_661_nl <= MUX_s_1_2_2((fsm_output(1)), nor_tmp_217, and_526_cse);
  mux_663_itm <= MUX_s_1_2_2(mux_662_nl, mux_661_nl, or_756_cse);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_W_instr_in_rsci_oswt_cse_1 <= '0';
        reg_wr_data_zero_guard_rsci_oswt_cse <= '0';
        reg_W_wr_data_rsci_irdy_run_psct_cse <= '0';
        reg_I_wr_data_rsci_irdy_run_psct_cse <= '0';
        reg_O_rd_data_rsci_ivld_run_psct_cse <= '0';
        reg_O_wr_data_rsci_irdy_run_psct_cse <= '0';
        W_data_vld_sva_dfm_1_1 <= '0';
        I_data_vld_sva_dfm_1_1 <= '0';
        land_9_lpi_1_dfm_1_1 <= '0';
        mac_data_data_sva_dfm_2_1 <= STD_LOGIC_VECTOR'( "0000000000000000");
        operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1 <=
            '0';
        if_5_and_svs_1 <= '0';
        or_svs_1 <= '0';
        mux_124_itm_1 <= '0';
        data_zg_sva <= '0';
        main_stage_0_2 <= '0';
      ELSIF ( run_wen = '1' ) THEN
        reg_W_instr_in_rsci_oswt_cse_1 <= NOT (fsm_output(1));
        reg_wr_data_zero_guard_rsci_oswt_cse <= NOT(operator_2_false_5_operator_2_false_5_operator_2_false_5_or_cse
            AND (fsm_output(1)));
        reg_W_wr_data_rsci_irdy_run_psct_cse <= (mux_355_nl OR (NOT(or_558_cse AND
            main_stage_0_2))) AND (fsm_output(1));
        reg_I_wr_data_rsci_irdy_run_psct_cse <= (mux_360_nl OR (NOT(or_557_cse AND
            main_stage_0_2))) AND (fsm_output(1));
        reg_O_rd_data_rsci_ivld_run_psct_cse <= mux_388_nl AND (fsm_output(1));
        reg_O_wr_data_rsci_irdy_run_psct_cse <= or_tmp_242;
        W_data_vld_sva_dfm_1_1 <= MUX_s_1_2_2(if_6_if_6_and_3_nl, W_data_vld_sva_mx0,
            mux_tmp_76);
        I_data_vld_sva_dfm_1_1 <= MUX_s_1_2_2(if_6_if_6_and_nl, I_data_vld_sva_mx0,
            mux_tmp_76);
        land_9_lpi_1_dfm_1_1 <= land_9_lpi_1_dfm_1;
        mac_data_data_sva_dfm_2_1 <= mac_data_data_sva_dfm_3;
        operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1_1 <=
            operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1;
        if_5_and_svs_1 <= land_5_lpi_1_dfm_1 AND operator_2_false_1_operator_2_false_1_operator_2_false_1_or_cse_sva_1;
        or_svs_1 <= land_5_lpi_1_dfm_1 OR CONV_SL_1_1(skid_buf_top_cnt_sva_mx1/=STD_LOGIC_VECTOR'("00"));
        mux_124_itm_1 <= MUX_s_1_2_2(if_6_if_6_and_9_nl, O_write_flag_sva_mx0, mux_tmp_76);
        data_zg_sva <= NOT((NOT(mux_123_nl OR else_8_land_lpi_1_dfm_mx1)) OR land_9_lpi_1_dfm_1);
        main_stage_0_2 <= fsm_output(1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_rd_data_rsci_idat <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (O_rd_data_rsci_idat_mx0c0 OR O_rd_data_rsci_idat_mx0c1
          OR O_rd_data_rsci_idat_mx0c2)) = '1' ) THEN
        O_rd_data_rsci_idat <= MUX1HOT_v_16_5_2(mac_data_data_sva_dfm_2_1, skid_buf_top_regs_data_0_0_sva,
            mac_data_data_sva_dfm_3, skid_buf_top_regs_data_1_0_sva, skid_buf_top_regs_data_2_0_sva,
            STD_LOGIC_VECTOR'( if_5_if_or_nl & if_5_if_or_2_nl & if_5_if_or_3_nl
            & if_5_if_or_4_nl & if_5_if_or_5_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        flags_wr_zero_guard_sva <= '0';
      ELSIF ( flags_wr_zero_guard_and_cse = '1' ) THEN
        flags_wr_zero_guard_sva <= operator_2_false_5_operator_2_false_5_operator_2_false_5_or_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_21)) = '1' ) THEN
        W_mem_0_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_29)) = '1' ) THEN
        W_mem_1_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_2_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_32)) = '1' ) THEN
        W_mem_2_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_3_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_33)) = '1' ) THEN
        W_mem_3_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_4_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_36)) = '1' ) THEN
        W_mem_4_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_5_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_39)) = '1' ) THEN
        W_mem_5_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_6_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_40)) = '1' ) THEN
        W_mem_6_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_7_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_41)) = '1' ) THEN
        W_mem_7_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_8_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_44)) = '1' ) THEN
        W_mem_8_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_9_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_45)) = '1' ) THEN
        W_mem_9_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_10_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_48)) = '1' ) THEN
        W_mem_10_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_11_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_49)) = '1' ) THEN
        W_mem_11_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_12_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_50)) = '1' ) THEN
        W_mem_12_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_13_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_51)) = '1' ) THEN
        W_mem_13_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_14_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_52)) = '1' ) THEN
        W_mem_14_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_15_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_53)) = '1' ) THEN
        W_mem_15_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_16_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_55)) = '1' ) THEN
        W_mem_16_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_17_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_57)) = '1' ) THEN
        W_mem_17_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_18_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_58)) = '1' ) THEN
        W_mem_18_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_19_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_59)) = '1' ) THEN
        W_mem_19_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_20_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_61)) = '1' ) THEN
        W_mem_20_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_21_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_63)) = '1' ) THEN
        W_mem_21_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_22_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_64)) = '1' ) THEN
        W_mem_22_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_23_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_65)) = '1' ) THEN
        W_mem_23_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_24_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_66)) = '1' ) THEN
        W_mem_24_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_25_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_67)) = '1' ) THEN
        W_mem_25_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_26_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_68)) = '1' ) THEN
        W_mem_26_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_27_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_69)) = '1' ) THEN
        W_mem_27_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_28_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_70)) = '1' ) THEN
        W_mem_28_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_29_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_71)) = '1' ) THEN
        W_mem_29_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_30_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_72)) = '1' ) THEN
        W_mem_30_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mem_31_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_73)) = '1' ) THEN
        W_mem_31_sva <= W_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mac_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
        O_mac_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
        W_irrel_cnt_sva_0 <= '0';
        I_irrel_cnt_sva_0 <= '0';
        O_mac_counter_4_sva <= STD_LOGIC_VECTOR'( "00000");
        O_mac_counter_3_sva <= STD_LOGIC_VECTOR'( "00000");
        O_mac_counter_2_sva <= STD_LOGIC_VECTOR'( "00000");
        O_mac_counter_1_sva <= STD_LOGIC_VECTOR'( "00000");
        O_mac_counter_0_sva <= STD_LOGIC_VECTOR'( "00000");
        W_mac_counter_4_sva <= STD_LOGIC_VECTOR'( "00000");
        W_mac_counter_3_sva <= STD_LOGIC_VECTOR'( "00000");
        W_mac_counter_2_sva <= STD_LOGIC_VECTOR'( "00000");
        W_mac_counter_1_sva <= STD_LOGIC_VECTOR'( "00000");
        W_mac_counter_0_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_counter_4_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_counter_3_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_counter_2_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_counter_1_sva <= STD_LOGIC_VECTOR'( "00000");
        I_mac_counter_0_sva <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( W_mac_pntr_and_cse = '1' ) THEN
        W_mac_pntr_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_19;
        I_mac_pntr_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_20;
        O_mac_pntr_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_18;
        W_irrel_cnt_sva_0 <= (W_irrel_cnt_sva_dfm_mx0(0)) AND if_6_unequal_tmp_2;
        I_irrel_cnt_sva_0 <= (I_irrel_cnt_sva_dfm_mx0(0)) AND if_6_unequal_tmp_3;
        O_mac_counter_4_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24(24
            DOWNTO 20);
        O_mac_counter_3_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24(19
            DOWNTO 15);
        O_mac_counter_2_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24(14
            DOWNTO 10);
        O_mac_counter_1_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24(9
            DOWNTO 5);
        O_mac_counter_0_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_24(4
            DOWNTO 0);
        W_mac_counter_4_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29(24
            DOWNTO 20);
        W_mac_counter_3_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29(19
            DOWNTO 15);
        W_mac_counter_2_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29(14
            DOWNTO 10);
        W_mac_counter_1_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29(9
            DOWNTO 5);
        W_mac_counter_0_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_29(4
            DOWNTO 0);
        I_mac_counter_4_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34(24
            DOWNTO 20);
        I_mac_counter_3_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34(19
            DOWNTO 15);
        I_mac_counter_2_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34(14
            DOWNTO 10);
        I_mac_counter_1_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34(9
            DOWNTO 5);
        I_mac_counter_0_sva <= libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_34(4
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_80)) = '1' ) THEN
        I_mem_0_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_88)) = '1' ) THEN
        I_mem_1_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_2_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_91)) = '1' ) THEN
        I_mem_2_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_3_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_92)) = '1' ) THEN
        I_mem_3_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_4_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_95)) = '1' ) THEN
        I_mem_4_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_5_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_98)) = '1' ) THEN
        I_mem_5_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_6_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_99)) = '1' ) THEN
        I_mem_6_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_7_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_100)) = '1' ) THEN
        I_mem_7_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_8_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_103)) = '1' ) THEN
        I_mem_8_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_9_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_104)) = '1' ) THEN
        I_mem_9_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_10_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_107)) = '1' ) THEN
        I_mem_10_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_11_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_108)) = '1' ) THEN
        I_mem_11_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_12_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_109)) = '1' ) THEN
        I_mem_12_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_13_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_110)) = '1' ) THEN
        I_mem_13_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_14_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_111)) = '1' ) THEN
        I_mem_14_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_15_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_112)) = '1' ) THEN
        I_mem_15_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_16_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_114)) = '1' ) THEN
        I_mem_16_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_17_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_115)) = '1' ) THEN
        I_mem_17_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_18_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_117)) = '1' ) THEN
        I_mem_18_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_19_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_118)) = '1' ) THEN
        I_mem_19_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_20_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_119)) = '1' ) THEN
        I_mem_20_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_21_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_120)) = '1' ) THEN
        I_mem_21_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_22_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_121)) = '1' ) THEN
        I_mem_22_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_23_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_122)) = '1' ) THEN
        I_mem_23_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_24_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_124)) = '1' ) THEN
        I_mem_24_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_25_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_125)) = '1' ) THEN
        I_mem_25_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_26_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_127)) = '1' ) THEN
        I_mem_26_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_27_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_128)) = '1' ) THEN
        I_mem_27_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_28_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_129)) = '1' ) THEN
        I_mem_28_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_29_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_130)) = '1' ) THEN
        I_mem_29_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_30_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_131)) = '1' ) THEN
        I_mem_30_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_mem_31_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_dcpl_132)) = '1' ) THEN
        I_mem_31_sva <= I_wr_data_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        else_3_land_lpi_1_dfm <= '0';
      ELSIF ( (run_wen AND (NOT(mux_419_nl OR ((mux_tmp_84 OR (NOT main_stage_0_2))
          AND (fsm_output(0)))))) = '1' ) THEN
        else_3_land_lpi_1_dfm <= else_3_land_lpi_1_dfm_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_138)))
          = '1' ) THEN
        O_mem_0_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_143)))
          = '1' ) THEN
        O_mem_1_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_2_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_147)))
          = '1' ) THEN
        O_mem_2_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_3_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_151)))
          = '1' ) THEN
        O_mem_3_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_4_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_155)))
          = '1' ) THEN
        O_mem_4_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_5_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_158)))
          = '1' ) THEN
        O_mem_5_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_6_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_161)))
          = '1' ) THEN
        O_mem_6_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_7_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_164)))
          = '1' ) THEN
        O_mem_7_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_8_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_168)))
          = '1' ) THEN
        O_mem_8_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_9_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_171)))
          = '1' ) THEN
        O_mem_9_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_10_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_174)))
          = '1' ) THEN
        O_mem_10_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_11_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_177)))
          = '1' ) THEN
        O_mem_11_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_12_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_181)))
          = '1' ) THEN
        O_mem_12_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_13_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_184)))
          = '1' ) THEN
        O_mem_13_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_14_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_187)))
          = '1' ) THEN
        O_mem_14_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_15_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_139 OR or_dcpl_190)))
          = '1' ) THEN
        O_mem_15_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_16_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_138)))
          = '1' ) THEN
        O_mem_16_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_17_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_143)))
          = '1' ) THEN
        O_mem_17_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_18_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_147)))
          = '1' ) THEN
        O_mem_18_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_19_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_151)))
          = '1' ) THEN
        O_mem_19_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_20_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_155)))
          = '1' ) THEN
        O_mem_20_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_21_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_158)))
          = '1' ) THEN
        O_mem_21_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_22_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_161)))
          = '1' ) THEN
        O_mem_22_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_23_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_164)))
          = '1' ) THEN
        O_mem_23_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_24_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_168)))
          = '1' ) THEN
        O_mem_24_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_25_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_171)))
          = '1' ) THEN
        O_mem_25_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_26_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_174)))
          = '1' ) THEN
        O_mem_26_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_27_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_177)))
          = '1' ) THEN
        O_mem_27_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_28_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_181)))
          = '1' ) THEN
        O_mem_28_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_29_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_184)))
          = '1' ) THEN
        O_mem_29_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_30_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_187)))
          = '1' ) THEN
        O_mem_30_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mem_31_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT((NOT mux_426_itm) OR or_dcpl_193 OR or_dcpl_190)))
          = '1' ) THEN
        O_mem_31_sva <= mac_data_data_sva_dfm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_regs_data_0_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_359_cse)) = '1' ) THEN
        skid_buf_top_regs_data_0_0_sva <= mac_data_data_sva_dfm_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_regs_data_1_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_363_cse)) = '1' ) THEN
        skid_buf_top_regs_data_1_0_sva <= mac_data_data_sva_dfm_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_regs_data_2_0_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (run_wen AND (NOT or_367_cse)) = '1' ) THEN
        skid_buf_top_regs_data_2_0_sva <= mac_data_data_sva_dfm_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_write_data_data_sva <= STD_LOGIC_VECTOR'( "0000000000000000");
      ELSIF ( (land_9_lpi_1_dfm_1_1 AND run_wen) = '1' ) THEN
        O_write_data_data_sva <= O_write_data_data_sva_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_wr_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (run_wen AND (NOT(or_dcpl_19 OR (NOT main_stage_0_2)))) = '1' ) THEN
        W_wr_pntr_sva <= W_wr_pntr_sva_dfm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_wr_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (run_wen AND (NOT(or_dcpl_78 OR (NOT main_stage_0_2)))) = '1' ) THEN
        I_wr_pntr_sva <= I_wr_pntr_sva_dfm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_rd_ptr_sva_0 <= '0';
        skid_buf_top_rd_ptr_sva_1 <= '0';
      ELSIF ( skid_buf_top_rd_ptr_and_cse = '1' ) THEN
        skid_buf_top_rd_ptr_sva_0 <= skid_buf_top_pop_skid_buf_top_pop_and_4_itm;
        skid_buf_top_rd_ptr_sva_1 <= skid_buf_top_pop_skid_buf_top_pop_and_2_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_cnt_sva <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (mux_597_nl AND and_dcpl_34 AND (NOT (fsm_output(0))) AND run_wen)
          = '1' ) THEN
        skid_buf_top_cnt_sva <= skid_buf_top_cnt_sva_mx1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_wr_ptr_sva_0 <= '0';
        skid_buf_top_wr_ptr_sva_1 <= '0';
      ELSIF ( and_370_cse = '1' ) THEN
        skid_buf_top_wr_ptr_sva_0 <= skid_buf_top_wr_ptr_sva_0_mx0w0;
        skid_buf_top_wr_ptr_sva_1 <= skid_buf_top_wr_ptr_sva_1_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_irrel_cnt_sva_4_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (mux_601_nl AND run_wen AND (NOT (fsm_output(0)))) = '1' ) THEN
        W_irrel_cnt_sva_4_1 <= W_irrel_cnt_sva_dfm_mx0(4 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_irrel_cnt_sva_4_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (mux_605_nl AND run_wen AND (NOT (fsm_output(0)))) = '1' ) THEN
        I_irrel_cnt_sva_4_1 <= I_irrel_cnt_sva_dfm_mx0(4 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_instr_in_crt_lpi_1_dfm <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
        I_instr_in_crt_lpi_1_dfm_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
        W_instr_in_crt_lpi_1_dfm_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000");
      ELSIF ( and_dcpl_58 = '1' ) THEN
        O_instr_in_crt_lpi_1_dfm <= O_instr_in_crt_lpi_1_dfm_mx0;
        I_instr_in_crt_lpi_1_dfm_1 <= I_instr_in_crt_lpi_1_dfm_1_mx0;
        W_instr_in_crt_lpi_1_dfm_1 <= W_instr_in_crt_lpi_1_dfm_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_vld_zg_pntr_sva <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (mux_614_nl AND run_wen AND (NOT (fsm_output(0)))) = '1' ) THEN
        O_vld_zg_pntr_sva <= if_6_if_6_mux1h_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_data_vld_sva <= '0';
      ELSIF ( (run_wen AND ((NOT(and_dcpl_28 OR ((NOT((NOT((NOT mux_460_cse) AND
          or_dcpl_14 AND aif_7_equal_tmp)) AND main_stage_0_2)) AND (fsm_output(0)))))
          OR O_data_vld_sva_mx0c1)) = '1' ) THEN
        O_data_vld_sva <= MUX_s_1_2_2(O_data_vld_sva_dfm_4_mx0w0, else_8_else_8_or_2_nl,
            O_data_vld_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        else_8_land_lpi_1_dfm <= '0';
      ELSIF ( (run_wen AND mux_490_nl AND (NOT((NOT(mux_517_nl AND main_stage_0_2))
          AND (fsm_output(0))))) = '1' ) THEN
        else_8_land_lpi_1_dfm <= else_8_land_lpi_1_dfm_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_mac_irrel_at_maxBuf_sva <= '0';
        I_mac_irrel_at_maxBuf_sva <= '0';
      ELSIF ( W_mac_irrel_at_maxBuf_and_cse = '1' ) THEN
        W_mac_irrel_at_maxBuf_sva <= MUX_s_1_2_2(libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_26,
            if_for_if_for_and_28_tmp, mux_tmp_76);
        I_mac_irrel_at_maxBuf_sva <= MUX_s_1_2_2(libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_31,
            if_for_if_for_and_27_tmp, mux_tmp_76);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mac_tile_bound_4_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        O_mac_tile_bound_3_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        O_mac_tile_bound_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        O_mac_tile_bound_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        O_mac_tile_bound_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        W_mac_tile_bound_4_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        W_mac_tile_bound_3_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        W_mac_tile_bound_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        W_mac_tile_bound_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        W_mac_tile_bound_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        I_mac_tile_bound_4_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        I_mac_tile_bound_3_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        I_mac_tile_bound_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        I_mac_tile_bound_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
        I_mac_tile_bound_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( and_395_cse = '1' ) THEN
        O_mac_tile_bound_4_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25(24
            DOWNTO 20)), O_mac_tile_bound_4_lpi_1_dfm_mx0, mux_tmp_76);
        O_mac_tile_bound_3_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25(19
            DOWNTO 15)), O_mac_tile_bound_3_lpi_1_dfm_mx0, mux_tmp_76);
        O_mac_tile_bound_2_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25(14
            DOWNTO 10)), O_mac_tile_bound_2_lpi_1_dfm_mx0, mux_tmp_76);
        O_mac_tile_bound_1_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25(9
            DOWNTO 5)), O_mac_tile_bound_1_lpi_1_dfm_mx0, mux_tmp_76);
        O_mac_tile_bound_0_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_25(4
            DOWNTO 0)), O_mac_tile_bound_0_lpi_1_dfm_mx0, mux_tmp_76);
        W_mac_tile_bound_4_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30(24
            DOWNTO 20)), W_mac_tile_bound_4_lpi_1_dfm_mx0, mux_tmp_76);
        W_mac_tile_bound_3_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30(19
            DOWNTO 15)), W_mac_tile_bound_3_lpi_1_dfm_mx0, mux_tmp_76);
        W_mac_tile_bound_2_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30(14
            DOWNTO 10)), W_mac_tile_bound_2_lpi_1_dfm_mx0, mux_tmp_76);
        W_mac_tile_bound_1_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30(9
            DOWNTO 5)), W_mac_tile_bound_1_lpi_1_dfm_mx0, mux_tmp_76);
        W_mac_tile_bound_0_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_30(4
            DOWNTO 0)), W_mac_tile_bound_0_lpi_1_dfm_mx0, mux_tmp_76);
        I_mac_tile_bound_4_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35(24
            DOWNTO 20)), I_mac_tile_bound_4_lpi_1_dfm_mx0, mux_tmp_76);
        I_mac_tile_bound_3_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35(19
            DOWNTO 15)), I_mac_tile_bound_3_lpi_1_dfm_mx0, mux_tmp_76);
        I_mac_tile_bound_2_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35(14
            DOWNTO 10)), I_mac_tile_bound_2_lpi_1_dfm_mx0, mux_tmp_76);
        I_mac_tile_bound_1_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35(9
            DOWNTO 5)), I_mac_tile_bound_1_lpi_1_dfm_mx0, mux_tmp_76);
        I_mac_tile_bound_0_lpi_1 <= MUX_v_5_2_2((libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_35(4
            DOWNTO 0)), I_mac_tile_bound_0_lpi_1_dfm_mx0, mux_tmp_76);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_write_flag_sva <= '0';
      ELSIF ( ((NOT W_data_vld_sva_dfm_1_1) AND run_wen) = '1' ) THEN
        W_write_flag_sva <= W_write_flag_sva_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_write_flag_sva <= '0';
      ELSIF ( ((NOT I_data_vld_sva_dfm_1_1) AND run_wen) = '1' ) THEN
        I_write_flag_sva <= I_write_flag_sva_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_cnt_sva_1_1 <= STD_LOGIC_VECTOR'( "00");
        skid_buf_top_wr_ptr_sva_dfm_1_1 <= '0';
      ELSIF ( skid_buf_top_cnt_and_1_cse = '1' ) THEN
        skid_buf_top_cnt_sva_1_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(skid_buf_top_cnt_sva_mx1)
            + UNSIGNED'( "01"), 2));
        skid_buf_top_wr_ptr_sva_dfm_1_1 <= skid_buf_top_push_and_psp_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        if_5_if_nbw_stat_sva <= '0';
      ELSIF ( (flags_wr_zero_guard_and_cse AND ((NOT mux_341_nl) OR (NOT O_mac_irrel_at_max_sva_dfm_mx0)
          OR flags_top_1_1_sva) AND (NOT(or_dcpl_226 OR (NOT if_5_and_svs_1)))) =
          '1' ) THEN
        if_5_if_nbw_stat_sva <= O_rd_data_rsci_irdy_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        I_vld_pntr_sva_dfm_1_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (run_wen AND (NOT(main_stage_0_2 AND (NOT mux_530_itm)))) = '1' ) THEN
        I_vld_pntr_sva_dfm_1_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_20,
            mux_530_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        W_vld_pntr_sva_dfm_1_1 <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (run_wen AND (NOT(main_stage_0_2 AND (NOT mux_543_itm)))) = '1' ) THEN
        W_vld_pntr_sva_dfm_1_1 <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_19,
            mux_543_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        aif_2_land_1_lpi_1_dfm <= '0';
        aif_3_land_lpi_1_dfm <= '0';
      ELSIF ( and_426_cse = '1' ) THEN
        aif_2_land_1_lpi_1_dfm <= aif_2_land_1_lpi_1_dfm_mx0;
        aif_3_land_lpi_1_dfm <= aif_3_land_lpi_1_dfm_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        O_mac_irrel_at_max_sva <= '1';
      ELSIF ( (mux_672_nl AND run_wen) = '1' ) THEN
        O_mac_irrel_at_max_sva <= MUX_s_1_2_2(libraries_O_addr_cnt_5_O_addr_type_L1_1_7448a59bcc55848f49259c21df88d8bc12ff1_21,
            O_mac_irrel_at_max_sva_dfm_mx0, or_531_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_wr_zero_guard_regs_1_sva_dfm_1 <= '0';
      ELSIF ( (run_wen AND (NOT or_dcpl_246)) = '1' ) THEN
        skid_buf_wr_zero_guard_regs_1_sva_dfm_1 <= wr_data_zero_guard_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_wr_zero_guard_regs_0_sva_dfm_1 <= '0';
      ELSIF ( (run_wen AND (NOT(or_dcpl_248 OR (fsm_output(0))))) = '1' ) THEN
        skid_buf_wr_zero_guard_regs_0_sva_dfm_1 <= wr_data_zero_guard_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_wr_zero_guard_cnt_sva <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( ((mux_675_nl OR and_432_cse) AND (NOT (fsm_output(0))) AND run_wen)
          = '1' ) THEN
        skid_buf_wr_zero_guard_cnt_sva <= mux1h_1_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_wr_zero_guard_wr_ptr_sva <= '0';
      ELSIF ( (run_wen AND (NOT(or_tmp_162 OR (fsm_output(0))))) = '1' ) THEN
        skid_buf_wr_zero_guard_wr_ptr_sva <= NOT skid_buf_wr_zero_guard_wr_ptr_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_wr_zero_guard_rd_ptr_sva <= '0';
      ELSIF ( (run_wen AND ((else_8_land_lpi_1_dfm_mx0w0 AND (NOT (fsm_output(0))))
          OR or_tmp_242)) = '1' ) THEN
        skid_buf_wr_zero_guard_rd_ptr_sva <= NOT skid_buf_wr_zero_guard_rd_ptr_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        flags_top_1_1_sva <= '0';
      ELSIF ( (run_wen AND (main_stage_0_2 OR flags_top_1_1_sva_mx0c1)) = '1' ) THEN
        flags_top_1_1_sva <= NOT((NOT(CONV_SL_1_1(mux1h_7_tmp/=STD_LOGIC_VECTOR'("00"))))
            OR flags_top_1_1_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        skid_buf_top_push_nor_psp <= '0';
        skid_buf_top_push_and_psp <= '0';
        skid_buf_top_push_and_1_psp <= '0';
      ELSIF ( skid_buf_top_push_and_2_cse = '1' ) THEN
        skid_buf_top_push_nor_psp <= skid_buf_top_push_nor_psp_mx0w0;
        skid_buf_top_push_and_psp <= skid_buf_top_push_and_psp_1;
        skid_buf_top_push_and_1_psp <= skid_buf_top_push_and_1_psp_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  nor_182_nl <= NOT(and_526_cse OR CONV_SL_1_1(W_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_9);
  nor_183_nl <= NOT(and_526_cse OR CONV_SL_1_1(if_6_if_3_acc_tmp(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_8);
  mux_354_nl <= MUX_s_1_2_2(nor_182_nl, nor_183_nl, W_mac_irrel_at_maxBuf_sva);
  nor_184_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(W_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_9);
  nor_185_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(if_6_if_3_acc_tmp(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_8);
  mux_353_nl <= MUX_s_1_2_2(nor_184_nl, nor_185_nl, if_for_if_for_and_28_tmp);
  mux_355_nl <= MUX_s_1_2_2(mux_354_nl, mux_353_nl, reg_W_instr_in_rsci_oswt_cse_1);
  nor_178_nl <= NOT(and_526_cse OR CONV_SL_1_1(I_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_15);
  nor_179_nl <= NOT(and_526_cse OR CONV_SL_1_1(if_6_if_1_acc_tmp(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_14);
  mux_359_nl <= MUX_s_1_2_2(nor_178_nl, nor_179_nl, I_mac_irrel_at_maxBuf_sva);
  nor_180_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(I_irrel_cnt_sva_4_1/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_15);
  nor_181_nl <= NOT(nor_tmp_8 OR CONV_SL_1_1(if_6_if_1_acc_tmp(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_14);
  mux_358_nl <= MUX_s_1_2_2(nor_180_nl, nor_181_nl, if_for_if_for_and_27_tmp);
  mux_360_nl <= MUX_s_1_2_2(mux_359_nl, mux_358_nl, reg_W_instr_in_rsci_oswt_cse_1);
  mux_386_nl <= MUX_s_1_2_2(or_18_cse, or_tmp_73, nor_tmp_26);
  mux_385_nl <= MUX_s_1_2_2(or_18_cse, or_tmp_73, nor_tmp_25);
  mux_387_nl <= MUX_s_1_2_2(mux_386_nl, mux_385_nl, reg_W_instr_in_rsci_oswt_cse_1);
  and_293_nl <= O_mac_irrel_at_max_sva AND and_306_cse;
  and_294_nl <= if_for_if_for_and_26_tmp AND and_306_cse;
  mux_384_nl <= MUX_s_1_2_2(and_293_nl, and_294_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_97_nl <= CONV_SL_1_1(mux1h_7_tmp/=STD_LOGIC_VECTOR'("00")) OR mux_384_nl;
  mux_388_nl <= MUX_s_1_2_2(mux_387_nl, or_97_nl, main_stage_0_2);
  if_6_if_6_and_3_nl <= W_data_vld_sva_mx0 AND if_6_unequal_tmp_2;
  if_6_if_6_and_nl <= I_data_vld_sva_mx0 AND if_6_unequal_tmp_3;
  if_6_if_6_and_9_nl <= O_write_flag_sva_mx0 AND land_lpi_1_dfm_1;
  if_6_if_if_6_if_and_nl <= data_zg_sva AND (NOT if_6_else_if_equal_tmp);
  if_6_mux_3_nl <= MUX_s_1_2_2(data_zg_sva, if_6_if_if_6_if_and_nl, land_lpi_1_dfm_1);
  mux_123_nl <= MUX_s_1_2_2(data_zg_sva, if_6_mux_3_nl, lor_4_lpi_1_dfm_1);
  if_5_if_or_nl <= ((((NOT or_360_tmp) AND skid_buf_top_peek_and_m1c) OR ((NOT or_364_tmp)
      AND skid_buf_top_peek_and_4_m1c) OR ((NOT or_368_tmp) AND skid_buf_top_peek_and_5_m1c))
      AND O_rd_data_rsci_idat_mx0c0) OR ((NOT or_359_cse) AND if_5_if_and_3_m1c)
      OR ((NOT or_363_cse) AND if_5_if_and_4_m1c) OR ((NOT or_367_cse) AND if_5_if_and_5_m1c);
  if_5_if_or_2_nl <= (or_360_tmp AND skid_buf_top_peek_and_m1c AND O_rd_data_rsci_idat_mx0c0)
      OR (or_359_cse AND if_5_if_and_3_m1c);
  if_5_if_or_3_nl <= (((skid_buf_top_push_nor_psp_mx0w0 AND skid_buf_top_peek_nor_m1c_1)
      OR (skid_buf_top_push_and_psp_1 AND skid_buf_top_peek_and_m1c_2) OR (skid_buf_top_push_and_1_psp_mx0w0
      AND skid_buf_top_peek_and_m1c_3)) AND O_rd_data_rsci_idat_mx0c0) OR O_rd_data_rsci_idat_mx0c2;
  if_5_if_or_4_nl <= (or_364_tmp AND skid_buf_top_peek_and_4_m1c AND O_rd_data_rsci_idat_mx0c0)
      OR (or_363_cse AND if_5_if_and_4_m1c);
  if_5_if_or_5_nl <= (or_368_tmp AND skid_buf_top_peek_and_5_m1c AND O_rd_data_rsci_idat_mx0c0)
      OR (or_367_cse AND if_5_if_and_5_m1c);
  nand_37_nl <= NOT(oif_1_unequal_tmp AND oif_2_unequal_tmp AND oif_unequal_tmp AND
      (NOT and_tmp_56));
  nand_36_nl <= NOT(oif_1_unequal_tmp AND oif_2_unequal_tmp AND (NOT and_tmp_56));
  mux_418_nl <= MUX_s_1_2_2(nand_37_nl, nand_36_nl, O_data_vld_sva);
  nor_175_nl <= NOT(land_lpi_1_dfm_1 OR mux_418_nl);
  mux_419_nl <= MUX_s_1_2_2(nor_175_nl, mux_tmp_84, main_stage_0_2);
  mux_595_nl <= MUX_s_1_2_2(or_tmp_299, mux_tmp_251, and_541_cse);
  mux_596_nl <= MUX_s_1_2_2(mux_595_nl, mux_tmp_251, or_tmp_300);
  or_593_nl <= (NOT O_mac_irrel_at_max_sva) OR flags_top_1_1_sva;
  mux_597_nl <= MUX_s_1_2_2(mux_596_nl, or_tmp_299, or_593_nl);
  and_537_nl <= oif_2_unequal_tmp AND or_1_cse AND oif_1_unequal_tmp AND not_tmp_165;
  nand_101_nl <= NOT(mux_124_itm_1 AND (NOT nand_tmp_39));
  nand_100_nl <= NOT(O_wr_data_rsci_ivld_mxwt AND (NOT nand_tmp_39));
  mux_599_nl <= MUX_s_1_2_2(nand_101_nl, nand_100_nl, land_9_lpi_1_dfm_1_1);
  mux_600_nl <= MUX_s_1_2_2(mux_599_nl, nand_tmp_39, or_1_cse);
  nor_302_nl <= NOT(nor_303_cse OR mux_600_nl);
  mux_601_nl <= MUX_s_1_2_2(and_537_nl, nor_302_nl, main_stage_0_2);
  and_533_nl <= oif_2_unequal_tmp AND or_1_cse AND oif_1_unequal_tmp AND not_tmp_172;
  nand_108_nl <= NOT(mux_124_itm_1 AND (NOT nand_tmp_46));
  nand_107_nl <= NOT(O_wr_data_rsci_ivld_mxwt AND (NOT nand_tmp_46));
  mux_603_nl <= MUX_s_1_2_2(nand_108_nl, nand_107_nl, land_9_lpi_1_dfm_1_1);
  mux_604_nl <= MUX_s_1_2_2(mux_603_nl, nand_tmp_46, or_1_cse);
  nor_299_nl <= NOT(nor_303_cse OR mux_604_nl);
  mux_605_nl <= MUX_s_1_2_2(and_533_nl, nor_299_nl, main_stage_0_2);
  and_388_nl <= oif_2_unequal_tmp AND oif_1_unequal_tmp AND nor_tmp_189;
  mux_611_nl <= MUX_s_1_2_2(and_tmp_107, or_tmp_10, mux_124_itm_1);
  mux_610_nl <= MUX_s_1_2_2(and_tmp_107, or_tmp_10, O_wr_data_rsci_ivld_mxwt);
  mux_612_nl <= MUX_s_1_2_2(mux_611_nl, mux_610_nl, land_9_lpi_1_dfm_1_1);
  and_387_nl <= or_620_cse AND mux_612_nl;
  mux_613_nl <= MUX_s_1_2_2(and_388_nl, and_387_nl, main_stage_0_2);
  and_385_nl <= oif_2_unequal_tmp AND oif_1_unequal_tmp AND and_tmp_103;
  mux_607_nl <= MUX_s_1_2_2(and_tmp_104, and_tmp_102, mux_124_itm_1);
  mux_606_nl <= MUX_s_1_2_2(and_tmp_104, and_tmp_102, O_wr_data_rsci_ivld_mxwt);
  mux_608_nl <= MUX_s_1_2_2(mux_607_nl, mux_606_nl, land_9_lpi_1_dfm_1_1);
  and_384_nl <= or_620_cse AND mux_608_nl;
  mux_609_nl <= MUX_s_1_2_2(and_385_nl, and_384_nl, main_stage_0_2);
  mux_614_nl <= MUX_s_1_2_2(mux_613_nl, mux_609_nl, and_526_cse);
  else_8_else_8_or_2_nl <= O_data_vld_sva_dfm_4_mx0 OR else_8_land_lpi_1_dfm_mx0w0;
  mux_488_nl <= MUX_s_1_2_2(mux_tmp_153, mux_tmp_143, mux_124_itm_1);
  mux_487_nl <= MUX_s_1_2_2(mux_tmp_153, mux_tmp_143, O_wr_data_rsci_ivld_mxwt);
  mux_489_nl <= MUX_s_1_2_2(mux_488_nl, mux_487_nl, land_9_lpi_1_dfm_1_1);
  mux_490_nl <= MUX_s_1_2_2(mux_tmp_153, mux_489_nl, nor_108_cse);
  mux_515_nl <= MUX_s_1_2_2(mux_tmp_180, mux_tmp_170, mux_124_itm_1);
  mux_514_nl <= MUX_s_1_2_2(mux_tmp_180, mux_tmp_170, O_wr_data_rsci_ivld_mxwt);
  mux_516_nl <= MUX_s_1_2_2(mux_515_nl, mux_514_nl, land_9_lpi_1_dfm_1_1);
  mux_517_nl <= MUX_s_1_2_2(mux_tmp_180, mux_516_nl, nor_108_cse);
  and_52_nl <= or_558_cse AND mux_tmp_6;
  mux_340_nl <= MUX_s_1_2_2(and_52_nl, mux_tmp_6, oif_2_unequal_tmp);
  and_49_nl <= or_558_cse AND mux_tmp_4;
  mux_335_nl <= MUX_s_1_2_2(and_tmp_1, and_tmp, I_data_vld_sva_dfm_1_1);
  mux_336_nl <= MUX_s_1_2_2(mux_335_nl, mux_554_cse, oif_1_unequal_tmp);
  mux_338_nl <= MUX_s_1_2_2(and_49_nl, mux_336_nl, oif_2_unequal_tmp);
  mux_341_nl <= MUX_s_1_2_2(mux_340_nl, mux_338_nl, or_1_cse);
  or_555_nl <= and_526_cse OR (NOT mux_tmp_14);
  or_556_nl <= nor_tmp_8 OR (NOT mux_tmp_14);
  mux_553_nl <= MUX_s_1_2_2(or_555_nl, or_556_nl, reg_W_instr_in_rsci_oswt_cse_1);
  or_531_nl <= (mux_tmp_76 AND (fsm_output(1))) OR (mux_553_nl AND main_stage_0_2);
  mux_716_nl <= MUX_s_1_2_2((fsm_output(1)), nor_tmp_217, and_526_cse);
  mux_670_nl <= MUX_s_1_2_2(nor_tmp_217, mux_716_nl, and_544_cse);
  mux_671_nl <= MUX_s_1_2_2(nor_tmp_217, mux_670_nl, oif_2_unequal_tmp);
  mux_721_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_663_itm, or_tmp_10);
  mux_666_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_721_nl, mux_124_itm_1);
  mux_722_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_663_itm, or_tmp_10);
  mux_665_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_722_nl, O_wr_data_rsci_ivld_mxwt);
  mux_667_nl <= MUX_s_1_2_2(mux_666_nl, mux_665_nl, land_9_lpi_1_dfm_1_1);
  mux_664_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_663_itm, or_tmp_10);
  mux_668_nl <= MUX_s_1_2_2(mux_667_nl, mux_664_nl, or_1_cse);
  mux_669_nl <= MUX_s_1_2_2(reg_W_instr_in_rsci_oswt_cse_1, mux_668_nl, or_620_cse);
  mux_672_nl <= MUX_s_1_2_2(mux_671_nl, mux_669_nl, main_stage_0_2);
  or_757_nl <= (NOT(mux_404_tmp OR (NOT(else_8_land_lpi_1_dfm AND (CONV_SL_1_1(skid_buf_wr_zero_guard_cnt_sva/=STD_LOGIC_VECTOR'("00")))))))
      OR land_8_lpi_1_dfm_1;
  mux_675_nl <= MUX_s_1_2_2(land_8_lpi_1_dfm_1, or_757_nl, aif_7_equal_tmp);
  UPDATE_PSUM_FROM_TOP_or_2_nl <= (NOT((NOT(or_dcpl_25 OR or_dcpl_23)) OR and_331_cse))
      OR (or_dcpl_21 AND and_331_cse);
  UPDATE_PSUM_FROM_TOP_mux_5_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_0_sva,
      UPDATE_PSUM_FROM_TOP_or_2_nl);
  if_10_mux_97_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_1_sva, or_dcpl_29);
  if_10_mux_98_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_2_sva, or_dcpl_32);
  if_10_mux_99_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_3_sva, or_dcpl_33);
  if_10_mux_100_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_4_sva, or_dcpl_36);
  if_10_mux_101_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_5_sva, or_dcpl_39);
  if_10_mux_102_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_6_sva, or_dcpl_40);
  if_10_mux_103_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_7_sva, or_dcpl_41);
  if_10_mux_104_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_8_sva, or_dcpl_44);
  if_10_mux_105_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_9_sva, or_dcpl_45);
  if_10_mux_106_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_10_sva, or_dcpl_48);
  if_10_mux_107_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_11_sva, or_dcpl_49);
  if_10_mux_108_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_12_sva, or_dcpl_50);
  if_10_mux_109_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_13_sva, or_dcpl_51);
  if_10_mux_110_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_14_sva, or_dcpl_52);
  if_10_mux_111_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_15_sva, or_dcpl_53);
  if_10_mux_112_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_16_sva, or_dcpl_55);
  if_10_mux_113_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_17_sva, or_dcpl_57);
  if_10_mux_114_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_18_sva, or_dcpl_58);
  if_10_mux_115_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_19_sva, or_dcpl_59);
  if_10_mux_116_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_20_sva, or_dcpl_61);
  if_10_mux_117_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_21_sva, or_dcpl_63);
  if_10_mux_118_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_22_sva, or_dcpl_64);
  if_10_mux_119_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_23_sva, or_dcpl_65);
  if_10_mux_120_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_24_sva, or_dcpl_66);
  if_10_mux_121_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_25_sva, or_dcpl_67);
  if_10_mux_122_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_26_sva, or_dcpl_68);
  if_10_mux_123_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_27_sva, or_dcpl_69);
  if_10_mux_124_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_28_sva, or_dcpl_70);
  if_10_mux_125_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_29_sva, or_dcpl_71);
  if_10_mux_126_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_30_sva, or_dcpl_72);
  if_10_mux_127_nl <= MUX_v_16_2_2(W_wr_data_rsci_idat_mxwt, W_mem_31_sva, or_dcpl_73);
  mux_723_nl <= MUX_v_16_32_2(UPDATE_PSUM_FROM_TOP_mux_5_nl, if_10_mux_97_nl, if_10_mux_98_nl,
      if_10_mux_99_nl, if_10_mux_100_nl, if_10_mux_101_nl, if_10_mux_102_nl, if_10_mux_103_nl,
      if_10_mux_104_nl, if_10_mux_105_nl, if_10_mux_106_nl, if_10_mux_107_nl, if_10_mux_108_nl,
      if_10_mux_109_nl, if_10_mux_110_nl, if_10_mux_111_nl, if_10_mux_112_nl, if_10_mux_113_nl,
      if_10_mux_114_nl, if_10_mux_115_nl, if_10_mux_116_nl, if_10_mux_117_nl, if_10_mux_118_nl,
      if_10_mux_119_nl, if_10_mux_120_nl, if_10_mux_121_nl, if_10_mux_122_nl, if_10_mux_123_nl,
      if_10_mux_124_nl, if_10_mux_125_nl, if_10_mux_126_nl, if_10_mux_127_nl, W_mac_pntr_sva);
  UPDATE_PSUM_FROM_TOP_or_3_nl <= (NOT((NOT(or_dcpl_84 OR or_dcpl_82)) OR and_331_cse))
      OR (or_dcpl_80 AND and_331_cse);
  UPDATE_PSUM_FROM_TOP_mux_6_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_0_sva,
      UPDATE_PSUM_FROM_TOP_or_3_nl);
  if_9_mux_97_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_1_sva, or_dcpl_88);
  if_9_mux_98_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_2_sva, or_dcpl_91);
  if_9_mux_99_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_3_sva, or_dcpl_92);
  if_9_mux_100_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_4_sva, or_dcpl_95);
  if_9_mux_101_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_5_sva, or_dcpl_98);
  if_9_mux_102_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_6_sva, or_dcpl_99);
  if_9_mux_103_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_7_sva, or_dcpl_100);
  if_9_mux_104_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_8_sva, or_dcpl_103);
  if_9_mux_105_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_9_sva, or_dcpl_104);
  if_9_mux_106_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_10_sva, or_dcpl_107);
  if_9_mux_107_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_11_sva, or_dcpl_108);
  if_9_mux_108_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_12_sva, or_dcpl_109);
  if_9_mux_109_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_13_sva, or_dcpl_110);
  if_9_mux_110_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_14_sva, or_dcpl_111);
  if_9_mux_111_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_15_sva, or_dcpl_112);
  if_9_mux_112_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_16_sva, or_dcpl_114);
  if_9_mux_113_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_17_sva, or_dcpl_115);
  if_9_mux_114_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_18_sva, or_dcpl_117);
  if_9_mux_115_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_19_sva, or_dcpl_118);
  if_9_mux_116_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_20_sva, or_dcpl_119);
  if_9_mux_117_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_21_sva, or_dcpl_120);
  if_9_mux_118_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_22_sva, or_dcpl_121);
  if_9_mux_119_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_23_sva, or_dcpl_122);
  if_9_mux_120_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_24_sva, or_dcpl_124);
  if_9_mux_121_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_25_sva, or_dcpl_125);
  if_9_mux_122_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_26_sva, or_dcpl_127);
  if_9_mux_123_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_27_sva, or_dcpl_128);
  if_9_mux_124_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_28_sva, or_dcpl_129);
  if_9_mux_125_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_29_sva, or_dcpl_130);
  if_9_mux_126_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_30_sva, or_dcpl_131);
  if_9_mux_127_nl <= MUX_v_16_2_2(I_wr_data_rsci_idat_mxwt, I_mem_31_sva, or_dcpl_132);
  mux_724_nl <= MUX_v_16_32_2(UPDATE_PSUM_FROM_TOP_mux_6_nl, if_9_mux_97_nl, if_9_mux_98_nl,
      if_9_mux_99_nl, if_9_mux_100_nl, if_9_mux_101_nl, if_9_mux_102_nl, if_9_mux_103_nl,
      if_9_mux_104_nl, if_9_mux_105_nl, if_9_mux_106_nl, if_9_mux_107_nl, if_9_mux_108_nl,
      if_9_mux_109_nl, if_9_mux_110_nl, if_9_mux_111_nl, if_9_mux_112_nl, if_9_mux_113_nl,
      if_9_mux_114_nl, if_9_mux_115_nl, if_9_mux_116_nl, if_9_mux_117_nl, if_9_mux_118_nl,
      if_9_mux_119_nl, if_9_mux_120_nl, if_9_mux_121_nl, if_9_mux_122_nl, if_9_mux_123_nl,
      if_9_mux_124_nl, if_9_mux_125_nl, if_9_mux_126_nl, if_9_mux_127_nl, I_mac_pntr_sva);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(mux_723_nl) * UNSIGNED(mux_724_nl)),
      16));
  and_549_nl <= if_5_and_svs_1 AND (fsm_output(1));
  skid_buf_top_pop_1_mux_1_nl <= MUX_v_2_2_2(skid_buf_top_cnt_sva, skid_buf_top_cnt_sva_1_1,
      and_549_nl);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(skid_buf_top_pop_1_mux_1_nl)
      + UNSIGNED'( "11"), 2));
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
    layer_instruction_in_rsc_vld : IN STD_LOGIC;
    layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
    O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
    I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
    I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
    W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
    W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
    W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
    W_instr_L3_out_rsc_rdy : IN STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : STD_LOGIC_VECTOR (79 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_tile_size_out_rsc_z : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_instr_bound_rsc_z : STD_LOGIC_VECTOR (79 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_instr_tile_rsc_z : STD_LOGIC_VECTOR (79 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;
  SIGNAL W_tiling_unit_L3_run_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL CGHpart_irsig_1 : STD_LOGIC;
  SIGNAL W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : STD_LOGIC_VECTOR (54 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_instr_bound_rsc_z : STD_LOGIC_VECTOR (54 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_instr_tile_rsc_z : STD_LOGIC_VECTOR (54 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;
  SIGNAL W_tiling_unit_L2_run_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : STD_LOGIC_VECTOR (69 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_tile_size_out_rsc_z : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_instr_bound_rsc_z : STD_LOGIC_VECTOR (69 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_instr_tile_rsc_z : STD_LOGIC_VECTOR (69 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : STD_LOGIC_VECTOR (44 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_instr_bound_rsc_z : STD_LOGIC_VECTOR (44 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_instr_tile_rsc_z : STD_LOGIC_VECTOR (44 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;
  SIGNAL O_tiling_unit_L2_run_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat : STD_LOGIC_VECTOR (24 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_instr_bound_rsc_z : STD_LOGIC_VECTOR (24 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_instr_tile_rsc_z : STD_LOGIC_VECTOR (24 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;
  SIGNAL O_tiling_unit_L1_run_cmp_ccs_ccore_en : STD_LOGIC;

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000159
    PORT (
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR(79 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR(79 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1 : STD_LOGIC_VECTOR (79 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1 : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1 : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1 : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1 : STD_LOGIC_VECTOR (79 DOWNTO
      0);
  SIGNAL W_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1 : STD_LOGIC_VECTOR (79 DOWNTO
      0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000161
    PORT (
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR(54 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR(54 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR(54 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1 : STD_LOGIC_VECTOR (54 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1 : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1 : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1 : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1 : STD_LOGIC_VECTOR (54 DOWNTO
      0);
  SIGNAL W_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1 : STD_LOGIC_VECTOR (54 DOWNTO
      0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000163
    PORT (
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR(69 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR(69 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR(69 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1 : STD_LOGIC_VECTOR (69 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1 : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1 : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1 : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1 : STD_LOGIC_VECTOR (69 DOWNTO
      0);
  SIGNAL O_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1 : STD_LOGIC_VECTOR (69 DOWNTO
      0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000165
    PORT (
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR(44 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1 : STD_LOGIC_VECTOR (44 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1 : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1 : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1 : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1 : STD_LOGIC_VECTOR (44 DOWNTO
      0);
  SIGNAL O_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1 : STD_LOGIC_VECTOR (44 DOWNTO
      0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000167
    PORT (
      loops_bound_rsc_dat : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      loops_relevancy_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_in_rsc_dat : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      tile_size_out_rsc_z : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      instr_bound_rsc_z : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      instr_tile_rsc_z : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat_1 : STD_LOGIC_VECTOR (24 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat_1 : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat_1 : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z_1 : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_instr_bound_rsc_z_1 : STD_LOGIC_VECTOR (24 DOWNTO
      0);
  SIGNAL O_tiling_unit_L1_run_cmp_instr_tile_rsc_z_1 : STD_LOGIC_VECTOR (24 DOWNTO
      0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
      layer_instruction_in_rsc_vld : IN STD_LOGIC;
      layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
      O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
      W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
      W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (79 DOWNTO
          0);
      W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4
          DOWNTO 0);
      W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO
          0);
      W_tiling_unit_L3_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (79 DOWNTO
          0);
      W_tiling_unit_L3_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (79 DOWNTO
          0);
      W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
      W_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_iro_1 : IN STD_LOGIC;
      CGHpart_irsig_1 : OUT STD_LOGIC;
      W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (54 DOWNTO
          0);
      W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4
          DOWNTO 0);
      W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (10 DOWNTO
          0);
      W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (10 DOWNTO
          0);
      W_tiling_unit_L2_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (54 DOWNTO
          0);
      W_tiling_unit_L2_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (54 DOWNTO
          0);
      W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
      W_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (69 DOWNTO
          0);
      O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4
          DOWNTO 0);
      O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (13 DOWNTO
          0);
      O_tiling_unit_L3_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (69 DOWNTO
          0);
      O_tiling_unit_L3_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (69 DOWNTO
          0);
      O_tiling_unit_L3_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (44 DOWNTO
          0);
      O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4
          DOWNTO 0);
      O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (8 DOWNTO
          0);
      O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (8 DOWNTO
          0);
      O_tiling_unit_L2_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (44 DOWNTO
          0);
      O_tiling_unit_L2_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (44 DOWNTO
          0);
      O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
      O_tiling_unit_L2_run_cmp_ccs_ccore_en : OUT STD_LOGIC;
      O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat : OUT STD_LOGIC_VECTOR (24 DOWNTO
          0);
      O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat : OUT STD_LOGIC_VECTOR (4
          DOWNTO 0);
      O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat : OUT STD_LOGIC_VECTOR (4 DOWNTO
          0);
      O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z : IN STD_LOGIC_VECTOR (4 DOWNTO
          0);
      O_tiling_unit_L1_run_cmp_instr_bound_rsc_z : IN STD_LOGIC_VECTOR (24 DOWNTO
          0);
      O_tiling_unit_L1_run_cmp_instr_tile_rsc_z : IN STD_LOGIC_VECTOR (24 DOWNTO
          0);
      O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat : OUT STD_LOGIC;
      O_tiling_unit_L1_run_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_layer_instruction_in_rsc_dat
      : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L1_out_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L2_out_rsc_dat
      : STD_LOGIC_VECTOR (109 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L3_out_rsc_dat
      : STD_LOGIC_VECTOR (159 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat
      : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_bound_rsc_z
      : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_tile_rsc_z
      : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat
      : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat
      : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z
      : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_bound_rsc_z
      : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_tile_rsc_z
      : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat
      : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat
      : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_bound_rsc_z
      : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_tile_rsc_z
      : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat
      : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z
      : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_bound_rsc_z
      : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_tile_rsc_z
      : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_bound_rsc_z
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_tile_rsc_z
      : STD_LOGIC_VECTOR (24 DOWNTO 0);

BEGIN
  W_tiling_unit_L3_run_cmp : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000159
    PORT MAP(
      loops_bound_rsc_dat => W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1,
      loops_relevancy_rsc_dat => W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1,
      tile_size_in_rsc_dat => W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1,
      tile_size_out_rsc_z => W_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1,
      instr_bound_rsc_z => W_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1,
      instr_tile_rsc_z => W_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1,
      ccs_ccore_start_rsc_dat => W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => W_tiling_unit_L3_run_cmp_ccs_ccore_en
    );
  W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1 <= W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat;
  W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1 <= W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat;
  W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1 <= W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat;
  W_tiling_unit_L3_run_cmp_tile_size_out_rsc_z <= W_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1;
  W_tiling_unit_L3_run_cmp_instr_bound_rsc_z <= W_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1;
  W_tiling_unit_L3_run_cmp_instr_tile_rsc_z <= W_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1;

  W_tiling_unit_L2_run_cmp : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000161
    PORT MAP(
      loops_bound_rsc_dat => W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1,
      loops_relevancy_rsc_dat => W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1,
      tile_size_in_rsc_dat => W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1,
      tile_size_out_rsc_z => W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1,
      instr_bound_rsc_z => W_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1,
      instr_tile_rsc_z => W_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1,
      ccs_ccore_start_rsc_dat => W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => W_tiling_unit_L2_run_cmp_ccs_ccore_en
    );
  W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1 <= W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat;
  W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1 <= W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat;
  W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1 <= W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat;
  W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z <= W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1;
  W_tiling_unit_L2_run_cmp_instr_bound_rsc_z <= W_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1;
  W_tiling_unit_L2_run_cmp_instr_tile_rsc_z <= W_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1;

  O_tiling_unit_L3_run_cmp : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000163
    PORT MAP(
      loops_bound_rsc_dat => O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1,
      loops_relevancy_rsc_dat => O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1,
      tile_size_in_rsc_dat => O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1,
      tile_size_out_rsc_z => O_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1,
      instr_bound_rsc_z => O_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1,
      instr_tile_rsc_z => O_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1,
      ccs_ccore_start_rsc_dat => CGHpart_irsig_1,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => O_tiling_unit_L3_run_cmp_ccs_ccore_en
    );
  O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat_1 <= O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat_1 <= O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat_1 <= O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat;
  O_tiling_unit_L3_run_cmp_tile_size_out_rsc_z <= O_tiling_unit_L3_run_cmp_tile_size_out_rsc_z_1;
  O_tiling_unit_L3_run_cmp_instr_bound_rsc_z <= O_tiling_unit_L3_run_cmp_instr_bound_rsc_z_1;
  O_tiling_unit_L3_run_cmp_instr_tile_rsc_z <= O_tiling_unit_L3_run_cmp_instr_tile_rsc_z_1;

  O_tiling_unit_L2_run_cmp : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000165
    PORT MAP(
      loops_bound_rsc_dat => O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1,
      loops_relevancy_rsc_dat => O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1,
      tile_size_in_rsc_dat => O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1,
      tile_size_out_rsc_z => O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1,
      instr_bound_rsc_z => O_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1,
      instr_tile_rsc_z => O_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1,
      ccs_ccore_start_rsc_dat => O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => O_tiling_unit_L2_run_cmp_ccs_ccore_en
    );
  O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat_1 <= O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat_1 <= O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat_1 <= O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat;
  O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z <= O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z_1;
  O_tiling_unit_L2_run_cmp_instr_bound_rsc_z <= O_tiling_unit_L2_run_cmp_instr_bound_rsc_z_1;
  O_tiling_unit_L2_run_cmp_instr_tile_rsc_z <= O_tiling_unit_L2_run_cmp_instr_tile_rsc_z_1;

  O_tiling_unit_L1_run_cmp : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000167
    PORT MAP(
      loops_bound_rsc_dat => O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat_1,
      loops_relevancy_rsc_dat => O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat_1,
      tile_size_in_rsc_dat => O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat_1,
      tile_size_out_rsc_z => O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z_1,
      instr_bound_rsc_z => O_tiling_unit_L1_run_cmp_instr_bound_rsc_z_1,
      instr_tile_rsc_z => O_tiling_unit_L1_run_cmp_instr_tile_rsc_z_1,
      ccs_ccore_start_rsc_dat => O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => O_tiling_unit_L1_run_cmp_ccs_ccore_en
    );
  O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat_1 <= O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat_1 <= O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat_1 <= O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat;
  O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z <= O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z_1;
  O_tiling_unit_L1_run_cmp_instr_bound_rsc_z <= O_tiling_unit_L1_run_cmp_instr_bound_rsc_z_1;
  O_tiling_unit_L1_run_cmp_instr_tile_rsc_z <= O_tiling_unit_L1_run_cmp_instr_tile_rsc_z_1;

  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000064
    PORT MAP(
      clk => clk,
      rst => rst,
      layer_instruction_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_layer_instruction_in_rsc_dat,
      layer_instruction_in_rsc_vld => layer_instruction_in_rsc_vld,
      layer_instruction_in_rsc_rdy => layer_instruction_in_rsc_rdy,
      O_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L1_out_rsc_dat,
      O_instr_L1_out_rsc_vld => O_instr_L1_out_rsc_vld,
      O_instr_L1_out_rsc_rdy => O_instr_L1_out_rsc_rdy,
      O_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L2_out_rsc_dat,
      O_instr_L2_out_rsc_vld => O_instr_L2_out_rsc_vld,
      O_instr_L2_out_rsc_rdy => O_instr_L2_out_rsc_rdy,
      O_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L3_out_rsc_dat,
      O_instr_L3_out_rsc_vld => O_instr_L3_out_rsc_vld,
      O_instr_L3_out_rsc_rdy => O_instr_L3_out_rsc_rdy,
      I_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L1_out_rsc_dat,
      I_instr_L1_out_rsc_vld => I_instr_L1_out_rsc_vld,
      I_instr_L1_out_rsc_rdy => I_instr_L1_out_rsc_rdy,
      I_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L2_out_rsc_dat,
      I_instr_L2_out_rsc_vld => I_instr_L2_out_rsc_vld,
      I_instr_L2_out_rsc_rdy => I_instr_L2_out_rsc_rdy,
      I_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L3_out_rsc_dat,
      I_instr_L3_out_rsc_vld => I_instr_L3_out_rsc_vld,
      I_instr_L3_out_rsc_rdy => I_instr_L3_out_rsc_rdy,
      W_instr_L1_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L1_out_rsc_dat,
      W_instr_L1_out_rsc_vld => W_instr_L1_out_rsc_vld,
      W_instr_L1_out_rsc_rdy => W_instr_L1_out_rsc_rdy,
      W_instr_L2_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L2_out_rsc_dat,
      W_instr_L2_out_rsc_vld => W_instr_L2_out_rsc_vld,
      W_instr_L2_out_rsc_rdy => W_instr_L2_out_rsc_rdy,
      W_instr_L3_out_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L3_out_rsc_dat,
      W_instr_L3_out_rsc_vld => W_instr_L3_out_rsc_vld,
      W_instr_L3_out_rsc_rdy => W_instr_L3_out_rsc_rdy,
      W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat,
      W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat,
      W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat,
      W_tiling_unit_L3_run_cmp_instr_bound_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_bound_rsc_z,
      W_tiling_unit_L3_run_cmp_instr_tile_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_tile_rsc_z,
      W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat => W_tiling_unit_L3_run_cmp_ccs_ccore_start_rsc_dat,
      W_tiling_unit_L3_run_cmp_ccs_ccore_en => W_tiling_unit_L3_run_cmp_ccs_ccore_en,
      ensig_cgo_iro_1 => CGHpart_irsig_1,
      CGHpart_irsig_1 => CGHpart_irsig_1,
      W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat,
      W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat,
      W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat,
      W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z,
      W_tiling_unit_L2_run_cmp_instr_bound_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_bound_rsc_z,
      W_tiling_unit_L2_run_cmp_instr_tile_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_tile_rsc_z,
      W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat => W_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat,
      W_tiling_unit_L2_run_cmp_ccs_ccore_en => W_tiling_unit_L2_run_cmp_ccs_ccore_en,
      O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat,
      O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat,
      O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat,
      O_tiling_unit_L3_run_cmp_instr_bound_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_bound_rsc_z,
      O_tiling_unit_L3_run_cmp_instr_tile_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_tile_rsc_z,
      O_tiling_unit_L3_run_cmp_ccs_ccore_en => O_tiling_unit_L3_run_cmp_ccs_ccore_en,
      O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat,
      O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat,
      O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat,
      O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z,
      O_tiling_unit_L2_run_cmp_instr_bound_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_bound_rsc_z,
      O_tiling_unit_L2_run_cmp_instr_tile_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_tile_rsc_z,
      O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat => O_tiling_unit_L2_run_cmp_ccs_ccore_start_rsc_dat,
      O_tiling_unit_L2_run_cmp_ccs_ccore_en => O_tiling_unit_L2_run_cmp_ccs_ccore_en,
      O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat,
      O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat,
      O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat,
      O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z,
      O_tiling_unit_L1_run_cmp_instr_bound_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_bound_rsc_z,
      O_tiling_unit_L1_run_cmp_instr_tile_rsc_z => config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_tile_rsc_z,
      O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat => O_tiling_unit_L1_run_cmp_ccs_ccore_start_rsc_dat,
      O_tiling_unit_L1_run_cmp_ccs_ccore_en => O_tiling_unit_L1_run_cmp_ccs_ccore_en
    );
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_layer_instruction_in_rsc_dat
      <= layer_instruction_in_rsc_dat;
  O_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L1_out_rsc_dat;
  O_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L2_out_rsc_dat;
  O_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_instr_L3_out_rsc_dat;
  I_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L1_out_rsc_dat;
  I_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L2_out_rsc_dat;
  I_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_I_instr_L3_out_rsc_dat;
  W_instr_L1_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L1_out_rsc_dat;
  W_instr_L2_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L2_out_rsc_dat;
  W_instr_L3_out_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_instr_L3_out_rsc_dat;
  W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_bound_rsc_dat;
  W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat;
  W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_bound_rsc_z
      <= W_tiling_unit_L3_run_cmp_instr_bound_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L3_run_cmp_instr_tile_rsc_z
      <= W_tiling_unit_L3_run_cmp_instr_tile_rsc_z;
  W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_bound_rsc_dat;
  W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat;
  W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z
      <= W_tiling_unit_L2_run_cmp_tile_size_out_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_bound_rsc_z
      <= W_tiling_unit_L2_run_cmp_instr_bound_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_W_tiling_unit_L2_run_cmp_instr_tile_rsc_z
      <= W_tiling_unit_L2_run_cmp_instr_tile_rsc_z;
  O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_tile_size_in_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_bound_rsc_z
      <= O_tiling_unit_L3_run_cmp_instr_bound_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L3_run_cmp_instr_tile_rsc_z
      <= O_tiling_unit_L3_run_cmp_instr_tile_rsc_z;
  O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_in_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z
      <= O_tiling_unit_L2_run_cmp_tile_size_out_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_bound_rsc_z
      <= O_tiling_unit_L2_run_cmp_instr_bound_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L2_run_cmp_instr_tile_rsc_z
      <= O_tiling_unit_L2_run_cmp_instr_tile_rsc_z;
  O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_bound_rsc_dat;
  O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_loops_relevancy_rsc_dat;
  O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat <= config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_in_rsc_dat;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z
      <= O_tiling_unit_L1_run_cmp_tile_size_out_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_bound_rsc_z
      <= O_tiling_unit_L1_run_cmp_instr_bound_rsc_z;
  config_control_unit_5_O_addr_type_L1_O_addr_type_L2_O_addr_type_L3_I_addr_type_L1_I_addr_type_L2_I_addr_type_L3_W_addr_type_L1_W_addr_type_L2_W_addr_type_L3_run_inst_O_tiling_unit_L1_run_cmp_instr_tile_rsc_z
      <= O_tiling_unit_L1_run_cmp_instr_tile_rsc_z;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_wr_data_rsc_vld : IN STD_LOGIC;
    O_wr_data_rsc_rdy : OUT STD_LOGIC;
    O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_rd_data_rsc_vld : OUT STD_LOGIC;
    O_rd_data_rsc_rdy : IN STD_LOGIC;
    I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_wr_data_rsc_vld : IN STD_LOGIC;
    I_wr_data_rsc_rdy : OUT STD_LOGIC;
    W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_wr_data_rsc_vld : IN STD_LOGIC;
    W_wr_data_rsc_rdy : OUT STD_LOGIC;
    wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
    wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
    wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
    O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    O_instr_in_rsc_vld : IN STD_LOGIC;
    O_instr_in_rsc_rdy : OUT STD_LOGIC;
    I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    I_instr_in_rsc_vld : IN STD_LOGIC;
    I_instr_in_rsc_rdy : OUT STD_LOGIC;
    W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
    W_instr_in_rsc_vld : IN STD_LOGIC;
    W_instr_in_rsc_rdy : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002
    IS
  -- Default Constants

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_wr_data_rsc_vld : IN STD_LOGIC;
      O_wr_data_rsc_rdy : OUT STD_LOGIC;
      O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_rd_data_rsc_vld : OUT STD_LOGIC;
      O_rd_data_rsc_rdy : IN STD_LOGIC;
      I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      I_wr_data_rsc_vld : IN STD_LOGIC;
      I_wr_data_rsc_rdy : OUT STD_LOGIC;
      W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      W_wr_data_rsc_vld : IN STD_LOGIC;
      W_wr_data_rsc_rdy : OUT STD_LOGIC;
      wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
      wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
      wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
      O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_in_rsc_vld : IN STD_LOGIC;
      O_instr_in_rsc_rdy : OUT STD_LOGIC;
      I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_in_rsc_vld : IN STD_LOGIC;
      I_instr_in_rsc_rdy : OUT STD_LOGIC;
      W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_in_rsc_vld : IN STD_LOGIC;
      W_instr_in_rsc_rdy : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_rd_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_wr_data_rsc_dat
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_instr_in_rsc_dat
      : STD_LOGIC_VECTOR (49 DOWNTO 0);

BEGIN
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000003
    PORT MAP(
      clk => clk,
      rst => rst,
      O_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_wr_data_rsc_dat,
      O_wr_data_rsc_vld => O_wr_data_rsc_vld,
      O_wr_data_rsc_rdy => O_wr_data_rsc_rdy,
      O_rd_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_rd_data_rsc_dat,
      O_rd_data_rsc_vld => O_rd_data_rsc_vld,
      O_rd_data_rsc_rdy => O_rd_data_rsc_rdy,
      I_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_wr_data_rsc_dat,
      I_wr_data_rsc_vld => I_wr_data_rsc_vld,
      I_wr_data_rsc_rdy => I_wr_data_rsc_rdy,
      W_wr_data_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_wr_data_rsc_dat,
      W_wr_data_rsc_vld => W_wr_data_rsc_vld,
      W_wr_data_rsc_rdy => W_wr_data_rsc_rdy,
      wr_data_zero_guard_rsc_dat => wr_data_zero_guard_rsc_dat,
      wr_data_zero_guard_rsc_vld => wr_data_zero_guard_rsc_vld,
      wr_data_zero_guard_rsc_rdy => wr_data_zero_guard_rsc_rdy,
      O_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_instr_in_rsc_dat,
      O_instr_in_rsc_vld => O_instr_in_rsc_vld,
      O_instr_in_rsc_rdy => O_instr_in_rsc_rdy,
      I_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_instr_in_rsc_dat,
      I_instr_in_rsc_vld => I_instr_in_rsc_vld,
      I_instr_in_rsc_rdy => I_instr_in_rsc_rdy,
      W_instr_in_rsc_dat => rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_instr_in_rsc_dat,
      W_instr_in_rsc_vld => W_instr_in_rsc_vld,
      W_instr_in_rsc_rdy => W_instr_in_rsc_rdy
    );
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_wr_data_rsc_dat
      <= O_wr_data_rsc_dat;
  O_rd_data_rsc_dat <= rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_rd_data_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_wr_data_rsc_dat
      <= I_wr_data_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_wr_data_rsc_dat
      <= W_wr_data_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_O_instr_in_rsc_dat
      <= O_instr_in_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_I_instr_in_rsc_dat
      <= I_instr_in_rsc_dat;
  rf_5_32_32_32_1_1_1_1_1_1_O_partial_type_O_addr_type_L1_I_type_I_addr_type_L1_W_type_W_addr_type_L1_run_inst_W_instr_in_rsc_dat
      <= W_instr_in_rsc_dat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_data_in_rsc_vld : IN STD_LOGIC;
    O_data_in_rsc_rdy : OUT STD_LOGIC;
    O_data_out_rsc_dat_data : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_data_out_rsc_vld : OUT STD_LOGIC;
    O_data_out_rsc_rdy : IN STD_LOGIC;
    I_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_data_in_rsc_vld : IN STD_LOGIC;
    I_data_in_rsc_rdy : OUT STD_LOGIC;
    W_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_data_in_rsc_vld : IN STD_LOGIC;
    W_data_in_rsc_rdy : OUT STD_LOGIC;
    zero_guard_in_rsc_dat : IN STD_LOGIC;
    zero_guard_in_rsc_vld : IN STD_LOGIC;
    zero_guard_in_rsc_rdy : OUT STD_LOGIC;
    layer_instruction_in_rsc_dat_relevancy : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_1 : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_2 : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_3 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_3 : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_4 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_4 : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_5 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_5 : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_6 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_6 : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_7 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_7 : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
    layer_instruction_in_rsc_dat_relevancy_8 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    layer_instruction_in_rsc_dat_bound_8 : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
    layer_instruction_in_rsc_vld : IN STD_LOGIC;
    layer_instruction_in_rsc_rdy : OUT STD_LOGIC
  );
END topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000;

ARCHITECTURE v2 OF topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000
    IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL O_instr_L1_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL O_instr_L2_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL O_instr_L3_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL I_instr_L1_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL I_instr_L2_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL I_instr_L3_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL W_instr_L1_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL W_instr_L2_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (109 DOWNTO 0);
  SIGNAL W_instr_L3_out_rsc_dat_nCCInst : STD_LOGIC_VECTOR (159 DOWNTO 0);
  SIGNAL O_rd_data_rsc_dat_nPE : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL layer_instruction_in_rsc_rdy_nCCInst_bud : STD_LOGIC;
  SIGNAL O_instr_L1_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL O_instr_in_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL O_instr_L2_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL O_instr_L3_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL I_instr_L1_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL I_instr_in_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL I_instr_L2_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL I_instr_L3_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL W_instr_L1_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL W_instr_in_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL W_instr_L2_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL W_instr_L3_out_rsc_vld_nCCInst_bud : STD_LOGIC;
  SIGNAL O_wr_data_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL O_rd_data_rsc_vld_nPE_bud : STD_LOGIC;
  SIGNAL I_wr_data_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL W_wr_data_rsc_rdy_nPE_bud : STD_LOGIC;
  SIGNAL wr_data_zero_guard_rsc_rdy_nPE_bud : STD_LOGIC;

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
      layer_instruction_in_rsc_vld : IN STD_LOGIC;
      layer_instruction_in_rsc_rdy : OUT STD_LOGIC;
      O_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      O_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      O_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      O_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      O_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      O_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (89 DOWNTO 0);
      I_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      I_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (139 DOWNTO 0);
      I_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      I_instr_L3_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L1_out_rsc_dat : OUT STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_L1_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L1_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L2_out_rsc_dat : OUT STD_LOGIC_VECTOR (109 DOWNTO 0);
      W_instr_L2_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L2_out_rsc_rdy : IN STD_LOGIC;
      W_instr_L3_out_rsc_dat : OUT STD_LOGIC_VECTOR (159 DOWNTO 0);
      W_instr_L3_out_rsc_vld : OUT STD_LOGIC;
      W_instr_L3_out_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL CCInst_layer_instruction_in_rsc_dat : STD_LOGIC_VECTOR (484 DOWNTO 0);
  SIGNAL CCInst_O_instr_L1_out_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL CCInst_O_instr_L2_out_rsc_dat : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL CCInst_O_instr_L3_out_rsc_dat : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL CCInst_I_instr_L1_out_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL CCInst_I_instr_L2_out_rsc_dat : STD_LOGIC_VECTOR (89 DOWNTO 0);
  SIGNAL CCInst_I_instr_L3_out_rsc_dat : STD_LOGIC_VECTOR (139 DOWNTO 0);
  SIGNAL CCInst_W_instr_L1_out_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL CCInst_W_instr_L2_out_rsc_dat : STD_LOGIC_VECTOR (109 DOWNTO 0);
  SIGNAL CCInst_W_instr_L3_out_rsc_dat : STD_LOGIC_VECTOR (159 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_wr_data_rsc_vld : IN STD_LOGIC;
      O_wr_data_rsc_rdy : OUT STD_LOGIC;
      O_rd_data_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_rd_data_rsc_vld : OUT STD_LOGIC;
      O_rd_data_rsc_rdy : IN STD_LOGIC;
      I_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      I_wr_data_rsc_vld : IN STD_LOGIC;
      I_wr_data_rsc_rdy : OUT STD_LOGIC;
      W_wr_data_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      W_wr_data_rsc_vld : IN STD_LOGIC;
      W_wr_data_rsc_rdy : OUT STD_LOGIC;
      wr_data_zero_guard_rsc_dat : IN STD_LOGIC;
      wr_data_zero_guard_rsc_vld : IN STD_LOGIC;
      wr_data_zero_guard_rsc_rdy : OUT STD_LOGIC;
      O_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      O_instr_in_rsc_vld : IN STD_LOGIC;
      O_instr_in_rsc_rdy : OUT STD_LOGIC;
      I_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      I_instr_in_rsc_vld : IN STD_LOGIC;
      I_instr_in_rsc_rdy : OUT STD_LOGIC;
      W_instr_in_rsc_dat : IN STD_LOGIC_VECTOR (49 DOWNTO 0);
      W_instr_in_rsc_vld : IN STD_LOGIC;
      W_instr_in_rsc_rdy : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL PE_O_wr_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL PE_O_rd_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL PE_I_wr_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL PE_W_wr_data_rsc_dat : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL PE_O_instr_in_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL PE_I_instr_in_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL PE_W_instr_in_rsc_dat : STD_LOGIC_VECTOR (49 DOWNTO 0);

BEGIN
  CCInst : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000001
    PORT MAP(
      clk => clk,
      rst => rst,
      layer_instruction_in_rsc_dat => CCInst_layer_instruction_in_rsc_dat,
      layer_instruction_in_rsc_vld => layer_instruction_in_rsc_vld,
      layer_instruction_in_rsc_rdy => layer_instruction_in_rsc_rdy_nCCInst_bud,
      O_instr_L1_out_rsc_dat => CCInst_O_instr_L1_out_rsc_dat,
      O_instr_L1_out_rsc_vld => O_instr_L1_out_rsc_vld_nCCInst_bud,
      O_instr_L1_out_rsc_rdy => O_instr_in_rsc_rdy_nPE_bud,
      O_instr_L2_out_rsc_dat => CCInst_O_instr_L2_out_rsc_dat,
      O_instr_L2_out_rsc_vld => O_instr_L2_out_rsc_vld_nCCInst_bud,
      O_instr_L2_out_rsc_rdy => '1',
      O_instr_L3_out_rsc_dat => CCInst_O_instr_L3_out_rsc_dat,
      O_instr_L3_out_rsc_vld => O_instr_L3_out_rsc_vld_nCCInst_bud,
      O_instr_L3_out_rsc_rdy => '1',
      I_instr_L1_out_rsc_dat => CCInst_I_instr_L1_out_rsc_dat,
      I_instr_L1_out_rsc_vld => I_instr_L1_out_rsc_vld_nCCInst_bud,
      I_instr_L1_out_rsc_rdy => I_instr_in_rsc_rdy_nPE_bud,
      I_instr_L2_out_rsc_dat => CCInst_I_instr_L2_out_rsc_dat,
      I_instr_L2_out_rsc_vld => I_instr_L2_out_rsc_vld_nCCInst_bud,
      I_instr_L2_out_rsc_rdy => '1',
      I_instr_L3_out_rsc_dat => CCInst_I_instr_L3_out_rsc_dat,
      I_instr_L3_out_rsc_vld => I_instr_L3_out_rsc_vld_nCCInst_bud,
      I_instr_L3_out_rsc_rdy => '1',
      W_instr_L1_out_rsc_dat => CCInst_W_instr_L1_out_rsc_dat,
      W_instr_L1_out_rsc_vld => W_instr_L1_out_rsc_vld_nCCInst_bud,
      W_instr_L1_out_rsc_rdy => W_instr_in_rsc_rdy_nPE_bud,
      W_instr_L2_out_rsc_dat => CCInst_W_instr_L2_out_rsc_dat,
      W_instr_L2_out_rsc_vld => W_instr_L2_out_rsc_vld_nCCInst_bud,
      W_instr_L2_out_rsc_rdy => '1',
      W_instr_L3_out_rsc_dat => CCInst_W_instr_L3_out_rsc_dat,
      W_instr_L3_out_rsc_vld => W_instr_L3_out_rsc_vld_nCCInst_bud,
      W_instr_L3_out_rsc_rdy => '1'
    );
  CCInst_layer_instruction_in_rsc_dat <= layer_instruction_in_rsc_dat_relevancy &
      layer_instruction_in_rsc_dat_bound & layer_instruction_in_rsc_dat_relevancy_1
      & layer_instruction_in_rsc_dat_bound_1 & layer_instruction_in_rsc_dat_relevancy_2
      & layer_instruction_in_rsc_dat_bound_2 & layer_instruction_in_rsc_dat_relevancy_3
      & layer_instruction_in_rsc_dat_bound_3 & layer_instruction_in_rsc_dat_relevancy_4
      & layer_instruction_in_rsc_dat_bound_4 & layer_instruction_in_rsc_dat_relevancy_5
      & layer_instruction_in_rsc_dat_bound_5 & layer_instruction_in_rsc_dat_relevancy_6
      & layer_instruction_in_rsc_dat_bound_6 & layer_instruction_in_rsc_dat_relevancy_7
      & layer_instruction_in_rsc_dat_bound_7 & layer_instruction_in_rsc_dat_relevancy_8
      & layer_instruction_in_rsc_dat_bound_8;
  O_instr_L1_out_rsc_dat_nCCInst <= CCInst_O_instr_L1_out_rsc_dat;
  O_instr_L2_out_rsc_dat_nCCInst <= CCInst_O_instr_L2_out_rsc_dat;
  O_instr_L3_out_rsc_dat_nCCInst <= CCInst_O_instr_L3_out_rsc_dat;
  I_instr_L1_out_rsc_dat_nCCInst <= CCInst_I_instr_L1_out_rsc_dat;
  I_instr_L2_out_rsc_dat_nCCInst <= CCInst_I_instr_L2_out_rsc_dat;
  I_instr_L3_out_rsc_dat_nCCInst <= CCInst_I_instr_L3_out_rsc_dat;
  W_instr_L1_out_rsc_dat_nCCInst <= CCInst_W_instr_L1_out_rsc_dat;
  W_instr_L2_out_rsc_dat_nCCInst <= CCInst_W_instr_L2_out_rsc_dat;
  W_instr_L3_out_rsc_dat_nCCInst <= CCInst_W_instr_L3_out_rsc_dat;

  PE : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000002
    PORT MAP(
      clk => clk,
      rst => rst,
      O_wr_data_rsc_dat => PE_O_wr_data_rsc_dat,
      O_wr_data_rsc_vld => O_data_in_rsc_vld,
      O_wr_data_rsc_rdy => O_wr_data_rsc_rdy_nPE_bud,
      O_rd_data_rsc_dat => PE_O_rd_data_rsc_dat,
      O_rd_data_rsc_vld => O_rd_data_rsc_vld_nPE_bud,
      O_rd_data_rsc_rdy => O_data_out_rsc_rdy,
      I_wr_data_rsc_dat => PE_I_wr_data_rsc_dat,
      I_wr_data_rsc_vld => I_data_in_rsc_vld,
      I_wr_data_rsc_rdy => I_wr_data_rsc_rdy_nPE_bud,
      W_wr_data_rsc_dat => PE_W_wr_data_rsc_dat,
      W_wr_data_rsc_vld => W_data_in_rsc_vld,
      W_wr_data_rsc_rdy => W_wr_data_rsc_rdy_nPE_bud,
      wr_data_zero_guard_rsc_dat => zero_guard_in_rsc_dat,
      wr_data_zero_guard_rsc_vld => zero_guard_in_rsc_vld,
      wr_data_zero_guard_rsc_rdy => wr_data_zero_guard_rsc_rdy_nPE_bud,
      O_instr_in_rsc_dat => PE_O_instr_in_rsc_dat,
      O_instr_in_rsc_vld => O_instr_L1_out_rsc_vld_nCCInst_bud,
      O_instr_in_rsc_rdy => O_instr_in_rsc_rdy_nPE_bud,
      I_instr_in_rsc_dat => PE_I_instr_in_rsc_dat,
      I_instr_in_rsc_vld => I_instr_L1_out_rsc_vld_nCCInst_bud,
      I_instr_in_rsc_rdy => I_instr_in_rsc_rdy_nPE_bud,
      W_instr_in_rsc_dat => PE_W_instr_in_rsc_dat,
      W_instr_in_rsc_vld => W_instr_L1_out_rsc_vld_nCCInst_bud,
      W_instr_in_rsc_rdy => W_instr_in_rsc_rdy_nPE_bud
    );
  PE_O_wr_data_rsc_dat <= O_data_in_rsc_dat_data;
  O_rd_data_rsc_dat_nPE <= PE_O_rd_data_rsc_dat;
  PE_I_wr_data_rsc_dat <= I_data_in_rsc_dat_data;
  PE_W_wr_data_rsc_dat <= W_data_in_rsc_dat_data;
  PE_O_instr_in_rsc_dat <= O_instr_L1_out_rsc_dat_nCCInst;
  PE_I_instr_in_rsc_dat <= I_instr_L1_out_rsc_dat_nCCInst;
  PE_W_instr_in_rsc_dat <= W_instr_L1_out_rsc_dat_nCCInst;

  O_data_out_rsc_dat_data <= O_rd_data_rsc_dat_nPE;
  layer_instruction_in_rsc_rdy <= layer_instruction_in_rsc_rdy_nCCInst_bud;
  O_data_in_rsc_rdy <= O_wr_data_rsc_rdy_nPE_bud;
  O_data_out_rsc_vld <= O_rd_data_rsc_vld_nPE_bud;
  I_data_in_rsc_rdy <= I_wr_data_rsc_rdy_nPE_bud;
  W_data_in_rsc_rdy <= W_wr_data_rsc_rdy_nPE_bud;
  zero_guard_in_rsc_rdy <= wr_data_zero_guard_rsc_rdy_nPE_bud;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000149.ALL;
USE work.topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000151.ALL;


ENTITY top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000
    IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    O_data_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_data_in_rsc_vld : IN STD_LOGIC;
    O_data_in_rsc_rdy : OUT STD_LOGIC;
    O_data_out_rsc_dat : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    O_data_out_rsc_vld : OUT STD_LOGIC;
    O_data_out_rsc_rdy : IN STD_LOGIC;
    I_data_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    I_data_in_rsc_vld : IN STD_LOGIC;
    I_data_in_rsc_rdy : OUT STD_LOGIC;
    W_data_in_rsc_dat : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    W_data_in_rsc_vld : IN STD_LOGIC;
    W_data_in_rsc_rdy : OUT STD_LOGIC;
    zero_guard_in_rsc_dat : IN STD_LOGIC;
    zero_guard_in_rsc_vld : IN STD_LOGIC;
    zero_guard_in_rsc_rdy : OUT STD_LOGIC;
    layer_instruction_in_rsc_dat : IN STD_LOGIC_VECTOR (484 DOWNTO 0);
    layer_instruction_in_rsc_vld : IN STD_LOGIC;
    layer_instruction_in_rsc_rdy : OUT STD_LOGIC
  );
END top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000;

ARCHITECTURE v2 OF top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000000
    IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL O_data_out_rsc_dat_data : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      O_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_data_in_rsc_vld : IN STD_LOGIC;
      O_data_in_rsc_rdy : OUT STD_LOGIC;
      O_data_out_rsc_dat_data : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      O_data_out_rsc_vld : OUT STD_LOGIC;
      O_data_out_rsc_rdy : IN STD_LOGIC;
      I_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      I_data_in_rsc_vld : IN STD_LOGIC;
      I_data_in_rsc_rdy : OUT STD_LOGIC;
      W_data_in_rsc_dat_data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      W_data_in_rsc_vld : IN STD_LOGIC;
      W_data_in_rsc_rdy : OUT STD_LOGIC;
      zero_guard_in_rsc_dat : IN STD_LOGIC;
      zero_guard_in_rsc_vld : IN STD_LOGIC;
      zero_guard_in_rsc_rdy : OUT STD_LOGIC;
      layer_instruction_in_rsc_dat_relevancy : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_1 : IN STD_LOGIC_VECTOR (54 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_2 : IN STD_LOGIC_VECTOR (79 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_3 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_3 : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_4 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_4 : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_5 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_5 : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_6 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_6 : IN STD_LOGIC_VECTOR (24 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_7 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_7 : IN STD_LOGIC_VECTOR (44 DOWNTO 0);
      layer_instruction_in_rsc_dat_relevancy_8 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      layer_instruction_in_rsc_dat_bound_8 : IN STD_LOGIC_VECTOR (69 DOWNTO 0);
      layer_instruction_in_rsc_vld : IN STD_LOGIC;
      layer_instruction_in_rsc_rdy : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000003
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000004
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000005
      : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000006
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000007
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000008
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000009
      : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000010
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000011
      : STD_LOGIC_VECTOR (79 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000012
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000013
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000014
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000015
      : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000016
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000017
      : STD_LOGIC_VECTOR (69 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000018
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000019
      : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000020
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000021
      : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000022
      : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000023
      : STD_LOGIC_VECTOR (69 DOWNTO 0);

BEGIN
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000001
      : topless_5comma_32comma_1comma_1comma_O_addr_type_L1comma_32comma_1comma_1comma_I_addr_type_L1comma_32comma_1comma_1comma_W_addr_type_L1comma_5comma_288comma_8comma_8comma_O_addr_type_L2comma_312comma_8comma_8comma_I_addr_type_L2c000000
    PORT MAP(
      clk => clk,
      rst => rst,
      O_data_in_rsc_dat_data => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002,
      O_data_in_rsc_vld => O_data_in_rsc_vld,
      O_data_in_rsc_rdy => O_data_in_rsc_rdy,
      O_data_out_rsc_dat_data => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000003,
      O_data_out_rsc_vld => O_data_out_rsc_vld,
      O_data_out_rsc_rdy => O_data_out_rsc_rdy,
      I_data_in_rsc_dat_data => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000004,
      I_data_in_rsc_vld => I_data_in_rsc_vld,
      I_data_in_rsc_rdy => I_data_in_rsc_rdy,
      W_data_in_rsc_dat_data => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000005,
      W_data_in_rsc_vld => W_data_in_rsc_vld,
      W_data_in_rsc_rdy => W_data_in_rsc_rdy,
      zero_guard_in_rsc_dat => zero_guard_in_rsc_dat,
      zero_guard_in_rsc_vld => zero_guard_in_rsc_vld,
      zero_guard_in_rsc_rdy => zero_guard_in_rsc_rdy,
      layer_instruction_in_rsc_dat_relevancy => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000006,
      layer_instruction_in_rsc_dat_bound => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000007,
      layer_instruction_in_rsc_dat_relevancy_1 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000008,
      layer_instruction_in_rsc_dat_bound_1 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000009,
      layer_instruction_in_rsc_dat_relevancy_2 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000010,
      layer_instruction_in_rsc_dat_bound_2 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000011,
      layer_instruction_in_rsc_dat_relevancy_3 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000012,
      layer_instruction_in_rsc_dat_bound_3 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000013,
      layer_instruction_in_rsc_dat_relevancy_4 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000014,
      layer_instruction_in_rsc_dat_bound_4 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000015,
      layer_instruction_in_rsc_dat_relevancy_5 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000016,
      layer_instruction_in_rsc_dat_bound_5 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000017,
      layer_instruction_in_rsc_dat_relevancy_6 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000018,
      layer_instruction_in_rsc_dat_bound_6 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000019,
      layer_instruction_in_rsc_dat_relevancy_7 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000020,
      layer_instruction_in_rsc_dat_bound_7 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000021,
      layer_instruction_in_rsc_dat_relevancy_8 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000022,
      layer_instruction_in_rsc_dat_bound_8 => top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000023,
      layer_instruction_in_rsc_vld => layer_instruction_in_rsc_vld,
      layer_instruction_in_rsc_rdy => layer_instruction_in_rsc_rdy
    );
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000002
      <= O_data_in_rsc_dat;
  O_data_out_rsc_dat_data <= top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000003;
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000004
      <= I_data_in_rsc_dat;
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000005
      <= W_data_in_rsc_dat;
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000006
      <= layer_instruction_in_rsc_dat(484 DOWNTO 480);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000007
      <= layer_instruction_in_rsc_dat(479 DOWNTO 455);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000008
      <= layer_instruction_in_rsc_dat(454 DOWNTO 450);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000009
      <= layer_instruction_in_rsc_dat(449 DOWNTO 395);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000010
      <= layer_instruction_in_rsc_dat(394 DOWNTO 390);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000011
      <= layer_instruction_in_rsc_dat(389 DOWNTO 310);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000012
      <= layer_instruction_in_rsc_dat(309 DOWNTO 305);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000013
      <= layer_instruction_in_rsc_dat(304 DOWNTO 280);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000014
      <= layer_instruction_in_rsc_dat(279 DOWNTO 275);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000015
      <= layer_instruction_in_rsc_dat(274 DOWNTO 230);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000016
      <= layer_instruction_in_rsc_dat(229 DOWNTO 225);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000017
      <= layer_instruction_in_rsc_dat(224 DOWNTO 155);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000018
      <= layer_instruction_in_rsc_dat(154 DOWNTO 150);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000019
      <= layer_instruction_in_rsc_dat(149 DOWNTO 125);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000020
      <= layer_instruction_in_rsc_dat(124 DOWNTO 120);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000021
      <= layer_instruction_in_rsc_dat(119 DOWNTO 75);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000022
      <= layer_instruction_in_rsc_dat(74 DOWNTO 70);
  top_5_32_1_1_O_addr_type_L1_32_1_1_I_addr_type_L1_32_1_1_W_addr_type_L1_5_288_8_8_O_addr_type_L2_312_8_8_I_addr_type_L2_1728_8_8_W_addr_type_L2_5_8640_8_8_O_addr_type_L3_8640_8_8_I_addr_type_L3_55296_8_8_W_addr_type_L3_O_partial_000023
      <= layer_instruction_in_rsc_dat(69 DOWNTO 0);

  O_data_out_rsc_dat <= O_data_out_rsc_dat_data;
END v2;



