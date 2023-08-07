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
			ref(0) <= "11011111"; -- 223
			ref(1) <= "10110111"; -- 183
			ref(2) <= "00100010"; -- 34
			ref(3) <= "00010001"; -- 17
			ref(4) <= "01010110"; -- 86
			ref(5) <= "01010100"; -- 84
			ref(6) <= "11000001"; -- 193
			ref(7) <= "00010000"; -- 16
			ref(8) <= "01000000"; -- 64
			ref(9) <= "10101100"; -- 172

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "10010110"; -- 150
			ref(1) <= "01011001"; -- 89
			ref(2) <= "10000100"; -- 132
			ref(3) <= "00000101"; -- 5
			ref(4) <= "10111010"; -- 186
			ref(5) <= "11111110"; -- 254
			ref(6) <= "10100010"; -- 162
			ref(7) <= "11010100"; -- 212
			ref(8) <= "00011011"; -- 27
			ref(9) <= "11011100"; -- 220

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