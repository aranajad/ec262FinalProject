--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all

type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);

--Entity Declaration
entity Register_64 is
    port(
        clrN, clock, load : in std_logic;
        --The array
        ledArray : in matrix_type;
        ledOut : out matrix_type;
    
    );
end Register_64;

architecture rtl of Register_64 is

component reg_N IS
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC_VECTOR(2 DOWNTO 0 );
		Q					:	OUT 	STD_LOGIC_VECTOR(2 DOWNTO 0 )
	);
END component;


begin
    regGen : for i in 0 to 63 generate
        reg_i: reg_N
            port map
            (
                clrN=>clrN, clock=>clock, load =>load, ledArray(i)=>D, ledOut(i)=>Q
            );
    end generate;


end architecture;