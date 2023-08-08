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
			ref(-1) <= "10011001"; -- 153
			ref(0) <= "00100010"; -- 34
			ref(1) <= "00111010"; -- 58
			ref(2) <= "00001100"; -- 12
			ref(-2) <= "00001010"; -- 10
			ref(-3) <= "00000010"; -- 2
			ref(-4) <= "11100101"; -- 229
			ref(-5) <= "01110101"; -- 117
			ref(-6) <= "11001010"; -- 202

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "10010001"; -- 145
			ref(0) <= "11011001"; -- 217
			ref(1) <= "00001111"; -- 15
			ref(2) <= "11110100"; -- 244
			ref(-2) <= "11111011"; -- 251
			ref(-3) <= "01100100"; -- 100
			ref(-4) <= "00111010"; -- 58
			ref(-5) <= "01010100"; -- 84
			ref(-6) <= "11010100"; -- 212

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11100000"; -- 224
			ref(0) <= "11110101"; -- 245
			ref(1) <= "01100011"; -- 99
			ref(2) <= "00011110"; -- 30
			ref(-2) <= "10110011"; -- 179
			ref(-3) <= "11101100"; -- 236
			ref(-4) <= "00110011"; -- 51
			ref(-5) <= "01000111"; -- 71
			ref(-6) <= "10110011"; -- 179

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11010000"; -- 208
			ref(0) <= "00100110"; -- 38
			ref(1) <= "00010011"; -- 19
			ref(2) <= "10000100"; -- 132
			ref(-2) <= "00100111"; -- 39
			ref(-3) <= "01010001"; -- 81
			ref(-4) <= "00101100"; -- 44
			ref(-5) <= "11000001"; -- 193
			ref(-6) <= "10000100"; -- 132

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00110101"; -- 53
			ref(0) <= "01011101"; -- 93
			ref(1) <= "11100100"; -- 228
			ref(2) <= "10111001"; -- 185
			ref(-2) <= "11000011"; -- 195
			ref(-3) <= "00111100"; -- 60
			ref(-4) <= "11001110"; -- 206
			ref(-5) <= "01011011"; -- 91
			ref(-6) <= "10001100"; -- 140

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