library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity de1_soc_top is
    port 
    (
        clrN                   : in std_logic;
        -- //////////// ADC //////////
        ADC_CS_N               : inout std_logic;
        ADC_DIN                : out   std_logic;
        ADC_DOUT               : in    std_logic;
        ADC_SCLK               : out   std_logic;
    
        -- //////////// Audio //////////
        AUD_ADCDAT             : in    std_logic;
        AUD_ADCLRCK            : inout std_logic;
        AUD_BCLK               : inout std_logic;
        AUD_DACDAT             : out   std_logic;
        AUD_DACLRCK            : inout std_logic;
        AUD_XCK                : out   std_logic;
    
        -- //////////// CLOCK //////////
        CLOCK_50               : in    std_logic;
        CLOCK2_50              : in    std_logic;
        CLOCK3_50              : in    std_logic;
        CLOCK4_50              : in    std_logic;
    
        -- //////////// SDRAM //////////
        DRAM_ADDR              : out   std_logic_vector(12 downto 0);
        DRAM_BA                : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N             : out   std_logic;
        DRAM_CKE               : out   std_logic;
        DRAM_CLK               : out   std_logic;
        DRAM_CS_N              : out   std_logic;
        DRAM_DQ                : inout std_logic_vector(15 downto 0);
        DRAM_LDQM              : out   std_logic;
        DRAM_RAS_N             : out   std_logic;
        DRAM_UDQM              : out   std_logic;
        DRAM_WE_N              : out   std_logic;
    
        -- //////////// I2C for Audio and Video-In //////////
        FPGA_I2C_SCLK          : out   std_logic;
        FPGA_I2C_SDAT          : inout std_logic;
    
        -- //////////// SEG7 //////////
        HEX0                   : out   std_logic_vector(6 downto 0);
        HEX1                   : out   std_logic_vector(6 downto 0);
        HEX2                   : out   std_logic_vector(6 downto 0);
        HEX3                   : out   std_logic_vector(6 downto 0);
        HEX4                   : out   std_logic_vector(6 downto 0);
        HEX5                   : out   std_logic_vector(6 downto 0);
    
        -- //////////// IR //////////
        IRDA_RXD               : in    std_logic;
        IRDA_TXD               : out   std_logic;
    
        -- //////////// KEY //////////
        KEY                    : in    std_logic_vector(3 downto 0);
    
        -- //////////// LED //////////
        LEDR                   : out   std_logic_vector(9 downto 0);
    
        -- //////////// PS2 //////////
        PS2_CLK                : inout std_logic;
        PS2_CLK2               : inout std_logic;
        PS2_DAT                : inout std_logic;
        PS2_DAT2               : inout std_logic;
    
        -- //////////// SW //////////
        SW                     : in    std_logic_vector(9 downto 0);
    
        -- //////////// Video-In //////////
        TD_CLK27               : in    std_logic;
        TD_DATA                : in    std_logic_vector(7 downto 0);
        TD_HS                  : in    std_logic;
        TD_RESET_N             : out   std_logic;
        TD_VS                  : in    std_logic;
    
        -- //////////// VGA //////////
        VGA_B                  : out   std_logic_vector(7 downto 0);
        VGA_BLANK_N            : out   std_logic;
        VGA_CLK                : out   std_logic;
        VGA_G                  : out   std_logic_vector(7 downto 0);
        VGA_HS                 : out   std_logic;
        VGA_R                  : out   std_logic_vector(7 downto 0);
        VGA_SYNC_N             : out   std_logic;
        VGA_VS                 : out   std_logic;
    
        -- //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
        GPIO_0                 : inout std_logic_vector(35 downto 0);
    
        -- //////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
        GPIO_1                 : inout std_logic_vector(35 downto 0)
    );
end entity de1_soc_top;

architecture rtl of de1_soc_top is

component RGB2lights is 
    PORT
    ( 		Count : IN std_logic_vector(5 downto 0);
            RGB   : IN std_logic_vector(2 downto 0);
            B1, B2, B3, B4, B5, B6, B7, B8, R1, R2, R3, R4,
            R5, R6, R7, R8, Row1, Row2, Row3, Row4, G8, G7, 
            G6, G5, G4, G3, G2, G1, Row5, Row6, Row7, Row8 : OUT std_logic 
        );
    End component;

    component counter IS
        PORT( 
            clrN, clock	:	IN 	STD_LOGIC;
            counterOut		:	OUT 	STD_LOGIC_VECTOR(5 DOWNTO 0 )
        );
    END component;

    component displayTest is
        port (
            clk : in std_logic;
            ledOUT : out std_logic_vector(2 downto 0)
        );
    end component;

    signal LEDsignal : std_logIC_VECTOR(2 downto 0);
    signal testCounter : 	std_logic_vector(5 downto 0);


begin -- Architecture begins here
    
    sixBitCounter: counter
    PORT MAP (
        clrN => clrN, clock => CLOCK_50, counterOut => testCounter
    );

    display: displayTest
    PORT MAP (
        clk => CLOCK_50, ledOUT => LEDsignal
    );

    converter: RGB2lights
    PORT MAP (
        Count => testCounter ,RGB => LEDsignal , B1 => GPIO_0(0), B2 => GPIO_0(1), B3 => GPIO_0(2), B4 => GPIO_0(3), B5 => GPIO_0(4),B6 => GPIO_0(5), B7 => GPIO_0(6), B8 => GPIO_0(7), R1 => GPIO_0(8), R2 => GPIO_0(9), R3 => GPIO_0(10), 
        R4 => GPIO_0(11), R5 => GPIO_0(12), R6 => GPIO_0(13), R7 => GPIO_0(14), R8 => GPIO_0(15), Row1 => GPIO_0(16), Row2 => GPIO_0(17), Row3 => GPIO_0(18), Row4 => GPIO_0(19), G1 => GPIO_0(20), G2 => GPIO_0(21), G3 => GPIO_0(22),
        G4 => GPIO_0(23), G5 => GPIO_0(24), G6 => GPIO_0(25), G7 => GPIO_0(26), G8 => GPIO_0(27), Row5 => GPIO_0(28), Row6 => GPIO_0(29), Row7 => GPIO_0(30), Row8 => GPIO_0(31)
    );
              

end architecture rtl;