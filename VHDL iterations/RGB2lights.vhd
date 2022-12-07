library IEEE;
use IEEE.std_logic_1164.all;

entity RGB2lights is 
PORT
( 		Count : IN std_logic_vector(5 downto 0);
		RGB   : IN std_logic_vector(2 downto 0);
		B1, B2, B3, B4, B5, B6, B7, B8, R1, R2, R3, R4,
		R5, R6, R7, R8, Row1, Row2, Row3, Row4, G8, G7, 
		G6, G5, G4, G3, G2, G1, Row5, Row6, Row7, Row8 : OUT std_logic 
	);
End RGB2lights;
Architecture arch of RGB2lights is

Begin
--Turn on rows when you get there
	Row1 <= '1' When (Count(5 downto 3) = "000") Else
			  '0';
	Row2 <= '1' When (Count(5 downto 3) = "001") Else
			  '0';
	Row3 <= '1' When (Count(5 downto 3) = "010") Else
			  '0';
	Row4 <= '1' When (Count(5 downto 3) = "011") Else
			  '0';
	Row5 <= '1' When (Count(5 downto 3) = "100") Else
			  '0';
	Row6 <= '1' When (Count(5 downto 3) = "101") Else
			  '0';
	Row7 <= '1' When (Count(5 downto 3) = "110") Else
			  '0';
	Row8 <= '1' When (Count(5 downto 3) = "111") Else
			  '0';
	
--Define RGB Pins based on RGB and Count
	B1 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "000") Else
			'1';
	B2 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "001") Else
			'1';
	B3 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "010") Else
			'1';
	B4 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "011") Else
			'1';
	B5 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "100") Else
			'1';
	B6 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "101") Else
			'1';
	B7 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "110") Else
			'1';
	B8 <= '0' WHEN (RGB = "111" and Count(2 downto 0) = "111") Else
			'1';
	R1 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "000") Else
			'1';
	R2 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "001") Else
			'1';
	R3 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "010") Else
			'1';
	R4 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "011") Else
			'1';
	R5 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "100") Else
			'1';
	R6 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "101") Else
			'1';
	R7 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "110") Else
			'1';
	R8 <= '0' WHEN ((RGB = "100" or RGB = "111") and Count(2 downto 0) = "111") Else
			'1';
	G8 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "111") Else
			'1';
	G7 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "110") Else
			'1';
	G6 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "101") Else
			'1';
	G5 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "100") Else
			'1';
	G4 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "011") Else
			'1';
	G3 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "010") Else
			'1';
	G2 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "001") Else
			'1';
	G1 <= '0' WHEN ((RGB = "010" or RGB = "111") and Count(2 downto 0) = "000") Else
			'1';
	
End arch;
	
			
			
			
			
			
			
			
			
			
			
			
			
	
	