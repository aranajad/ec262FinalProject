Library IEEE;
use IEEE.std_logic_1164.all;

entity GameLog is
generic ( N : Integer := 25000000); -- For simulation
--Generic ( N : Integer := xxxxx) --Actual number of cycles
port 
(
	P1, P2 : IN std_logic_vector(3 downto 0);
	Enter, Reset, Win, Clock : IN std_logic;
	Move : Out std_logic_vector (3 downto 0);
	Load, Res : OUT std_logic;
	Player : OUT std_logic_vector (1 downto 0)
);

end GameLog;
architecture arch of GameLog is

	Type state_type is (BoardRes, P1Load, P1Moves, P2Load, P2Moves, Endgame,P1Del, P2Del);

	--Internal Signal
	Signal pr_state, nx_state : state_type;
	Signal counter : integer;
	
Begin
	--Next State Logic
	Process (pr_state, P1, P2, Enter, Win)
	Begin	
		Case pr_state is
			When BoardRes => 
				nx_state <= P1Load;
			When P1Load =>
				if Win = '1' then
					nx_state <= Endgame;
				Elsif Enter = '1' then
					nx_state <= P1Moves;
				Else 
					nx_state <= P1Load;
				End if;
			When P1Del => 
				If Counter = (N - 1) then
					nx_state <= P1Moves;
				Else
					nx_state <= P1Del;
				End if;
			When P1Moves =>
				if Win = '1' then
					nx_state <= Endgame;
				Else 
					nx_state <= P2Load;
				End if;
			When P2Load =>
				if Win = '1' then
					nx_state <= Endgame;
				Elsif Enter = '1' then
					nx_state <= P2Del;
				Else 
					nx_state <= P2Load; 
				End if;
			When P2Del =>
				if Counter = N - 1 then
					nx_state <= P2Moves;
				Else 
					nx_state <= P2Del;
				End if;
			When P2Moves =>
				If Win = '1' then
					nx_state <= Endgame;
				Else
					nx_state <= P1Load;
				End if;
			When Endgame =>
				If Reset = '1' then	
					nx_state <= BoardRes;
				Else
					nx_state <= Endgame;
				End if;
		End Case;
	End Process;
	
	Process(reset, clock)
	Begin 
			If reset = '1' then 
				pr_state <= BoardRes;
			Elsif (clock'event and clock = '1') then	
				pr_state <= nx_state;
			End if;
	End Process;
	
	Process(Clock, Reset)
	Begin	
		If reset = '1' Then
			Counter <= 0;
		Elsif (clock'event and clock = '1') then
			If (pr_state = P1Del) or (pr_state = P2del) then
				Counter <= Counter + 1;
			Else 
				Counter <= 0;
			End if;
		End if;
	End Process;
	
	--Output Section
	
	Move <= P1 When (pr_state = P1Moves) Else
			  P2 When (pr_state = P2Moves) Else
			  "1111";
	
	Player <= "01" When (pr_state = P1Moves) Else
				 "10" When (pr_state = P2Moves) Else
				 "00";
		
	Load <= '1' When (pr_state = P1Moves) or (pr_state = P2Moves) Else
			  '0';
	
	Res <= '0' When (pr_state = BoardRes) Else
			 '1';
			 
End arch;
	
		
	
	