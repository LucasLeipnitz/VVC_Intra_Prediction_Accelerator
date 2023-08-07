-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_46_tb IS
END mode_46_tb;

ARCHITECTURE comportamental OF mode_46_tb IS

SIGNAL ref : ref_bus (-2 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_46
	PORT ( 
		ref : in ref_bus (-2 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_46
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "01000110"; -- 70
			ref(0) <= "01011011"; -- 91
			ref(1) <= "01011111"; -- 95
			ref(2) <= "01110110"; -- 118
			ref(-2) <= "01101011"; -- 107

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11001100"; -- 204
			ref(0) <= "00111100"; -- 60
			ref(1) <= "01011010"; -- 90
			ref(2) <= "10001000"; -- 136
			ref(-2) <= "10000010"; -- 130

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