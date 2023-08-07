-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_18_tb IS
END mode_18_tb;

ARCHITECTURE comportamental OF mode_18_tb IS

SIGNAL ref : ref_bus (1 to -inf);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_18
	PORT ( 
		ref : in ref_bus (1 to -inf);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_18
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(0) <= "01111111"; -- 127
			ref(1) <= "01111000"; -- 120
			ref(2) <= "10010111"; -- 151
			ref(3) <= "01001010"; -- 74

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "01100101"; -- 101
			ref(1) <= "11011101"; -- 221
			ref(2) <= "01000001"; -- 65
			ref(3) <= "01111100"; -- 124

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