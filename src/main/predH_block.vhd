-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY predH_block IS
	PORT (
		ref : in ref_bus (0 to 15);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		base: in std_logic_vector(4 downto 0);
		state: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		output : out planar_eq_out
	);
END predH_block;

ARCHITECTURE comportamental OF predH_block IS

COMPONENT predH_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector ( 12 downto 0 );
	q			: OUT std_logic_vector ( 12 downto 0 )
);
END COMPONENT;

SIGNAL buffer_in : reg_predH;
SIGNAL buffer_out : reg_predH;

BEGIN
	
predH_reg_gen: 
FOR i IN 0 TO 31 GENERATE
	predH_reg : predH_register
	PORT MAP (clk => clk, rst => rst, d => buffer_in(i), q => buffer_out(i));
END GENERATE predH_reg_gen;

opposite_ref_reg : predH_register
PORT MAP (clk => clk, rst => rst, d => buffer_in(32), q => buffer_out(32));
	
PROCESS (ref, state) IS
	variable sum : std_logic_vector ( 12 downto 0);
	variable product : std_logic_vector ( 12 downto 0);
	variable product_opposite : std_logic_vector ( 12 downto 0);

BEGIN	
	IF(base = "00000") THEN
		product_opposite := "00000" & opposite_ref;
		FOR i IN 0 to 15 LOOP
			product := (ref(i) & "00000") - ("00000" & ref(i));
			sum := product + product_opposite;
			IF(state = '0') THEN
				buffer_in(i) <= product; 
			ELSE
				buffer_in(i + 16) <= product;
			END IF;
			output(i) <= sum & "00000";
		END LOOP;
		buffer_in(32) <= product_opposite;
	ELSE
		FOR i IN 0 to 15 LOOP
			product_opposite := buffer_out(32) + ("00000" & opposite_ref);
			IF(state = '0') THEN
				product := buffer_out(i) - ("00000" & ref(i));
				buffer_in(i) <= product;
				buffer_in(32) <= product_opposite;
			ELSE
				product := buffer_out(i + 16) - ("00000" & ref(i));
				buffer_in(i + 16) <= product;
			END IF;
			sum := product + product_opposite;
			output(i) <= sum & "00000";
		END LOOP;
	END IF;
END PROCESS; 

END comportamental;