Library IEEE;
use IEEE.std_logic_1164.all;

Entity one2Nine is
Port
(
	RG : In std_logic_vector(1 downto 0);
	Move  : In std_logic_vector(3 downto 0);
	Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8  : OUT std_logic_vector(1 downto 0)
);

End one2Nine;

Architecture arch of one2Nine is
Begin
	Out0 <= RG when Move = "0000" Else
			  "00";
	Out1 <= RG when Move = "0001" Else
			  "00";
	Out2 <= RG when Move = "0010" Else
			  "00";
	Out3 <= RG when Move = "0011" Else
			  "00";
	Out4 <= RG when Move = "0100" Else
			  "00";
	Out5 <= RG when Move = "0101" Else
			  "00";
	Out6 <= RG when Move = "0110" Else
			  "00";
	Out7	<= RG when Move = "0111" Else
			  "00";
	Out8	<= RG when Move = "1000" Else
			  "00";
			  
End arch;
	