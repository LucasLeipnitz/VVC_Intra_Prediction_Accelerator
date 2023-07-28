-----------------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_35_tb IS
END mode_35_tb;

ARCHITECTURE mode_35_arch OF mode_35_tb IS


-----------------------------------------------------------------------------
-- Testbench Internal Signals
-----------------------------------------------------------------------------

SIGNAL ref : ref_bus (-15 to 2 );
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;


-----------------------------------------------------------------------------
-- Declare the Component Under Test
-----------------------------------------------------------------------------
COMPONENT mode_35
PORT (
	ref : in ref_bus (-15 to 2 );
	output : out output_bus
  );
END COMPONENT;

BEGIN
	
	i1 : mode_35
	PORT MAP (ref => ref, output => output);
	
	file_open(file_RESULTS, "output_results.txt", write_mode);

	init : PROCESS
		VARIABLE v_OLINE	: line;
	
	
		BEGIN  
			ref(-1) <= "00001001"; --9
			ref(0) <= "00110000"; --48
			ref(1) <= "10001110"; --142
			ref(2) <= "11110011"; --243
			--output(0) = (9*-2 + 48*60 + 142*7 + 243*-1 + 32) >> 6 = 56
			ref(-2) <= "00001001"; --9
			ref(-3) <= "00110000"; --48
			ref(-4) <= "10001110"; --142
			ref(-5) <= "11110011"; --243
			ref(-6) <= "00001001"; --9
			ref(-7) <= "00110000"; --48
			ref(-8) <= "10001110"; --142
			ref(-9) <= "11110011"; --243
			ref(-10) <= "00001001"; --9
			ref(-11) <= "00110000"; --48
			ref(-12) <= "10001110"; --142
			ref(-13) <= "11110011"; --243
			ref(-14) <= "10001110"; --142
			ref(-15) <= "11110011"; --243
			
			write(v_OLINE, output(0), right, c_WIDTH);
			wait;
	
	END PROCESS init;                                          

END mode_35_arch;
