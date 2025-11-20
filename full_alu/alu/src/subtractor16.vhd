library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

--16 bit inputs A & B with a 16 bit output Difference
--single bit outputs for overflow and carryout
entity subtractor16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Diff:	out signed(15 downto 0);
	Cout:	out std_logic;
	Overflow:	out std_logic
	);
end subtractor16;

architecture structural of subtractor16 is
--inverted B signal
signal Binv		:	signed(15 downto 0);
--17 bit carry in order to ripple through all 16 adders and produce a single carryout bit
signal carry	:	std_logic_vector(16 downto 0); 
--internal 16 bit diff signal for overflow handling
signal diff_int	:	signed(15 downto 0);
begin  			
	--invert B	 
	create_notB: for i in 0 to 15 generate
		notB: entity work.notgate port map (a => B(i), r => Binv(i));	 
	end generate;
	--for twos complement
	carry(0) <= '1';

	 --16 full adders connected together via a "for" loop
	create_FAs : for i in 0 to 15 generate
		FA:	entity work.fulladder port map(A => A(i), B => Binv(i), Cin => carry(i), Sum => diff_int(i), Cout => carry(i+1));
	end generate;
	
	Diff <= diff_int;
	--17th bit from 17 bit assigned to carryout after rippling through all 16 full adders
	Cout <= carry(16); 
	
	--overflow handling which compares MSB
Overflow <= '1' when (A(15) = '0' and B(15) = '1' and diff_int(15) = '1') or (A(15) = '1' and B(15) = '0' and diff_int(15) = '0')
                else '0';

	
end structural;