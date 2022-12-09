--Library declaration
library IEEE;						-- Declare which VHDL library
use IEEE.std_logic_1164.all;	-- and packages to use

-- Entity declaration
ENTITY bcd2ssd IS
	PORT(
		-- Input ports
		bcd			: 	IN STD_LOGIC_VECTOR (3 downto 0);	

		-- Output port
		ssd			: 	OUT STD_LOGIC_VECTOR (6 downto 0)	
	) ;
END ENTITY ;



--Architecture body
ARCHITECTURE a  OF bcd2ssd  IS
BEGIN

	WITH bcd SELECT
		ssd  <=	"1111001" WHEN "0000",	-- 0 (0x40)
					"0100100" WHEN "0001",	-- 1 (0x79)
					"0110000" WHEN "0010",	-- 2 (0x24)
					"0011001" WHEN "0011",	-- 3 (0x30)
					"0010010" WHEN "0100",	-- 4 (0x19)
					"0000010" WHEN "0101",	-- 5 (0x12)
					"1111000" WHEN "0110",	-- 6 (0x02)
					"0000000" WHEN "0111",	-- 7 (0x78)
					"0010000" WHEN "1000",	-- 8 (0x00)
					"1111111" WHEN OTHERS;  -- blank for all other cases
END a  ;
