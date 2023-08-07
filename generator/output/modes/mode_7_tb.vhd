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
			ref(0) <= "00111100"; -- 60
			ref(1) <= "00001100"; -- 12
			ref(2) <= "10001101"; -- 141
			ref(3) <= "00011111"; -- 31
			ref(4) <= "01100011"; -- 99
			ref(5) <= "00001011"; -- 11
			ref(6) <= "00110000"; -- 48
			ref(7) <= "00010001"; -- 17
			ref(8) <= "00110010"; -- 50
			ref(9) <= "11011101"; -- 221
			ref(10) <= "01101111"; -- 111
			ref(11) <= "11010110"; -- 214
			ref(12) <= "10100010"; -- 162

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11101111"; -- 239
			ref(1) <= "01010000"; -- 80
			ref(2) <= "01011011"; -- 91
			ref(3) <= "10001010"; -- 138
			ref(4) <= "11101111"; -- 239
			ref(5) <= "11010110"; -- 214
			ref(6) <= "11000000"; -- 192
			ref(7) <= "01100100"; -- 100
			ref(8) <= "11111100"; -- 252
			ref(9) <= "01010110"; -- 86
			ref(10) <= "10100111"; -- 167
			ref(11) <= "01010110"; -- 86
			ref(12) <= "00110110"; -- 54

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