-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY planar_tb IS
END planar_tb;

ARCHITECTURE comportamental OF planar_tb IS

SIGNAL ref_x : ref_bus (0 to 1);
SIGNAL ref_y : ref_bus (0 to 16);
SIGNAL state : std_logic;
SIGNAL output : output_bus;
FILE file_RESULTS : text;
CONSTANT c_WIDTH : natural := 4;

COMPONENT planar
	PORT ( 
		ref_x : in ref_bus (0 to 1);  
		ref_y : ref_bus (0 to 16);
		state: in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	
	i1 : planar
    PORT MAP (ref_x => ref_x, ref_y => ref_y, state => state, output => output);
	file_open(file_RESULTS, "output_results.txt", write_mode);
    init : PROCESS
    VARIABLE v_OLINE  : line;
	VARIABLE row  : line;
    BEGIN
        state <= '0';
        ref_x(0) <= "00110111"; -- 55
        ref_x(1) <= "10111001"; -- 185
        ref_y(0) <= "10011110"; -- 158
        ref_y(1) <= "11000011"; -- 195
        ref_y(2) <= "01010001"; -- 81
        ref_y(3) <= "10100001"; -- 161
        ref_y(4) <= "10100110"; -- 166
        ref_y(5) <= "00101100"; -- 44
        ref_y(6) <= "10000010"; -- 130
        ref_y(7) <= "00011110"; -- 30
        ref_y(8) <= "00011010"; -- 26
        ref_y(9) <= "10110011"; -- 179
        ref_y(10) <= "10111011"; -- 187
        ref_y(11) <= "11111101"; -- 253
        ref_y(12) <= "01110110"; -- 118
        ref_y(13) <= "01101110"; -- 110
        ref_y(14) <= "00011101"; -- 29
        ref_y(15) <= "11000111"; -- 199
        ref_y(16) <= "01100000"; -- 96


        wait for 5 ns;

        FOR i IN 0 TO 15 LOOP
            write(v_OLINE, output(i), right, c_WIDTH);
            writeline(file_RESULTS, v_OLINE);
        END LOOP;

        wait for 5 ns;

        state <= '1';
        ref_y(0) <= "01010111"; -- 87
        ref_y(1) <= "10110100"; -- 180
        ref_y(2) <= "10000101"; -- 133
        ref_y(3) <= "01011000"; -- 88
        ref_y(4) <= "10010101"; -- 149
        ref_y(5) <= "01000010"; -- 66
        ref_y(6) <= "00100110"; -- 38
        ref_y(7) <= "11110100"; -- 244
        ref_y(8) <= "00100011"; -- 35
        ref_y(9) <= "00001110"; -- 14
        ref_y(10) <= "00000010"; -- 2
        ref_y(11) <= "10111001"; -- 185
        ref_y(12) <= "10000110"; -- 134
        ref_y(13) <= "01000001"; -- 65
        ref_y(14) <= "00111101"; -- 61
        ref_y(15) <= "10000101"; -- 133

        wait for 5 ns;

        FOR i IN 0 TO 15 LOOP
            write(v_OLINE, output(i), right, c_WIDTH);
            writeline(file_RESULTS, v_OLINE);
        END LOOP;
        
        wait;
    END PROCESS init;

END comportamental;