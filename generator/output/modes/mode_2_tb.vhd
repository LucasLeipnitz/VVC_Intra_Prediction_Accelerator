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

SIGNAL ref : ref_bus (2 to 17);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_2
	PORT ( 
		ref : in ref_bus (2 to 17);
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
			ref(1) <= "10100010"; -- 162
			ref(2) <= "10111111"; -- 191
			ref(3) <= "10010001"; -- 145
			ref(4) <= "00010111"; -- 23
			ref(5) <= "10011010"; -- 154
			ref(6) <= "11110110"; -- 246
			ref(7) <= "11000000"; -- 192
			ref(8) <= "01001111"; -- 79
			ref(9) <= "11010100"; -- 212
			ref(10) <= "10101110"; -- 174
			ref(11) <= "10100110"; -- 166
			ref(12) <= "00110111"; -- 55
			ref(13) <= "01100011"; -- 99
			ref(14) <= "11100100"; -- 228
			ref(15) <= "10100110"; -- 166
			ref(16) <= "10110111"; -- 183
			ref(17) <= "01110011"; -- 115
			ref(18) <= "10101010"; -- 170
			ref(19) <= "10110111"; -- 183

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(1) <= "11111010"; -- 250
			ref(2) <= "10010000"; -- 144
			ref(3) <= "00111010"; -- 58
			ref(4) <= "01111111"; -- 127
			ref(5) <= "00100001"; -- 33
			ref(6) <= "01100100"; -- 100
			ref(7) <= "01011101"; -- 93
			ref(8) <= "10010110"; -- 150
			ref(9) <= "01100111"; -- 103
			ref(10) <= "01101000"; -- 104
			ref(11) <= "00100010"; -- 34
			ref(12) <= "01010001"; -- 81
			ref(13) <= "10101101"; -- 173
			ref(14) <= "10011101"; -- 157
			ref(15) <= "00001101"; -- 13
			ref(16) <= "00011001"; -- 25
			ref(17) <= "01010111"; -- 87
			ref(18) <= "11001100"; -- 204
			ref(19) <= "01101001"; -- 105

			write(row,1, right);
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