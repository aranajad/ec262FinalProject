Library IEEE;
use IEEE.std_logic_1164.all;

Entity checkWin2 is 
PORT 
(
	A,B,C,D     : IN std_logic_vector(3 DOWNTO 0);
	Win           : OUT std_logic 
);
End checkWin2;

Architecture arch of checkWin2 is 

Begin

	Win <= '1' When ((((A = "0000") or (B = "0000") or (C = "0000") or (D = "0000")) and 
					  ((A = "0001") or (B = "0001") or (C = "0001") or (D = "0001")) and 
					  ((A = "0010") or (B = "0010") or (C = "0010") or (D = "0010"))) or
					  --Row 2
					  (((A = "0011") or (B = "0011") or (C = "0011") or (D = "0011")) and 
					  ((A = "0100") or (B = "0100") or (C = "0100") or (D = "0100")) and 
					  ((A = "0101") or (B = "0101") or (C = "0101") or (D = "0101"))) or
					  --Row 3
					  (((A = "0110") or (B = "0110") or (C = "0110") or (D = "0110")) and 
					  ((A = "0111") or (B = "0111") or (C = "0111") or (D = "0111")) and 
					  ((A = "1000") or (B = "1000") or (C = "1000") or (D = "1000"))) or
					  --Col 1
					  (((A = "0000") or (B = "0000") or (C = "0000") or (D = "0000")) and 
					  ((A = "0011") or (B = "0011") or (C = "0011") or (D = "0011")) and 
					  ((A = "0110") or (B = "0110") or (C = "0110") or (D = "0110"))) or
					  --Col 2
					  (((A = "0001") or (B = "0001") or (C = "0001") or (D = "0001")) and 
					  ((A = "0100") or (B = "0100") or (C = "0100") or (D = "0100")) and 
					  ((A = "0111") or (B = "0111") or (C = "0111") or (D = "0111"))) or
					  --Col 3
					  (((A = "0010") or (B = "0010") or (C = "0010") or (D = "0010")) and 
					  ((A = "0101") or (B = "0101") or (C = "0101") or (D = "0101")) and 
					  ((A = "1000") or (B = "1000") or (C = "1000") or (D = "1000"))) or
					  --Top Right to Bot Left
					  (((A = "0000") or (B = "0000") or (C = "0000") or (D = "0000")) and 
					  ((A = "0100") or (B = "0100") or (C = "0100") or (D = "0100")) and 
					  ((A = "1000") or (B = "1000") or (C = "1000") or (D = "1000"))) or
					  --Top Left to Bot Right
					  (((A = "0010") or (B = "0010") or (C = "0010") or (D = "0010")) and 
					  ((A = "0100") or (B = "0100") or (C = "0100") or (D = "0100")) and 
					  ((A = "0110") or (B = "0110") or (C = "0110") or (D = "0110")))) ELSE
			 '0';
End arch;
					  
					  
					  