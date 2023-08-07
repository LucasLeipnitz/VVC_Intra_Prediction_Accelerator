-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_33_tb IS
END mode_33_tb;

ARCHITECTURE comportamental OF mode_33_tb IS

SIGNAL ref : ref_bus (-15 to 2);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_33
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_33
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(-1) <= "10010010"; -- 146
			ref(0) <= "01111101"; -- 125
			ref(1) <= "10011001"; -- 153
			ref(2) <= "01011011"; -- 91
			ref(-2) <= "00111111"; -- 63
			ref(-3) <= "00101010"; -- 42
			ref(-4) <= "01001011"; -- 75
			ref(-5) <= "01001001"; -- 73
			ref(-6) <= "10001010"; -- 138
			ref(-7) <= "01111101"; -- 125
			ref(-8) <= "00010001"; -- 17
			ref(-9) <= "00100010"; -- 34
			ref(-10) <= "11000011"; -- 195
			ref(-11) <= "11010001"; -- 209
			ref(-12) <= "11100101"; -- 229
			ref(-13) <= "01011001"; -- 89
			ref(-14) <= "11001011"; -- 203
			ref(-15) <= "10110111"; -- 183

			write(row,0, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "10000111"; -- 135
			ref(0) <= "00001100"; -- 12
			ref(1) <= "01001100"; -- 76
			ref(2) <= "10101101"; -- 173
			ref(-2) <= "00111000"; -- 56
			ref(-3) <= "10101101"; -- 173
			ref(-4) <= "00111011"; -- 59
			ref(-5) <= "10010100"; -- 148
			ref(-6) <= "11110010"; -- 242
			ref(-7) <= "11100110"; -- 230
			ref(-8) <= "11001111"; -- 207
			ref(-9) <= "01001011"; -- 75
			ref(-10) <= "11000100"; -- 196
			ref(-11) <= "11000101"; -- 197
			ref(-12) <= "11100011"; -- 227
			ref(-13) <= "11110001"; -- 241
			ref(-14) <= "10000110"; -- 134

			write(row,0, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '0';
			ref(-1) <= "11110101"; -- 245
			ref(0) <= "00111110"; -- 62
			ref(1) <= "10011000"; -- 152
			ref(2) <= "00010110"; -- 22
			ref(-2) <= "10100101"; -- 165
			ref(-3) <= "10111101"; -- 189
			ref(-4) <= "00101010"; -- 42
			ref(-5) <= "01110001"; -- 113
			ref(-6) <= "01101010"; -- 106
			ref(-7) <= "11011100"; -- 220
			ref(-8) <= "11111110"; -- 254
			ref(-9) <= "11111000"; -- 248
			ref(-10) <= "00111110"; -- 62
			ref(-11) <= "10001110"; -- 142
			ref(-12) <= "10010000"; -- 144
			ref(-13) <= "11100100"; -- 228
			ref(-14) <= "00100001"; -- 33
			ref(-15) <= "11100010"; -- 226

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(state_row,1, right);
			writeline(file_RESULTS,state_row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			state <= '1';
			ref(-1) <= "01010110"; -- 86
			ref(0) <= "00011011"; -- 27
			ref(1) <= "00111101"; -- 61
			ref(2) <= "10001111"; -- 143
			ref(-2) <= "11000010"; -- 194
			ref(-3) <= "01010110"; -- 86
			ref(-4) <= "01000110"; -- 70
			ref(-5) <= "00101111"; -- 47
			ref(-6) <= "11001000"; -- 200
			ref(-7) <= "10011100"; -- 156
			ref(-8) <= "00011001"; -- 25
			ref(-9) <= "11001011"; -- 203
			ref(-10) <= "00101110"; -- 46
			ref(-11) <= "11101111"; -- 239
			ref(-12) <= "00000110"; -- 6
			ref(-13) <= "10011001"; -- 153
			ref(-14) <= "10101011"; -- 171

			write(row,1, right);
			writeline(file_RESULTS,row);

			write(state_row,2, right);
			writeline(file_RESULTS,state_row);

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