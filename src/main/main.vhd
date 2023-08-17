-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY main IS
PORT (
    clk : IN std_logic;
    rst	: IN std_logic;
	start : IN std_logic;
    input : IN ref_bus (-66 to 38 );
	mode0_out: OUT output_bus;
	mode1_out: OUT std_logic_vector(7 downto 0);
	mode_angular_out: OUT main_output
);
END main;

ARCHITECTURE comportamental OF main IS

COMPONENT control IS
PORT (
    clk : IN std_logic;
    rst	: IN std_logic;
	start : IN std_logic;
	wrt_input_reg : OUT std_logic;
    base_signal : OUT std_logic_vector(4 downto 0);
    state_signal: OUT std_logic
);
END COMPONENT;

COMPONENT datapath IS
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
END COMPONENT;

SIGNAL base_signal : std_logic_vector(4 downto 0);
SIGNAL state_signal : std_logic;
SIGNAL wrt_input_reg_signal : std_logic;
SIGNAL base_integer : integer := 0;

BEGIN
    control_block : control
    PORT MAP (clk => clk, rst => rst, start => start, wrt_input_reg => wrt_input_reg_signal, base_signal => base_signal, state_signal => state_signal);

    datapath_block : datapath
    PORT MAP (input => input, state => state_signal, wrt_input_reg => wrt_input_reg_signal, clk => clk, base => base_signal, rst => rst, mode0_out => mode0_out, mode1_out => mode1_out, mode_angular_out => mode_angular_out);
	
END comportamental;
