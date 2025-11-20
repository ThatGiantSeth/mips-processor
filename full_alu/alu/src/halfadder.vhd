library IEEE;
use IEEE.STD_LOGIC_1164.All; 

--inputs A&B and outputs R and Carryout
entity halfadder is
	Port(
	A	:	in STD_logic;
	B	:	in STD_logic;
	R	:	out STD_logic;
	Carry	:	out STD_logic
	);
end halfadder;


architecture structural of halfadder is	  	

begin 
	--XOR gate for the half adder result
	u1 : entity work.xorgate port map (A => a, B => b, r => R);
	--AND gate for the half adder carrout
	u2 : entity work.andgate port map (A => a, B => b, r => Carry);
end structural;
