library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity de1_soc_top is
    port 
    (
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

component Top_level is 
Port
(
	P1Move, P2Move               : In std_logic_vector(3 downto 0);	
	EntMove, ResGame, Clk        : In std_logic;
	G1,R1,G2,R2,G3,R3,G4,R4,G5,R5,G6,R6,G7,R7,G8,R8,G9,R9,WinGame : Out std_logic
);

End component; 

begin -- Architecture begins here

	TicTacToe : Top_level Port Map(SW(3 downto 0), SW(7 downto 4), GPIO_0(35), SW(9), clock_50,GPIO_0(0),GPIO_0(1),GPIO_0(2),GPIO_0(3),GPIO_0(4),GPIO_0(5),GPIO_0(6),GPIO_0(7),GPIO_0(8),GPIO_0(9),GPIO_0(10),GPIO_0(11),GPIO_0(12),GPIO_0(13),GPIO_0(14),GPIO_0(15),GPIO_0(16),GPIO_0(17),GPIO_0(30));
	

end architecture rtl;