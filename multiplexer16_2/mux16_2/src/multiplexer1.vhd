library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexer1 is
	Port(
	c0,c1	:	in std_logic;
	S	:	in std_logic;
	R	:	out std_logic
	);
end multiplexer1;  

architecture structural of multiplexer1 is	 
	
signal nsel : std_logic;
signal out0, out1 : std_logic;

begin	
	-- inverts the select lines
	notS: entity work.notgate port map (a => S, r => nsel);

	
	-- compare each select line with its associated input (only one can be active at a time)
	andS0: entity work.andgate port map (a => c0, b => nsel, r => out0 ); --S:0
	andS1: entity work.andgate port map (a => c1, b => S, r => out1);  --S:1
	  
	-- combine the outputs into a single output
	or1: entity work.orgate port map (a => out0, b => out1, r => R);

end structural;