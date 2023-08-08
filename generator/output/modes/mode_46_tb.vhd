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
			ref(-1) <= "10111111"; -- 191
			ref(0) <= "01011100"; -- 92
			ref(1) <= "00100001"; -- 33
			ref(2) <= "01110100"; -- 116
			ref(-2) <= "11011000"; -- 216

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11010011"; -- 211
			ref(0) <= "11001011"; -- 203
			ref(1) <= "11001111"; -- 207
			ref(2) <= "11110011"; -- 243
			ref(-2) <= "10000111"; -- 135

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11101101"; -- 237
			ref(0) <= "01011101"; -- 93
			ref(1) <= "01110111"; -- 119
			ref(2) <= "10111100"; -- 188
			ref(-2) <= "10110001"; -- 177

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11001011"; -- 203
			ref(0) <= "00111011"; -- 59
			ref(1) <= "01011101"; -- 93
			ref(2) <= "00010101"; -- 21
			ref(-2) <= "00101011"; -- 43

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00110110"; -- 54
			ref(0) <= "11000011"; -- 195
			ref(1) <= "00010001"; -- 17
			ref(2) <= "00001110"; -- 14
			ref(-2) <= "01001100"; -- 76

			write(row,4, right);
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