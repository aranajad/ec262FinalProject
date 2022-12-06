-- 0-to-9-counter 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; -- for typ convertions

ENTITY counter_N IS
GENERIC( NUM_OF_BITS	:	INTEGER := 4; 
			MAX_NUM: INTEGER := 10); 
	PORT(
		clk, ClrN	: 	IN STD_LOGIC;
		count	:	OUT STD_LOGIC_VECTOR (NUM_OF_BITS-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF counter_N IS
BEGIN

	PROCESS ( clk )
	VARIABLE cnt	:	INTEGER;
	
	BEGIN
		IF (ClrN = '0') THEN
			cnt  := 0;
			
		ELSIF( clk'EVENT AND clk = '1' ) THEN
		
			cnt := cnt + 1;
			IF ( cnt = MAX_NUM) THEN 
				cnt := 0;
			END IF;
			
		END IF;

		 -- assign internal count to output
		 count <= std_logic_vector(to_unsigned(cnt, NUM_OF_BITS));
	
	END PROCESS;
END ARCHITECTURE;
