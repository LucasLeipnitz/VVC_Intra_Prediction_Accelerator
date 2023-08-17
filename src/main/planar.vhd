-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY planar IS
	PORT (
		ref_x : in ref_bus (0 to 1);  
		ref_y : ref_bus (0 to 16);
		state: in std_logic;
		base : IN std_logic_vector(4 downto 0);
		clk : IN std_logic;
		rst	: IN std_logic;
		output : out output_bus
	);
END planar;

ARCHITECTURE comportamental OF planar IS

COMPONENT predH_block IS
	PORT (
		ref : in ref_bus (0 to 15);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		base: in std_logic_vector(4 downto 0);
		state: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		output : out planar_eq_out
	);
END COMPONENT;

COMPONENT predV_block IS
	PORT (
		ref : in std_logic_vector ( 7 downto 0);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		output : out planar_eq_out
	);
END COMPONENT;

signal predV_out : planar_eq_out;
signal predH_out : planar_eq_out;

BEGIN

predV: predV_block
PORT MAP (ref => ref_x(0), opposite_ref => ref_x(1), state => state, output => predV_out);

predH: predH_block
PORT MAP (ref => ref_y(0 to 15), opposite_ref => ref_y(16), base => base, state => state, clk => clk, rst => rst, output => predH_out);

PROCESS (predV_out, predH_out) is

variable sum : std_logic_vector (18 downto 0);

    BEGIN
        FOR i IN 0 to 15 LOOP
            sum := ('0' & predV_out(i)) + ('0' & predH_out(i)) + "0000000010000000000"; -- nTbH * nTbW = 32*32 = 1024
            output(i) <= sum(18 downto 11); -- >> (Log2(32) + Log2(32) + 1) = >> 11
        END LOOP;
END PROCESS;

END comportamental;
