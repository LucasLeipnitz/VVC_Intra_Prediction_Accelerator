-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_47 IS
	PORT (
		ref : in ref_bus (-2 to 3 );
		state: in bit;
		output : out output_bus
	);
END mode_47;

ARCHITECTURE comportamental OF mode_47 IS

COMPONENT MCM_47_b1_n1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b1_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15, Y16 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b1_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b1_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b1_n2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b2_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15, Y16 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b2_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b2_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b2_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_47_b2_n1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 96) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of eq_input;
signal 	input : t_input;
signal 	eq_input : t_eq_input;


BEGIN
m0 : MCM_47_b1_n1
PORT MAP ( X => ref(-1), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7), Y9 => input(8), Y10 => input(9), Y11 => input(10) );

m1 : MCM_47_b1_0
PORT MAP ( X => ref(0), Y1 => input(11), Y2 => input(12), Y3 => input(13), Y4 => input(14), Y5 => input(15), Y6 => input(16), Y7 => input(17), Y8 => input(18), Y9 => input(19), Y10 => input(20), Y11 => input(21), Y12 => input(22), Y13 => input(23), Y14 => input(24), Y15 => input(25), Y16 => input(26) );

m2 : MCM_47_b1_1
PORT MAP ( X => ref(1), Y1 => input(27), Y2 => input(28), Y3 => input(29), Y4 => input(30), Y5 => input(31), Y6 => input(32), Y7 => input(33), Y8 => input(34), Y9 => input(35), Y10 => input(36), Y11 => input(37), Y12 => input(38), Y13 => input(39), Y14 => input(40), Y15 => input(41) );

m3 : MCM_47_b1_2
PORT MAP ( X => ref(2), Y1 => input(42), Y2 => input(43), Y3 => input(44), Y4 => input(45), Y5 => input(46) );

m4 : MCM_47_b1_n2
PORT MAP ( X => ref(-2), Y1 => input(47), Y2 => input(48) );

m5 : MCM_47_b2_0
PORT MAP ( X => ref(0), Y1 => input(49), Y2 => input(50), Y3 => input(51), Y4 => input(52), Y5 => input(53), Y6 => input(54), Y7 => input(55), Y8 => input(56), Y9 => input(57), Y10 => input(58), Y11 => input(59), Y12 => input(60), Y13 => input(61), Y14 => input(62), Y15 => input(63), Y16 => input(64) );

m6 : MCM_47_b2_1
PORT MAP ( X => ref(1), Y1 => input(65), Y2 => input(66), Y3 => input(67), Y4 => input(68), Y5 => input(69), Y6 => input(70), Y7 => input(71), Y8 => input(72), Y9 => input(73), Y10 => input(74), Y11 => input(75), Y12 => input(76), Y13 => input(77), Y14 => input(78), Y15 => input(79) );

m7 : MCM_47_b2_2
PORT MAP ( X => ref(2), Y1 => input(80), Y2 => input(81), Y3 => input(82), Y4 => input(83), Y5 => input(84), Y6 => input(85), Y7 => input(86), Y8 => input(87), Y9 => input(88), Y10 => input(89) );

m8 : MCM_47_b2_3
PORT MAP ( X => ref(3), Y1 => input(90), Y2 => input(91) );

m9 : MCM_47_b2_n1
PORT MAP ( X => ref(-1), Y1 => input(92), Y2 => input(93), Y3 => input(94), Y4 => input(95), Y5 => input(96) );

PROCESS (state) is
BEGIN
	IF (state = '0') THEN
		eq_input(0)(0) <= input(0);
		eq_input(0)(1) <= input(11);
		eq_input(0)(2) <= input(27);
		eq_input(0)(3) <= input(42);
		eq_input(1)(0) <= input(1);
		eq_input(1)(1) <= input(12);
		eq_input(1)(2) <= input(28);
		eq_input(1)(3) <= input(43);
		eq_input(2)(0) <= input(1);
		eq_input(2)(1) <= input(13);
		eq_input(2)(2) <= input(29);
		eq_input(2)(3) <= input(44);
		eq_input(3)(0) <= input(2);
		eq_input(3)(1) <= input(14);
		eq_input(3)(2) <= input(30);
		eq_input(3)(3) <= input(45);
		eq_input(4)(0) <= input(2);
		eq_input(4)(1) <= input(15);
		eq_input(4)(2) <= input(31);
		eq_input(4)(3) <= input(43);
		eq_input(5)(0) <= input(2);
		eq_input(5)(1) <= input(16);
		eq_input(5)(2) <= input(32);
		eq_input(5)(3) <= input(43);
		eq_input(6)(0) <= input(3);
		eq_input(6)(1) <= input(17);
		eq_input(6)(2) <= input(33);
		eq_input(6)(3) <= input(46);
		eq_input(7)(0) <= input(2);
		eq_input(7)(1) <= input(18);
		eq_input(7)(2) <= input(34);
		eq_input(7)(3) <= input(42);
		eq_input(8)(0) <= input(4);
		eq_input(8)(1) <= input(19);
		eq_input(8)(2) <= input(35);
		eq_input(8)(3) <= input(42);
		eq_input(9)(0) <= input(1);
		eq_input(9)(1) <= input(20);
		eq_input(9)(2) <= input(36);
		eq_input(9)(3) <= "0000000000000000";
		eq_input(10)(0) <= "0000000000000000";
		eq_input(10)(1) <= input(5);
		eq_input(10)(2) <= input(21);
		eq_input(10)(3) <= input(37);
		eq_input(11)(0) <= input(47);
		eq_input(11)(1) <= input(6);
		eq_input(11)(2) <= input(22);
		eq_input(11)(3) <= input(38);
		eq_input(12)(0) <= input(47);
		eq_input(12)(1) <= input(7);
		eq_input(12)(2) <= input(23);
		eq_input(12)(3) <= input(39);
		eq_input(13)(0) <= input(47);
		eq_input(13)(1) <= input(8);
		eq_input(13)(2) <= input(24);
		eq_input(13)(3) <= input(40);
		eq_input(14)(0) <= input(48);
		eq_input(14)(1) <= input(9);
		eq_input(14)(2) <= input(25);
		eq_input(14)(3) <= input(41);
		eq_input(15)(0) <= input(48);
		eq_input(15)(1) <= input(10);
		eq_input(15)(2) <= input(26);
		eq_input(15)(3) <= input(39);
	ELSIF (state = '1') THEN
		eq_input(0)(0) <= input(49);
		eq_input(0)(1) <= input(65);
		eq_input(0)(2) <= input(80);
		eq_input(0)(3) <= input(90);
		eq_input(1)(0) <= input(50);
		eq_input(1)(1) <= input(66);
		eq_input(1)(2) <= input(81);
		eq_input(1)(3) <= input(91);
		eq_input(2)(0) <= input(51);
		eq_input(2)(1) <= input(67);
		eq_input(2)(2) <= input(82);
		eq_input(2)(3) <= input(91);
		eq_input(3)(0) <= input(52);
		eq_input(3)(1) <= input(68);
		eq_input(3)(2) <= input(83);
		eq_input(3)(3) <= input(91);
		eq_input(4)(0) <= input(53);
		eq_input(4)(1) <= input(69);
		eq_input(4)(2) <= input(84);
		eq_input(4)(3) <= "0000000000000000";
		eq_input(5)(0) <= "0000000000000000";
		eq_input(5)(1) <= input(54);
		eq_input(5)(2) <= input(70);
		eq_input(5)(3) <= input(85);
		eq_input(6)(0) <= input(92);
		eq_input(6)(1) <= input(55);
		eq_input(6)(2) <= input(71);
		eq_input(6)(3) <= input(86);
		eq_input(7)(0) <= input(92);
		eq_input(7)(1) <= input(56);
		eq_input(7)(2) <= input(72);
		eq_input(7)(3) <= input(87);
		eq_input(8)(0) <= input(93);
		eq_input(8)(1) <= input(57);
		eq_input(8)(2) <= input(73);
		eq_input(8)(3) <= input(88);
		eq_input(9)(0) <= input(94);
		eq_input(9)(1) <= input(58);
		eq_input(9)(2) <= input(74);
		eq_input(9)(3) <= input(87);
		eq_input(10)(0) <= input(94);
		eq_input(10)(1) <= input(59);
		eq_input(10)(2) <= input(75);
		eq_input(10)(3) <= input(87);
		eq_input(11)(0) <= input(95);
		eq_input(11)(1) <= input(60);
		eq_input(11)(2) <= input(76);
		eq_input(11)(3) <= input(87);
		eq_input(12)(0) <= input(96);
		eq_input(12)(1) <= input(61);
		eq_input(12)(2) <= input(77);
		eq_input(12)(3) <= input(85);
		eq_input(13)(0) <= input(94);
		eq_input(13)(1) <= input(62);
		eq_input(13)(2) <= input(78);
		eq_input(13)(3) <= input(85);
		eq_input(14)(0) <= input(92);
		eq_input(14)(1) <= input(63);
		eq_input(14)(2) <= input(79);
		eq_input(14)(3) <= input(89);
		eq_input(15)(0) <= "0000000000000000";
		eq_input(15)(1) <= input(64);
		eq_input(15)(2) <= "0000000000000000";
		eq_input(15)(3) <= "0000000000000000";
	END IF;
END PROCESS;

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