-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY predH_block IS
	PORT (
		ref : in ref_bus (0 to 15);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		output : out planar_eq_out
	);
END predH_block;

ARCHITECTURE comportamental OF predH_block IS 

BEGIN
	
PROCESS (ref) IS

	variable sum : std_logic_vector ( 12 downto 0);
	variable product : std_logic_vector ( 12 downto 0);

BEGIN

	FOR i IN 0 to 15 LOOP
		product := (ref(i) & "00000") - ("00000" & ref(i));
		sum := product + ("00000" & opposite_ref);
		output(i) <= sum & "00000";
	END LOOP;

END PROCESS; 

END comportamental;