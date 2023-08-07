-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_2 IS
	PORT (
		ref : in ref_bus (2 to 17 );
		output : out output_bus
	);
END mode_2;

ARCHITECTURE comportamental OF mode_2 IS

COMPONENT MCM_2_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_6
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_7
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_8
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_9
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_10
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_11
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_12
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_13
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_14
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_15
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_16
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2_17
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

type t_input is array (0 to 15) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of eq_input;
signal 	input : t_input;
signal 	eq_input : t_eq_input;


BEGIN
m0 : MCM_2_2
PORT MAP ( X => ref(2), Y => input(0) );

m1 : MCM_2_3
PORT MAP ( X => ref(3), Y => input(1) );

m2 : MCM_2_4
PORT MAP ( X => ref(4), Y => input(2) );

m3 : MCM_2_5
PORT MAP ( X => ref(5), Y => input(3) );

m4 : MCM_2_6
PORT MAP ( X => ref(6), Y => input(4) );

m5 : MCM_2_7
PORT MAP ( X => ref(7), Y => input(5) );

m6 : MCM_2_8
PORT MAP ( X => ref(8), Y => input(6) );

m7 : MCM_2_9
PORT MAP ( X => ref(9), Y => input(7) );

m8 : MCM_2_10
PORT MAP ( X => ref(10), Y => input(8) );

m9 : MCM_2_11
PORT MAP ( X => ref(11), Y => input(9) );

m10 : MCM_2_12
PORT MAP ( X => ref(12), Y => input(10) );

m11 : MCM_2_13
PORT MAP ( X => ref(13), Y => input(11) );

m12 : MCM_2_14
PORT MAP ( X => ref(14), Y => input(12) );

m13 : MCM_2_15
PORT MAP ( X => ref(15), Y => input(13) );

m14 : MCM_2_16
PORT MAP ( X => ref(16), Y => input(14) );

m15 : MCM_2_17
PORT MAP ( X => ref(17), Y => input(15) );


eq_input(0)(0) <= "0000000000000000";
eq_input(0)(1) <= input(0);
eq_input(0)(2) <= "0000000000000000";
eq_input(0)(3) <= "0000000000000000";
eq_input(1)(0) <= "0000000000000000";
eq_input(1)(1) <= input(1);
eq_input(1)(2) <= "0000000000000000";
eq_input(1)(3) <= "0000000000000000";
eq_input(2)(0) <= "0000000000000000";
eq_input(2)(1) <= input(2);
eq_input(2)(2) <= "0000000000000000";
eq_input(2)(3) <= "0000000000000000";
eq_input(3)(0) <= "0000000000000000";
eq_input(3)(1) <= input(3);
eq_input(3)(2) <= "0000000000000000";
eq_input(3)(3) <= "0000000000000000";
eq_input(4)(0) <= "0000000000000000";
eq_input(4)(1) <= input(4);
eq_input(4)(2) <= "0000000000000000";
eq_input(4)(3) <= "0000000000000000";
eq_input(5)(0) <= "0000000000000000";
eq_input(5)(1) <= input(5);
eq_input(5)(2) <= "0000000000000000";
eq_input(5)(3) <= "0000000000000000";
eq_input(6)(0) <= "0000000000000000";
eq_input(6)(1) <= input(6);
eq_input(6)(2) <= "0000000000000000";
eq_input(6)(3) <= "0000000000000000";
eq_input(7)(0) <= "0000000000000000";
eq_input(7)(1) <= input(7);
eq_input(7)(2) <= "0000000000000000";
eq_input(7)(3) <= "0000000000000000";
eq_input(8)(0) <= "0000000000000000";
eq_input(8)(1) <= input(8);
eq_input(8)(2) <= "0000000000000000";
eq_input(8)(3) <= "0000000000000000";
eq_input(9)(0) <= "0000000000000000";
eq_input(9)(1) <= input(9);
eq_input(9)(2) <= "0000000000000000";
eq_input(9)(3) <= "0000000000000000";
eq_input(10)(0) <= "0000000000000000";
eq_input(10)(1) <= input(10);
eq_input(10)(2) <= "0000000000000000";
eq_input(10)(3) <= "0000000000000000";
eq_input(11)(0) <= "0000000000000000";
eq_input(11)(1) <= input(11);
eq_input(11)(2) <= "0000000000000000";
eq_input(11)(3) <= "0000000000000000";
eq_input(12)(0) <= "0000000000000000";
eq_input(12)(1) <= input(12);
eq_input(12)(2) <= "0000000000000000";
eq_input(12)(3) <= "0000000000000000";
eq_input(13)(0) <= "0000000000000000";
eq_input(13)(1) <= input(13);
eq_input(13)(2) <= "0000000000000000";
eq_input(13)(3) <= "0000000000000000";
eq_input(14)(0) <= "0000000000000000";
eq_input(14)(1) <= input(14);
eq_input(14)(2) <= "0000000000000000";
eq_input(14)(3) <= "0000000000000000";
eq_input(15)(0) <= "0000000000000000";
eq_input(15)(1) <= input(15);
eq_input(15)(2) <= "0000000000000000";
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