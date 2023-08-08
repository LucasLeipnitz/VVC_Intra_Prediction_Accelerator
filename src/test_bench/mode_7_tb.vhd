-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_7_tb IS
END mode_7_tb;

ARCHITECTURE comportamental OF mode_7_tb IS

SIGNAL ref : ref_bus (0 to 11);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_7
	PORT ( 
		ref : in ref_bus (0 to 11);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_7
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(0) <= "01111011"; -- 123
			ref(1) <= "11010100"; -- 212
			ref(2) <= "10010010"; -- 146
			ref(3) <= "10111100"; -- 188
			ref(4) <= "01001101"; -- 77
			ref(5) <= "10110000"; -- 176
			ref(6) <= "00110000"; -- 48
			ref(7) <= "10000111"; -- 135
			ref(8) <= "01001000"; -- 72
			ref(9) <= "11100110"; -- 230
			ref(10) <= "10001100"; -- 140
			ref(11) <= "10101101"; -- 173

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "01100110"; -- 102
			ref(1) <= "10010110"; -- 150
			ref(2) <= "01011101"; -- 93
			ref(3) <= "00101010"; -- 42
			ref(4) <= "10010111"; -- 151
			ref(5) <= "00010001"; -- 17
			ref(6) <= "00110011"; -- 51
			ref(7) <= "11011111"; -- 223
			ref(8) <= "00011110"; -- 30
			ref(9) <= "11100010"; -- 226
			ref(10) <= "01011000"; -- 88
			ref(11) <= "00001101"; -- 13

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "00101011"; -- 43
			ref(1) <= "00100111"; -- 39
			ref(2) <= "11111001"; -- 249
			ref(3) <= "10111011"; -- 187
			ref(4) <= "11110010"; -- 242
			ref(5) <= "00110111"; -- 55
			ref(6) <= "01000101"; -- 69
			ref(7) <= "10011001"; -- 153
			ref(8) <= "00111101"; -- 61
			ref(9) <= "00000110"; -- 6
			ref(10) <= "01100110"; -- 102
			ref(11) <= "01111011"; -- 123

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11100100"; -- 228
			ref(1) <= "01100100"; -- 100
			ref(2) <= "11111011"; -- 251
			ref(3) <= "00010110"; -- 22
			ref(4) <= "10111101"; -- 189
			ref(5) <= "01100110"; -- 102
			ref(6) <= "00111100"; -- 60
			ref(7) <= "00100111"; -- 39
			ref(8) <= "11010010"; -- 210
			ref(9) <= "11111010"; -- 250
			ref(10) <= "11011110"; -- 222
			ref(11) <= "11111100"; -- 252

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11000000"; -- 192
			ref(1) <= "11100011"; -- 227
			ref(2) <= "01011111"; -- 95
			ref(3) <= "00110010"; -- 50
			ref(4) <= "00101110"; -- 46
			ref(5) <= "10100001"; -- 161
			ref(6) <= "01001001"; -- 73
			ref(7) <= "01000111"; -- 71
			ref(8) <= "11000111"; -- 199
			ref(9) <= "11111011"; -- 251
			ref(10) <= "01111101"; -- 125
			ref(11) <= "10111100"; -- 188

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