library IEEE;
use IEEE.std_logic_1164.all;

type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);
entity displayTest is
    port (
        clk : in std_logic;

    );
end displayTest;

architecture rtl of displayTest is

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
        ("000"),("000"),("000"),("000"),("000"),("000"),("000"),("000"), 
    );


begin

end architecture;