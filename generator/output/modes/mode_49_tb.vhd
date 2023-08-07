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
			ref(-1) <= "10110001"; -- 177
			ref(0) <= "01001110"; -- 78
			ref(1) <= "00010101"; -- 21
			ref(2) <= "10100100"; -- 164

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
			ref(0) <= "11111001"; -- 249
			ref(1) <= "01110010"; -- 114
			ref(2) <= "00010001"; -- 17
			ref(3) <= "10100100"; -- 164

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
			ref(-1) <= "10111101"; -- 189
			ref(0) <= "11101101"; -- 237
			ref(1) <= "01001000"; -- 72
			ref(2) <= "10110110"; -- 182

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
			ref(0) <= "11101111"; -- 239
			ref(1) <= "01111010"; -- 122
			ref(2) <= "01100110"; -- 102
			ref(3) <= "00000000"; -- 0

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