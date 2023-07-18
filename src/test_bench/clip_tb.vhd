-----------------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
-----------------------------------------------

ENTITY clip_tb IS
END clip_tb;

ARCHITECTURE clip_arch OF clip_tb IS

SIGNAL input : std_logic_vector( 19 downto 0 );
SIGNAL output : std_logic_vector( 7 downto 0 );

COMPONENT clip
PORT (
	input : in std_logic_vector( 19 downto 0 );
	output : out std_logic_vector( 7 downto 0 )
  );
END COMPONENT;

BEGIN
	i1 : clip
	PORT MAP ( input => input, output => output);

init : PROCESS                                               

BEGIN  
	
	input <= "00000000000000111000"; -- 56
	
	wait for 10 ns;
	
	input <= "00000000000111001000"; -- 456	
	
	wait for 10 ns;
	
	input <= "11111111111101101111"; -- -145
	
	assert false report "Fim do teste";
	wait;
	
END PROCESS init;                                          

END clip_arch;