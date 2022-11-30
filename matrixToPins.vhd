--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all

--Entity Declaration
entity matrixToPins is
    port(
        -- Input ports
        in1, in2, in3 : IN std_logic

        -- Output ports
        

        );

ARCHITECTURE arch OF matrixToPins IS
    -- internal signals
    SIGNAL COUNTER : INTEGER;
    --Creating the Tic Tac Toe grid w/ a 2D array (0-63 are the row/cols) and 2 to 0 are the RGB bits
    type matrix_type is array (0 to 63) of std_logic_vector(2 down 0);
    constant matrix : matrix_type := (
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("111"),("000"),("111"),("000"),("111"),("000"),("111"),("000"), 
        ("111"),("111"),("111"),("111"),("111"),("111"),("111"),("000"), 
        ("000"),("000"),("000"),("000"),("000"),("000"),("000"),("000"), 
    )