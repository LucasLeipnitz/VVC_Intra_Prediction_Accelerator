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
			ref(-1) <= "11111010"; -- 250
			ref(0) <= "11100111"; -- 231
			ref(1) <= "10001010"; -- 138
			ref(2) <= "11011011"; -- 219
			ref(-2) <= "10010110"; -- 150
			ref(-3) <= "00000100"; -- 4
			ref(-4) <= "01010101"; -- 85
			ref(-5) <= "00111010"; -- 58
			ref(-6) <= "10001110"; -- 142
			ref(-7) <= "10110001"; -- 177
			ref(-8) <= "00001101"; -- 13
			ref(-9) <= "00100101"; -- 37
			ref(-10) <= "10101101"; -- 173
			ref(-11) <= "11001111"; -- 207
			ref(-12) <= "10011001"; -- 153
			ref(-13) <= "10100011"; -- 163
			ref(-14) <= "11001110"; -- 206
			ref(-15) <= "00101000"; -- 40

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
			ref(-1) <= "11000110"; -- 198
			ref(0) <= "10100111"; -- 167
			ref(1) <= "10111001"; -- 185
			ref(2) <= "01000111"; -- 71
			ref(-2) <= "00001110"; -- 14
			ref(-3) <= "10011010"; -- 154
			ref(-4) <= "11100110"; -- 230
			ref(-5) <= "11011011"; -- 219
			ref(-6) <= "10011111"; -- 159
			ref(-7) <= "01001001"; -- 73
			ref(-8) <= "00110110"; -- 54
			ref(-9) <= "10010011"; -- 147
			ref(-10) <= "10011000"; -- 152
			ref(-11) <= "10010001"; -- 145
			ref(-12) <= "00101111"; -- 47
			ref(-13) <= "10110111"; -- 183
			ref(-14) <= "00010111"; -- 23

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
			ref(-1) <= "10111110"; -- 190
			ref(0) <= "01100111"; -- 103
			ref(1) <= "01100001"; -- 97
			ref(2) <= "01010010"; -- 82
			ref(-2) <= "00110111"; -- 55
			ref(-3) <= "11010111"; -- 215
			ref(-4) <= "01001000"; -- 72
			ref(-5) <= "10011000"; -- 152
			ref(-6) <= "01000001"; -- 65
			ref(-7) <= "11110011"; -- 243
			ref(-8) <= "11100011"; -- 227
			ref(-9) <= "11010101"; -- 213
			ref(-10) <= "00001001"; -- 9
			ref(-11) <= "10000000"; -- 128
			ref(-12) <= "00011001"; -- 25
			ref(-13) <= "00111000"; -- 56
			ref(-14) <= "00001110"; -- 14
			ref(-15) <= "01100000"; -- 96

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
			ref(-1) <= "01011110"; -- 94
			ref(0) <= "10110100"; -- 180
			ref(1) <= "11111100"; -- 252
			ref(2) <= "10011001"; -- 153
			ref(-2) <= "01100100"; -- 100
			ref(-3) <= "11111110"; -- 254
			ref(-4) <= "10010000"; -- 144
			ref(-5) <= "01001010"; -- 74
			ref(-6) <= "01101010"; -- 106
			ref(-7) <= "11010000"; -- 208
			ref(-8) <= "01101100"; -- 108
			ref(-9) <= "00011000"; -- 24
			ref(-10) <= "10010011"; -- 147
			ref(-11) <= "10100010"; -- 162
			ref(-12) <= "01011011"; -- 91
			ref(-13) <= "01100111"; -- 103
			ref(-14) <= "00000011"; -- 3

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