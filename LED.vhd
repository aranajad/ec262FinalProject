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
    --for element 000111 of LED array that is the element at row 000 col 111
    mux_Col1 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(000000), B=> ledArray(000001), C => ledArray(000010), D => ledArray(000011), E => ledArray(000100), F => ledArray(000101), G => ledArray(000110), H => ledArray(000111), I => col0Out);

    mux_Col2 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(001000), B=> ledArray(001001), C => ledArray(001010), D => ledArray(001011), E => ledArray(001100), F => ledArray(001101), G => ledArray(001110), H => ledArray(001111), I => col1Out);

    mux_Col3 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(010000), B=> ledArray(010001), C => ledArray(010010), D => ledArray(010011), E => ledArray(010100), F => ledArray(010101), G => ledArray(010110), H => ledArray(010111), I => col2Out);

    mux_Col4 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(011000), B=> ledArray(011001), C => ledArray(011010), D => ledArray(011011), E => ledArray(011100), F => ledArray(011101), G => ledArray(011110), H => ledArray(011111), I => col3Out);

    mux_Col5 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(100000), B=> ledArray(100001), C => ledArray(100010), D => ledArray(100011), E => ledArray(100100), F => ledArray(100101), G => ledArray(100110), H => ledArray(100111), I => col4Out);

    mux_Col6 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(101000), B=> ledArray(101001), C => ledArray(101010), D => ledArray(101011), E => ledArray(101100), F => ledArray(101101), G => ledArray(101110), H => ledArray(101111), I => col5Out);

    mux_Col7 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(110000), B=> ledArray(110001), C => ledArray(110010), D => ledArray(110011), E => ledArray(110100), F => ledArray(110101), G => ledArray(110110), H => ledArray(110111), I => col6Out);

    mux_Col8 : mux_N
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(111000), B=> ledArray(111001), C => ledArray(111010), D => ledArray(111011), E => ledArray(111100), F => ledArray(111101), G => ledArray(111110), H => ledArray(111111), I => col7Out);

    --We have filtered out which column is currently being looked at, now we need to find what row it is on by looking at the 3 MSB of the ledCounter
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
