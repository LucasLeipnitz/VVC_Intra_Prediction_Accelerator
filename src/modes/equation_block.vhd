-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
-----------------------------------------------

ENTITY equation_block IS
   PORT ( 
   		input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
		output : out std_logic_vector ( 7 downto 0 )
	);
END equation_block;

ARCHITECTURE comportamental OF equation_block IS

COMPONENT clip
PORT (
	input : in std_logic_vector ( 19 downto 0 );
	output : out std_logic_vector ( 7 downto 0 )
  );
END COMPONENT;

	signal sum: std_logic_vector (19 downto 0);
	signal sum_shift: std_logic_vector (19 downto 0); 
	signal t0: std_logic_vector ( 19 downto 0 );
	signal t1: std_logic_vector ( 19 downto 0 );
	signal t2: std_logic_vector ( 19 downto 0 );
	signal t3: std_logic_vector ( 19 downto 0 );

BEGIN
	
	t0 <= input_0(15) & input_0(15) & input_0(15) & input_0(15) & input_0(15 downto 0);
	t1 <= input_1(15) & input_1(15) & input_1(15) & input_1(15) & input_1(15 downto 0);
	t2 <= input_2(15) & input_2(15) & input_2(15) & input_2(15) & input_2(15 downto 0);
	t3 <= input_3(15) & input_3(15) & input_3(15) & input_3(15) & input_3(15 downto 0);
	
	sum <= t0 + t1 + t2 + t3 + 32;
	sum_shift <= "000000" & sum(19 downto 6);
	i1 : clip
	PORT MAP ( input => sum_shift,  output => output );

END comportamental;
