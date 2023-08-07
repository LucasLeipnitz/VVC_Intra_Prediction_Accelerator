-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_54_tb IS
END mode_54_tb;

ARCHITECTURE comportamental OF mode_54_tb IS

SIGNAL ref : ref_bus (0 to 4);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_54
	PORT ( 
		ref : in ref_bus (0 to 4);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_54
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(0) <= "11000101"; -- 197
			ref(1) <= "10010010"; -- 146
			ref(2) <= "11010111"; -- 215
			ref(3) <= "10111101"; -- 189
			ref(4) <= "10010000"; -- 144
			ref(5) <= "11000001"; -- 193

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "00100111"; -- 39
			ref(1) <= "10101000"; -- 168
			ref(2) <= "10001001"; -- 137
			ref(3) <= "10100110"; -- 166
			ref(4) <= "00001000"; -- 8
			ref(5) <= "00110001"; -- 49

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