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
			ref(-1) <= "11001010"; -- 202
			ref(0) <= "10000000"; -- 128
			ref(1) <= "00101000"; -- 40
			ref(2) <= "11000000"; -- 192
			ref(-2) <= "10101101"; -- 173
			ref(-3) <= "00010000"; -- 16

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00100100"; -- 36
			ref(0) <= "00110100"; -- 52
			ref(1) <= "10110010"; -- 178
			ref(2) <= "01100001"; -- 97
			ref(-2) <= "11001011"; -- 203
			ref(-3) <= "01110101"; -- 117

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01000111"; -- 71
			ref(0) <= "10001011"; -- 139
			ref(1) <= "00100100"; -- 36
			ref(2) <= "00001111"; -- 15
			ref(-2) <= "01110000"; -- 112
			ref(-3) <= "00010111"; -- 23

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00101100"; -- 44
			ref(0) <= "01010100"; -- 84
			ref(1) <= "01100100"; -- 100
			ref(2) <= "11001000"; -- 200
			ref(-2) <= "00101010"; -- 42
			ref(-3) <= "11001101"; -- 205

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01000010"; -- 66
			ref(0) <= "11001001"; -- 201
			ref(1) <= "01000011"; -- 67
			ref(2) <= "00110001"; -- 49
			ref(-2) <= "11011000"; -- 216
			ref(-3) <= "11101011"; -- 235

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