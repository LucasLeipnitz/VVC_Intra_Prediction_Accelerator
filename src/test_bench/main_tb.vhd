-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY main_tb IS
END main_tb;

ARCHITECTURE comportamental OF main_tb IS 

SIGNAL input : ref_bus (-66 TO 38 ); 
SIGNAL clk : std_logic;
SIGNAL rst : std_logic;
SIGNAL start : std_logic;
SIGNAL mode0_out: output_bus;
SIGNAL mode1_out: std_logic_vector(7 DOWNTO 0);
SIGNAL mode_angular_out: main_output;
FILE file_planar : text;
FILE file_mode2 : text;
FILE file_mode3 : text;
FILE file_mode7 : text;
FILE file_mode10 : text;
FILE file_mode18 : text;
FILE file_mode23 : text;
FILE file_mode26 : text;
FILE file_mode30 : text;
FILE file_mode33 : text;
FILE file_mode34 : text;
FILE file_mode35 : text;
FILE file_mode43 : text;
FILE file_mode46 : text;
FILE file_mode49 : text;
FILE file_mode50 : text;
FILE file_mode54 : text;
CONSTANT c_WIDTH : natural := 4;


COMPONENT main IS
PORT (
    clk : IN std_logic;
    rst	: IN std_logic;
	start : IN std_logic;
    input : IN ref_bus (-66 to 38 );
	mode0_out: OUT output_bus;
	mode1_out: OUT std_logic_vector(7 downto 0);
	mode_angular_out: OUT main_output
);
END COMPONENT;

BEGIN
	
	i1 : main
    PORT MAP (input => input, start => start, clk => clk, rst => rst, mode0_out => mode0_out, mode1_out => mode1_out, mode_angular_out => mode_angular_out);
	file_open(file_planar, "output_results_planar.txt", write_mode);
	file_open(file_mode2, "output_results_mode2.txt", write_mode);
	file_open(file_mode3, "output_results_mode3.txt", write_mode);
	file_open(file_mode7, "output_results_mode7.txt", write_mode);
	file_open(file_mode10, "output_results_mode10.txt", write_mode);
	file_open(file_mode18, "output_results_mode18.txt", write_mode);
	file_open(file_mode23, "output_results_mode23.txt", write_mode);
	file_open(file_mode26, "output_results_mode26.txt", write_mode);
	file_open(file_mode30, "output_results_mode30.txt", write_mode);
	file_open(file_mode33, "output_results_mode33.txt", write_mode);
	file_open(file_mode34, "output_results_mode34.txt", write_mode);
	file_open(file_mode35, "output_results_mode35.txt", write_mode);
	file_open(file_mode43, "output_results_mode43.txt", write_mode);
	file_open(file_mode46, "output_results_mode46.txt", write_mode);
	file_open(file_mode49, "output_results_mode49.txt", write_mode);
	file_open(file_mode50, "output_results_mode50.txt", write_mode);
	file_open(file_mode54, "output_results_mode54.txt", write_mode);
	init : PROCESS
		VARIABLE planar_line  : line;
		VARIABLE mode2_line  : line;
		VARIABLE mode3_line  : line;
		VARIABLE mode7_line  : line;
		VARIABLE mode10_line  : line;
		VARIABLE mode18_line  : line;
		VARIABLE mode23_line  : line;
		VARIABLE mode26_line  : line;
		VARIABLE mode30_line  : line;
		VARIABLE mode33_line  : line;
		VARIABLE mode34_line  : line;
		VARIABLE mode35_line  : line;
		VARIABLE mode43_line  : line;
		VARIABLE mode46_line  : line;
		VARIABLE mode49_line  : line;
		VARIABLE mode50_line  : line;
		VARIABLE mode54_line  : line;
		VARIABLE row  : line;
		VARIABLE wrt_file : boolean;
	
    BEGIN

		clk <= '1';
		rst <= '1';
		start <= '1';
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
		rst <= '0';
		wrt_file := false;
		
		wait for 5 ns;
		
		FOR i IN 0 to 128 LOOP
			clk <= NOT clk;
			start <= '0';
			
			wait for 5 ns;
			
			IF(wrt_file = true AND clk = '1') THEN
				FOR i IN 0 TO 15 LOOP
		            write(planar_line, mode0_out(i), right, c_WIDTH);
					write(mode2_line, mode_angular_out(0)(i), right, c_WIDTH);
					write(mode3_line, mode_angular_out(1)(i), right, c_WIDTH);
					write(mode7_line, mode_angular_out(2)(i), right, c_WIDTH);
					write(mode10_line, mode_angular_out(3)(i), right, c_WIDTH);
					write(mode18_line, mode_angular_out(4)(i), right, c_WIDTH);
					write(mode23_line, mode_angular_out(5)(i), right, c_WIDTH);
					write(mode26_line, mode_angular_out(6)(i), right, c_WIDTH);
					write(mode30_line, mode_angular_out(7)(i), right, c_WIDTH);
					write(mode33_line, mode_angular_out(8)(i), right, c_WIDTH);
					write(mode34_line, mode_angular_out(9)(i), right, c_WIDTH);
					write(mode35_line, mode_angular_out(10)(i), right, c_WIDTH);
					write(mode43_line, mode_angular_out(11)(i), right, c_WIDTH);
					write(mode46_line, mode_angular_out(12)(i), right, c_WIDTH);
					write(mode49_line, mode_angular_out(13)(i), right, c_WIDTH);
					write(mode50_line, mode_angular_out(14)(i), right, c_WIDTH);
					write(mode54_line, mode_angular_out(15)(i), right, c_WIDTH);
		            writeline(file_planar, planar_line);
					writeline(file_mode2, mode2_line);
					writeline(file_mode3, mode3_line);
					writeline(file_mode7, mode7_line);
					writeline(file_mode10, mode10_line);
					writeline(file_mode18, mode18_line);
					writeline(file_mode23, mode23_line);
					writeline(file_mode26, mode26_line);
					writeline(file_mode30, mode30_line);
					writeline(file_mode33, mode33_line);
					writeline(file_mode34, mode34_line);
					writeline(file_mode35, mode35_line);
					writeline(file_mode43, mode43_line);
					writeline(file_mode46, mode46_line);
					writeline(file_mode49, mode49_line);
					writeline(file_mode50, mode50_line);
					writeline(file_mode54, mode54_line);
	        	END LOOP;
			ELSE
				wrt_file := true;
			END IF;
			
		END LOOP;
		
		wait for 5 ns;
		
		file_close(file_planar);
		file_close(file_mode2);
		file_close(file_mode3);
		file_close(file_mode7);
		file_close(file_mode10);
		file_close(file_mode18);
		file_close(file_mode23);
		file_close(file_mode26);
		file_close(file_mode30);
		file_close(file_mode33);
		file_close(file_mode34);
		file_close(file_mode35);
		file_close(file_mode43);
		file_close(file_mode46);
		file_close(file_mode49);
		file_close(file_mode50);
		file_close(file_mode54);
		
		wait;
	
	END PROCESS init;

END comportamental;

