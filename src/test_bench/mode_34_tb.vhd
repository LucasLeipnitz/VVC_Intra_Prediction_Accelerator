-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_34_tb IS
END mode_34_tb;

ARCHITECTURE comportamental OF mode_34_tb IS

SIGNAL ref : ref_bus (-16 to 1);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_34
	PORT ( 
		ref : in ref_bus (-16 to 1);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_34
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "11101000"; -- 232
			ref(0) <= "10110101"; -- 181
			ref(1) <= "01100000"; -- 96
			ref(-2) <= "11100111"; -- 231
			ref(-3) <= "10100010"; -- 162
			ref(-4) <= "10011011"; -- 155
			ref(-5) <= "00100111"; -- 39
			ref(-6) <= "00110101"; -- 53
			ref(-7) <= "01101110"; -- 110
			ref(-8) <= "11110010"; -- 242
			ref(-9) <= "11011011"; -- 219
			ref(-10) <= "00000111"; -- 7
			ref(-11) <= "11001100"; -- 204
			ref(-12) <= "01011101"; -- 93
			ref(-13) <= "00000101"; -- 5
			ref(-14) <= "01110100"; -- 116
			ref(-15) <= "01011110"; -- 94
			ref(-16) <= "01000110"; -- 70

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "10101100"; -- 172
			ref(0) <= "00000111"; -- 7
			ref(1) <= "10001001"; -- 137
			ref(-2) <= "10001000"; -- 136
			ref(-3) <= "00011111"; -- 31
			ref(-4) <= "11011110"; -- 222
			ref(-5) <= "11000101"; -- 197
			ref(-6) <= "01111010"; -- 122
			ref(-7) <= "11110111"; -- 247
			ref(-8) <= "11110111"; -- 247
			ref(-9) <= "00110001"; -- 49
			ref(-10) <= "11000001"; -- 193
			ref(-11) <= "10101010"; -- 170
			ref(-12) <= "11111110"; -- 254
			ref(-13) <= "11010111"; -- 215
			ref(-14) <= "10100010"; -- 162
			ref(-15) <= "11010111"; -- 215
			ref(-16) <= "00001001"; -- 9

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "10001111"; -- 143
			ref(0) <= "00000001"; -- 1
			ref(1) <= "10100011"; -- 163
			ref(-2) <= "00110111"; -- 55
			ref(-3) <= "01011100"; -- 92
			ref(-4) <= "10011100"; -- 156
			ref(-5) <= "10001111"; -- 143
			ref(-6) <= "10100001"; -- 161
			ref(-7) <= "10011010"; -- 154
			ref(-8) <= "01001110"; -- 78
			ref(-9) <= "01011011"; -- 91
			ref(-10) <= "10110100"; -- 180
			ref(-11) <= "10101101"; -- 173
			ref(-12) <= "00000010"; -- 2
			ref(-13) <= "10001111"; -- 143
			ref(-14) <= "00001111"; -- 15
			ref(-15) <= "01011100"; -- 92
			ref(-16) <= "11110000"; -- 240

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11001101"; -- 205
			ref(0) <= "00001011"; -- 11
			ref(1) <= "01111111"; -- 127
			ref(-2) <= "11010111"; -- 215
			ref(-3) <= "01000010"; -- 66
			ref(-4) <= "10111001"; -- 185
			ref(-5) <= "01011100"; -- 92
			ref(-6) <= "01011011"; -- 91
			ref(-7) <= "01101101"; -- 109
			ref(-8) <= "00010000"; -- 16
			ref(-9) <= "11100110"; -- 230
			ref(-10) <= "11010011"; -- 211
			ref(-11) <= "11111001"; -- 249
			ref(-12) <= "11100010"; -- 226
			ref(-13) <= "11110011"; -- 243
			ref(-14) <= "10010011"; -- 147
			ref(-15) <= "11001000"; -- 200
			ref(-16) <= "10110001"; -- 177

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11111000"; -- 248
			ref(0) <= "01001011"; -- 75
			ref(1) <= "01101111"; -- 111
			ref(-2) <= "01110101"; -- 117
			ref(-3) <= "11001101"; -- 205
			ref(-4) <= "00011101"; -- 29
			ref(-5) <= "00110110"; -- 54
			ref(-6) <= "10110010"; -- 178
			ref(-7) <= "10010011"; -- 147
			ref(-8) <= "00110101"; -- 53
			ref(-9) <= "10110001"; -- 177
			ref(-10) <= "00101011"; -- 43
			ref(-11) <= "00101100"; -- 44
			ref(-12) <= "00100110"; -- 38
			ref(-13) <= "10001010"; -- 138
			ref(-14) <= "00011000"; -- 24
			ref(-15) <= "01011011"; -- 91
			ref(-16) <= "01010110"; -- 86

			write(row,4, right);
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