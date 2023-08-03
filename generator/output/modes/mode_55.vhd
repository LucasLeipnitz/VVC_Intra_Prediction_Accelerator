-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_55 IS
	PORT (
		ref : in ref_bus (0 to 6 );
		output : out output_bus
	);
END mode_55;

ARCHITECTURE comportamental OF mode_55 IS

COMPONENT MCM_55_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_55_6
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

type t_input is array (0 to 47) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of eq_input;
signal 	input : t_input;
signal 	eq_input : t_eq_input;


BEGIN
m0 : MCM_55_0
PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2) );

m1 : MCM_55_1
PORT MAP ( X => ref(1), Y1 => input(3), Y2 => input(4), Y3 => input(5), Y4 => input(6), Y5 => input(7), Y6 => input(8), Y7 => input(9), Y8 => input(10) );

m2 : MCM_55_2
PORT MAP ( X => ref(2), Y1 => input(11), Y2 => input(12), Y3 => input(13), Y4 => input(14), Y5 => input(15), Y6 => input(16), Y7 => input(17), Y8 => input(18), Y9 => input(19), Y10 => input(20), Y11 => input(21), Y12 => input(22) );

m3 : MCM_55_3
PORT MAP ( X => ref(3), Y1 => input(23), Y2 => input(24), Y3 => input(25), Y4 => input(26), Y5 => input(27), Y6 => input(28), Y7 => input(29), Y8 => input(30), Y9 => input(31), Y10 => input(32), Y11 => input(33), Y12 => input(34) );

m4 : MCM_55_4
PORT MAP ( X => ref(4), Y1 => input(35), Y2 => input(36), Y3 => input(37), Y4 => input(38), Y5 => input(39), Y6 => input(40), Y7 => input(41), Y8 => input(42), Y9 => input(43) );

m5 : MCM_55_5
PORT MAP ( X => ref(5), Y1 => input(44), Y2 => input(45), Y3 => input(46) );

m6 : MCM_55_6
PORT MAP ( X => ref(6), Y => input(47) );


eq_input(0)(0) <= input(0);
eq_input(0)(1) <= input(3);
eq_input(0)(2) <= input(11);
eq_input(0)(3) <= input(23);
eq_input(1)(0) <= input(1);
eq_input(1)(1) <= input(4);
eq_input(1)(2) <= input(12);
eq_input(1)(3) <= input(24);
eq_input(2)(0) <= input(0);
eq_input(2)(1) <= input(5);
eq_input(2)(2) <= input(13);
eq_input(2)(3) <= input(24);
eq_input(3)(0) <= input(2);
eq_input(3)(1) <= input(6);
eq_input(3)(2) <= input(14);
eq_input(3)(3) <= input(24);
eq_input(4)(0) <= "0000000000000000";
eq_input(4)(1) <= input(7);
eq_input(4)(2) <= input(15);
eq_input(4)(3) <= input(23);
eq_input(5)(0) <= input(8);
eq_input(5)(1) <= input(16);
eq_input(5)(2) <= input(25);
eq_input(5)(3) <= input(35);
eq_input(6)(0) <= input(9);
eq_input(6)(1) <= input(17);
eq_input(6)(2) <= input(26);
eq_input(6)(3) <= input(35);
eq_input(7)(0) <= input(10);
eq_input(7)(1) <= input(18);
eq_input(7)(2) <= input(27);
eq_input(7)(3) <= input(36);
eq_input(8)(0) <= input(8);
eq_input(8)(1) <= input(19);
eq_input(8)(2) <= input(28);
eq_input(8)(3) <= input(37);
eq_input(9)(0) <= input(8);
eq_input(9)(1) <= input(20);
eq_input(9)(2) <= input(29);
eq_input(9)(3) <= input(35);
eq_input(10)(0) <= input(21);
eq_input(10)(1) <= input(30);
eq_input(10)(2) <= input(38);
eq_input(10)(3) <= "0000000000000000";
eq_input(11)(0) <= input(22);
eq_input(11)(1) <= input(31);
eq_input(11)(2) <= input(39);
eq_input(11)(3) <= input(44);
eq_input(12)(0) <= input(22);
eq_input(12)(1) <= input(32);
eq_input(12)(2) <= input(40);
eq_input(12)(3) <= input(45);
eq_input(13)(0) <= input(22);
eq_input(13)(1) <= input(33);
eq_input(13)(2) <= input(41);
eq_input(13)(3) <= input(46);
eq_input(14)(0) <= input(21);
eq_input(14)(1) <= input(34);
eq_input(14)(2) <= input(42);
eq_input(14)(3) <= input(45);
eq_input(15)(0) <= "0000000000000000";
eq_input(15)(1) <= input(43);
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