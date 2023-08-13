-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_34 IS
	PORT (
		ref : in ref_bus (-16 to 1 );
		output : out output_bus
	);
END mode_34;

ARCHITECTURE comportamental OF mode_34 IS

COMPONENT MCM_34_n1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n6
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n7
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n8
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n9
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n10
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n11
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n12
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n13
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n14
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n15
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_34_n16
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

type t_input is array (0 to 33) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of eq_input;
signal 	input : t_input;
signal 	eq_input : t_eq_input;


BEGIN
m0 : MCM_34_n1
PORT MAP ( X => ref(-1), Y1 => input(0), Y2 => input(1) );

m1 : MCM_34_0
PORT MAP ( X => ref(0), Y1 => input(2), Y2 => input(3) );

m2 : MCM_34_1
PORT MAP ( X => ref(1), Y => input(4) );

m3 : MCM_34_n2
PORT MAP ( X => ref(-2), Y1 => input(5), Y2 => input(6) );

m4 : MCM_34_n3
PORT MAP ( X => ref(-3), Y1 => input(7), Y2 => input(8) );

m5 : MCM_34_n4
PORT MAP ( X => ref(-4), Y1 => input(9), Y2 => input(10) );

m6 : MCM_34_n5
PORT MAP ( X => ref(-5), Y1 => input(11), Y2 => input(12) );

m7 : MCM_34_n6
PORT MAP ( X => ref(-6), Y1 => input(13), Y2 => input(14) );

m8 : MCM_34_n7
PORT MAP ( X => ref(-7), Y1 => input(15), Y2 => input(16) );

m9 : MCM_34_n8
PORT MAP ( X => ref(-8), Y1 => input(17), Y2 => input(18) );

m10 : MCM_34_n9
PORT MAP ( X => ref(-9), Y1 => input(19), Y2 => input(20) );

m11 : MCM_34_n10
PORT MAP ( X => ref(-10), Y1 => input(21), Y2 => input(22) );

m12 : MCM_34_n11
PORT MAP ( X => ref(-11), Y1 => input(23), Y2 => input(24) );

m13 : MCM_34_n12
PORT MAP ( X => ref(-12), Y1 => input(25), Y2 => input(26) );

m14 : MCM_34_n13
PORT MAP ( X => ref(-13), Y1 => input(27), Y2 => input(28) );

m15 : MCM_34_n14
PORT MAP ( X => ref(-14), Y1 => input(29), Y2 => input(30) );

m16 : MCM_34_n15
PORT MAP ( X => ref(-15), Y1 => input(31), Y2 => input(32) );

m17 : MCM_34_n16
PORT MAP ( X => ref(-16), Y => input(33) );


eq_input(0)(0) <= input(0);
eq_input(0)(1) <= input(2);
eq_input(0)(2) <= input(4);
eq_input(0)(3) <= "0000000000000000";
eq_input(1)(0) <= input(5);
eq_input(1)(1) <= input(1);
eq_input(1)(2) <= input(3);
eq_input(1)(3) <= "0000000000000000";
eq_input(2)(0) <= input(7);
eq_input(2)(1) <= input(6);
eq_input(2)(2) <= input(0);
eq_input(2)(3) <= "0000000000000000";
eq_input(3)(0) <= input(9);
eq_input(3)(1) <= input(8);
eq_input(3)(2) <= input(5);
eq_input(3)(3) <= "0000000000000000";
eq_input(4)(0) <= input(11);
eq_input(4)(1) <= input(10);
eq_input(4)(2) <= input(7);
eq_input(4)(3) <= "0000000000000000";
eq_input(5)(0) <= input(13);
eq_input(5)(1) <= input(12);
eq_input(5)(2) <= input(9);
eq_input(5)(3) <= "0000000000000000";
eq_input(6)(0) <= input(15);
eq_input(6)(1) <= input(14);
eq_input(6)(2) <= input(11);
eq_input(6)(3) <= "0000000000000000";
eq_input(7)(0) <= input(17);
eq_input(7)(1) <= input(16);
eq_input(7)(2) <= input(13);
eq_input(7)(3) <= "0000000000000000";
eq_input(8)(0) <= input(19);
eq_input(8)(1) <= input(18);
eq_input(8)(2) <= input(15);
eq_input(8)(3) <= "0000000000000000";
eq_input(9)(0) <= input(21);
eq_input(9)(1) <= input(20);
eq_input(9)(2) <= input(17);
eq_input(9)(3) <= "0000000000000000";
eq_input(10)(0) <= input(23);
eq_input(10)(1) <= input(22);
eq_input(10)(2) <= input(19);
eq_input(10)(3) <= "0000000000000000";
eq_input(11)(0) <= input(25);
eq_input(11)(1) <= input(24);
eq_input(11)(2) <= input(21);
eq_input(11)(3) <= "0000000000000000";
eq_input(12)(0) <= input(27);
eq_input(12)(1) <= input(26);
eq_input(12)(2) <= input(23);
eq_input(12)(3) <= "0000000000000000";
eq_input(13)(0) <= input(29);
eq_input(13)(1) <= input(28);
eq_input(13)(2) <= input(25);
eq_input(13)(3) <= "0000000000000000";
eq_input(14)(0) <= input(31);
eq_input(14)(1) <= input(30);
eq_input(14)(2) <= input(27);
eq_input(14)(3) <= "0000000000000000";
eq_input(15)(0) <= input(33);
eq_input(15)(1) <= input(32);
eq_input(15)(2) <= input(29);
eq_input(15)(3) <= "0000000000000000";

e0: equation_block
PORT MAP (input_0 => eq_input(0)(0), input_1 => eq_input(0)(1), input_2 => eq_input(0)(2), input_3 => eq_input(0)(3), output => output(0));

e1: equation_block
PORT MAP (input_0 => eq_input(1)(0), input_1 => eq_input(1)(1), input_2 => eq_input(1)(2), input_3 => eq_input(1)(3), output => output(1));

e2: equation_block
PORT MAP (input_0 => eq_input(2)(0), input_1 => eq_input(2)(1), input_2 => eq_input(2)(2), input_3 => eq_input(2)(3), output => output(2));

e3: equation_block
PORT MAP (input_0 => eq_input(3)(0), input_1 => eq_input(3)(1), input_2 => eq_input(3)(2), input_3 => eq_input(3)(3), output => output(3));

e4: equation_block
PORT MAP (input_0 => eq_input(4)(0), input_1 => eq_input(4)(1), input_2 => eq_input(4)(2), input_3 => eq_input(4)(3), output => output(4));

e5: equation_block
PORT MAP (input_0 => eq_input(5)(0), input_1 => eq_input(5)(1), input_2 => eq_input(5)(2), input_3 => eq_input(5)(3), output => output(5));

e6: equation_block
PORT MAP (input_0 => eq_input(6)(0), input_1 => eq_input(6)(1), input_2 => eq_input(6)(2), input_3 => eq_input(6)(3), output => output(6));

e7: equation_block
PORT MAP (input_0 => eq_input(7)(0), input_1 => eq_input(7)(1), input_2 => eq_input(7)(2), input_3 => eq_input(7)(3), output => output(7));

e8: equation_block
PORT MAP (input_0 => eq_input(8)(0), input_1 => eq_input(8)(1), input_2 => eq_input(8)(2), input_3 => eq_input(8)(3), output => output(8));

e9: equation_block
PORT MAP (input_0 => eq_input(9)(0), input_1 => eq_input(9)(1), input_2 => eq_input(9)(2), input_3 => eq_input(9)(3), output => output(9));

e10: equation_block
PORT MAP (input_0 => eq_input(10)(0), input_1 => eq_input(10)(1), input_2 => eq_input(10)(2), input_3 => eq_input(10)(3), output => output(10));

e11: equation_block
PORT MAP (input_0 => eq_input(11)(0), input_1 => eq_input(11)(1), input_2 => eq_input(11)(2), input_3 => eq_input(11)(3), output => output(11));

e12: equation_block
PORT MAP (input_0 => eq_input(12)(0), input_1 => eq_input(12)(1), input_2 => eq_input(12)(2), input_3 => eq_input(12)(3), output => output(12));

e13: equation_block
PORT MAP (input_0 => eq_input(13)(0), input_1 => eq_input(13)(1), input_2 => eq_input(13)(2), input_3 => eq_input(13)(3), output => output(13));

e14: equation_block
PORT MAP (input_0 => eq_input(14)(0), input_1 => eq_input(14)(1), input_2 => eq_input(14)(2), input_3 => eq_input(14)(3), output => output(14));

e15: equation_block
PORT MAP (input_0 => eq_input(15)(0), input_1 => eq_input(15)(1), input_2 => eq_input(15)(2), input_3 => eq_input(15)(3), output => output(15));

END comportamental;