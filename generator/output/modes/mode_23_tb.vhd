-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_23_tb IS
END mode_23_tb;

ARCHITECTURE comportamental OF mode_23_tb IS

SIGNAL ref : ref_bus (-3 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_23
	PORT ( 
		ref : in ref_bus (-3 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_23
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "00110100"; -- 52
			ref(0) <= "01011011"; -- 91
			ref(1) <= "00011110"; -- 30
			ref(2) <= "10110010"; -- 178
			ref(-2) <= "01000111"; -- 71
			ref(-3) <= "11110001"; -- 241

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00000010"; -- 2
			ref(0) <= "00010100"; -- 20
			ref(1) <= "01001100"; -- 76
			ref(2) <= "00110001"; -- 49
			ref(-2) <= "01000001"; -- 65
			ref(-3) <= "00110110"; -- 54

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