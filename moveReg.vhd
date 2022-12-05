Library IEEE;
use IEEE.std_logic_1164.all;

entity moveReg is 
Port
(
	clk, clrN, load : IN std_logic;
	lastMove    : IN std_logic_vector(3 downto 0);
	A,B,C,D,E,F,G,H,I : OUT std_logic_vector(3 downto 0)
);
End moveReg;

Architecture arch of moveReg is

Component reg_N IS
	GENERIC( N	:	INTEGER := 4);   
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 );
		Q					:	OUT 	STD_LOGIC_VECTOR( N-1 DOWNTO 0 )
	);
END Component;

 --Internal Signal
	signal M1,M2,M3,M4,M5,M6,M7,M8,M9 : Std_LOGIC_VECTOR (3 downto 0);

Begin
	
		
	--Component Instantiation
	
	Move1 : reg_N Port map(clrN,clk,load, lastMove, M1);
	Move2 : reg_N Port map(clrN,clk,load, M1, M2);
	Move3 : reg_N Port map(clrN,clk,load, M2, M3);
	Move4 : reg_N Port map(clrN,clk,load, M3, M4);
	Move5 : reg_N Port map(clrN,clk,load, M4, M5);
	Move6 : reg_N Port map(clrN,clk,load, M5, M6);
	Move7 : reg_N Port map(clrN,clk,load, M6, M7);
	Move8 : reg_N Port map(clrN,clk,load, M7, M8);
	Move9 : reg_N Port map(clrN,clk,load, M8, M9);
		
	A <= M1 when (M2 /= "0000") and (LastMove /= "0000") else
		  "1111";
	B <= M2 when (M3 /= "0000") and (M1 /= "0000") else
		  "1111";
	C <= M3 when (M4 /= "0000") and (M2 /= "0000") else
		  "1111";
	D <= M4 when (M5 /= "0000") and (M3 /= "0000") else
		  "1111";
	E <= M5 when (M6 /= "0000") and (M4 /= "0000") else
		  "1111";
	F <= M6 when (M7 /= "0000") and (M5 /= "0000") else
		  "1111";
	G <= M7 when (M8 /= "0000") and (M6 /= "0000") else
		  "1111";
	H <= M8 when (M9 /= "0000") and (M7 /= "0000") else
		  "1111";
	I <= M9 when (M7 /= "0000") and (M8 /= "0000") else
		  "1111";
	
End arch;

	
		
		
