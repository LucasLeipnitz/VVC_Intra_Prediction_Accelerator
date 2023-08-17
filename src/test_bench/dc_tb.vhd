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

SIGNAL input : ref_bus (-32 to 32);
SIGNAL ref : std_logic_vector ( 7 downto 0);
SIGNAL state : std_logic;
SIGNAL base : integer;
SIGNAL output : std_logic_vector ( 7 downto 0);
SIGNAL clk : std_logic;

COMPONENT dc
	PORT ( 
		ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		base: in integer;
		output : out std_logic_vector ( 7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : dc
    PORT MAP (ref => ref, state => state, base => base, output => output);
	
	entrada : PROCESS
    BEGIN
		
        state <= '0';
        input(1) <= "10111010"; --186
		input(2) <= "11101010"; --234
		input(3) <= "00011001"; --25
		input(4) <= "00001000"; --8
		input(5) <= "10010000"; --144
		input(6) <= "11111001"; --249
		input(7) <= "10110111"; --183
		input(8) <= "10101110"; --174
		input(9) <= "10111100"; --188
		input(10) <= "01011011"; --91
		input(11) <= "11110011"; --243
		input(12) <= "11111100"; --252
		input(13) <= "01011010"; --90
		input(14) <= "00000101"; --5
		input(15) <= "00111111"; --63
		input(16) <= "01000110"; --70
		input(17) <= "00101001"; --41
		input(18) <= "00101010"; --42
		input(19) <= "00101111"; --47
		input(20) <= "10100111"; --167
		input(21) <= "11111011"; --251
		input(22) <= "11101010"; --234
		input(23) <= "11000111"; --199
		input(24) <= "01101010"; --106
		input(25) <= "10111100"; --188
		input(26) <= "01100100"; --100
		input(27) <= "00011001"; --25
		input(28) <= "10001001"; --137
		input(29) <= "11101101"; --237
		input(30) <= "10100110"; --166
		input(31) <= "01000010"; --66
		input(32) <= "00011100"; --28

        wait for 5 ns;
		
        state <= '1';
		input(32) <= "00100100"; --36
		input(31) <= "11011100"; --220
		input(30) <= "10111000"; --184
		input(29) <= "11001001"; --201
		input(28) <= "10100101"; --165
		input(27) <= "00010010"; --18
		input(26) <= "00101110"; --46
		input(25) <= "11111111"; --255
		input(24) <= "11011101"; --221
		input(23) <= "01110110"; --118
		input(22) <= "00011101"; --29
		input(21) <= "01011111"; --95
		input(20) <= "11001011"; --203
		input(19) <= "00001111"; --15
		input(18) <= "01001001"; --73
		input(17) <= "01111000"; --120
		input(16) <= "00011010"; --26
		input(15) <= "11111111"; --255
		input(14) <= "01111110"; --126
		input(13) <= "11010011"; --211
		input(12) <= "11010101"; --213
		input(11) <= "01101100"; --108
		input(10) <= "11101001"; --233
		input(9) <= "11001010"; --202
		input(8) <= "10111100"; --188
		input(7) <= "11000010"; --194
		input(6) <= "01111101"; --125
		input(5) <= "00001101"; --13
		input(4) <= "00101101"; --45
		input(3) <= "11111010"; --250
		input(2) <= "01111000"; --120
		input(1) <= "01000010"; --66
		
		WHILE base /= 32 LOOP
			IF next_clk = 0 THEN
				next_clk := 1;
				clk <= '0';
				state <= '0';
				base <= base + 1;
			ELSE 
				next_clk := 0;
				clk <= '1';
				state <= '1';
			END IF;
			
			wait for 5 ns;
			
			if(wrt_file = true) THEN
				FOR i IN 0 TO 15 LOOP
		            write(v_OLINE, mode_0_out(i), right, c_WIDTH);
		            writeline(file_planar, v_OLINE);
	        	END LOOP;
			ELSE
				wrt_file := true;
			END IF;
			
			wait for 5 ns;
			
		END LOOP;
   
        wait;
    END PROCESS entrada;

END comportamental;