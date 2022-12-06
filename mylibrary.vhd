library ieee;
use ieee.std_logic_1164.all;
    
package mytypes is
    type array16x16 is array(0 to 15) of std_logic_vector(15 downto 0);
	 type array32x32 is array(0 to 31) of std_logic_vector(31 downto 0);
	 
	 type matrix_type is array (0 to 63) of std_logic_vector(2 downto 0);
end package mytypes;