-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_10_tb IS
END mode_10_tb;

ARCHITECTURE comportamental OF mode_10_tb IS

SIGNAL ref : ref_bus (0 to 8);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_10
	PORT ( 
		ref : in ref_bus (0 to 8);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_10
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(0) <= "00110000"; -- 48
			ref(1) <= "00000011"; -- 3
			ref(2) <= "10001011"; -- 139
			ref(3) <= "01011101"; -- 93
			ref(4) <= "11000110"; -- 198
			ref(5) <= "10011011"; -- 155
			ref(6) <= "10010000"; -- 144
			ref(7) <= "01010001"; -- 81
			ref(8) <= "00001100"; -- 12

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "00110100"; -- 52
			ref(1) <= "00000010"; -- 2
			ref(2) <= "01111001"; -- 121
			ref(3) <= "10101000"; -- 168
			ref(4) <= "10101000"; -- 168
			ref(5) <= "11010001"; -- 209
			ref(6) <= "00001010"; -- 10
			ref(7) <= "10001000"; -- 136
			ref(8) <= "11110100"; -- 244

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "00001101"; -- 13
			ref(1) <= "00110000"; -- 48
			ref(2) <= "10110000"; -- 176
			ref(3) <= "01001010"; -- 74
			ref(4) <= "00001010"; -- 10
			ref(5) <= "10110111"; -- 183
			ref(6) <= "01111011"; -- 123
			ref(7) <= "11010000"; -- 208
			ref(8) <= "11010100"; -- 212

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "10110101"; -- 181
			ref(1) <= "10011101"; -- 157
			ref(2) <= "00011111"; -- 31
			ref(3) <= "11101011"; -- 235
			ref(4) <= "10011110"; -- 158
			ref(5) <= "01000010"; -- 66
			ref(6) <= "00000000"; -- 0
			ref(7) <= "10100011"; -- 163
			ref(8) <= "10001001"; -- 137

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11000111"; -- 199
			ref(1) <= "11110000"; -- 240
			ref(2) <= "11001001"; -- 201
			ref(3) <= "11100000"; -- 224
			ref(4) <= "11011000"; -- 216
			ref(5) <= "01000111"; -- 71
			ref(6) <= "01000000"; -- 64
			ref(7) <= "10100110"; -- 166
			ref(8) <= "01100110"; -- 102

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