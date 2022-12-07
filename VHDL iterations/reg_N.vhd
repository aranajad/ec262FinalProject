-- N-bit register with load signal
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_N IS
	GENERIC( N	:	INTEGER := 3);   
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 );
		Q					:	OUT 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 )
	);
END ENTITY;

ARCHITECTURE arch OF reg_N IS
BEGIN
	PROCESS ( clrN, clock)
	BEGIN
		IF ( clrN = '0' ) THEN							-- clear (active low) 
			Q <= (OTHERS => '0') ;
		ELSIF ( clock'EVENT AND clock = '1' ) THEN  	-- rising edge
			IF (LOAD = '1') THEN
				Q <= D;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE; 
