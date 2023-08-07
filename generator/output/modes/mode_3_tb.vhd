-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_3_tb IS
END mode_3_tb;

ARCHITECTURE comportamental OF mode_3_tb IS

SIGNAL ref : ref_bus (0 to 17);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_3
	PORT ( 
		ref : in ref_bus (0 to 17);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_3
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(0) <= "00001010"; -- 10
			ref(1) <= "00011001"; -- 25
			ref(2) <= "01010011"; -- 83
			ref(3) <= "01000110"; -- 70
			ref(4) <= "10101110"; -- 174
			ref(5) <= "01010101"; -- 85
			ref(6) <= "00111011"; -- 59
			ref(7) <= "10100100"; -- 164
			ref(8) <= "11101100"; -- 236
			ref(9) <= "01111010"; -- 122
			ref(10) <= "10011011"; -- 155
			ref(11) <= "11110001"; -- 241
			ref(12) <= "01001100"; -- 76
			ref(13) <= "10000011"; -- 131
			ref(14) <= "11000001"; -- 193
			ref(15) <= "10100111"; -- 167
			ref(16) <= "00011101"; -- 29
			ref(17) <= "01111101"; -- 125

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
			ref(1) <= "00001100"; -- 12
			ref(2) <= "11111001"; -- 249
			ref(3) <= "01111100"; -- 124
			ref(4) <= "00000011"; -- 3
			ref(5) <= "11011000"; -- 216
			ref(6) <= "10110010"; -- 178
			ref(7) <= "01101101"; -- 109
			ref(8) <= "10001101"; -- 141
			ref(9) <= "10011010"; -- 154
			ref(10) <= "01001110"; -- 78
			ref(11) <= "11001000"; -- 200
			ref(12) <= "10000110"; -- 134
			ref(13) <= "10010000"; -- 144
			ref(14) <= "00100100"; -- 36
			ref(15) <= "01001100"; -- 76
			ref(16) <= "11100001"; -- 225
			ref(17) <= "00001000"; -- 8
			ref(18) <= "11111001"; -- 249

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
			ref(0) <= "01010001"; -- 81
			ref(1) <= "11000101"; -- 197
			ref(2) <= "11010001"; -- 209
			ref(3) <= "10111111"; -- 191
			ref(4) <= "00000000"; -- 0
			ref(5) <= "10000011"; -- 131
			ref(6) <= "00101100"; -- 44
			ref(7) <= "11000001"; -- 193
			ref(8) <= "00010001"; -- 17
			ref(9) <= "01100100"; -- 100
			ref(10) <= "11011010"; -- 218
			ref(11) <= "01111010"; -- 122
			ref(12) <= "11110000"; -- 240
			ref(13) <= "11001001"; -- 201
			ref(14) <= "01101110"; -- 110
			ref(15) <= "00110010"; -- 50
			ref(16) <= "00000110"; -- 6
			ref(17) <= "01101100"; -- 108

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
			ref(1) <= "11010111"; -- 215
			ref(2) <= "00101101"; -- 45
			ref(3) <= "00001000"; -- 8
			ref(4) <= "00101001"; -- 41
			ref(5) <= "11010011"; -- 211
			ref(6) <= "01011100"; -- 92
			ref(7) <= "01000111"; -- 71
			ref(8) <= "11110001"; -- 241
			ref(9) <= "11110000"; -- 240
			ref(10) <= "01001101"; -- 77
			ref(11) <= "11011100"; -- 220
			ref(12) <= "11100100"; -- 228
			ref(13) <= "00111101"; -- 61
			ref(14) <= "01000111"; -- 71
			ref(15) <= "11110110"; -- 246
			ref(16) <= "01100001"; -- 97
			ref(17) <= "11111010"; -- 250
			ref(18) <= "01010100"; -- 84

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