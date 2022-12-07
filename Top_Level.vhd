library IEEE;
use IEEE.std_logic_1164.all;

entity Top_level is 
Port
(
	P1Move, P2Move               : In std_logic_vector(3 downto 0);	
	EntMove, ResGame, Clk        : In std_logic;
	G1,R1,G2,R2,G3,R3,G4,R4,G5,R5,G6,R6,G7,R7,G8,R8,G9,R9,WinGame : Out std_logic
);

End Top_level; 

architecture arch of Top_level is

--Bring in components--
component GameLog is
generic ( N : Integer := 4); -- For simulation
--Generic ( N : Integer := xxxxx) --Actual number of cycles
port 
(
	P1, P2 : IN std_logic_vector(3 downto 0);
	Enter, Reset, Win, Clock : IN std_logic;
	Move : Out std_logic_vector (3 downto 0);
	Load, Res : OUT std_logic;
	Player : OUT std_logic_vector (1 downto 0)
);

end component;	

component one2Nine is
Port
(
	RG : In std_logic_vector(1 downto 0);
	Move  : In std_logic_vector(3 downto 0);
	Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8  : OUT std_logic_vector(1 downto 0)
);

End component;

Component selReg is 
Port
(
	clk, Res   : IN Std_LOGIC;
	Playa      : IN std_logic_vector(1 downto 0);
	Red, Green : Out std_logic
);
End component;

component moveReg is 
Port
(
	clk, clrN, load   : IN std_logic;
	lastMove          : IN std_logic_vector(3 downto 0);
	A,B,C,D,E,F,G,H,I : OUT std_logic_vector(3 downto 0)
);
End component;

component checkWin1 is 
PORT 
(
	A,B,C,D,E     : IN std_logic_vector(3 DOWNTO 0);
	Win           : OUT std_logic 
);
End component;

component checkWin2 is 
PORT 
(
	A,B,C,D     : IN std_logic_vector(3 DOWNTO 0);
	Win           : OUT std_logic 
);
End component;

--Signal Declaration

signal moveout,ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8,ch9 : std_logic_vector(3 downto 0);
signal playout,s1,s2,s3,s4,s5,s6,s7,s8,s9 : std_logic_vector(1 downto 0);
signal loader, resetter, winner1, winner2 : std_logic;

Begin
	Gamestate : GameLog Port Map(P1Move,P2Move,EntMove,ResGame,(winner1 or winner2),clk,moveout,loader,resetter,playout);
	GridSelect : one2Nine Port Map(playout,moveout,s1,s2,s3,s4,s5,s6,s7,s8,s9);
	Pos1 : SelReg Port Map(clk,resetter,s1,R1,G1);
	Pos2 : SelReg Port Map(clk,resetter,s2,R2,G2);
	Pos3 : SelReg Port Map(clk,resetter,s3,R3,G3);
	Pos4 : SelReg Port Map(clk,resetter,s4,R4,G4);
	Pos5 : SelReg Port Map(clk,resetter,s5,R5,G5);
	Pos6 : SelReg Port Map(clk,resetter,s6,R6,G6);
	Pos7 : SelReg Port Map(clk,resetter,s7,R7,G7);
	Pos8 : SelReg Port Map(clk,resetter,s8,R8,G8);
	Pos9 : SelReg Port Map(clk,resetter,s9,R9,G9);
	MovMem : MoveReg Port Map(clk,resetter,loader,moveout,ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8,ch9);
	Win1  : CheckWin1 Port Map(ch1,ch3,ch5,ch7,ch9, winner1);
	Win2  : CheckWin2 Port Map(ch2,ch4,ch6,ch8, winner2);
	
	WinGame <= winner1 or winner2;
	
End arch;
	
