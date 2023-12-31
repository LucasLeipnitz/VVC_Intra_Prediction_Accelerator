-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY mode_3 IS
	PORT (
		ref : in ref_bus (0 to 17 );
		state: in std_logic;
		output : out output_bus
	);
END mode_3;

ARCHITECTURE comportamental OF mode_3 IS

COMPONENT MCM_3_b1_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_6
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_7
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_8
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_9
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_10
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_11
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_12
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_13
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_14
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_15
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_16
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b1_17
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_4
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_5
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_6
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_7
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_8
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_9
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_10
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_11
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_12
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_13
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_14
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_15
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_16
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3_b2_17
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 122) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of eq_input;
signal 	input : t_input;
signal 	eq_input : t_eq_input;


BEGIN
m0 : MCM_3_b1_0
PORT MAP ( X => ref(0), Y => input(0) );

m1 : MCM_3_b1_1
PORT MAP ( X => ref(1), Y1 => input(1), Y2 => input(2) );

m2 : MCM_3_b1_2
PORT MAP ( X => ref(2), Y1 => input(3), Y2 => input(4), Y3 => input(5) );

m3 : MCM_3_b1_3
PORT MAP ( X => ref(3), Y1 => input(6), Y2 => input(7), Y3 => input(8), Y4 => input(9) );

m4 : MCM_3_b1_4
PORT MAP ( X => ref(4), Y1 => input(10), Y2 => input(11), Y3 => input(12), Y4 => input(13) );

m5 : MCM_3_b1_5
PORT MAP ( X => ref(5), Y1 => input(14), Y2 => input(15), Y3 => input(16), Y4 => input(17) );

m6 : MCM_3_b1_6
PORT MAP ( X => ref(6), Y1 => input(18), Y2 => input(19), Y3 => input(20), Y4 => input(21) );

m7 : MCM_3_b1_7
PORT MAP ( X => ref(7), Y1 => input(22), Y2 => input(23), Y3 => input(24), Y4 => input(25) );

m8 : MCM_3_b1_8
PORT MAP ( X => ref(8), Y1 => input(26), Y2 => input(27), Y3 => input(28), Y4 => input(29) );

m9 : MCM_3_b1_9
PORT MAP ( X => ref(9), Y1 => input(30), Y2 => input(31), Y3 => input(32), Y4 => input(33), Y5 => input(34) );

m10 : MCM_3_b1_10
PORT MAP ( X => ref(10), Y1 => input(35), Y2 => input(36), Y3 => input(37), Y4 => input(38), Y5 => input(39) );

m11 : MCM_3_b1_11
PORT MAP ( X => ref(11), Y1 => input(40), Y2 => input(41), Y3 => input(42), Y4 => input(43), Y5 => input(44) );

m12 : MCM_3_b1_12
PORT MAP ( X => ref(12), Y1 => input(45), Y2 => input(46), Y3 => input(47), Y4 => input(48), Y5 => input(49) );

m13 : MCM_3_b1_13
PORT MAP ( X => ref(13), Y1 => input(50), Y2 => input(51), Y3 => input(52), Y4 => input(53) );

m14 : MCM_3_b1_14
PORT MAP ( X => ref(14), Y1 => input(54), Y2 => input(55), Y3 => input(56), Y4 => input(57) );

m15 : MCM_3_b1_15
PORT MAP ( X => ref(15), Y1 => input(58), Y2 => input(59), Y3 => input(60) );

m16 : MCM_3_b1_16
PORT MAP ( X => ref(16), Y1 => input(61), Y2 => input(62) );

m17 : MCM_3_b1_17
PORT MAP ( X => ref(17), Y => input(63) );

m18 : MCM_3_b2_1
PORT MAP ( X => ref(1), Y => input(64) );

m19 : MCM_3_b2_2
PORT MAP ( X => ref(2), Y1 => input(65), Y2 => input(66) );

m20 : MCM_3_b2_3
PORT MAP ( X => ref(3), Y1 => input(67), Y2 => input(68), Y3 => input(69) );

m21 : MCM_3_b2_4
PORT MAP ( X => ref(4), Y1 => input(70), Y2 => input(71), Y3 => input(72), Y4 => input(73) );

m22 : MCM_3_b2_5
PORT MAP ( X => ref(5), Y1 => input(74), Y2 => input(75), Y3 => input(76), Y4 => input(77), Y5 => input(78) );

m23 : MCM_3_b2_6
PORT MAP ( X => ref(6), Y1 => input(79), Y2 => input(80), Y3 => input(81), Y4 => input(82) );

m24 : MCM_3_b2_7
PORT MAP ( X => ref(7), Y1 => input(83), Y2 => input(84), Y3 => input(85), Y4 => input(86), Y5 => input(87) );

m25 : MCM_3_b2_8
PORT MAP ( X => ref(8), Y1 => input(88), Y2 => input(89), Y3 => input(90), Y4 => input(91) );

m26 : MCM_3_b2_9
PORT MAP ( X => ref(9), Y1 => input(92), Y2 => input(93), Y3 => input(94), Y4 => input(95) );

m27 : MCM_3_b2_10
PORT MAP ( X => ref(10), Y1 => input(96), Y2 => input(97), Y3 => input(98), Y4 => input(99) );

m28 : MCM_3_b2_11
PORT MAP ( X => ref(11), Y1 => input(100), Y2 => input(101) );

m29 : MCM_3_b2_12
PORT MAP ( X => ref(12), Y1 => input(102), Y2 => input(103), Y3 => input(104), Y4 => input(105) );

m30 : MCM_3_b2_13
PORT MAP ( X => ref(13), Y1 => input(106), Y2 => input(107), Y3 => input(108), Y4 => input(109) );

m31 : MCM_3_b2_14
PORT MAP ( X => ref(14), Y1 => input(110), Y2 => input(111), Y3 => input(112), Y4 => input(113) );

m32 : MCM_3_b2_15
PORT MAP ( X => ref(15), Y1 => input(114), Y2 => input(115), Y3 => input(116), Y4 => input(117) );

m33 : MCM_3_b2_16
PORT MAP ( X => ref(16), Y1 => input(118), Y2 => input(119), Y3 => input(120) );

m34 : MCM_3_b2_17
PORT MAP ( X => ref(17), Y1 => input(121), Y2 => input(122) );

PROCESS (ref, state) is
BEGIN
	IF (state = '0') THEN
		eq_input(0)(0) <= input(0);
		eq_input(0)(1) <= input(1);
		eq_input(0)(2) <= input(3);
		eq_input(0)(3) <= input(6);
		eq_input(1)(0) <= input(2);
		eq_input(1)(1) <= input(4);
		eq_input(1)(2) <= input(7);
		eq_input(1)(3) <= input(10);
		eq_input(2)(0) <= input(5);
		eq_input(2)(1) <= input(8);
		eq_input(2)(2) <= input(11);
		eq_input(2)(3) <= input(14);
		eq_input(3)(0) <= input(9);
		eq_input(3)(1) <= input(12);
		eq_input(3)(2) <= input(15);
		eq_input(3)(3) <= input(18);
		eq_input(4)(0) <= input(13);
		eq_input(4)(1) <= input(16);
		eq_input(4)(2) <= input(19);
		eq_input(4)(3) <= input(22);
		eq_input(5)(0) <= input(17);
		eq_input(5)(1) <= input(20);
		eq_input(5)(2) <= input(23);
		eq_input(5)(3) <= input(26);
		eq_input(6)(0) <= input(21);
		eq_input(6)(1) <= input(24);
		eq_input(6)(2) <= input(27);
		eq_input(6)(3) <= input(30);
		eq_input(7)(0) <= input(25);
		eq_input(7)(1) <= input(28);
		eq_input(7)(2) <= input(31);
		eq_input(7)(3) <= input(35);
		eq_input(8)(0) <= input(29);
		eq_input(8)(1) <= input(32);
		eq_input(8)(2) <= input(36);
		eq_input(8)(3) <= input(40);
		eq_input(9)(0) <= input(33);
		eq_input(9)(1) <= input(37);
		eq_input(9)(2) <= input(41);
		eq_input(9)(3) <= input(45);
		eq_input(10)(0) <= input(34);
		eq_input(10)(1) <= input(38);
		eq_input(10)(2) <= input(42);
		eq_input(10)(3) <= input(46);
		eq_input(11)(0) <= input(39);
		eq_input(11)(1) <= input(43);
		eq_input(11)(2) <= input(47);
		eq_input(11)(3) <= input(50);
		eq_input(12)(0) <= input(44);
		eq_input(12)(1) <= input(48);
		eq_input(12)(2) <= input(51);
		eq_input(12)(3) <= input(54);
		eq_input(13)(0) <= input(49);
		eq_input(13)(1) <= input(52);
		eq_input(13)(2) <= input(55);
		eq_input(13)(3) <= input(58);
		eq_input(14)(0) <= input(53);
		eq_input(14)(1) <= input(56);
		eq_input(14)(2) <= input(59);
		eq_input(14)(3) <= input(61);
		eq_input(15)(0) <= input(57);
		eq_input(15)(1) <= input(60);
		eq_input(15)(2) <= input(62);
		eq_input(15)(3) <= input(63);
	ELSE 
		eq_input(0)(0) <= input(64);
		eq_input(0)(1) <= input(65);
		eq_input(0)(2) <= input(67);
		eq_input(0)(3) <= input(70);
		eq_input(1)(0) <= input(66);
		eq_input(1)(1) <= input(68);
		eq_input(1)(2) <= input(71);
		eq_input(1)(3) <= input(74);
		eq_input(2)(0) <= input(69);
		eq_input(2)(1) <= input(72);
		eq_input(2)(2) <= input(75);
		eq_input(2)(3) <= input(79);
		eq_input(3)(0) <= input(73);
		eq_input(3)(1) <= input(76);
		eq_input(3)(2) <= input(80);
		eq_input(3)(3) <= input(83);
		eq_input(4)(0) <= input(77);
		eq_input(4)(1) <= input(81);
		eq_input(4)(2) <= input(84);
		eq_input(4)(3) <= "0000000000000000";
		eq_input(5)(0) <= input(78);
		eq_input(5)(1) <= input(82);
		eq_input(5)(2) <= input(85);
		eq_input(5)(3) <= input(88);
		eq_input(6)(0) <= input(79);
		eq_input(6)(1) <= input(86);
		eq_input(6)(2) <= input(89);
		eq_input(6)(3) <= input(92);
		eq_input(7)(0) <= input(87);
		eq_input(7)(1) <= input(90);
		eq_input(7)(2) <= input(93);
		eq_input(7)(3) <= input(96);
		eq_input(8)(0) <= input(91);
		eq_input(8)(1) <= input(94);
		eq_input(8)(2) <= input(97);
		eq_input(8)(3) <= input(100);
		eq_input(9)(0) <= input(95);
		eq_input(9)(1) <= input(98);
		eq_input(9)(2) <= input(101);
		eq_input(9)(3) <= input(102);
		eq_input(10)(0) <= input(99);
		eq_input(10)(1) <= input(101);
		eq_input(10)(2) <= input(103);
		eq_input(10)(3) <= input(106);
		eq_input(11)(0) <= input(100);
		eq_input(11)(1) <= input(104);
		eq_input(11)(2) <= input(107);
		eq_input(11)(3) <= input(110);
		eq_input(12)(0) <= input(105);
		eq_input(12)(1) <= input(108);
		eq_input(12)(2) <= input(111);
		eq_input(12)(3) <= input(114);
		eq_input(13)(0) <= input(109);
		eq_input(13)(1) <= input(112);
		eq_input(13)(2) <= input(115);
		eq_input(13)(3) <= input(118);
		eq_input(14)(0) <= input(113);
		eq_input(14)(1) <= input(116);
		eq_input(14)(2) <= input(119);
		eq_input(14)(3) <= input(121);
		eq_input(15)(0) <= input(117);
		eq_input(15)(1) <= input(120);
		eq_input(15)(2) <= input(122);
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