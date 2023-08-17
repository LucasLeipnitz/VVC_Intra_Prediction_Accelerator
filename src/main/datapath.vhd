-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY datapath IS
	PORT (
		input : IN ref_bus (-66 to 38 );
		state : IN std_logic;
		base : IN std_logic_vector(4 downto 0);
		clk : IN std_logic;
		rst	: IN std_logic;
		wrt_input_reg : IN std_logic;
		mode0_out: OUT output_bus;
		mode1_out: OUT std_logic_vector(7 downto 0);
		mode_angular_out: OUT main_output
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS

COMPONENT input_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	wrt			: IN std_logic;	-- write
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END COMPONENT;

COMPONENT output_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END COMPONENT;

COMPONENT planar
	PORT ( 
		ref_x : in ref_bus (0 to 1);  
		ref_y : ref_bus (0 to 16);
		state: in std_logic;
		base : IN std_logic_vector(4 downto 0);
		clk : IN std_logic;
		rst	: IN std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT dc
	PORT ( 
		ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		base: in std_logic_vector(4 downto 0);
		clk: in  std_logic;
		rst: in std_logic;
		output : out std_logic_vector ( 7 downto 0)
	);
END COMPONENT;

COMPONENT mode_2
	PORT ( 
		ref : in ref_bus (1 to 18);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_3
	PORT ( 
		ref : in ref_bus (0 to 17);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_7
	PORT ( 
		ref : in ref_bus (0 to 11);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_10
	PORT ( 
		ref : in ref_bus (0 to 8);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_18
	PORT ( 
		ref : in ref_bus (1 to 1);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_23
	PORT ( 
		ref : in ref_bus (-3 to 2);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_26
	PORT ( 
		ref : in ref_bus (-6 to 2);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_30
	PORT ( 
		ref : in ref_bus (-10 to 2);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_33
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_34
	PORT ( 
		ref : in ref_bus (-16 to 1);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_35
	PORT ( 
		ref : in ref_bus (-15 to 2);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_43
	PORT ( 
		ref : in ref_bus (-5 to 2);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_46
	PORT ( 
		ref : in ref_bus (-2 to 2);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_49
	PORT ( 
		ref : in ref_bus (-1 to 3);
		state : in std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_50
	PORT ( 
		ref : in ref_bus (1 to 1);
		output : out output_bus
	);
END COMPONENT;

COMPONENT mode_54
	PORT ( 
		ref : in ref_bus (0 to 4);
		output : out output_bus
	);
END COMPONENT;

SIGNAL ref_in_bus : ref_bus (-66 to 38);
SIGNAL planar_bus_x : ref_bus (0 to 1);
SIGNAL planar_bus_y : ref_bus (0 to 16);
SIGNAL planar_bus_out : output_bus;
SIGNAL dc_bus_in : std_logic_vector ( 7 downto 0);
SIGNAL dc_bus_out : std_logic_vector ( 7 downto 0);	
SIGNAL mode2_bus_in : ref_bus (1 to 18);
SIGNAL mode2_bus_out : output_bus;
SIGNAL mode3_bus_in : ref_bus (0 to 17);
SIGNAL mode3_bus_out : output_bus;
SIGNAL mode7_bus_in : ref_bus (0 to 11);
SIGNAL mode7_bus_out : output_bus;
SIGNAL mode10_bus_in : ref_bus (0 to 8);
SIGNAL mode10_bus_out : output_bus;
SIGNAL mode18_bus_in : ref_bus (1 to 1);
SIGNAL mode18_bus_out : output_bus;
SIGNAL mode23_bus_in : ref_bus (-3 to 2);
SIGNAL mode23_bus_out : output_bus;
SIGNAL mode26_bus_in : ref_bus (-6 to 2);
SIGNAL mode26_bus_out : output_bus;
SIGNAL mode30_bus_in : ref_bus (-10 to 2);
SIGNAL mode30_bus_out : output_bus;
SIGNAL mode33_bus_in : ref_bus (-15 to 2);
SIGNAL mode33_bus_out : output_bus;
SIGNAL mode34_bus_in : ref_bus (-16 to 1);
SIGNAL mode34_bus_out : output_bus;
SIGNAL mode35_bus_in : ref_bus (-15 to 2);
SIGNAL mode35_bus_out : output_bus;
SIGNAL mode43_bus_in : ref_bus (-5 to 2);
SIGNAL mode43_bus_out : output_bus;
SIGNAL mode46_bus_in : ref_bus (-2 to 2);
SIGNAL mode46_bus_out : output_bus;
SIGNAL mode49_bus_in : ref_bus (-1 to 3);
SIGNAL mode49_bus_out : output_bus;
SIGNAL mode50_bus_in : ref_bus (1 to 1);
SIGNAL mode50_bus_out : output_bus;
SIGNAL mode54_bus_in : ref_bus (0 to 4);
SIGNAL mode54_bus_out : output_bus;

BEGIN

input_reg_gen: 
FOR i IN -66 to 38 GENERATE
	ref_reg : input_register 
	PORT MAP (clk => clk, rst => rst, wrt => wrt_input_reg, d => input(i), q => ref_in_bus(i));
END GENERATE input_reg_gen;
	
planar_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	planar_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => planar_bus_out(i), q => mode0_out(i));
END GENERATE planar_reg_gen;
 
dc_reg : output_register
PORT MAP (clk => clk, rst => rst, d => dc_bus_out, q => mode1_out);

mode2_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode2_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode2_bus_out(i), q => mode_angular_out(0)(i));
END GENERATE mode2_reg_gen;

mode3_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode3_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode3_bus_out(i), q => mode_angular_out(1)(i));
END GENERATE mode3_reg_gen;	 

mode7_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode7_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode7_bus_out(i), q => mode_angular_out(2)(i));
END GENERATE mode7_reg_gen;

mode10_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode10_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode10_bus_out(i), q => mode_angular_out(3)(i));
END GENERATE mode10_reg_gen;

mode18_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode18_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode18_bus_out(i), q => mode_angular_out(4)(i));
END GENERATE mode18_reg_gen;

mode23_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode23_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode23_bus_out(i), q => mode_angular_out(5)(i));
END GENERATE mode23_reg_gen; 

mode26_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode26_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode26_bus_out(i), q => mode_angular_out(6)(i));
END GENERATE mode26_reg_gen;

mode30_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode30_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode30_bus_out(i), q => mode_angular_out(7)(i));
END GENERATE mode30_reg_gen;

mode33_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode33_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode33_bus_out(i), q => mode_angular_out(8)(i));
END GENERATE mode33_reg_gen;

mode34_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode34_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode34_bus_out(i), q => mode_angular_out(9)(i));
END GENERATE mode34_reg_gen;

mode35_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode35_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode35_bus_out(i), q => mode_angular_out(10)(i));
END GENERATE mode35_reg_gen;

mode43_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode43_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode43_bus_out(i), q => mode_angular_out(11)(i));
END GENERATE mode43_reg_gen;

mode46_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode46_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode46_bus_out(i), q => mode_angular_out(12)(i));
END GENERATE mode46_reg_gen;

mode49_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode49_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode49_bus_out(i), q => mode_angular_out(13)(i));
END GENERATE mode49_reg_gen;

mode50_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode50_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode50_bus_out(i), q => mode_angular_out(14)(i));
END GENERATE mode50_reg_gen;

mode54_reg_gen: 
FOR i IN 0 TO 15 GENERATE
	mode54_reg : output_register
	PORT MAP (clk => clk, rst => rst, d => mode54_bus_out(i), q => mode_angular_out(15)(i));
END GENERATE mode54_reg_gen;

planar_block: planar
PORT MAP (ref_x => planar_bus_x, ref_y => planar_bus_y, base => base, state => state, clk => clk, rst => rst, output => planar_bus_out);

dc_block : dc
PORT MAP (ref => dc_bus_in, state => state, base => base, clk => clk, rst => rst, output => dc_bus_out);

mode2_block : mode_2
PORT MAP (ref => mode2_bus_in, output => mode2_bus_out);

mode3_block : mode_3
PORT MAP (ref => mode3_bus_in, state => state, output => mode3_bus_out);

mode7_block : mode_7
PORT MAP (ref => mode7_bus_in, output => mode7_bus_out);

mode10_block : mode_10
PORT MAP (ref => mode10_bus_in, output => mode10_bus_out); 

mode18_block : mode_18
PORT MAP (ref => mode18_bus_in, output => mode18_bus_out);

mode23_block : mode_23
PORT MAP (ref => mode23_bus_in, output => mode23_bus_out);

mode26_block : mode_26
PORT MAP (ref => mode26_bus_in, output => mode26_bus_out);

mode30_block : mode_30
PORT MAP (ref => mode30_bus_in, output => mode30_bus_out);

mode33_block : mode_33
PORT MAP (ref => mode33_bus_in, state => state, output => mode33_bus_out);

mode34_block : mode_34
PORT MAP (ref => mode34_bus_in, output => mode34_bus_out);

mode35_block : mode_35
PORT MAP (ref => mode35_bus_in, state => state, output => mode35_bus_out);

mode43_block : mode_43
PORT MAP (ref => mode43_bus_in, output => mode43_bus_out);

mode46_block : mode_46
PORT MAP (ref => mode46_bus_in, output => mode46_bus_out);

mode49_block : mode_49
PORT MAP (ref => mode49_bus_in, state => state, output => mode49_bus_out);

mode50_block : mode_50
PORT MAP (ref => mode50_bus_in, output => mode50_bus_out);

mode54_block : mode_54
PORT MAP (ref => mode54_bus_in, output => mode54_bus_out);


PROCESS (ref_in_bus, state) is
	VARIABLE integer_base : integer;
	BEGIN
		integer_base := to_integer(unsigned(base));
		
		--Planar reference mapping
		planar_bus_x(0) <= ref_in_bus(integer_base + 1);
		planar_bus_x(1) <= ref_in_bus(-33);
		FOR i IN 0 to 15 LOOP
			IF(state = '0') THEN
				planar_bus_y(i) <= ref_in_bus(0 - (i + 1));
			ELSE
				planar_bus_y(i) <= ref_in_bus(0 - (i + 17));
			END IF;
		END LOOP;
		planar_bus_y(16) <= ref_in_bus(33);
		
		--DC reference mapping
		IF(state = '0') THEN
			dc_bus_in <= ref_in_bus(integer_base + 1);
		ELSE
			dc_bus_in <= ref_in_bus(0 - (integer_base + 1));
		END IF;
		
		--Mode 2 reference mapping		
		IF(state = '0') THEN
			FOR i IN 1 to 18 LOOP
				mode2_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
			END LOOP;
		ELSE
			FOR i IN 1 to 18 LOOP
				mode2_bus_in(i) <= ref_in_bus(0 - (integer_base + 16 + i));
			END LOOP;
		END IF;
		
		--Mode 3 reference mapping
		IF(state = '0') THEN
			FOR i IN 0 to 17 LOOP
				mode3_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
			END LOOP;
		ELSE
			FOR i IN 0 to 16 LOOP
				mode3_bus_in(i + 1) <= ref_in_bus(0 - (integer_base + 15 + i));
			END LOOP;	
		END IF;
		
		--Mode 7 reference mapping
		IF(state = '0') THEN
			FOR i IN 0 to 11 LOOP
				mode7_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
			END LOOP;
		ELSE
			FOR i IN 0 to 11 LOOP
				mode7_bus_in(i) <= ref_in_bus(0 - (integer_base + 9 + i));
			END LOOP;	
		END IF;
		
		--Mode 10 reference mapping
		IF(state = '0') THEN
			FOR i IN 0 to 8 LOOP
				mode10_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
			END LOOP;
		ELSE
			FOR i IN 0 to 8 LOOP
				mode10_bus_in(i) <= ref_in_bus(0 - (integer_base + 6 + i));
			END LOOP;	
		END IF;
		
		--Mode 18 reference mapping
		mode18_bus_in(1) <= ref_in_bus(0 - (integer_base + 1));
		
		--Mode 23 reference mapping
		IF(state = '0') THEN
			FOR i IN -3 to 2 LOOP
				IF (i + integer_base) = -3 THEN
					mode23_bus_in(i) <= ref_in_bus(16);
				ELSIF (i + integer_base) = -2 THEN 
					mode23_bus_in(i) <= ref_in_bus(11);
				ELSIF (i + integer_base) = -1 THEN
					mode23_bus_in(i) <= ref_in_bus(5);
				ELSE
					mode23_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
				END IF;
			END LOOP;
		ELSE
			FOR i IN -3 to 2 LOOP
				IF (i + integer_base - 3) = -6 THEN
					mode23_bus_in(i) <= ref_in_bus(32);
				ELSIF (i + integer_base - 3) = -5 THEN 
					mode23_bus_in(i) <= ref_in_bus(27);
				ELSIF (i + integer_base - 3) = -4 THEN
					mode23_bus_in(i) <= ref_in_bus(21);
				ELSIF (i + integer_base - 3) = -3 THEN 
					mode23_bus_in(i) <= ref_in_bus(16);
				ELSIF (i + integer_base - 3) = -2 THEN
					mode23_bus_in(i) <= ref_in_bus(11);
				ELSIF (i + integer_base - 3) = -1 THEN
					mode23_bus_in(i) <= ref_in_bus(5);
				ELSE
					mode23_bus_in(i) <= ref_in_bus(3 - (integer_base + i));
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 26 reference mapping
		IF(state = '0') THEN
			FOR i IN -6 to 2 LOOP
				IF (i + integer_base) = -6 THEN
					mode26_bus_in(i) <= ref_in_bus(16);
				ELSIF (i + integer_base) = -5 THEN 
					mode26_bus_in(i) <= ref_in_bus(13);
				ELSIF (i + integer_base) = -4 THEN
					mode26_bus_in(i) <= ref_in_bus(11);
				ELSIF (i + integer_base) = -3 THEN
					mode26_bus_in(i) <= ref_in_bus(8);
				ELSIF (i + integer_base) = -2 THEN
					mode26_bus_in(i) <= ref_in_bus(5);
				ELSIF (i + integer_base) = -1 THEN
					mode26_bus_in(i) <= ref_in_bus(3);
				ELSE
					mode26_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
				END IF;
			END LOOP;
		ELSE
			FOR i IN -6 to 2 LOOP
				IF (i + integer_base - 6) = -12 THEN
					mode26_bus_in(i) <= ref_in_bus(32);
				ELSIF (i + integer_base - 6) = -11 THEN 
					mode26_bus_in(i) <= ref_in_bus(29);
				ELSIF (i + integer_base - 6) = -10 THEN
					mode26_bus_in(i) <= ref_in_bus(27);
				ELSIF (i + integer_base - 6) = -9 THEN 
					mode26_bus_in(i) <= ref_in_bus(24);
				ELSIF (i + integer_base - 6) <= -8 THEN
					mode26_bus_in(i) <= ref_in_bus(21);
				ELSIF (i + integer_base - 6) = -7 THEN
					mode26_bus_in(i) <= ref_in_bus(19);
				ELSIF (i + integer_base - 6) = -6 THEN
					mode26_bus_in(i) <= ref_in_bus(16);
				ELSIF (i + integer_base - 6) = -5 THEN
					mode26_bus_in(i) <= ref_in_bus(13);
				ELSIF (i + integer_base - 6) = -4 THEN
					mode26_bus_in(i) <= ref_in_bus(11);
				ELSIF (i + integer_base - 6) = -3 THEN
					mode26_bus_in(i) <= ref_in_bus(8);
				ELSIF (i + integer_base - 6) = -2 THEN
					mode26_bus_in(i) <= ref_in_bus(5);
				ELSIF (i + integer_base - 6) = -1 THEN
					mode26_bus_in(i) <= ref_in_bus(3);
				ELSE
					mode26_bus_in(i) <= ref_in_bus(6 - (integer_base + i));
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 30 reference mapping
		IF(state = '0') THEN
			FOR i IN -10 to 2 LOOP
				IF (i + integer_base) = -10 THEN
					mode30_bus_in(i) <= ref_in_bus(16);
				ELSIF (i + integer_base) < -7 THEN 
					mode30_bus_in(i) <= ref_in_bus(5 - (integer_base + i));
				ELSIF (i + integer_base) < -5 THEN 
					mode30_bus_in(i) <= ref_in_bus(4 - (integer_base + i));
				ELSIF (i + integer_base) = -5 THEN 
					mode30_bus_in(i) <= ref_in_bus(3 - (integer_base + i));
				ELSIF (i + integer_base) < -2 THEN 
					mode30_bus_in(i) <= ref_in_bus(2 - (integer_base + i));
				ELSIF (i + integer_base) < 0 THEN 
					mode30_bus_in(i) <= ref_in_bus(1 - (integer_base + i));
				ELSE
					mode30_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
				END IF;
			END LOOP;
		ELSE
			FOR i IN -10 to 2 LOOP
				IF (i + integer_base - 10) = -20 THEN
					mode30_bus_in(i) <= ref_in_bus(32);
				ELSIF (i + integer_base - 10) < -17 THEN 
					mode30_bus_in(i) <= ref_in_bus(21 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -15 THEN 
					mode30_bus_in(i) <= ref_in_bus(20 - (integer_base + i));
				ELSIF (i + integer_base - 10) = -15 THEN 
					mode30_bus_in(i) <= ref_in_bus(19 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -12 THEN 
					mode30_bus_in(i) <= ref_in_bus(18 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -10 THEN 
					mode30_bus_in(i) <= ref_in_bus(17 - (integer_base + i));
				ELSIF (i + integer_base - 10) = -10 THEN 
					mode30_bus_in(i) <= ref_in_bus(16 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -7 THEN 
					mode30_bus_in(i) <= ref_in_bus(15 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -5 THEN 
					mode30_bus_in(i) <= ref_in_bus(14 - (integer_base + i));
				ELSIF (i + integer_base - 10) = -5 THEN 
					mode30_bus_in(i) <= ref_in_bus(13 - (integer_base + i));
				ELSIF (i + integer_base - 10) < -2 THEN 
					mode30_bus_in(i) <= ref_in_bus(12 - (integer_base + i));
				ELSIF (i + integer_base - 10) < 0 THEN 
					mode30_bus_in(i) <= ref_in_bus(11 - (integer_base + i));
				ELSE
					mode30_bus_in(i) <= ref_in_bus(10 - (integer_base + i));
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 33 reference mapping
		IF(state = '0') THEN
			FOR i IN -15 to 2 LOOP
				IF (i + integer_base) = -15 THEN
					mode33_bus_in(i) <= ref_in_bus(17);
				ELSIF (i + integer_base) < -4 THEN
					mode33_bus_in(i) <= ref_in_bus(1 - (integer_base + i));
				ELSE
					mode33_bus_in(i) <= ref_in_bus(0 - (integer_base + i));
				END IF;
			END LOOP;
		ELSE
			FOR i IN -14 to 2 LOOP
				IF (i + integer_base - 15) < -24 THEN
					mode33_bus_in(i) <= ref_in_bus(18 - (integer_base + i));
				ELSIF (i + integer_base - 15) < -14 THEN
					mode33_bus_in(i) <= ref_in_bus(17 - (integer_base + i));
				ELSIF (i + integer_base - 15) < -4 THEN
					mode33_bus_in(i) <= ref_in_bus(16 - (integer_base + i));
				ELSE
					mode33_bus_in(i) <= ref_in_bus(15 - (integer_base + i));
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 34 reference mapping		
		IF(state = '0') THEN
			FOR i IN -16 to 1 LOOP
				mode34_bus_in(i) <= ref_in_bus(integer_base + i);
			END LOOP;
		ELSE
			FOR i IN -16 to 1 LOOP
				mode34_bus_in(i) <= ref_in_bus(integer_base + i - 16);
			END LOOP;
		END IF;
		
		--Mode 35 reference mapping
		IF(state = '0') THEN
			FOR i IN -15 to 2 LOOP
				IF (i + integer_base) = -15 THEN
					mode35_bus_in(i) <= ref_in_bus(-17);
				ELSIF (i + integer_base) < -4 THEN
					mode35_bus_in(i) <= ref_in_bus(integer_base + i - 1);
				ELSE
					mode35_bus_in(i) <= ref_in_bus(integer_base + i);
				END IF;
			END LOOP;
		ELSE
			FOR i IN -14 to 2 LOOP
				IF (i + integer_base - 15) < -24 THEN
					mode35_bus_in(i) <= ref_in_bus(integer_base + i - 18);
				ELSIF (i + integer_base - 15) < -14 THEN
					mode35_bus_in(i) <= ref_in_bus(integer_base + i - 17);
				ELSIF (i + integer_base - 15) < -4 THEN
					mode35_bus_in(i) <= ref_in_bus(integer_base + i - 16);
				ELSE
					mode35_bus_in(i) <= ref_in_bus(integer_base + i - 15);
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 43 reference mapping
		IF(state = '0') THEN
			FOR i IN -5 to 2 LOOP
				IF (i + integer_base) = -5 THEN
					mode43_bus_in(i) <= ref_in_bus(-16);
				ELSIF (i + integer_base) = -4 THEN
					mode43_bus_in(i) <= ref_in_bus(-13);
				ELSIF (i + integer_base) = -3 THEN
					mode43_bus_in(i) <= ref_in_bus(-10);
				ELSIF (i + integer_base) = -2 THEN
					mode43_bus_in(i) <= ref_in_bus(-6);
				ELSIF (i + integer_base) = -1 THEN
					mode43_bus_in(i) <= ref_in_bus(-3);
				ELSE
					mode43_bus_in(i) <= ref_in_bus(integer_base + i);
				END IF;
			END LOOP;
		ELSE
			FOR i IN -5 to 2 LOOP
				IF (i + integer_base - 5) = -10 THEN
					mode43_bus_in(i) <= ref_in_bus(-32);
				ELSIF (i + integer_base - 5) = -9 THEN 
					mode43_bus_in(i) <= ref_in_bus(-29);
				ELSIF (i + integer_base - 5) = -8 THEN 
					mode43_bus_in(i) <= ref_in_bus(-26);
				ELSIF (i + integer_base - 5) = -7 THEN 
					mode43_bus_in(i) <= ref_in_bus(-22);
				ELSIF (i + integer_base - 5) = -6 THEN 
					mode43_bus_in(i) <= ref_in_bus(-19);
				ELSIF (i + integer_base - 5) = -5 THEN 
					mode43_bus_in(i) <= ref_in_bus(-16);
				ELSIF (i + integer_base - 5) = -4 THEN 
					mode43_bus_in(i) <= ref_in_bus(-13);
				ELSIF (i + integer_base - 5) = -3 THEN 
					mode43_bus_in(i) <= ref_in_bus(-10);
				ELSIF (i + integer_base - 5) = -2 THEN 
					mode43_bus_in(i) <= ref_in_bus(-6);
				ELSIF (i + integer_base - 5) = -1 THEN 
					mode43_bus_in(i) <= ref_in_bus(-3);
				ELSE
					mode43_bus_in(i) <= ref_in_bus(integer_base + i - 5);
				END IF;
			END LOOP;	
		END IF;
		
		--Mode 46 reference mapping		
		IF(state = '0') THEN
			FOR i IN -2 to 2 LOOP
				IF (i + integer_base) = -2 THEN
					mode46_bus_in(i) <= ref_in_bus(-16);
				ELSIF (i + integer_base) = -1 THEN
					mode46_bus_in(i) <= ref_in_bus(-8);
				ELSE	
					mode46_bus_in(i) <= ref_in_bus(integer_base + i);
				END IF;
			END LOOP;
		ELSE
			FOR i IN -2 to 2 LOOP
				IF (i + integer_base - 2) = -4 THEN
					mode46_bus_in(i) <= ref_in_bus(-32);
				ELSIF (i + integer_base - 2) = -3 THEN
					mode46_bus_in(i) <= ref_in_bus(-24);
				ELSIF (i + integer_base - 2) = -2 THEN
					mode46_bus_in(i) <= ref_in_bus(-16);
				ELSIF (i + integer_base - 2) = -1 THEN
					mode46_bus_in(i) <= ref_in_bus(-8);
				ELSE	
					mode46_bus_in(i) <= ref_in_bus(integer_base + i - 2);
				END IF;
			END LOOP;
		END IF;
		
		--Mode 49 reference mapping		
		IF(state = '0') THEN
			FOR i IN -1 to 2 LOOP
				IF (i + integer_base) = -1 THEN
					mode49_bus_in(i) <= ref_in_bus(-32);
				ELSE	
					mode49_bus_in(i) <= ref_in_bus(integer_base + i);
				END IF;
			END LOOP;
		ELSE
			FOR i IN 0 to 3 LOOP
				IF (i + integer_base - 1) = -1 THEN
					mode49_bus_in(i) <= ref_in_bus(-32);
				ELSE
					mode49_bus_in(i) <= ref_in_bus(integer_base + i - 1);
				END IF;
			END LOOP;
		END IF;
		
		--Mode 50 reference mapping		
		mode50_bus_in(1) <= ref_in_bus(integer_base + 1);
		
		--Mode 54 reference mapping		
		IF(state = '0') THEN
			FOR i IN 0 to 4 LOOP
				mode54_bus_in(i) <= ref_in_bus(integer_base + i);
			END LOOP;
		ELSE
			FOR i IN 0 to 4 LOOP	
				mode54_bus_in(i) <= ref_in_bus(integer_base + i + 2);
			END LOOP;
		END IF;
		
END PROCESS;

END comportamental;
