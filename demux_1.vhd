-- 1 bit demux 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demux_1 IS  
	PORT( 
		sel	:	IN 	STD_LOGIC;
		A	   :	IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		B, C  :	OUT   STD_LOGIC_VECTOR( 1 DOWNTO 0 )
	);
END ENTITY;

ARCHITECTURE arch OF demux_1 IS
BEGIN
	B <= A When sel = '0' Else 
		  "00";
	C <= A When sel = '1' Else
		  "00";
END arch; 
