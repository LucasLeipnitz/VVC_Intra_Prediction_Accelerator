-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY dc IS
	PORT (
		ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		base: in std_logic_vector(4 downto 0);
		clk: in  std_logic;
		rst: in std_logic;
		output : out std_logic_vector ( 7 downto 0)
	);
END dc;

ARCHITECTURE comportamental OF dc IS

COMPONENT sum_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector ( 13 downto 0);
	q			: OUT std_logic_vector ( 13 downto 0)
);
END COMPONENT;


SIGNAL sum_buffer_in : std_logic_vector ( 13 downto 0);
SIGNAL sum_buffer_out : std_logic_vector ( 13 downto 0);

BEGIN
	
sum_buffer : sum_register
PORT MAP (clk => clk, rst => rst, d => sum_buffer_in, q => sum_buffer_out);

PROCESS (ref, state)	IS
	VARIABLE value : std_logic_vector ( 13 downto 0);
	VARIABLE average : std_logic_vector ( 13 downto 0);
BEGIN
	
	value := "000000" & ref;
	sum_buffer_in <= value + sum_buffer_out;
	average := value + sum_buffer_out + "00000000100000"; -- + 32
	output <= average(13 downto 6);	-- >> 6

END PROCESS;

END comportamental;