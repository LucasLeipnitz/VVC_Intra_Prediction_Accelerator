----------------------------------------------------------
-- Registrador de 8 bits com reset assÃ­ncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY output_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END output_register;
-----------------------------------------------

ARCHITECTURE rtl OF output_register IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= (OTHERS => '0');
			ELSIF (clk'EVENT) THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------