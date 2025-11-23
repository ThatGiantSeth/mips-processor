library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--three inputs A, B, and carry in
--two outputs sum and carryout
entity fulladder is
	Port(
	a : in std_logic;
	b : in std_logic; 
	cin : in std_logic;
	sum : out std_logic;
	cout : out std_logic);
end fulladder;	 

architecture structural	of fulladder is	  	 

signal sum1, carry1, carry2 : std_logic;

begin 
	--two half adders connected with the carryouts of each being OR gated together
	u1 : entity work.halfadder port map (a,b,sum1,carry1);
	u2 : entity work.halfadder port map (sum1,cin,sum,carry2);	
    carryout: entity work.orgate port map (carry1, carry2, cout);
end structural;