-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY mode_30_tb IS
END mode_30_tb;

ARCHITECTURE comportamental OF mode_30_tb IS

SIGNAL ref : ref_bus (-10 to 2);
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT mode_30
	PORT ( 
		ref : in ref_bus (-10 to 2);
		output : out output_bus
	);
END COMPONENT;

BEGIN
	i1 : mode_30
	PORT MAP (ref => ref, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
	init : PROCESS
	VARIABLE v_OLINE  : line;
	VARIABLE row  : line;

		BEGIN
			ref(-1) <= "10011100"; -- 156
			ref(0) <= "01101000"; -- 104
			ref(1) <= "00100001"; -- 33
			ref(2) <= "10011001"; -- 153
			ref(-2) <= "00001010"; -- 10
			ref(-3) <= "01110001"; -- 113
			ref(-4) <= "01110101"; -- 117
			ref(-5) <= "11011110"; -- 222
			ref(-6) <= "00010000"; -- 16
			ref(-7) <= "00000101"; -- 5
			ref(-8) <= "01110000"; -- 112
			ref(-9) <= "00011110"; -- 30
			ref(-10) <= "10011100"; -- 156

			write(row,0, right);
			writeline(file_RESULTS,row);

			wait for 5 ns;

			FOR i IN 0 TO 15 LOOP
				write(v_OLINE, output(i), right, c_WIDTH);
				writeline(file_RESULTS, v_OLINE);
			END LOOP;

			wait for 5 ns;

			ref(-1) <= "10010011"; -- 147
			ref(0) <= "10011111"; -- 159
			ref(1) <= "11100011"; -- 227
			ref(2) <= "01011010"; -- 90
			ref(-2) <= "00100110"; -- 38
			ref(-3) <= "10110011"; -- 179
			ref(-4) <= "00011110"; -- 30
			ref(-5) <= "00111011"; -- 59
			ref(-6) <= "00101100"; -- 44
			ref(-7) <= "00001000"; -- 8
			ref(-8) <= "10011011"; -- 155
			ref(-9) <= "01100000"; -- 96
			ref(-10) <= "10101001"; -- 169

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