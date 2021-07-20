library ieee;
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


library ieee;
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
