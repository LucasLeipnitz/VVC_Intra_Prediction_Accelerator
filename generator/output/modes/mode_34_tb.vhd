-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_34_tb IS
END mode_34_tb;

ARCHITECTURE comportamental OF mode_34_tb IS

SIGNAL ref : ref_bus (-15 to 0);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_34
	PORT ( 
		ref : in ref_bus (-15 to 0);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_34
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "00111011"; -- 59
			ref(0) <= "11010011"; -- 211
			ref(1) <= "00010101"; -- 21
			ref(2) <= "10011011"; -- 155
			ref(-2) <= "10101011"; -- 171
			ref(-3) <= "10010111"; -- 151
			ref(-4) <= "01010101"; -- 85
			ref(-5) <= "10010111"; -- 151
			ref(-6) <= "10110000"; -- 176
			ref(-7) <= "01100111"; -- 103
			ref(-8) <= "00110011"; -- 51
			ref(-9) <= "00111011"; -- 59
			ref(-10) <= "01010100"; -- 84
			ref(-11) <= "01000111"; -- 71
			ref(-12) <= "00111000"; -- 56
			ref(-13) <= "01101000"; -- 104
			ref(-14) <= "10011010"; -- 154
			ref(-15) <= "10110110"; -- 182
			ref(-16) <= "11110011"; -- 243

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "11010010"; -- 210
			ref(0) <= "01001100"; -- 76
			ref(1) <= "10100001"; -- 161
			ref(2) <= "01110001"; -- 113
			ref(-2) <= "01111010"; -- 122
			ref(-3) <= "10010001"; -- 145
			ref(-4) <= "11010101"; -- 213
			ref(-5) <= "00010101"; -- 21
			ref(-6) <= "10101101"; -- 173
			ref(-7) <= "10010000"; -- 144
			ref(-8) <= "00111100"; -- 60
			ref(-9) <= "01000100"; -- 68
			ref(-10) <= "00101010"; -- 42
			ref(-11) <= "11100101"; -- 229
			ref(-12) <= "00001001"; -- 9
			ref(-13) <= "00001100"; -- 12
			ref(-14) <= "10000010"; -- 130
			ref(-15) <= "11110100"; -- 244
			ref(-16) <= "01011001"; -- 89

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