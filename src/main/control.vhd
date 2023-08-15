-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY control IS
PORT (
    clk : IN std_logic;
    rst	: IN std_logic;
    base_signal : OUT std_logic_vector(4 downto 0);
    state_signal: OUT std_logic
);
END control;

ARCHITECTURE comportamental OF control IS

COMPONENT base_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector ( 4 downto 0 );
	q			: OUT std_logic_vector ( 4 downto 0 )
);
END COMPONENT;

COMPONENT state_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic;
	q			: OUT std_logic
);
END COMPONENT;

SIGNAL next_base : std_logic_vector(4 downto 0);
SIGNAL next_state : std_logic;
SIGNAL base_reg_out : std_logic_vector(4 downto 0);
SIGNAL state_reg_out : std_logic;

BEGIN

base_reg : base_register
PORT MAP (clk => clk, rst => rst, d => next_base, q => base_reg_out);

state_reg : state_register
PORT MAP (clk => clk, rst => rst, d => next_state, q => state_reg_out);

PROCESS(clk, rst)
	VARIABLE next_state_extended : std_logic_vector(1 downto 0) := "00";
	VARIABLE state_carry : std_logic_vector(1 downto 0);
BEGIN 	
	IF (rst = '1') THEN
	    state_carry	:= "00";
		next_state <= '0';
		next_base <= "00000";
	ELSIF (clk = '1') THEN
		base_signal <= base_reg_out;
		state_signal <= state_reg_out;
	ELSE
		next_state_extended := ('0' & state_reg_out);
		state_carry	:= next_state_extended + "01";
		next_state <= NOT state_reg_out; -- Increment in 1
	    next_base <= base_reg_out + ("0000" & state_carry(1)); -- Carry from next_state to next_based
	END IF;
END PROCESS;
END comportamental;
