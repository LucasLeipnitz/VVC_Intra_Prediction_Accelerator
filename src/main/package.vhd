-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
-----------------------------------------------

package mode_in_out is
	type ref_bus is array(integer range <>) of std_logic_vector ( 7 downto 0);
	type output_bus is array(0 to 15) of std_logic_vector ( 7 downto 0);
	type eq_input is array(0 to 3) of std_logic_vector ( 15 downto 0);
	type planar_input is array(0 to 1) of std_logic_vector ( 12 downto 0); 
	type planar_eq_out is array(0 to 15) of std_logic_vector ( 17 downto 0 );
	type output_bus_dc is array(0 to 31) of std_logic_vector ( 7 downto 0);
end package mode_in_out;