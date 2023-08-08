-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_30_tb IS
END mode_30_tb;

ARCHITECTURE comportamental OF mode_30_tb IS

SIGNAL ref : ref_bus (-10 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_30
	PORT ( 
		ref : in ref_bus (-10 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_30
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "10000001"; -- 129
			ref(0) <= "00011001"; -- 25
			ref(1) <= "11000101"; -- 197
			ref(2) <= "11111110"; -- 254
			ref(-2) <= "10000001"; -- 129
			ref(-3) <= "10101011"; -- 171
			ref(-4) <= "10111001"; -- 185
			ref(-5) <= "11101001"; -- 233
			ref(-6) <= "10111001"; -- 185
			ref(-7) <= "00100110"; -- 38
			ref(-8) <= "11010110"; -- 214
			ref(-9) <= "00100101"; -- 37
			ref(-10) <= "00100000"; -- 32

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00101011"; -- 43
			ref(0) <= "00001001"; -- 9
			ref(1) <= "11111110"; -- 254
			ref(2) <= "01000111"; -- 71
			ref(-2) <= "01010001"; -- 81
			ref(-3) <= "11101100"; -- 236
			ref(-4) <= "01010110"; -- 86
			ref(-5) <= "10010001"; -- 145
			ref(-6) <= "00001111"; -- 15
			ref(-7) <= "00111011"; -- 59
			ref(-8) <= "01110110"; -- 118
			ref(-9) <= "11111010"; -- 250
			ref(-10) <= "00001110"; -- 14

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01101000"; -- 104
			ref(0) <= "00000111"; -- 7
			ref(1) <= "10111100"; -- 188
			ref(2) <= "11000011"; -- 195
			ref(-2) <= "01001101"; -- 77
			ref(-3) <= "10011011"; -- 155
			ref(-4) <= "11100001"; -- 225
			ref(-5) <= "11101101"; -- 237
			ref(-6) <= "11111110"; -- 254
			ref(-7) <= "00011100"; -- 28
			ref(-8) <= "00001001"; -- 9
			ref(-9) <= "11000111"; -- 199
			ref(-10) <= "00110011"; -- 51

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01010000"; -- 80
			ref(0) <= "10100010"; -- 162
			ref(1) <= "10111100"; -- 188
			ref(2) <= "00000111"; -- 7
			ref(-2) <= "00011110"; -- 30
			ref(-3) <= "01011100"; -- 92
			ref(-4) <= "11101011"; -- 235
			ref(-5) <= "11010000"; -- 208
			ref(-6) <= "01010110"; -- 86
			ref(-7) <= "10000010"; -- 130
			ref(-8) <= "11011001"; -- 217
			ref(-9) <= "01000010"; -- 66
			ref(-10) <= "10111001"; -- 185

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01100000"; -- 96
			ref(0) <= "10111111"; -- 191
			ref(1) <= "10010101"; -- 149
			ref(2) <= "11010000"; -- 208
			ref(-2) <= "00000110"; -- 6
			ref(-3) <= "00000010"; -- 2
			ref(-4) <= "11001110"; -- 206
			ref(-5) <= "11111010"; -- 250
			ref(-6) <= "11011111"; -- 223
			ref(-7) <= "11001100"; -- 204
			ref(-8) <= "11010000"; -- 208
			ref(-9) <= "11011100"; -- 220
			ref(-10) <= "11010100"; -- 212

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