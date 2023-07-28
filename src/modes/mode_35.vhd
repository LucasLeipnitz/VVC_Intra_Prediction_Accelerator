-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_35 IS
	PORT (
		ref : in ref_bus (-15 to 2 );
		output : out output_bus
	);
END mode_35;

ARCHITECTURE comportamental OF mode_35 IS

COMPONENT MCM_35_n1
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

COMPONENT MCM_35_n2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n6
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n7
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n8
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n9
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n10
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n11
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n12
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n13
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n14
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_35_n15
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

			type t_input is array (0 to 55) of std_logic_vector( 15 downto 0);
			signal 	input : t_input;

BEGIN

	m0 : MCM_35_n1
	PORT MAP ( X => ref(-1), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3) );

	m1 : MCM_35_0
	PORT MAP ( X => ref(0), Y1 => input(4), Y2 => input(5), Y3 => input(6) );

	m2 : MCM_35_1
	PORT MAP ( X => ref(1), Y1 => input(7), Y2 => input(8) );

	m3 : MCM_35_2
	PORT MAP ( X => ref(2), Y => input(9) );

	m4 : MCM_35_n2
	PORT MAP ( X => ref(-2), Y1 => input(10), Y2 => input(11), Y3 => input(12) );

	m5 : MCM_35_n3
	PORT MAP ( X => ref(-3), Y1 => input(13), Y2 => input(14), Y3 => input(15), Y4 => input(16) );

	m6 : MCM_35_n4
	PORT MAP ( X => ref(-4), Y1 => input(17), Y2 => input(18), Y3 => input(19) );

	m7 : MCM_35_n5
	PORT MAP ( X => ref(-5), Y1 => input(20), Y2 => input(21), Y3 => input(22) );

	m8 : MCM_35_n6
	PORT MAP ( X => ref(-6), Y1 => input(23), Y2 => input(24), Y3 => input(25), Y4 => input(26) );

	m9 : MCM_35_n7
	PORT MAP ( X => ref(-7), Y1 => input(27), Y2 => input(28), Y3 => input(29), Y4 => input(30) );

	m10 : MCM_35_n8
	PORT MAP ( X => ref(-8), Y1 => input(31), Y2 => input(32), Y3 => input(33), Y4 => input(34) );

	m11 : MCM_35_n9
	PORT MAP ( X => ref(-9), Y1 => input(35), Y2 => input(36), Y3 => input(37), Y4 => input(38) );

	m12 : MCM_35_n10
	PORT MAP ( X => ref(-10), Y1 => input(39), Y2 => input(40), Y3 => input(41), Y4 => input(42) );

	m13 : MCM_35_n11
	PORT MAP ( X => ref(-11), Y1 => input(43), Y2 => input(44), Y3 => input(45), Y4 => input(46) );

	m14 : MCM_35_n12
	PORT MAP ( X => ref(-12), Y1 => input(47), Y2 => input(48), Y3 => input(49) );

	m15 : MCM_35_n13
	PORT MAP ( X => ref(-13), Y1 => input(50), Y2 => input(51), Y3 => input(52) );

	m16 : MCM_35_n14
	PORT MAP ( X => ref(-14), Y1 => input(53), Y2 => input(54) );

	m17 : MCM_35_n15
	PORT MAP ( X => ref(-15), Y => input(55) );

	e0: equation_block
	PORT MAP (input_0 => input(0), input_1 => input(4), input_2 => input(7), input_3 => input(9), output => output(0));

	e1: equation_block
	PORT MAP (input_0 => input(10), input_1 => input(1), input_2 => input(5), input_3 => input(8), output => output(1));

	e2: equation_block
	PORT MAP (input_0 => input(13), input_1 => input(11), input_2 => input(2), input_3 => input(6), output => output(2));

	e3: equation_block
	PORT MAP (input_0 => input(17), input_1 => input(14), input_2 => input(12), input_3 => input(3), output => output(3));

	e4: equation_block
	PORT MAP (input_0 => input(20), input_1 => input(18), input_2 => input(15), input_3 => input(10), output => output(4));

	e5: equation_block
	PORT MAP (input_0 => input(23), input_1 => input(21), input_2 => input(19), input_3 => input(16), output => output(5));

	e6: equation_block
	PORT MAP (input_0 => input(27), input_1 => input(24), input_2 => input(22), input_3 => input(17), output => output(6));

	e7: equation_block
	PORT MAP (input_0 => input(31), input_1 => input(28), input_2 => input(25), input_3 => input(20), output => output(7));

	e8: equation_block
	PORT MAP (input_0 => input(35), input_1 => input(32), input_2 => input(29), input_3 => input(26), output => output(8));

	e9: equation_block
	PORT MAP (input_0 => "0000000000000000", input_1 => input(36), input_2 => input(33), input_3 => input(30), output => output(9));

	e10: equation_block
	PORT MAP (input_0 => input(39), input_1 => input(37), input_2 => input(34), input_3 => "0000000000000000", output => output(10));

	e11: equation_block
	PORT MAP (input_0 => input(43), input_1 => input(40), input_2 => input(38), input_3 => input(31), output => output(11));

	e12: equation_block
	PORT MAP (input_0 => input(47), input_1 => input(44), input_2 => input(41), input_3 => input(35), output => output(12));

	e13: equation_block
	PORT MAP (input_0 => input(50), input_1 => input(48), input_2 => input(45), input_3 => input(42), output => output(13));

	e14: equation_block
	PORT MAP (input_0 => input(53), input_1 => input(51), input_2 => input(49), input_3 => input(46), output => output(14));

	e15: equation_block
	PORT MAP (input_0 => input(55), input_1 => input(54), input_2 => input(52), input_3 => input(47), output => output(15));

END comportamental;