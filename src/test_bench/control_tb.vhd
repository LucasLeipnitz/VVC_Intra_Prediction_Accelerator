-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY control_tb IS
END control_tb;

ARCHITECTURE comportamental OF control_tb IS 

COMPONENT control IS
PORT (
    clk : IN std_logic;
    rst	: IN std_logic;
    base_signal : OUT std_logic_vector(4 downto 0);
    state_signal: OUT std_logic
);
END COMPONENT;

SIGNAL clk : std_logic;
SIGNAL rst : std_logic;
SIGNAL state : std_logic;
SIGNAL base : std_logic_vector(4 downto 0);
SIGNAL base_signal : std_logic_vector(4 downto 0);
SIGNAL state_signal: std_logic;

BEGIN

i1 : control
PORT MAP (clk => clk, rst => rst, base_signal => base_signal, state_signal => state_signal);

    init : PROCESS
    BEGIN
        clk <= '1';
        rst <= '1';
        wait for 5 ns;

        clk <= '0';
        rst <= '0';
        wait for 5 ns;

        clk <= '1';
        wait for 5 ns;

        clk <= '0';
        wait for 5 ns;

        clk <= '1';
        wait for 5 ns;

        clk <= '0';
        wait for 5 ns;

        clk <= '1';
        wait for 5 ns;

        clk <= '0';
        wait for 5 ns;

        clk <= '1';
        wait for 5 ns;
		
		clk <= '0';
        wait for 5 ns;
		
		clk <= '1';
        wait for 5 ns;
		
		clk <= '0';
        wait for 5 ns;
		
		clk <= '1';
        wait;

    END PROCESS init;

END comportamental;