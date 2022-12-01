--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all

--Entity Declaration
entity matrixToPins is
    port(
        --  ports
        in1, in2,: IN std_logic; --ignore (currently serves no use)
        ledCount : IN std_logIC_VECTOR(5 downto 0); --6 bit counter where 3 LSB are the col count and 3 MSB are the row count
        ledArray : IN matrix_type;

        -- Output ports
        selRGB : OUT std_logic_vector(2 downto 0);
        

        );

ARCHITECTURE arch OF matrixToPins IS

    COMPONENT eightToOneMUX IS
        GENERIC( N	:	INTEGER := 4);   
        PORT( 
            sel	:	IN 	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
            A, B, C, D, E, F, G, H	:	IN 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 );
            I		:	OUT 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 )
        );
    END COMPONENT;

    SIGNAL col1out, col2out, col3out, col4out, col5out, col6out, col7out, col8out : std_logic_vector(2 down to 0)

    --Two layers of MUXs where the left most is the columns and right most is the rows
    mux_Col1 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 000000, B=> 000001, C => 000010, D => 000011, E => 000100, F => 000101, G => 000110, H => 000111, I => col0Out);

    mux_Col2 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 001000, B=> 001001, C => 001010, D => 001011, E => 001100, F => 001101, G => 001110, H => 001111, I => col1Out);

    mux_Col3 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 010000, B=> 010001, C => 010010, D => 010011, E => 010100, F => 010101, G => 010110, H => 010111, I => col2Out);

    mux_Col4 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 011000, B=> 011001, C => 011010, D => 011011, E => 011100, F => 011101, G => 011110, H => 011111, I => col3Out);

    mux_Col5 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 100000, B=> 100001, C => 100010, D => 100011, E => 100100, F => 100101, G => 100110, H => 100111, I => col4Out);

    mux_Col6 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 101000, B=> 101001, C => 101010, D => 101011, E => 101100, F => 101101, G => 101110, H => 101111, I => col5Out);

    mux_Col7 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 110000, B=> 110001, C => 110010, D => 110011, E => 110100, F => 110101, G => 110110, H => 110111, I => col6Out);

    mux_Col8 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => 111000, B=> 111001, C => 111010, D => 111011, E => 111100, F => 111101, G => 111110, H => 111111, I => col7Out);

    mux_rows : mux_N
    PORT MAP (sel=>ledCount(5 to 3), A => col0Out, B=> col1Out, C => col2Out, D => col3Out, E => col4Out, F => col5Out, G => col6Out, H => col7Out, I => selLED);
    -- internal signals
    SIGNAL COUNTER : INTEGER;
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
    )
