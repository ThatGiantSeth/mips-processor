library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexer2_1 is
	Port(
	c0,c1	:	in std_logic;
	S	:	in std_logic;
	R	:	out std_logic
	);
end multiplexer2_1;  

architecture structural of multiplexer2_1 is	 
	
signal nsel : std_logic;
signal out0, out1 : std_logic;

begin	
	-- inverted select line
	notS: entity work.notgate_fast port map (a => S, r => nsel);

	
	-- compare each select line with its associated input (only one can be active at a time)
	andS0: entity work.andgate_fast port map (a => c0, b => nsel, r => out0 ); --S:0
	andS1: entity work.andgate_fast port map (a => c1, b => S, r => out1);  --S:1
	  
	-- combine the outputs into a single output
	or1: entity work.orgate_fast port map (a => out0, b => out1, r => R);

end structural;