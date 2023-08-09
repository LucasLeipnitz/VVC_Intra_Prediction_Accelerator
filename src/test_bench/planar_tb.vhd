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

SIGNAL ref : ref_bus (0 to 3);
SIGNAL state : std_logic;
SIGNAL output : output_bus;

COMPONENT planar
	PORT ( 
		ref : in ref_bus (0 to 3);
		state: in std_logic;
		output : out output_bus
	);
END COMPONENT;

BEGIN
	
	i1 : planar
    PORT MAP (ref => ref, state => state, output => output);
	
    init : PROCESS

    BEGIN
        state <= '0';
        ref(0) <= "00101011"; -- 43
        ref(1) <= "11111001"; -- 249
        ref(2) <= "01000101"; -- 69
        ref(3) <= "01100110"; -- 102

        wait for 5 ns;

        state <= '1';
        ref(0) <= "11100100"; -- 228
        ref(1) <= "11111011"; -- 251
        ref(2) <= "00010110"; -- 22
        ref(3) <= "11111111"; -- 255
        
        wait;
    END PROCESS init;

END comportamental;