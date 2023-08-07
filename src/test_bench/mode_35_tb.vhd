-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_35_tb IS
END mode_35_tb;

ARCHITECTURE comportamental OF mode_35_tb IS

SIGNAL ref : ref_bus (-15 to 2);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_35
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_35
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(-1) <= "00000010"; -- 2
			ref(0) <= "00111001"; -- 57
			ref(1) <= "11111101"; -- 253
			ref(2) <= "00010011"; -- 19
			ref(-2) <= "10101001"; -- 169
			ref(-3) <= "00000001"; -- 1
			ref(-4) <= "01101010"; -- 106
			ref(-5) <= "00011101"; -- 29
			ref(-6) <= "00110011"; -- 51
			ref(-7) <= "11101100"; -- 236
			ref(-8) <= "01001011"; -- 75
			ref(-9) <= "10110100"; -- 180
			ref(-10) <= "00110101"; -- 53
			ref(-11) <= "01110100"; -- 116
			ref(-12) <= "00010000"; -- 16
			ref(-13) <= "10100000"; -- 160
			ref(-14) <= "00101010"; -- 42
			ref(-15) <= "11010000"; -- 208

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "11101110"; -- 238
			ref(0) <= "01010010"; -- 82
			ref(1) <= "01001010"; -- 74
			ref(2) <= "00101100"; -- 44
			ref(-2) <= "11010011"; -- 211
			ref(-3) <= "10010010"; -- 146
			ref(-4) <= "01011000"; -- 88
			ref(-5) <= "00010101"; -- 21
			ref(-6) <= "10001110"; -- 142
			ref(-7) <= "11010000"; -- 208
			ref(-8) <= "11000110"; -- 198
			ref(-9) <= "11101111"; -- 239
			ref(-10) <= "00011010"; -- 26
			ref(-11) <= "11000101"; -- 197
			ref(-12) <= "01110011"; -- 115
			ref(-13) <= "11011001"; -- 217
			ref(-14) <= "01100010"; -- 98
			ref(-15) <= "10111100"; -- 188

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(row,2, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "00011110"; -- 30
			ref(0) <= "01000011"; -- 67
			ref(1) <= "11100101"; -- 229
			ref(2) <= "11110011"; -- 243
			ref(-2) <= "11011111"; -- 223
			ref(-3) <= "00110010"; -- 50
			ref(-4) <= "01001000"; -- 72
			ref(-5) <= "11110010"; -- 242
			ref(-6) <= "11010000"; -- 208
			ref(-7) <= "01000111"; -- 71
			ref(-8) <= "10011011"; -- 155
			ref(-9) <= "01101000"; -- 104
			ref(-10) <= "10011000"; -- 152
			ref(-11) <= "11001111"; -- 207
			ref(-12) <= "10100001"; -- 161
			ref(-13) <= "00101010"; -- 42
			ref(-14) <= "01010011"; -- 83

			write(row,2, right);
			writeline(file_RESULTS,row);

			write(row,1, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "01101010"; -- 106
			ref(0) <= "00111011"; -- 59
			ref(1) <= "10011110"; -- 158
			ref(2) <= "00111110"; -- 62
			ref(-2) <= "10100110"; -- 166
			ref(-3) <= "01010010"; -- 82
			ref(-4) <= "10111101"; -- 189
			ref(-5) <= "11011010"; -- 218
			ref(-6) <= "10011010"; -- 154
			ref(-7) <= "10000101"; -- 133
			ref(-8) <= "01001000"; -- 72
			ref(-9) <= "01111100"; -- 124
			ref(-10) <= "00110010"; -- 50
			ref(-11) <= "11000100"; -- 196
			ref(-12) <= "10010000"; -- 144
			ref(-13) <= "11110101"; -- 245
			ref(-14) <= "01100010"; -- 98

			write(row,2, right);
			writeline(file_RESULTS,row);

			write(row,2, right);
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