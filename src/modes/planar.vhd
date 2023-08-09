-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY planar IS
	PORT (
		ref : in ref_bus (0 to 3);
		state: in std_logic;
		output : out output_bus
	);
END planar;

ARCHITECTURE comportamental OF planar IS

COMPONENT planar_eq_block IS
    PORT (
		ref : in ref_bus (0 to 1);
		state: in std_logic;
		output : out planar_eq_out
	);
END COMPONENT;

signal predV_out : planar_eq_out;
signal predH_out : planar_eq_out;

BEGIN

predV: planar_eq_block
PORT MAP (ref => ref(0 to 1), state => state, output => predV_out);

predH: planar_eq_block
PORT MAP (ref => ref(2 to 3), state => state, output => predH_out);

PROCESS (predV_out, predH_out) is

variable sum : std_logic_vector (18 downto 0);

    BEGIN
        FOR i IN 0 to 15 LOOP
            sum := ('0' & predV_out(i)) + ('0' & predH_out(i)) + "0000000010000000000"; -- nTbH * nTbW = 32*32 = 1024
            output(i) <= sum(18 downto 11); -- >> (Log2(32) + Log2(32) + 1) = >> 11
        END LOOP;
END PROCESS;

END comportamental;
