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

Component reg_NHigh IS
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
	
	Move1 : reg_NHigh Port map(clrN,clk,load, lastMove, M1);
	Move2 : reg_NHigh Port map(clrN,clk,load, M1, M2);
	Move3 : reg_NHigh Port map(clrN,clk,load, M2, M3);
	Move4 : reg_NHigh Port map(clrN,clk,load, M3, M4);
	Move5 : reg_NHigh Port map(clrN,clk,load, M4, M5);
	Move6 : reg_NHigh Port map(clrN,clk,load, M5, M6);
	Move7 : reg_NHigh Port map(clrN,clk,load, M6, M7);
	Move8 : reg_NHigh Port map(clrN,clk,load, M7, M8);
	Move9 : reg_NHigh Port map(clrN,clk,load, M8, M9);
		
	A <= M1;
	B <= M2;
	C <= M3;
	D <= M4;
	E <= M5;
	F <= M6;
	G <= M7;
	H <= M8;
	I <= M9;
	
End arch;

	
		
		
