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
		base : IN integer;
		clk : IN std_logic;
		rst	: IN std_logic;
		rst_sum_buffer: IN std_logic;
		wrt : IN std_logic;
		mode0_out: OUT output_bus;
		mode1_out: OUT std_logic_vector(7 downto 0);
		mode2_out: OUT output_bus
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
		base : IN integer;
		clk : IN std_logic;
		rst	: IN std_logic;
		output : out output_bus
	);
END COMPONENT;

COMPONENT dc
	PORT ( 
		ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		base: in integer;
		clk: in  std_logic;
		rst_sum_buffer: in std_logic;
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

BEGIN

input_reg_gen: 
FOR i IN -66 to 38 GENERATE
	ref_reg : input_register 
	PORT MAP (clk => clk, rst => rst, wrt => wrt, d => input(i), q => ref_in_bus(i));
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
	PORT MAP (clk => clk, rst => rst, d => mode2_bus_out(i), q => mode2_out(i));
END GENERATE mode2_reg_gen;

planar_block: planar
PORT MAP (ref_x => planar_bus_x, ref_y => planar_bus_y, base => base, state => state, clk => clk, rst => rst, output => planar_bus_out);

dc_block : dc
PORT MAP (ref => dc_bus_in, state => state, base => base, clk => clk, rst_sum_buffer => rst_sum_buffer, output => dc_bus_out);

mode2_block : mode_2
PORT MAP (ref => mode2_bus_in, output => mode2_bus_out);

PROCESS (state) is
	BEGIN
	
		--Planar reference mapping
		planar_bus_x(0) <= ref_in_bus(base + 1);
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
			dc_bus_in <= ref_in_bus(base + 1);
		ELSE
			dc_bus_in <= ref_in_bus(0 - (base + 1));
		END IF;
		
		--Mode 2 reference mapping
		FOR i IN 1 to 18 LOOP
			IF(state = '0') THEN
				mode2_bus_in(i) <= ref_in_bus(0 - (base + i));
			ELSE
				mode2_bus_in(i) <= ref_in_bus(0 - (base + 16 + i));
			END IF;
		END LOOP;		
END PROCESS;

END comportamental;
