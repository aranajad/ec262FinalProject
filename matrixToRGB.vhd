--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all

--Entity Declaration
type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);
entity LED is
    port(
        --  ports
        ledCount : IN std_logIC_VECTOR(5 downto 0); --6 bit counter where 3 LSB are the col count and 3 MSB are the row count
        ledArray : IN matrix_type;

        -- Output ports
        selLED : OUT std_logic_vector(2 downto 0);
        

        );
end entity;

ARCHITECTURE arch OF LED IS

    COMPONENT eightToOneMUX IS
        GENERIC( N	:	INTEGER := 3);   
        PORT( 
            sel	:	IN 	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
            A, B, C, D, E, F, G, H	:	IN 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 );
            I		:	OUT 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 )
        );
    END COMPONENT;

    SIGNAL col1out, col2out, col3out, col4out, col5out, col6out, col7out, col8out : std_logic_vector(2 down to 0)

    --Two layers of MUXs where the left most is the columns and right most is the rows
    --for element 000111 of LED array that is the element at row 000 col 111
    mux_Col1 : mux_N --00000 to 000111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(0), B=> ledArray(1), C => ledArray(2), D => ledArray(3), E => ledArray(4), F => ledArray(5), G => ledArray(6), H => ledArray(7), I => col0Out);

    mux_Col2 : mux_N --001000 to 001111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(8), B=> ledArray(9), C => ledArray(10), D => ledArray(11), E => ledArray(12), F => ledArray(13), G => ledArray(14), H => ledArray(15), I => col1Out);

    mux_Col3 : mux_N -- 010000 to 010111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(16), B=> ledArray(17), C => ledArray(18), D => ledArray(19), E => ledArray(20), F => ledArray(21), G => ledArray(22), H => ledArray(23), I => col2Out);

    mux_Col4 : mux_N -- 011000 to 011111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(24), B=> ledArray(25), C => ledArray(26), D => ledArray(27), E => ledArray(28), F => ledArray(29), G => ledArray(30), H => ledArray(31), I => col3Out);

    mux_Col5 : mux_N -- 100000 to 100000
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(32), B=> ledArray(33), C => ledArray(34), D => ledArray(35), E => ledArray(36), F => ledArray(37), G => ledArray(38), H => ledArray(39), I => col4Out);

    mux_Col6 : mux_N -- 101000 to 101111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(40), B=> ledArray(41), C => ledArray(42), D => ledArray(43), E => ledArray(44), F => ledArray(45), G => ledArray(46), H => ledArray(47), I => col5Out);

    mux_Col7 : mux_N -- 110000 to 110111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(48), B=> ledArray(49), C => ledArray(50), D => ledArray(51), E => ledArray(52), F => ledArray(53), G => ledArray(54), H => ledArray(55), I => col6Out);

    mux_Col8 : mux_N -- 111000 to 111111
    PORT MAP (sel=>ledCount(2 to 0), A => ledArray(56), B=> ledArray(57), C => ledArray(58), D => ledArray(59), E => ledArray(60), F => ledArray(61), G => ledArray(62), H => ledArray(63), I => col7Out);

    --We have filtered out which col is currently being looked at, now we need to find what row it is on by looking at the 3 MSB of the ledCounter
    mux_rows : mux_N
    PORT MAP (sel=>ledCount(5 to 3), A => col0Out, B=> col1Out, C => col2Out, D => col3Out, E => col4Out, F => col5Out, G => col6Out, H => col7Out, I => selLED);
