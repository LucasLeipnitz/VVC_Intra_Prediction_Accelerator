-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY dc IS
	PORT (
		ref : in ref_bus (0 to 15);
		state: in std_logic;
		output : out output_bus_dc
	);
END dc;

ARCHITECTURE comportamental OF dc IS

SIGNAL sum_buffer : integer := 0;
SIGNAL sum_signal : std_logic_vector ( 13 downto 0);

BEGIN 

PROCESS (ref)	IS
	VARIABLE sum : integer;
BEGIN
	
	sum := 0;
    FOR i IN 0 to 15 LOOP
        sum := sum + to_integer(unsigned(ref(i)));
    END LOOP;
	
	sum_signal <= std_logic_vector(to_unsigned(sum + sum_buffer + 16, 14));

END PROCESS;

PROCESS (sum_signal, state)	IS
BEGIN
	
	IF(state = '0') THEN
		sum_buffer <=  to_integer(unsigned(sum_signal));
	ELSE
		sum_buffer <= 0;
	END IF;
	
	FOR i IN 0 to 31 LOOP
		output(i) <= sum_signal(13 downto 6);
	END LOOP;

END PROCESS;


END comportamental;