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

library ieee;
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

library ieee;
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

