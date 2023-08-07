-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_50_tb IS
END mode_50_tb;

ARCHITECTURE comportamental OF mode_50_tb IS

SIGNAL ref : ref_bus (1 to -inf);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_50
	PORT ( 
		ref : in ref_bus (1 to -inf);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_50
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(0) <= "11011111"; -- 223
			ref(1) <= "00100010"; -- 34
			ref(2) <= "10011101"; -- 157
			ref(3) <= "00000111"; -- 7

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11000000"; -- 192
			ref(1) <= "10101111"; -- 175
			ref(2) <= "01011011"; -- 91
			ref(3) <= "11000111"; -- 199

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