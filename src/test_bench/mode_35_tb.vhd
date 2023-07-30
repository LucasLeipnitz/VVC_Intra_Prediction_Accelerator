-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_35_tb IS
END mode_35_tb;

ARCHITECTURE comportamental OF mode_35_tb IS

SIGNAL ref : ref_bus (-15 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_35
	PORT ( 
		ref : in ref_bus (-15 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_35
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-15) <= "00110101"; -- 53
			ref(-14) <= "01111110"; -- 126
			ref(-13) <= "10010101"; -- 149
			ref(-12) <= "00000100"; -- 4
			ref(-11) <= "00001001"; -- 9
			ref(-10) <= "00101111"; -- 47
			ref(-9) <= "00001100"; -- 12
			ref(-8) <= "00001100"; -- 12
			ref(-7) <= "01111011"; -- 123
			ref(-6) <= "10110100"; -- 180
			ref(-5) <= "10001001"; -- 137
			ref(-4) <= "00110101"; -- 53
			ref(-3) <= "10010110"; -- 150
			ref(-2) <= "11011011"; -- 219
			ref(-1) <= "00100110"; -- 38
			ref(0) <= "10111001"; -- 185
			ref(1) <= "10000110"; -- 134
			ref(2) <= "00000110"; -- 6

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns

			ref(-15) <= "11001010"; -- 202
			ref(-14) <= "11000111"; -- 199
			ref(-13) <= "10101110"; -- 174
			ref(-12) <= "00110011"; -- 51
			ref(-11) <= "11000110"; -- 198
			ref(-10) <= "01010011"; -- 83
			ref(-9) <= "00011010"; -- 26
			ref(-8) <= "10000111"; -- 135
			ref(-7) <= "10010011"; -- 147
			ref(-6) <= "00111101"; -- 61
			ref(-5) <= "01000111"; -- 71
			ref(-4) <= "11000101"; -- 197
			ref(-3) <= "11001110"; -- 206
			ref(-2) <= "10100011"; -- 163
			ref(-1) <= "01101011"; -- 107
			ref(0) <= "00110110"; -- 54
			ref(1) <= "01101011"; -- 107
			ref(2) <= "01010010"; -- 82

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns

			ref(-15) <= "11011010"; -- 218
			ref(-14) <= "11111100"; -- 252
			ref(-13) <= "00101100"; -- 44
			ref(-12) <= "10001000"; -- 136
			ref(-11) <= "10001001"; -- 137
			ref(-10) <= "00000011"; -- 3
			ref(-9) <= "01100111"; -- 103
			ref(-8) <= "00000111"; -- 7
			ref(-7) <= "01101110"; -- 110
			ref(-6) <= "11010011"; -- 211
			ref(-5) <= "00000101"; -- 5
			ref(-4) <= "11110001"; -- 241
			ref(-3) <= "11110111"; -- 247
			ref(-2) <= "01000000"; -- 64
			ref(-1) <= "10000100"; -- 132
			ref(0) <= "01101010"; -- 106
			ref(1) <= "11011100"; -- 220
			ref(2) <= "01101111"; -- 111

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns

			ref(-15) <= "01011110"; -- 94
			ref(-14) <= "00010011"; -- 19
			ref(-13) <= "01100110"; -- 102
			ref(-12) <= "11011011"; -- 219
			ref(-11) <= "11101001"; -- 233
			ref(-10) <= "10101011"; -- 171
			ref(-9) <= "01111001"; -- 121
			ref(-8) <= "11010101"; -- 213
			ref(-7) <= "11001100"; -- 204
			ref(-6) <= "00011001"; -- 25
			ref(-5) <= "00010011"; -- 19
			ref(-4) <= "11110001"; -- 241
			ref(-3) <= "00110101"; -- 53
			ref(-2) <= "10110000"; -- 176
			ref(-1) <= "11110010"; -- 242
			ref(0) <= "00010011"; -- 19
			ref(1) <= "01110010"; -- 114
			ref(2) <= "00011010"; -- 26

			write(row,4, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns

			ref(-15) <= "11110110"; -- 246
			ref(-14) <= "00011111"; -- 31
			ref(-13) <= "10101000"; -- 168
			ref(-12) <= "00001100"; -- 12
			ref(-11) <= "11000101"; -- 197
			ref(-10) <= "01000110"; -- 70
			ref(-9) <= "01010111"; -- 87
			ref(-8) <= "11000000"; -- 192
			ref(-7) <= "10011100"; -- 156
			ref(-6) <= "10000110"; -- 134
			ref(-5) <= "01000001"; -- 65
			ref(-4) <= "10100001"; -- 161
			ref(-3) <= "11110010"; -- 242
			ref(-2) <= "10010110"; -- 150
			ref(-1) <= "10001000"; -- 136
			ref(0) <= "10101001"; -- 169
			ref(1) <= "11110101"; -- 245
			ref(2) <= "01100001"; -- 97

			write(row,5, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns

			file_close(file_RESULTS);

			wait;

	END PROCESS init;

END comportamental;