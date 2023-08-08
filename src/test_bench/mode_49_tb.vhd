-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_49_tb IS
END mode_49_tb;

ARCHITECTURE comportamental OF mode_49_tb IS

SIGNAL ref : ref_bus (-1 to 3);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_49
	PORT ( 
		ref : in ref_bus (-1 to 3);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_49
	PORT MAP (ref => ref, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
	VARIABLE state_row  : line;

		BEGIN
			state <= '0';
			ref(-1) <= "00101010"; -- 42
			ref(0) <= "00110011"; -- 51
			ref(1) <= "01011110"; -- 94
			ref(2) <= "10000000"; -- 128

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
			ref(0) <= "11001011"; -- 203
			ref(1) <= "11111010"; -- 250
			ref(2) <= "11101000"; -- 232
			ref(3) <= "00001001"; -- 9

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
			ref(-1) <= "00010110"; -- 22
			ref(0) <= "10111010"; -- 186
			ref(1) <= "01101100"; -- 108
			ref(2) <= "00010110"; -- 22

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
			ref(0) <= "00011000"; -- 24
			ref(1) <= "00100111"; -- 39
			ref(2) <= "11111100"; -- 252
			ref(3) <= "00000001"; -- 1

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

			state <= '0';
			ref(-1) <= "11111001"; -- 249
			ref(0) <= "10010110"; -- 150
			ref(1) <= "11001010"; -- 202
			ref(2) <= "11111010"; -- 250

			write(row,2, right);
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
			ref(0) <= "01001000"; -- 72
			ref(1) <= "10001000"; -- 136
			ref(2) <= "00011101"; -- 29
			ref(3) <= "11100101"; -- 229

			write(row,2, right);
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
			ref(-1) <= "11100101"; -- 229
			ref(0) <= "11001001"; -- 201
			ref(1) <= "10100100"; -- 164
			ref(2) <= "10101010"; -- 170

			write(row,3, right);
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
			ref(0) <= "00011010"; -- 26
			ref(1) <= "11011101"; -- 221
			ref(2) <= "00000101"; -- 5
			ref(3) <= "00001101"; -- 13

			write(row,3, right);
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
			ref(-1) <= "01110001"; -- 113
			ref(0) <= "01011011"; -- 91
			ref(1) <= "10100110"; -- 166
			ref(2) <= "10000101"; -- 133

			write(row,4, right);
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
			ref(0) <= "11001110"; -- 206
			ref(1) <= "11101001"; -- 233
			ref(2) <= "11010001"; -- 209
			ref(3) <= "11011011"; -- 219

			write(row,4, right);
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