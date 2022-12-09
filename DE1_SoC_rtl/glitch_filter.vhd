--Library declaration
library IEEE;						-- Declare which VHDL library
use IEEE.std_logic_1164.all;	-- and packages to use

-- Entity declaration
ENTITY glitch_filter IS
	GENERIC( clock_cycles	: INTEGER := 4;
				logic_level		: STD_LOGIC := '0');
	PORT(
		-- Input ports
		clock, x, clrn	: 	IN STD_LOGIC;	

		-- Output port
		y			: 	OUT STD_LOGIC	
	) ;
END ENTITY ;

--Architecture body
ARCHITECTURE a  OF glitch_filter  IS
BEGIN

	PROCESS (clock)
	VARIABLE count: INTEGER;
	BEGIN
		IF clrN = '1' THEN
			count := 0;
		ELSIF (clock'EVENT AND clock = '1') THEN  
			if (x = logic_level) then
				count := count + 1;
				if (count > clock_cycles) then 
					y <= logic_level;
					count := clock_cycles;
				end if;
			else 
				count:= 0;
				y <= not logic_level;
			end if;
		END IF;
	END PROCESS;

END a  ;

