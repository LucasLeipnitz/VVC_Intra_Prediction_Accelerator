-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_26_tb IS
END mode_26_tb;

ARCHITECTURE comportamental OF mode_26_tb IS

SIGNAL ref : ref_bus (-6 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_26
	PORT ( 
		ref : in ref_bus (-6 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_26
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "11011001"; -- 217
			ref(0) <= "11010100"; -- 212
			ref(1) <= "10011100"; -- 156
			ref(2) <= "11111101"; -- 253
			ref(-2) <= "01001100"; -- 76
			ref(-3) <= "10101000"; -- 168
			ref(-4) <= "10100001"; -- 161
			ref(-5) <= "11000100"; -- 196
			ref(-6) <= "00110111"; -- 55

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01010010"; -- 82
			ref(0) <= "11000001"; -- 193
			ref(1) <= "11001010"; -- 202
			ref(2) <= "01101010"; -- 106
			ref(-2) <= "01000000"; -- 64
			ref(-3) <= "00111001"; -- 57
			ref(-4) <= "00011100"; -- 28
			ref(-5) <= "01110001"; -- 113
			ref(-6) <= "00100000"; -- 32

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