-----------------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
-----------------------------------------------

ENTITY mode_35_tb IS
END mode_35_tb;

ARCHITECTURE mode_35_arch OF mode_35_tb IS

SIGNAL ref_n_1, ref_0, ref_1, ref_2 : std_logic_vector( 7 downto 0 );
SIGNAL output : std_logic_vector( 7 downto 0 );

COMPONENT mode_35
PORT (
	ref_n_1, ref_0, ref_1, ref_2 : in std_logic_vector( 7 downto 0 );
	output : out std_logic_vector( 7 downto 0 )
  );
END COMPONENT;

BEGIN
	i1 : mode_35
	PORT MAP ( ref_n_1 => ref_n_1, ref_0 => ref_0, ref_1 => ref_1, ref_2 => ref_2, output => output);

init : PROCESS                                               

BEGIN  
	ref_n_1 <= "00001001"; --9
	ref_0 <= "00110000"; --48
	ref_1 <= "10001110"; --142
	ref_2 <= "11110011"; --243
	--output = (9*-2 + 48*60 + 142*7 + 243*-1 + 32) >> 6 = 56
	
	assert false report "Fim do teste";
	wait;
	
END PROCESS init;                                          

END mode_35_arch;
