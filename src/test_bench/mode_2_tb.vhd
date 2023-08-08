-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_2_tb IS
END mode_2_tb;

ARCHITECTURE comportamental OF mode_2_tb IS

SIGNAL ref : ref_bus (1 to 18);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_2
	PORT ( 
		ref : in ref_bus (1 to 18);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_2
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(1) <= "00110101"; -- 53
			ref(2) <= "10101010"; -- 170
			ref(3) <= "11101111"; -- 239
			ref(4) <= "00001010"; -- 10
			ref(5) <= "10111110"; -- 190
			ref(6) <= "11001010"; -- 202
			ref(7) <= "01011100"; -- 92
			ref(8) <= "01001100"; -- 76
			ref(9) <= "11000101"; -- 197
			ref(10) <= "01000110"; -- 70
			ref(11) <= "10100001"; -- 161
			ref(12) <= "11001110"; -- 206
			ref(13) <= "10011000"; -- 152
			ref(14) <= "10100000"; -- 160
			ref(15) <= "00000110"; -- 6
			ref(16) <= "01010100"; -- 84
			ref(17) <= "11010001"; -- 209
			ref(18) <= "10111001"; -- 185

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(1) <= "01001011"; -- 75
			ref(2) <= "10110111"; -- 183
			ref(3) <= "01110000"; -- 112
			ref(4) <= "10010000"; -- 144
			ref(5) <= "11000111"; -- 199
			ref(6) <= "01011001"; -- 89
			ref(7) <= "01110100"; -- 116
			ref(8) <= "00100110"; -- 38
			ref(9) <= "01101101"; -- 109
			ref(10) <= "00000000"; -- 0
			ref(11) <= "11110100"; -- 244
			ref(12) <= "10001010"; -- 138
			ref(13) <= "01110100"; -- 116
			ref(14) <= "01000110"; -- 70
			ref(15) <= "11010110"; -- 214
			ref(16) <= "01010001"; -- 81
			ref(17) <= "10110010"; -- 178
			ref(18) <= "00110111"; -- 55

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(1) <= "01010100"; -- 84
			ref(2) <= "01101001"; -- 105
			ref(3) <= "10011010"; -- 154
			ref(4) <= "01100100"; -- 100
			ref(5) <= "00011001"; -- 25
			ref(6) <= "11101101"; -- 237
			ref(7) <= "11101101"; -- 237
			ref(8) <= "00000110"; -- 6
			ref(9) <= "11010000"; -- 208
			ref(10) <= "11010000"; -- 208
			ref(11) <= "11100001"; -- 225
			ref(12) <= "00010011"; -- 19
			ref(13) <= "00111101"; -- 61
			ref(14) <= "01100110"; -- 102
			ref(15) <= "10001000"; -- 136
			ref(16) <= "11011100"; -- 220
			ref(17) <= "01111011"; -- 123
			ref(18) <= "01110100"; -- 116

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(1) <= "11110100"; -- 244
			ref(2) <= "00101001"; -- 41
			ref(3) <= "01000010"; -- 66
			ref(4) <= "01111110"; -- 126
			ref(5) <= "01110000"; -- 112
			ref(6) <= "01000001"; -- 65
			ref(7) <= "01000111"; -- 71
			ref(8) <= "10100101"; -- 165
			ref(9) <= "00000000"; -- 0
			ref(10) <= "01011010"; -- 90
			ref(11) <= "01110000"; -- 112
			ref(12) <= "01001110"; -- 78
			ref(13) <= "01111100"; -- 124
			ref(14) <= "01011011"; -- 91
			ref(15) <= "11100110"; -- 230
			ref(16) <= "11001001"; -- 201
			ref(17) <= "10010100"; -- 148
			ref(18) <= "00001110"; -- 14

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(1) <= "11001110"; -- 206
			ref(2) <= "00001100"; -- 12
			ref(3) <= "00011000"; -- 24
			ref(4) <= "01010011"; -- 83
			ref(5) <= "10111111"; -- 191
			ref(6) <= "10011001"; -- 153
			ref(7) <= "00000010"; -- 2
			ref(8) <= "01100001"; -- 97
			ref(9) <= "01001000"; -- 72
			ref(10) <= "11101010"; -- 234
			ref(11) <= "10111000"; -- 184
			ref(12) <= "10001101"; -- 141
			ref(13) <= "10110111"; -- 183
			ref(14) <= "10001010"; -- 138
			ref(15) <= "10110000"; -- 176
			ref(16) <= "01010101"; -- 85
			ref(17) <= "10101001"; -- 169
			ref(18) <= "00100011"; -- 35

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