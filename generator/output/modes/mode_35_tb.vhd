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
			ref(-15) <= "10001110"; -- 142
			ref(-14) <= "11100100"; -- 228
			ref(-13) <= "00000101"; -- 5
			ref(-12) <= "10101010"; -- 170
			ref(-11) <= "11000001"; -- 193
			ref(-10) <= "00110011"; -- 51
			ref(-9) <= "01100000"; -- 96
			ref(-8) <= "11111111"; -- 255
			ref(-7) <= "10000101"; -- 133
			ref(-6) <= "10100111"; -- 167
			ref(-5) <= "10010000"; -- 144
			ref(-4) <= "10010101"; -- 149
			ref(-3) <= "11110101"; -- 245
			ref(-2) <= "11111011"; -- 251
			ref(-1) <= "11001011"; -- 203
			ref(0) <= "00001001"; -- 9
			ref(1) <= "10111110"; -- 190
			ref(2) <= "11111110"; -- 254

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-15) <= "11011001"; -- 217
			ref(-14) <= "01111100"; -- 124
			ref(-13) <= "00111111"; -- 63
			ref(-12) <= "10010010"; -- 146
			ref(-11) <= "00100100"; -- 36
			ref(-10) <= "01110100"; -- 116
			ref(-9) <= "00110101"; -- 53
			ref(-8) <= "11101100"; -- 236
			ref(-7) <= "11100111"; -- 231
			ref(-6) <= "00101111"; -- 47
			ref(-5) <= "01110010"; -- 114
			ref(-4) <= "00011111"; -- 31
			ref(-3) <= "11110001"; -- 241
			ref(-2) <= "10001111"; -- 143
			ref(-1) <= "11010100"; -- 212
			ref(0) <= "11000111"; -- 199
			ref(1) <= "11100111"; -- 231
			ref(2) <= "01000100"; -- 68

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-15) <= "11101000"; -- 232
			ref(-14) <= "01000110"; -- 70
			ref(-13) <= "10111101"; -- 189
			ref(-12) <= "11010000"; -- 208
			ref(-11) <= "11101001"; -- 233
			ref(-10) <= "10011000"; -- 152
			ref(-9) <= "10010011"; -- 147
			ref(-8) <= "10101001"; -- 169
			ref(-7) <= "10111010"; -- 186
			ref(-6) <= "11001100"; -- 204
			ref(-5) <= "00011111"; -- 31
			ref(-4) <= "01101101"; -- 109
			ref(-3) <= "10101110"; -- 174
			ref(-2) <= "01110110"; -- 118
			ref(-1) <= "11101010"; -- 234
			ref(0) <= "11010101"; -- 213
			ref(1) <= "01000101"; -- 69
			ref(2) <= "01001011"; -- 75

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-15) <= "00100110"; -- 38
			ref(-14) <= "10101110"; -- 174
			ref(-13) <= "11001111"; -- 207
			ref(-12) <= "01101010"; -- 106
			ref(-11) <= "10111001"; -- 185
			ref(-10) <= "10001100"; -- 140
			ref(-9) <= "01000110"; -- 70
			ref(-8) <= "11011101"; -- 221
			ref(-7) <= "00101110"; -- 46
			ref(-6) <= "10011111"; -- 159
			ref(-5) <= "11101010"; -- 234
			ref(-4) <= "11010110"; -- 214
			ref(-3) <= "01010101"; -- 85
			ref(-2) <= "01110001"; -- 113
			ref(-1) <= "01100111"; -- 103
			ref(0) <= "01000000"; -- 64
			ref(1) <= "00110100"; -- 52
			ref(2) <= "00011101"; -- 29

			write(row,4, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-15) <= "10111001"; -- 185
			ref(-14) <= "00010001"; -- 17
			ref(-13) <= "11001011"; -- 203
			ref(-12) <= "11101010"; -- 234
			ref(-11) <= "10000111"; -- 135
			ref(-10) <= "11010011"; -- 211
			ref(-9) <= "00000100"; -- 4
			ref(-8) <= "10111110"; -- 190
			ref(-7) <= "00111000"; -- 56
			ref(-6) <= "00001110"; -- 14
			ref(-5) <= "00110000"; -- 48
			ref(-4) <= "10010000"; -- 144
			ref(-3) <= "00000000"; -- 0
			ref(-2) <= "11000111"; -- 199
			ref(-1) <= "10000000"; -- 128
			ref(0) <= "10101101"; -- 173
			ref(1) <= "10110000"; -- 176
			ref(2) <= "11000000"; -- 192

			write(row,5, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			file_close(file_RESULTS);

			wait;

	END PROCESS init;

END comportamental;