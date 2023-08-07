-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_43_tb IS
END mode_43_tb;

ARCHITECTURE comportamental OF mode_43_tb IS

SIGNAL ref : ref_bus (-5 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_43
	PORT ( 
		ref : in ref_bus (-5 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_43
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "11001001"; -- 201
			ref(0) <= "00011110"; -- 30
			ref(1) <= "10110010"; -- 178
			ref(2) <= "10110101"; -- 181
			ref(-2) <= "00110110"; -- 54
			ref(-3) <= "01011111"; -- 95
			ref(-4) <= "10101110"; -- 174
			ref(-5) <= "10001101"; -- 141

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01010111"; -- 87
			ref(0) <= "01010100"; -- 84
			ref(1) <= "10100101"; -- 165
			ref(2) <= "10110001"; -- 177
			ref(-2) <= "10011101"; -- 157
			ref(-3) <= "00010010"; -- 18
			ref(-4) <= "01001000"; -- 72
			ref(-5) <= "11110000"; -- 240

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