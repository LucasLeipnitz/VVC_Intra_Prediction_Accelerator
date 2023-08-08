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
			ref(-1) <= "10110110"; -- 182
			ref(0) <= "11001000"; -- 200
			ref(1) <= "10011011"; -- 155
			ref(2) <= "01100101"; -- 101
			ref(-2) <= "10110111"; -- 183
			ref(-3) <= "00001100"; -- 12
			ref(-4) <= "00010111"; -- 23
			ref(-5) <= "00110011"; -- 51

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "00001010"; -- 10
			ref(0) <= "01011011"; -- 91
			ref(1) <= "00010111"; -- 23
			ref(2) <= "11001010"; -- 202
			ref(-2) <= "10001100"; -- 140
			ref(-3) <= "01101011"; -- 107
			ref(-4) <= "10011000"; -- 152
			ref(-5) <= "11111100"; -- 252

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01100011"; -- 99
			ref(0) <= "00111000"; -- 56
			ref(1) <= "01011101"; -- 93
			ref(2) <= "00011011"; -- 27
			ref(-2) <= "00110100"; -- 52
			ref(-3) <= "10111000"; -- 184
			ref(-4) <= "01110001"; -- 113
			ref(-5) <= "11011011"; -- 219

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11100101"; -- 229
			ref(0) <= "00110110"; -- 54
			ref(1) <= "10101110"; -- 174
			ref(2) <= "11101111"; -- 239
			ref(-2) <= "01000001"; -- 65
			ref(-3) <= "01101111"; -- 111
			ref(-4) <= "01111010"; -- 122
			ref(-5) <= "10110010"; -- 178

			write(row,3, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "01100001"; -- 97
			ref(0) <= "00110110"; -- 54
			ref(1) <= "11001110"; -- 206
			ref(2) <= "11011110"; -- 222
			ref(-2) <= "00111001"; -- 57
			ref(-3) <= "11100111"; -- 231
			ref(-4) <= "10101000"; -- 168
			ref(-5) <= "11000100"; -- 196

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