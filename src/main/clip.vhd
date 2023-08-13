-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;
-----------------------------------------------

ENTITY clip IS
   PORT ( 
   		input : in std_logic_vector ( 19 downto 0 );
		output : out std_logic_vector ( 7 downto 0 )
	);
END clip;

ARCHITECTURE comportamental OF clip IS

BEGIN	

    PROCESS (input)
	BEGIN	
		IF (to_integer(signed(input)) > 255) THEN
			output <= "11111111";
		ELSE 
			IF (to_integer(signed(input)) < 0) THEN
				output <= "00000000";
			ELSE
				output <= input (7 downto 0);
			END IF;
		END IF;
	END PROCESS;
END comportamental;