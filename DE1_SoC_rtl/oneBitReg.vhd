--1 Bit reg
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY oneBitReg IS
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC;
		Q					:	OUT 	STD_LOGIC
	);
END ENTITY;

ARCHITECTURE arch OF oneBitReg IS
BEGIN
	PROCESS ( clrN, clock)
	BEGIN
		IF ( clrN = '0' ) THEN							-- clear (active low) 
			Q <= '0' ;
		ELSIF ( clock'EVENT AND clock = '1' ) THEN  	-- rising edge
			IF (LOAD = '1') THEN
				Q <= D;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE; 
