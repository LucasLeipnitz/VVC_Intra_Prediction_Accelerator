-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
-----------------------------------------------

ENTITY mode_35 IS
   PORT ( 
   		ref_n_1, ref_0, ref_1, ref_2 : in std_logic_vector ( 7 downto 0 );
		output : out std_logic_vector ( 7 downto 0 )
	);
END mode_35;

ARCHITECTURE comportamental OF mode_35 IS

COMPONENT MCM_35_n_1
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT MCM_35_0
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT MCM_35_1
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y1, Y2 : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT MCM_35_2
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT equation_block
PORT (
	input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
	output : out std_logic_vector ( 7 downto 0 )
  );
END COMPONENT;

	signal input_0: std_logic_vector ( 15 downto 0 );	 
	signal input_1: std_logic_vector ( 15 downto 0 );
	signal input_2: std_logic_vector ( 15 downto 0 );
	signal input_3: std_logic_vector ( 15 downto 0 );

BEGIN
	m0 : MCM_35_n_1
	PORT MAP ( X => ref_n_1, Y1 => input_0 );

	m1 : MCM_35_0
	PORT MAP ( X => ref_0, Y1 => input_1 );

	m2 : MCM_35_1
	PORT MAP ( X => ref_1, Y1 => input_2 );

	m3 : MCM_35_2
	PORT MAP ( X => ref_2, Y => input_3 );
	
	e0: equation_block
	PORT MAP (input_0 => input_0, input_1 => input_1, input_2 => input_2, input_3 => input_3, output => output);	 
	

END comportamental;
