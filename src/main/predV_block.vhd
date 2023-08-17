-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY predV_block IS
	PORT (
		ref : in std_logic_vector ( 7 downto 0);
		opposite_ref : in std_logic_vector ( 7 downto 0);
		state: in std_logic;
		output : out planar_eq_out
	);
END predV_block;

ARCHITECTURE comportamental OF predV_block IS

COMPONENT MCM_planar_1
	PORT (
            X : in std_logic_vector ( 7 downto 0 );
            Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15, Y16, Y17 : out std_logic_vector ( 12 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_planar_2
	PORT (
            X : in std_logic_vector ( 7 downto 0 );
            Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15, Y16 : out std_logic_vector ( 12 downto 0 )
	);
END COMPONENT;

type t_sum is array	 (0 to 15) of std_logic_vector ( 12 downto 0);
type t_mcm_out_1 is array (0 to 16) of std_logic_vector ( 12 downto 0 );
type t_mcm_out_2 is array (0 to 15) of std_logic_vector ( 12 downto 0 );
signal mcm_in : ref_bus (0 to 1);
signal mcm_out_1 : t_mcm_out_1;
signal mcm_out_2 : t_mcm_out_2;
signal sum: t_sum;


BEGIN

-- Y17 = 32*i, Y16 = 31*i, Y15 = 30*i ... Y2 = 17*i, Y1 = 16*i
mcm_v1: MCM_planar_1
PORT MAP (X => mcm_in(0), Y17 => mcm_out_1(16), Y16 => mcm_out_1(15), Y15 => mcm_out_1(14), Y14 => mcm_out_1(13), Y13 => mcm_out_1(12), Y12 => mcm_out_1(11), Y11 => mcm_out_1(10), Y10 => mcm_out_1(9), Y9 => mcm_out_1(8), Y8 => mcm_out_1(7), Y7 => mcm_out_1(6), Y6 => mcm_out_1(5), Y5 => mcm_out_1(4), Y4 => mcm_out_1(3), Y3 => mcm_out_1(2), Y2 => mcm_out_1(1), Y1 => mcm_out_1(0));

-- Y1 = 1*i, Y2 = 2*i, Y3 = 3*i ... Y15 = 15*j, Y16 = 16*i 
mcm_v2: MCM_planar_2
PORT MAP (X => mcm_in(1), Y1 => mcm_out_2(15), Y2 => mcm_out_2(14), Y3 => mcm_out_2(13), Y4 => mcm_out_2(12), Y5 => mcm_out_2(11), Y6 => mcm_out_2(10), Y7 => mcm_out_2(9), Y8 => mcm_out_2(8), Y9 => mcm_out_2(7), Y10 => mcm_out_2(6), Y11 => mcm_out_2(5), Y12 => mcm_out_2(4), Y13 => mcm_out_2(3), Y14 => mcm_out_2(2), Y15 => mcm_out_2(1), Y16 => mcm_out_2(0));

PROCESS (ref, state) IS
BEGIN
    IF (state = '0') THEN
        mcm_in(0) <= ref;
        mcm_in(1) <= opposite_ref;
		
    ELSE
        mcm_in(0) <= opposite_ref;
        mcm_in(1) <= ref;
    END IF;
END PROCESS;

PROCESS (mcm_out_1, mcm_out_2) IS
BEGIN
    IF (state = '0') THEN

        FOR i IN 0 to 15 LOOP
			sum(i) <= mcm_out_1(15 - i) + mcm_out_2(15 - i);
		END LOOP;

    ELSE
        FOR i IN 0 to 14 LOOP
			sum(i) <= mcm_out_1(i + 1) + mcm_out_2(i + 1);
		END LOOP;
											 
		sum(15) <= mcm_out_1(16) + "0000000000000";
    END IF;
END PROCESS;

PROCESS (sum) IS
BEGIN
	FOR i IN 0 to 15 LOOP
    	output(i) <= sum(i) & "00000";
	END LOOP;
END PROCESS;		

END comportamental;


