-----------------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
-----------------------------------------------

ENTITY equation_block_tb IS
END equation_block_tb;

ARCHITECTURE equation_block_arch OF equation_block_tb IS

SIGNAL input_0, input_1, input_2, input_3 : std_logic_vector( 15 downto 0 );
SIGNAL output : std_logic_vector( 7 downto 0 );

COMPONENT equation_block
PORT (
	input_0, input_1, input_2, input_3 : in std_logic_vector( 15 downto 0 );
	output : out std_logic_vector( 7 downto 0 )
  );
END COMPONENT;

BEGIN
	i1 : equation_block
	PORT MAP ( input_0 => input_0, input_1 => input_1, input_2 => input_2, input_3 => input_3, output => output);

init : PROCESS                                               

BEGIN  
	input_0 <= "1111111111101110"; -- -18
	input_1 <= "0000101101000000"; -- 2880
	input_2 <= "0000001111100010"; -- 994
	input_3 <= "1111111100001101"; -- -243
	--output = (9*-2 + 48*60 + 142*7 + 243*-1 + 32) >> 6 = 56	
	
	assert false report "Fim do teste";
	wait;
	
END PROCESS init;                                          

END equation_block_arch;
