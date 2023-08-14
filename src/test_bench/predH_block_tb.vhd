-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY predH_block_tb IS
END predH_block_tb;

ARCHITECTURE comportamental OF predH_block_tb IS

SIGNAL ref : ref_bus (0 to 15);
SIGNAL opposite_ref : std_logic_vector ( 7 downto 0);
SIGNAL base : integer;
SIGNAL state: std_logic;
SIGNAL clk: std_logic;
SIGNAL rst: std_logic;
SIGNAL output : planar_eq_out;

COMPONENT predH_block
	PORT ( 
		ref : in ref_bus (0 to 15);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		base: in integer;
		state: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		output : out planar_eq_out
	);
END COMPONENT;

BEGIN
	
	i1 : predH_block
    PORT MAP (ref => ref, opposite_ref => opposite_ref, base => base, state => state, clk => clk, rst => rst, output => output);
    init : PROCESS
    BEGIN
        base <= 0;
		state <= '0';
		clk <= '0';
        ref(0) <= "10011110"; -- 158
        ref(1) <= "11000011"; -- 195
        ref(2) <= "01010001"; -- 81
        ref(3) <= "10100001"; -- 161
        ref(4) <= "10100110"; -- 166
        ref(5) <= "00101100"; -- 44
        ref(6) <= "10000010"; -- 130
        ref(7) <= "00011110"; -- 30
        ref(8) <= "00011010"; -- 26
        ref(9) <= "10110011"; -- 179
        ref(10) <= "10111011"; -- 187
        ref(11) <= "11111101"; -- 253
        ref(12) <= "01110110"; -- 118
        ref(13) <= "01101110"; -- 110
        ref(14) <= "00011101"; -- 29
        ref(15) <= "11000111"; -- 199
		opposite_ref <= "01100000"; -- 96


        wait for 5 ns;
		
		state <= '1';
		clk <= '1';
		ref(0) <= "01010111"; -- 87
        ref(1) <= "10110100"; -- 180
        ref(2) <= "10000101"; -- 133
        ref(3) <= "01011000"; -- 88
        ref(4) <= "10010101"; -- 149
        ref(5) <= "01000010"; -- 66
        ref(6) <= "00100110"; -- 38
        ref(7) <= "11110100"; -- 244
        ref(8) <= "00100011"; -- 35
        ref(9) <= "00001110"; -- 14
        ref(10) <= "00000010"; -- 2
        ref(11) <= "10111001"; -- 185
        ref(12) <= "10000110"; -- 134
        ref(13) <= "01000001"; -- 65
        ref(14) <= "00111101"; -- 61
        ref(15) <= "10000101"; -- 133
        
		wait for 5 ns;
		
		base <= 1;
		state <= '0';
		clk <= '0';
		ref(0) <= "10011110"; -- 158
        ref(1) <= "11000011"; -- 195
        ref(2) <= "01010001"; -- 81
        ref(3) <= "10100001"; -- 161
        ref(4) <= "10100110"; -- 166
        ref(5) <= "00101100"; -- 44
        ref(6) <= "10000010"; -- 130
        ref(7) <= "00011110"; -- 30
        ref(8) <= "00011010"; -- 26
        ref(9) <= "10110011"; -- 179
        ref(10) <= "10111011"; -- 187
        ref(11) <= "11111101"; -- 253
        ref(12) <= "01110110"; -- 118
        ref(13) <= "01101110"; -- 110
        ref(14) <= "00011101"; -- 29
        ref(15) <= "11000111"; -- 199
		
		wait for 5 ns;
		
		state <= '1';
		clk <= '1';
		ref(0) <= "01010111"; -- 87
        ref(1) <= "10110100"; -- 180
        ref(2) <= "10000101"; -- 133
        ref(3) <= "01011000"; -- 88
        ref(4) <= "10010101"; -- 149
        ref(5) <= "01000010"; -- 66
        ref(6) <= "00100110"; -- 38
        ref(7) <= "11110100"; -- 244
        ref(8) <= "00100011"; -- 35
        ref(9) <= "00001110"; -- 14
        ref(10) <= "00000010"; -- 2
        ref(11) <= "10111001"; -- 185
        ref(12) <= "10000110"; -- 134
        ref(13) <= "01000001"; -- 65
        ref(14) <= "00111101"; -- 61
        ref(15) <= "10000101"; -- 133
		
		wait for 5 ns;
		
		base <= 2;
		state <= '0';
		clk <= '0';
		ref(0) <= "10011110"; -- 158
        ref(1) <= "11000011"; -- 195
        ref(2) <= "01010001"; -- 81
        ref(3) <= "10100001"; -- 161
        ref(4) <= "10100110"; -- 166
        ref(5) <= "00101100"; -- 44
        ref(6) <= "10000010"; -- 130
        ref(7) <= "00011110"; -- 30
        ref(8) <= "00011010"; -- 26
        ref(9) <= "10110011"; -- 179
        ref(10) <= "10111011"; -- 187
        ref(11) <= "11111101"; -- 253
        ref(12) <= "01110110"; -- 118
        ref(13) <= "01101110"; -- 110
        ref(14) <= "00011101"; -- 29
        ref(15) <= "11000111"; -- 199
		
		wait for 5 ns;
		
		state <= '1';
		clk <= '1';
		ref(0) <= "01010111"; -- 87
        ref(1) <= "10110100"; -- 180
        ref(2) <= "10000101"; -- 133
        ref(3) <= "01011000"; -- 88
        ref(4) <= "10010101"; -- 149
        ref(5) <= "01000010"; -- 66
        ref(6) <= "00100110"; -- 38
        ref(7) <= "11110100"; -- 244
        ref(8) <= "00100011"; -- 35
        ref(9) <= "00001110"; -- 14
        ref(10) <= "00000010"; -- 2
        ref(11) <= "10111001"; -- 185
        ref(12) <= "10000110"; -- 134
        ref(13) <= "01000001"; -- 65
        ref(14) <= "00111101"; -- 61
        ref(15) <= "10000101"; -- 133
		
        wait;
    END PROCESS init;

END comportamental;