----------------------------------------------------------
-- Registrador de 8 bits com reset assÃ­ncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY state_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	d			: IN std_logic;
	q			: OUT std_logic
);
END state_register;
-----------------------------------------------

ARCHITECTURE rtl OF state_register IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= '0';
			ELSIF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------