library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);
entity displayTest is
    port (
        clk : in std_logic;
        ledOUT : out std_logic_vector(2 downto 0)
    );
end displayTest;

architecture rtl of displayTest is
    constant clk_freq : INTEGER := 50e6;
    constant scan_freq : INTEGER := 200;
    signal clk_counter : integer;
    signal matrixCounter : unsigned (5 downto 0);
--Creating the Tic Tac Toe grid w/ a 2D array (0-63 are the row/cols) and 2 to 0 are the RGB bits
    type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);
    constant gameReset : matrix_type := (
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("000"),("000"),("000"),("000"),("000"),("000"),("000"),("000") 
    );


begin
    
    counterPROC : process(clk)
    begin
        if (clk'event AND clk = '1') then
            if clk_counter = (clk_freq / (scan_freq * 640)) - 1 then
                clk_counter <= 0;
            else
                clk_counter <= clk_counter + 1;
				end if;
        end if;
    end process;

    matrixPROC : process(matrixCounter)
    begin
		  matrixCounter <= matrixCounter + 1;
        ledOut <= gameReset(to_integer(matrixCounter));
    end process;



end architecture;