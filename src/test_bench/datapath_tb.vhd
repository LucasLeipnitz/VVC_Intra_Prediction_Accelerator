-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY datapath_tb IS
END datapath_tb;

ARCHITECTURE comportamental OF datapath_tb IS 

SIGNAL input : ref_bus (-66 to 38 ); 
SIGNAL state : std_logic;
SIGNAL clk : std_logic;
SIGNAL rst : std_logic;
SIGNAL rst_sum_buffer : std_logic;
SIGNAL wrt : std_logic;
SIGNAL base : integer := -1;
SIGNAL mode0_out: output_bus;
SIGNAL mode1_out: std_logic_vector(7 downto 0);
SIGNAL mode2_out: output_bus;
FILE file_planar : text;
FILE file_mode2 : text;
CONSTANT c_WIDTH : natural := 4;


COMPONENT datapath IS
	PORT (
		input : IN ref_bus (-66 to 38 );
		state : IN std_logic;
		base : IN integer;
		clk : IN std_logic;
		rst	: IN std_logic;
		rst_sum_buffer: IN std_logic;
		wrt : IN std_logic;
		mode0_out: OUT output_bus;
		mode1_out: OUT std_logic_vector(7 downto 0);
		mode2_out: OUT output_bus
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
    PORT MAP (input => input, state => state, wrt => wrt, clk => clk, base => base, rst => rst, rst_sum_buffer => rst_sum_buffer, mode0_out => mode0_out, mode1_out => mode1_out, mode2_out => mode2_out);
	file_open(file_planar, "output_results_planar.txt", write_mode);
	file_open(file_mode2, "output_results_mode2.txt", write_mode);
	init : PROCESS
		VARIABLE planar_line  : line;
		VARIABLE mode2_line  : line;
		VARIABLE row  : line;
		VARIABLE next_state : integer;
		VARIABLE wrt_file : boolean;
	
    BEGIN
	    clk <= '1';
		rst <= '1';
		wait for 5 ns;
		clk <= '0';
		rst <= '0';
		wait for 5 ns;
		clk <= '1';
		wrt <= '1';
		input(-66) <= "00001110"; --14
		input(-65) <= "01101011"; --107
		input(-64) <= "11011000"; --216
		input(-63) <= "10100001"; --161
		input(-62) <= "00101000"; --40
		input(-61) <= "10011000"; --152
		input(-60) <= "01001111"; --79
		input(-59) <= "10001110"; --142
		input(-58) <= "00110111"; --55
		input(-57) <= "01000110"; --70
		input(-56) <= "10011100"; --156
		input(-55) <= "10001100"; --140
		input(-54) <= "10110111"; --183
		input(-53) <= "11011011"; --219
		input(-52) <= "00100000"; --32
		input(-51) <= "11110111"; --247
		input(-50) <= "10001111"; --143
		input(-49) <= "01010111"; --87
		input(-48) <= "00011101"; --29
		input(-47) <= "11010011"; --211
		input(-46) <= "11000010"; --194
		input(-45) <= "00111011"; --59
		input(-44) <= "11000100"; --196
		input(-43) <= "01011110"; --94
		input(-42) <= "10001111"; --143
		input(-41) <= "10000111"; --135
		input(-40) <= "01000100"; --68
		input(-39) <= "01100000"; --96
		input(-38) <= "11101000"; --232
		input(-37) <= "01000111"; --71
		input(-36) <= "10101000"; --168
		input(-35) <= "10110110"; --182
		input(-34) <= "11110001"; --241
		input(-33) <= "11100101"; --229
		input(-32) <= "00100100"; --36
		input(-31) <= "11011100"; --220
		input(-30) <= "10111000"; --184
		input(-29) <= "11001001"; --201
		input(-28) <= "10100101"; --165
		input(-27) <= "00010010"; --18
		input(-26) <= "00101110"; --46
		input(-25) <= "11111111"; --255
		input(-24) <= "11011101"; --221
		input(-23) <= "01110110"; --118
		input(-22) <= "00011101"; --29
		input(-21) <= "01011111"; --95
		input(-20) <= "11001011"; --203
		input(-19) <= "00001111"; --15
		input(-18) <= "01001001"; --73
		input(-17) <= "01111000"; --120
		input(-16) <= "00011010"; --26
		input(-15) <= "11111111"; --255
		input(-14) <= "01111110"; --126
		input(-13) <= "11010011"; --211
		input(-12) <= "11010101"; --213
		input(-11) <= "01101100"; --108
		input(-10) <= "11101001"; --233
		input(-9) <= "11001010"; --202
		input(-8) <= "10111100"; --188
		input(-7) <= "11000010"; --194
		input(-6) <= "01111101"; --125
		input(-5) <= "00001101"; --13
		input(-4) <= "00101101"; --45
		input(-3) <= "11111010"; --250
		input(-2) <= "01111000"; --120
		input(-1) <= "01000010"; --66
		input(0) <= "01111111"; --127
		input(1) <= "10111010"; --186
		input(2) <= "11101010"; --234
		input(3) <= "00011001"; --25
		input(4) <= "00001000"; --8
		input(5) <= "10010000"; --144
		input(6) <= "11111001"; --249
		input(7) <= "10110111"; --183
		input(8) <= "10101110"; --174
		input(9) <= "10111100"; --188
		input(10) <= "01011011"; --91
		input(11) <= "11110011"; --243
		input(12) <= "11111100"; --252
		input(13) <= "01011010"; --90
		input(14) <= "00000101"; --5
		input(15) <= "00111111"; --63
		input(16) <= "01000110"; --70
		input(17) <= "00101001"; --41
		input(18) <= "00101010"; --42
		input(19) <= "00101111"; --47
		input(20) <= "10100111"; --167
		input(21) <= "11111011"; --251
		input(22) <= "11101010"; --234
		input(23) <= "11000111"; --199
		input(24) <= "01101010"; --106
		input(25) <= "10111100"; --188
		input(26) <= "01100100"; --100
		input(27) <= "00011001"; --25
		input(28) <= "10001001"; --137
		input(29) <= "11101101"; --237
		input(30) <= "10100110"; --166
		input(31) <= "01000010"; --66
		input(32) <= "00011100"; --28
		input(33) <= "00001100"; --12
		input(34) <= "00001110"; --14
		input(35) <= "10110111"; --183
		input(36) <= "00010000"; --16
		input(37) <= "10111100"; --188
		input(38) <= "00011110"; --30
		
		wait for 5 ns;
		clk <= '0';
		wrt <= '0';
		rst <= '0';
		
		wait for 5 ns;
		next_state := 0;
		rst_sum_buffer <= '1';
		wrt_file := false;
		
		WHILE base /= 32 LOOP
			clk <= '1';
			IF next_state = 0 THEN
				base <= base + 1;
				next_state := 1;
				state <= '0';
			ELSE 
				next_state := 0;
				state <= '1';
			END IF;
			
			wait for 5 ns;
			clk <= '0';
			rst_sum_buffer <= '0';
			
			IF(wrt_file = true) THEN
				FOR i IN 0 TO 15 LOOP
		            write(planar_line, mode0_out(i), right, c_WIDTH);
					write(mode2_line, mode2_out(i), right, c_WIDTH);
		            writeline(file_planar, planar_line);
					writeline(file_mode2, mode2_line);
	        	END LOOP;
			ELSE
				wrt_file := true;
			END IF;
			
			wait for 5 ns;
			
		END LOOP;
		
		file_close(file_planar);
		file_close(file_mode2);
		
		wait;
	
	END PROCESS init;

END comportamental;

