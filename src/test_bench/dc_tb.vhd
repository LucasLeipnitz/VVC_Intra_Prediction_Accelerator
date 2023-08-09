-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY dc_tb IS
END dc_tb;

ARCHITECTURE comportamental OF dc_tb IS

SIGNAL ref : ref_bus (0 to 15);
SIGNAL state : std_logic;
SIGNAL output : output_bus_dc;

COMPONENT dc
	PORT ( 
		ref : in ref_bus (0 to 15);
		state: in std_logic;
		output : out output_bus_dc
	);
END COMPONENT;

BEGIN
	
	i1 : dc
    PORT MAP (ref => ref, state => state, output => output);
	
	entrada : PROCESS
    BEGIN
		
        state <= '0';
        ref(0) <= "01111010"; -- 122
        ref(1) <= "11101101"; -- 237
        ref(2) <= "01100000"; -- 96
        ref(3) <= "01111110"; -- 126
        ref(4) <= "10011011"; -- 155
        ref(5) <= "01101011"; -- 107
        ref(6) <= "10010001"; -- 145
        ref(7) <= "01000011"; -- 67
        ref(8) <= "10011101"; -- 157
        ref(9) <= "11001011"; -- 203
        ref(10) <= "00110100"; -- 52
        ref(11) <= "11110110"; -- 246
        ref(12) <= "10111000"; -- 184
        ref(13) <= "01010111"; -- 87
        ref(14) <= "10010001"; -- 145
        ref(15) <= "01011101"; -- 93

        wait for 5 ns;
		
        state <= '1';
		ref(0) <= "01111010"; -- 122
        ref(1) <= "00100001"; -- 33
        ref(2) <= "00110100"; -- 52
        ref(3) <= "01001010"; -- 74
        ref(4) <= "11010100"; -- 212
        ref(5) <= "11000101"; -- 197
        ref(6) <= "00110101"; -- 53
        ref(7) <= "00100101"; -- 37
        ref(8) <= "11111101"; -- 253
        ref(9) <= "10000000"; -- 128
        ref(10) <= "10100100"; -- 164
        ref(11) <= "11000111"; -- 199
        ref(12) <= "10100011"; -- 163
        ref(13) <= "11010110"; -- 214
        ref(14) <= "11010110"; -- 214
        ref(15) <= "01011001"; -- 89
   
        wait;
    END PROCESS entrada;

END comportamental;