----------------------------------------------------------
-- Registrador de 8 bits com reset assíncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY base_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector ( 4 downto 0 );
	q			: OUT std_logic_vector ( 4 downto 0 )
);
END base_register;
-----------------------------------------------

ARCHITECTURE rtl OF base_register IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= (OTHERS => '0');
			ELSIF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------