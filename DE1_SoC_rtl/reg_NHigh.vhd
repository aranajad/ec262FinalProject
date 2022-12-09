-- N-bit register with load signal
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_NHigh IS
	GENERIC( N	:	INTEGER := 4);   
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 );
		Q					:	OUT 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 )
	);
END ENTITY;

ARCHITECTURE arch OF reg_NHigh IS
BEGIN
	PROCESS ( clrN, clock)
	BEGIN
		IF ( clrN = '0' ) THEN							-- clear (active low) 
			Q <= (OTHERS => '1') ;
		ELSIF ( clock'EVENT AND clock = '1' ) THEN  	-- rising edge
			IF (LOAD = '1') THEN
				Q <= D;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE; 
