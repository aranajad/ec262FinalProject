-- N-bit multiplexler 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY eightToOneMUX IS
	PORT( 
		sel	:	IN 	STD_LOGIC_VECTOR(2 DOWNTO 0);
		A, B, C, D, E, F, G, H	:	IN 	STD_LOGIC_VECTOR(2 DOWNTO 0 );
		I		:	OUT 	STD_LOGIC_VECTOR(2 DOWNTO 0 )
	);
END ENTITY;

ARCHITECTURE arch OF eightToOneMUX IS
BEGIN
  WITH sel select
  I <= A WHEN "000",
       B WHEN "001",
       C WHEN "010",
       D WHEN "011",
       E WHEN "100",
       F WHEN "101",
       G WHEN "110",
       H WHEN OTHERS;
END arch; 