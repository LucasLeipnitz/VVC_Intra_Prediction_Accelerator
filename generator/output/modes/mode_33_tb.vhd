-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_33_tb IS
END mode_33_tb;

ARCHITECTURE comportamental OF mode_33_tb IS

SIGNAL ref : ref_bus (-15 to 2);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_33
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_33
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(-1) <= "10000111"; -- 135
			ref(0) <= "11111110"; -- 254
			ref(1) <= "10100110"; -- 166
			ref(2) <= "01010000"; -- 80
			ref(-2) <= "10001111"; -- 143
			ref(-3) <= "10000111"; -- 135
			ref(-4) <= "01101111"; -- 111
			ref(-5) <= "10100101"; -- 165
			ref(-6) <= "00001010"; -- 10
			ref(-7) <= "01110001"; -- 113
			ref(-8) <= "01110110"; -- 118
			ref(-9) <= "01010101"; -- 85
			ref(-10) <= "01010110"; -- 86
			ref(-11) <= "01001011"; -- 75
			ref(-12) <= "01100001"; -- 97
			ref(-13) <= "00010011"; -- 19
			ref(-14) <= "00100110"; -- 38
			ref(-15) <= "10110001"; -- 177

			write(row,0, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "11111001"; -- 249
			ref(0) <= "10001101"; -- 141
			ref(1) <= "00001011"; -- 11
			ref(2) <= "00110110"; -- 54
			ref(-2) <= "10010000"; -- 144
			ref(-3) <= "11110001"; -- 241
			ref(-4) <= "00100011"; -- 35
			ref(-5) <= "11110111"; -- 247
			ref(-6) <= "01001011"; -- 75
			ref(-7) <= "01011001"; -- 89
			ref(-8) <= "01001011"; -- 75
			ref(-9) <= "00111000"; -- 56
			ref(-10) <= "00001101"; -- 13
			ref(-11) <= "01101000"; -- 104
			ref(-12) <= "01111110"; -- 126
			ref(-13) <= "11100001"; -- 225
			ref(-14) <= "11100100"; -- 228

			write(row,0, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "01000011"; -- 67
			ref(0) <= "01001101"; -- 77
			ref(1) <= "10110001"; -- 177
			ref(2) <= "01111001"; -- 121
			ref(-2) <= "00001010"; -- 10
			ref(-3) <= "10000111"; -- 135
			ref(-4) <= "10100111"; -- 167
			ref(-5) <= "11011010"; -- 218
			ref(-6) <= "01010100"; -- 84
			ref(-7) <= "00110001"; -- 49
			ref(-8) <= "11000101"; -- 197
			ref(-9) <= "01010011"; -- 83
			ref(-10) <= "00001010"; -- 10
			ref(-11) <= "10011000"; -- 152
			ref(-12) <= "01100000"; -- 96
			ref(-13) <= "00011101"; -- 29
			ref(-14) <= "11101110"; -- 238
			ref(-15) <= "10100110"; -- 166

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "01100010"; -- 98
			ref(0) <= "11010001"; -- 209
			ref(1) <= "01111111"; -- 127
			ref(2) <= "11111011"; -- 251
			ref(-2) <= "01010111"; -- 87
			ref(-3) <= "00001110"; -- 14
			ref(-4) <= "00110111"; -- 55
			ref(-5) <= "11010000"; -- 208
			ref(-6) <= "11010110"; -- 214
			ref(-7) <= "00111111"; -- 63
			ref(-8) <= "01111100"; -- 124
			ref(-9) <= "11110010"; -- 242
			ref(-10) <= "00100011"; -- 35
			ref(-11) <= "01100110"; -- 102
			ref(-12) <= "11100101"; -- 229
			ref(-13) <= "01100000"; -- 96
			ref(-14) <= "11000100"; -- 196

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "11001110"; -- 206
			ref(0) <= "10101100"; -- 172
			ref(1) <= "00110010"; -- 50
			ref(2) <= "11010101"; -- 213
			ref(-2) <= "11101111"; -- 239
			ref(-3) <= "01111110"; -- 126
			ref(-4) <= "00011011"; -- 27
			ref(-5) <= "11010000"; -- 208
			ref(-6) <= "00011011"; -- 27
			ref(-7) <= "01010001"; -- 81
			ref(-8) <= "01001100"; -- 76
			ref(-9) <= "11011111"; -- 223
			ref(-10) <= "10000101"; -- 133
			ref(-11) <= "01100011"; -- 99
			ref(-12) <= "10100111"; -- 167
			ref(-13) <= "11100110"; -- 230
			ref(-14) <= "01000110"; -- 70
			ref(-15) <= "01110010"; -- 114

			write(row,2, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "10111100"; -- 188
			ref(0) <= "10101010"; -- 170
			ref(1) <= "11000110"; -- 198
			ref(2) <= "00001100"; -- 12
			ref(-2) <= "11000101"; -- 197
			ref(-3) <= "10110000"; -- 176
			ref(-4) <= "11001101"; -- 205
			ref(-5) <= "10010101"; -- 149
			ref(-6) <= "01111010"; -- 122
			ref(-7) <= "10101110"; -- 174
			ref(-8) <= "00000111"; -- 7
			ref(-9) <= "00010000"; -- 16
			ref(-10) <= "01001001"; -- 73
			ref(-11) <= "00100011"; -- 35
			ref(-12) <= "10010101"; -- 149
			ref(-13) <= "00000010"; -- 2
			ref(-14) <= "11100100"; -- 228

			write(row,2, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "10011000"; -- 152
			ref(0) <= "01000011"; -- 67
			ref(1) <= "10110100"; -- 180
			ref(2) <= "01110101"; -- 117
			ref(-2) <= "00111110"; -- 62
			ref(-3) <= "11100100"; -- 228
			ref(-4) <= "10001110"; -- 142
			ref(-5) <= "10011010"; -- 154
			ref(-6) <= "01010101"; -- 85
			ref(-7) <= "11110001"; -- 241
			ref(-8) <= "01001111"; -- 79
			ref(-9) <= "10100011"; -- 163
			ref(-10) <= "11100000"; -- 224
			ref(-11) <= "10010101"; -- 149
			ref(-12) <= "10010001"; -- 145
			ref(-13) <= "10100100"; -- 164
			ref(-14) <= "11000111"; -- 199
			ref(-15) <= "00010111"; -- 23

			write(row,3, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "00000101"; -- 5
			ref(0) <= "01000100"; -- 68
			ref(1) <= "00111101"; -- 61
			ref(2) <= "10111001"; -- 185
			ref(-2) <= "00101001"; -- 41
			ref(-3) <= "01101100"; -- 108
			ref(-4) <= "00000110"; -- 6
			ref(-5) <= "11101100"; -- 236
			ref(-6) <= "10001101"; -- 141
			ref(-7) <= "10011000"; -- 152
			ref(-8) <= "01100010"; -- 98
			ref(-9) <= "11011010"; -- 218
			ref(-10) <= "00101111"; -- 47
			ref(-11) <= "10100111"; -- 167
			ref(-12) <= "11101001"; -- 233
			ref(-13) <= "00101010"; -- 42
			ref(-14) <= "00001001"; -- 9

			write(row,3, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "00111000"; -- 56
			ref(0) <= "01010110"; -- 86
			ref(1) <= "00010101"; -- 21
			ref(2) <= "11001010"; -- 202
			ref(-2) <= "01100101"; -- 101
			ref(-3) <= "01001000"; -- 72
			ref(-4) <= "11100010"; -- 226
			ref(-5) <= "00000011"; -- 3
			ref(-6) <= "00000000"; -- 0
			ref(-7) <= "11111010"; -- 250
			ref(-8) <= "11010111"; -- 215
			ref(-9) <= "10100111"; -- 167
			ref(-10) <= "01000100"; -- 68
			ref(-11) <= "11000101"; -- 197
			ref(-12) <= "00110110"; -- 54
			ref(-13) <= "10000001"; -- 129
			ref(-14) <= "00110110"; -- 54
			ref(-15) <= "10010100"; -- 148

			write(row,4, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "11011011"; -- 219
			ref(0) <= "11110110"; -- 246
			ref(1) <= "11100110"; -- 230
			ref(2) <= "01101010"; -- 106
			ref(-2) <= "01110111"; -- 119
			ref(-3) <= "10011000"; -- 152
			ref(-4) <= "01010110"; -- 86
			ref(-5) <= "10101100"; -- 172
			ref(-6) <= "01110000"; -- 112
			ref(-7) <= "11111010"; -- 250
			ref(-8) <= "11101000"; -- 232
			ref(-9) <= "01111101"; -- 125
			ref(-10) <= "11000010"; -- 194
			ref(-11) <= "00000101"; -- 5
			ref(-12) <= "00001010"; -- 10
			ref(-13) <= "11001000"; -- 200
			ref(-14) <= "01011010"; -- 90

			write(row,4, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

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