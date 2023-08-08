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
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_35
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_35
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(-1) <= "00110011"; -- 51
			ref(0) <= "10010000"; -- 144
			ref(1) <= "11010100"; -- 212
			ref(2) <= "11001000"; -- 200
			ref(-2) <= "11111011"; -- 251
			ref(-3) <= "00001101"; -- 13
			ref(-4) <= "00110000"; -- 48
			ref(-5) <= "10101000"; -- 168
			ref(-6) <= "01000111"; -- 71
			ref(-7) <= "01101110"; -- 110
			ref(-8) <= "11010001"; -- 209
			ref(-9) <= "01011101"; -- 93
			ref(-10) <= "00011100"; -- 28
			ref(-11) <= "11011011"; -- 219
			ref(-12) <= "11111011"; -- 251
			ref(-13) <= "01000001"; -- 65
			ref(-14) <= "11011100"; -- 220
			ref(-15) <= "10000001"; -- 129

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
			ref(-1) <= "11011111"; -- 223
			ref(0) <= "00100111"; -- 39
			ref(1) <= "00110011"; -- 51
			ref(2) <= "10011001"; -- 153
			ref(-2) <= "01011000"; -- 88
			ref(-3) <= "11011011"; -- 219
			ref(-4) <= "01000100"; -- 68
			ref(-5) <= "10101001"; -- 169
			ref(-6) <= "10000010"; -- 130
			ref(-7) <= "01111011"; -- 123
			ref(-8) <= "00010111"; -- 23
			ref(-9) <= "00011011"; -- 27
			ref(-10) <= "10111110"; -- 190
			ref(-11) <= "11010000"; -- 208
			ref(-12) <= "01000000"; -- 64
			ref(-13) <= "00110110"; -- 54
			ref(-14) <= "11001000"; -- 200

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
			ref(-1) <= "00011111"; -- 31
			ref(0) <= "01000101"; -- 69
			ref(1) <= "01011111"; -- 95
			ref(2) <= "00010100"; -- 20
			ref(-2) <= "10101100"; -- 172
			ref(-3) <= "11111111"; -- 255
			ref(-4) <= "10001110"; -- 142
			ref(-5) <= "01001000"; -- 72
			ref(-6) <= "01101100"; -- 108
			ref(-7) <= "00000110"; -- 6
			ref(-8) <= "01101110"; -- 110
			ref(-9) <= "00010000"; -- 16
			ref(-10) <= "11010110"; -- 214
			ref(-11) <= "00010011"; -- 19
			ref(-12) <= "00011111"; -- 31
			ref(-13) <= "10001110"; -- 142
			ref(-14) <= "11001110"; -- 206
			ref(-15) <= "11000110"; -- 198

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
			ref(-1) <= "10000101"; -- 133
			ref(0) <= "10010101"; -- 149
			ref(1) <= "11010000"; -- 208
			ref(2) <= "01111111"; -- 127
			ref(-2) <= "00111101"; -- 61
			ref(-3) <= "00001010"; -- 10
			ref(-4) <= "01111000"; -- 120
			ref(-5) <= "11101010"; -- 234
			ref(-6) <= "01111100"; -- 124
			ref(-7) <= "11010011"; -- 211
			ref(-8) <= "10110010"; -- 178
			ref(-9) <= "11111000"; -- 248
			ref(-10) <= "01000010"; -- 66
			ref(-11) <= "11010010"; -- 210
			ref(-12) <= "00110110"; -- 54
			ref(-13) <= "01001101"; -- 77
			ref(-14) <= "01110011"; -- 115

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
			ref(-1) <= "11010100"; -- 212
			ref(0) <= "00110110"; -- 54
			ref(1) <= "01111101"; -- 125
			ref(2) <= "00110101"; -- 53
			ref(-2) <= "11011011"; -- 219
			ref(-3) <= "00010101"; -- 21
			ref(-4) <= "11101000"; -- 232
			ref(-5) <= "01000101"; -- 69
			ref(-6) <= "00100111"; -- 39
			ref(-7) <= "11101010"; -- 234
			ref(-8) <= "10000101"; -- 133
			ref(-9) <= "10111100"; -- 188
			ref(-10) <= "00001011"; -- 11
			ref(-11) <= "11001100"; -- 204
			ref(-12) <= "00011110"; -- 30
			ref(-13) <= "00011111"; -- 31
			ref(-14) <= "01001111"; -- 79
			ref(-15) <= "01101011"; -- 107

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
			ref(-1) <= "10000011"; -- 131
			ref(0) <= "11011100"; -- 220
			ref(1) <= "00011111"; -- 31
			ref(2) <= "00001001"; -- 9
			ref(-2) <= "11001100"; -- 204
			ref(-3) <= "01110110"; -- 118
			ref(-4) <= "01000111"; -- 71
			ref(-5) <= "10011010"; -- 154
			ref(-6) <= "00100101"; -- 37
			ref(-7) <= "10010001"; -- 145
			ref(-8) <= "00010110"; -- 22
			ref(-9) <= "11001010"; -- 202
			ref(-10) <= "01100111"; -- 103
			ref(-11) <= "10101010"; -- 170
			ref(-12) <= "11101001"; -- 233
			ref(-13) <= "10011011"; -- 155
			ref(-14) <= "01100000"; -- 96

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
			ref(-1) <= "10100100"; -- 164
			ref(0) <= "00110100"; -- 52
			ref(1) <= "00110011"; -- 51
			ref(2) <= "11101110"; -- 238
			ref(-2) <= "01011100"; -- 92
			ref(-3) <= "11010010"; -- 210
			ref(-4) <= "00010110"; -- 22
			ref(-5) <= "10111111"; -- 191
			ref(-6) <= "11110100"; -- 244
			ref(-7) <= "11101000"; -- 232
			ref(-8) <= "11011100"; -- 220
			ref(-9) <= "00100101"; -- 37
			ref(-10) <= "01101011"; -- 107
			ref(-11) <= "01110101"; -- 117
			ref(-12) <= "00101101"; -- 45
			ref(-13) <= "01010010"; -- 82
			ref(-14) <= "11010101"; -- 213
			ref(-15) <= "11000100"; -- 196

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
			ref(-1) <= "10101100"; -- 172
			ref(0) <= "01101111"; -- 111
			ref(1) <= "11011010"; -- 218
			ref(2) <= "11110110"; -- 246
			ref(-2) <= "10110101"; -- 181
			ref(-3) <= "11110100"; -- 244
			ref(-4) <= "11001110"; -- 206
			ref(-5) <= "10001101"; -- 141
			ref(-6) <= "00001101"; -- 13
			ref(-7) <= "11001010"; -- 202
			ref(-8) <= "10111110"; -- 190
			ref(-9) <= "10011100"; -- 156
			ref(-10) <= "10000111"; -- 135
			ref(-11) <= "00010000"; -- 16
			ref(-12) <= "10101010"; -- 170
			ref(-13) <= "00101110"; -- 46
			ref(-14) <= "11110111"; -- 247

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
			ref(-1) <= "00100100"; -- 36
			ref(0) <= "01110000"; -- 112
			ref(1) <= "00101110"; -- 46
			ref(2) <= "00000010"; -- 2
			ref(-2) <= "10100000"; -- 160
			ref(-3) <= "01111110"; -- 126
			ref(-4) <= "10010100"; -- 148
			ref(-5) <= "00111100"; -- 60
			ref(-6) <= "01100000"; -- 96
			ref(-7) <= "00111110"; -- 62
			ref(-8) <= "10101101"; -- 173
			ref(-9) <= "00010001"; -- 17
			ref(-10) <= "00110110"; -- 54
			ref(-11) <= "11101111"; -- 239
			ref(-12) <= "00011011"; -- 27
			ref(-13) <= "10111110"; -- 190
			ref(-14) <= "11001000"; -- 200
			ref(-15) <= "00110101"; -- 53

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
			ref(-1) <= "01111111"; -- 127
			ref(0) <= "01010111"; -- 87
			ref(1) <= "11000001"; -- 193
			ref(2) <= "01011100"; -- 92
			ref(-2) <= "10000100"; -- 132
			ref(-3) <= "10100000"; -- 160
			ref(-4) <= "11001100"; -- 204
			ref(-5) <= "01010110"; -- 86
			ref(-6) <= "01011110"; -- 94
			ref(-7) <= "10001101"; -- 141
			ref(-8) <= "11010001"; -- 209
			ref(-9) <= "10100010"; -- 162
			ref(-10) <= "11010100"; -- 212
			ref(-11) <= "01101101"; -- 109
			ref(-12) <= "10110011"; -- 179
			ref(-13) <= "10000010"; -- 130
			ref(-14) <= "00101101"; -- 45

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