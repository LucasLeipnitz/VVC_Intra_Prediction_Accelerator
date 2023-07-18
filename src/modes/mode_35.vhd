-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
-----------------------------------------------

ENTITY mode_35 IS
   PORT ( 
   		ref_n_3, ref_n_2, ref_n_1, ref_0, ref_1, ref_2 : in std_logic_vector ( 7 downto 0 );
		output0, output1, output2 : out std_logic_vector ( 7 downto 0 )
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

COMPONENT MCM_35_n_2
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT MCM_35_n_3
PORT (
	X : in std_logic_vector ( 7 downto 0 );
	Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
  );
END COMPONENT;

COMPONENT equation_block
PORT (
	input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
	output : out std_logic_vector ( 7 downto 0 )
  );
END COMPONENT;

	type t_input is array (0 to 63) of std_logic_vector( 15 downto 0);
	signal 	input : t_input;

BEGIN
	m0 : MCM_35_n_1
	PORT MAP ( X => ref_n_1, Y1 => input(0), Y2 => input(5), Y3 => input(9));

	m1 : MCM_35_0
	PORT MAP ( X => ref_0, Y1 => input(1), Y2 => input(6), Y3 => input(10) );

	m2 : MCM_35_1
	PORT MAP ( X => ref_1, Y1 => input(2), Y2 => input(7) );

	m3 : MCM_35_2
	PORT MAP ( X => ref_2, Y => input(3) );
	
	e0: equation_block
	PORT MAP (input_0 => input(0), input_1 => input(1), input_2 => input(2), input_3 => input(3), output => output0);
	
	m4 : MCM_35_n_2
	PORT MAP ( X => ref_n_2, Y1 => input(4), Y2 => input(11) );
	
	e1: equation_block
	PORT MAP (input_0 => input(4), input_1 => input(5), input_2 => input(6), input_3 => input(7), output => output1);
	
	m5 : MCM_35_n_3
	PORT MAP ( X => ref_n_3, Y1 => input(8) );
	
	e2: equation_block
	PORT MAP (input_0 => input(8), input_1 => input(9), input_2 => input(10), input_3 => input(11), output => output2);	


END comportamental;
