library IEEE;
use IEEE.std_logic_1164.all;

Entity selReg is 
Port
(
	clk, Res   : IN Std_LOGIC;
	Playa      : IN std_logic_vector(1 downto 0);
	Red, Green : Out std_logic
);
End selReg;

Architecture arch of selReg is 

Component oneBitReg IS
	PORT( 
		clrN, clock, load	:	IN 	STD_LOGIC;
		D					:	IN 	STD_LOGIC;
		Q					:	OUT 	STD_LOGIC
	);
END Component;

Component demux_1 IS  
	PORT( 
		sel	:	IN 	STD_LOGIC;
		A	   :	IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		B, C  :	OUT	   STD_LOGIC_VECTOR( 1 DOWNTO 0 )
	);
END Component;

Signal red_out, green_out : std_LOGIC_VECTOR(1 DOWNTO 0);

Begin
	Demux : demux_1 Port Map(Playa(0), Playa, red_out, green_out);
	Red_Reg : oneBitReg Port Map(Res, clk, (red_out(1) or red_out(0)), red_out(1), Red);
	Green_Reg : oneBitReg Port Map(Res, clk,  green_out(0), green_out(0), Green);
	
	
End arch;
	
