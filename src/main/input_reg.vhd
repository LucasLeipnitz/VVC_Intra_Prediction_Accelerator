----------------------------------------------------------
-- Registrador de 8 bits com reset assíncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY input_register IS
PORT (
	clk			: IN std_logic; -- clock
	rst			: IN std_logic; -- reset
	wrt			: IN std_logic; -- write
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END input_register;
-----------------------------------------------

ARCHITECTURE rtl OF input_register IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= (OTHERS => '0');
			ELSIF (clk'EVENT AND clk = '1' AND wrt = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------