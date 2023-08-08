-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_3_tb IS
END mode_3_tb;

ARCHITECTURE comportamental OF mode_3_tb IS

SIGNAL ref : ref_bus (0 to 17);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_3
	PORT ( 
		ref : in ref_bus (0 to 17);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_3
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(0) <= "01111010"; -- 122
			ref(1) <= "11101101"; -- 237
			ref(2) <= "01100000"; -- 96
			ref(3) <= "01111110"; -- 126
			ref(4) <= "10011011"; -- 155
			ref(5) <= "01101011"; -- 107
			ref(6) <= "10010001"; -- 145
			ref(7) <= "01000011"; -- 67
			ref(8) <= "10011101"; -- 157
			ref(9) <= "11001011"; -- 203
			ref(10) <= "00110100"; -- 52
			ref(11) <= "11110110"; -- 246
			ref(12) <= "10111000"; -- 184
			ref(13) <= "01010111"; -- 87
			ref(14) <= "10010001"; -- 145
			ref(15) <= "01011101"; -- 93
			ref(16) <= "10011011"; -- 155
			ref(17) <= "11100011"; -- 227

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
			ref(1) <= "01011111"; -- 95
			ref(2) <= "00000111"; -- 7
			ref(3) <= "00001010"; -- 10
			ref(4) <= "10011110"; -- 158
			ref(5) <= "10001010"; -- 138
			ref(6) <= "11100011"; -- 227
			ref(7) <= "10101100"; -- 172
			ref(8) <= "11000011"; -- 195
			ref(9) <= "00011001"; -- 25
			ref(10) <= "01010110"; -- 86
			ref(11) <= "11100011"; -- 227
			ref(12) <= "11100011"; -- 227
			ref(13) <= "01001111"; -- 79
			ref(14) <= "00001100"; -- 12
			ref(15) <= "01110100"; -- 116
			ref(16) <= "10011101"; -- 157
			ref(17) <= "00011001"; -- 25

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
			ref(0) <= "00111101"; -- 61
			ref(1) <= "00011010"; -- 26
			ref(2) <= "11010010"; -- 210
			ref(3) <= "01010011"; -- 83
			ref(4) <= "10111100"; -- 188
			ref(5) <= "00000001"; -- 1
			ref(6) <= "11101111"; -- 239
			ref(7) <= "10000011"; -- 131
			ref(8) <= "01010011"; -- 83
			ref(9) <= "10100001"; -- 161
			ref(10) <= "00111111"; -- 63
			ref(11) <= "01101101"; -- 109
			ref(12) <= "01111010"; -- 122
			ref(13) <= "10001111"; -- 143
			ref(14) <= "01001110"; -- 78
			ref(15) <= "10110000"; -- 176
			ref(16) <= "00011010"; -- 26
			ref(17) <= "11100011"; -- 227

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
			ref(1) <= "00100001"; -- 33
			ref(2) <= "00110100"; -- 52
			ref(3) <= "01001010"; -- 74
			ref(4) <= "11010100"; -- 212
			ref(5) <= "11000101"; -- 197
			ref(6) <= "00110101"; -- 53
			ref(7) <= "00100101"; -- 37
			ref(8) <= "11111101"; -- 253
			ref(9) <= "10000000"; -- 128
			ref(10) <= "10100100"; -- 164
			ref(11) <= "11000111"; -- 199
			ref(12) <= "10100011"; -- 163
			ref(13) <= "11010110"; -- 214
			ref(14) <= "11010110"; -- 214
			ref(15) <= "01011001"; -- 89
			ref(16) <= "00001010"; -- 10
			ref(17) <= "11111001"; -- 249

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
			ref(0) <= "01010111"; -- 87
			ref(1) <= "10110100"; -- 180
			ref(2) <= "10000101"; -- 133
			ref(3) <= "01011000"; -- 88
			ref(4) <= "10010101"; -- 149
			ref(5) <= "01000010"; -- 66
			ref(6) <= "00100110"; -- 38
			ref(7) <= "11110100"; -- 244
			ref(8) <= "00100011"; -- 35
			ref(9) <= "00001110"; -- 14
			ref(10) <= "00000010"; -- 2
			ref(11) <= "10111001"; -- 185
			ref(12) <= "10000110"; -- 134
			ref(13) <= "01000001"; -- 65
			ref(14) <= "00111101"; -- 61
			ref(15) <= "10000101"; -- 133
			ref(16) <= "01100000"; -- 96
			ref(17) <= "01010110"; -- 86

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
			ref(1) <= "10001001"; -- 137
			ref(2) <= "00001000"; -- 8
			ref(3) <= "11101011"; -- 235
			ref(4) <= "01111010"; -- 122
			ref(5) <= "10010101"; -- 149
			ref(6) <= "00010111"; -- 23
			ref(7) <= "01100010"; -- 98
			ref(8) <= "00011100"; -- 28
			ref(9) <= "10101011"; -- 171
			ref(10) <= "10011010"; -- 154
			ref(11) <= "00011100"; -- 28
			ref(12) <= "11000011"; -- 195
			ref(13) <= "11110001"; -- 241
			ref(14) <= "10111100"; -- 188
			ref(15) <= "01000011"; -- 67
			ref(16) <= "01111010"; -- 122
			ref(17) <= "00101111"; -- 47

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
			ref(0) <= "00110111"; -- 55
			ref(1) <= "10111001"; -- 185
			ref(2) <= "10011110"; -- 158
			ref(3) <= "11000011"; -- 195
			ref(4) <= "01010001"; -- 81
			ref(5) <= "10100001"; -- 161
			ref(6) <= "10100110"; -- 166
			ref(7) <= "00101100"; -- 44
			ref(8) <= "10000010"; -- 130
			ref(9) <= "00011110"; -- 30
			ref(10) <= "00011010"; -- 26
			ref(11) <= "10110011"; -- 179
			ref(12) <= "10111011"; -- 187
			ref(13) <= "11111101"; -- 253
			ref(14) <= "01110110"; -- 118
			ref(15) <= "01101110"; -- 110
			ref(16) <= "00011101"; -- 29
			ref(17) <= "11000111"; -- 199

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
			ref(1) <= "01100100"; -- 100
			ref(2) <= "11111000"; -- 248
			ref(3) <= "10011100"; -- 156
			ref(4) <= "00010001"; -- 17
			ref(5) <= "10010101"; -- 149
			ref(6) <= "01101001"; -- 105
			ref(7) <= "11100010"; -- 226
			ref(8) <= "10011101"; -- 157
			ref(9) <= "10101001"; -- 169
			ref(10) <= "10110100"; -- 180
			ref(11) <= "01100111"; -- 103
			ref(12) <= "01011001"; -- 89
			ref(13) <= "10100000"; -- 160
			ref(14) <= "10101000"; -- 168
			ref(15) <= "01010100"; -- 84
			ref(16) <= "10011100"; -- 156
			ref(17) <= "10110010"; -- 178

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
			ref(0) <= "10101101"; -- 173
			ref(1) <= "00010110"; -- 22
			ref(2) <= "11011100"; -- 220
			ref(3) <= "00011001"; -- 25
			ref(4) <= "10000100"; -- 132
			ref(5) <= "10001010"; -- 138
			ref(6) <= "11111011"; -- 251
			ref(7) <= "11111111"; -- 255
			ref(8) <= "11101111"; -- 239
			ref(9) <= "10100101"; -- 165
			ref(10) <= "10111100"; -- 188
			ref(11) <= "00001001"; -- 9
			ref(12) <= "10100100"; -- 164
			ref(13) <= "11110000"; -- 240
			ref(14) <= "00100011"; -- 35
			ref(15) <= "11011001"; -- 217
			ref(16) <= "10101100"; -- 172
			ref(17) <= "01010000"; -- 80

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
			ref(1) <= "01010110"; -- 86
			ref(2) <= "10011111"; -- 159
			ref(3) <= "10010001"; -- 145
			ref(4) <= "10110100"; -- 180
			ref(5) <= "01110010"; -- 114
			ref(6) <= "00110000"; -- 48
			ref(7) <= "11010010"; -- 210
			ref(8) <= "00110100"; -- 52
			ref(9) <= "10010100"; -- 148
			ref(10) <= "01011100"; -- 92
			ref(11) <= "11010001"; -- 209
			ref(12) <= "01110100"; -- 116
			ref(13) <= "10011110"; -- 158
			ref(14) <= "00100001"; -- 33
			ref(15) <= "01011011"; -- 91
			ref(16) <= "01001011"; -- 75
			ref(17) <= "00110101"; -- 53

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