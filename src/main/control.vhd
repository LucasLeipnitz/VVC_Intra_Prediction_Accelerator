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
	start : IN std_logic;
	wrt_input_reg : OUT std_logic;
    base_signal : OUT std_logic_vector(4 downto 0);
    state_signal: OUT std_logic
);
END control;

ARCHITECTURE comportamental OF control IS

COMPONENT setup_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic;
	q			: OUT std_logic
);
END COMPONENT;

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

SIGNAL setup_next_state : std_logic;
SIGNAL setup_current_state : std_logic;
SIGNAL next_base : std_logic_vector(4 downto 0);
SIGNAL next_state : std_logic;
SIGNAL current_base : std_logic_vector(4 downto 0);
SIGNAL current_state : std_logic;

BEGIN

-- Setup, Base and State registers
setup_reg : setup_register
PORT MAP (clk => clk, rst => rst, d => setup_next_state, q => setup_current_state);

base_reg : base_register
PORT MAP (clk => clk, rst => rst, d => next_base, q => current_base);

state_reg : state_register
PORT MAP (clk => clk, rst => rst, d => next_state, q => current_state);

-- Next state logic
PROCESS(start, current_base, current_state, setup_current_state)
	VARIABLE next_state_extended : std_logic_vector(1 downto 0) := "00";
	VARIABLE state_carry : std_logic_vector(1 downto 0);
BEGIN
	IF start = '1' AND setup_current_state = '0' THEN
		setup_next_state <= '1'; -- Setup_state <= Prediction begin
		wrt_input_reg <= '1';
		next_state <= '0';
		next_base <= "00000";
	ELSE 
		wrt_input_reg <= '0';
		next_state_extended := ('0' & current_state);
		state_carry	:= next_state_extended + "01";
		next_state <= NOT current_state; -- Increment in 1
		next_base <= current_base + ("0000" & state_carry(1)); -- Carry from next_state to next_based
	END IF;
END PROCESS;

-- Output Logic
PROCESS(current_base, current_state, next_base, next_state)	
BEGIN
	base_signal <= current_base;
	state_signal <= current_state;
END PROCESS;
END comportamental;
