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
			ref(0) <= "01000110"; -- 70
			ref(1) <= "10101100"; -- 172
			ref(2) <= "10111010"; -- 186
			ref(3) <= "11110000"; -- 240
			ref(4) <= "01110110"; -- 118

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "01001101"; -- 77
			ref(1) <= "01100010"; -- 98
			ref(2) <= "01101000"; -- 104
			ref(3) <= "00010001"; -- 17
			ref(4) <= "01100100"; -- 100

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "10110000"; -- 176
			ref(1) <= "11010100"; -- 212
			ref(2) <= "10100001"; -- 161
			ref(3) <= "00001111"; -- 15
			ref(4) <= "01011000"; -- 88

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "11111110"; -- 254
			ref(1) <= "01001011"; -- 75
			ref(2) <= "10000011"; -- 131
			ref(3) <= "00001011"; -- 11
			ref(4) <= "11111101"; -- 253

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(0) <= "01001001"; -- 73
			ref(1) <= "00110101"; -- 53
			ref(2) <= "10011101"; -- 157
			ref(3) <= "10011000"; -- 152
			ref(4) <= "11100001"; -- 225

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