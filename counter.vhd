LIBRARY IEEE;
USE IEEE.NUMERIC_STD;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counter IS
	PORT( 
		clrN, clock	:	IN 	STD_LOGIC;
		counterOut		:	OUT 	STD_LOGIC_VECTOR(5 DOWNTO 0 )
	);

END ENTITY;

architecture rtl of counter is

    signal COUNTER : INTEGER;

begin
    PROCESS (clrN, clock)
    BEGIN
        IF clrN = '0' THEN
            COUNTER <= 0;
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (COUNTER = 63) THEN
                COUNTER <= 0;
            ELSE
                COUNTER <= COUNTER + 1;
            END IF;
        END IF;
    END PROCESS;

    --Convert the int to the 6 bit output
    with COUNTER select
    counterOut <= "000000" WHEN 0,
                  "000001" WHEN 1,
                  "000010" WHEN 2,
                  "000011" WHEN 3,
                  "000100" WHEN 4,
                  "000101" WHEN 5,
                  "000110" WHEN 6,
                  "000111" WHEN 7,
                  "001000" WHEN 8,
                  "001001" WHEN 9,
                  "001010" WHEN 10,
                  "001011" WHEN 11,
                  "001100" WHEN 12,
                  "001101" WHEN 13,
                  "001110" WHEN 14,
                  "001111" WHEN 15,
                  "010000" WHEN 16,
                  "010001" WHEN 17,
                  "010010" WHEN 18,
                  "010011" WHEN 19,
                  "010100" WHEN 20,
                  "010101" WHEN 21,
                  "010110" WHEN 22,
                  "010111" WHEN 23,
                  "011000" WHEN 24,
                  "011001" WHEN 25,
                  "011010" WHEN 26,
                  "011011" WHEN 27,
                  "011100" WHEN 28,
                  "011101" WHEN 29,
                  "011110" WHEN 30,
                  "011111" WHEN 31,
                  "100000" WHEN 32,
                  "100001" WHEN 33,
                  "100010" WHEN 34,
                  "100011" WHEN 35,
                  "100100" WHEN 36,
                  "100101" WHEN 37,
                  "100110" WHEN 38,
                  "100111" WHEN 39,
                  "101000" WHEN 40,
                  "101001" WHEN 41,
                  "101010" WHEN 42,
                  "101011" WHEN 43,
                  "101100" WHEN 44,
                  "101101" WHEN 45,
                  "101110" WHEN 46,
                  "101111" WHEN 47,
                  "110000" WHEN 48,
                  "110001" WHEN 49,
                  "110010" WHEN 50,
                  "110011" WHEN 51,
                  "110100" WHEN 52,
                  "110101" WHEN 53,
                  "110110" WHEN 54,
                  "110111" WHEN 55,
                  "111000" WHEN 56,
                  "111001" WHEN 57,
                  "111010" WHEN 58,
                  "111011" WHEN 59,
                  "111000" WHEN 60,
                  "111001" WHEN 61,
                  "111010" WHEN 62,
                  "111111" WHEN 63,


end architecture;