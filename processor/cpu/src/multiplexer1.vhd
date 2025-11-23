library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity multiplexer1 is
	Port(
	c0,c1,c2,c3,c4	:	in std_logic;
	S	:	in std_logic_vector(2 downto 0);
	R	:	out std_logic
	);
end multiplexer1;  

architecture structural of multiplexer1 is	 
	
	signal nsel0, nsel1, nsel2 : std_logic;
	signal sel0, sel1, sel2, sel3, sel4 : std_logic;
	signal out0, out1, out2, out3, out4 : std_logic;
	signal o1, o2, o3, o4 : std_logic;

begin	
	-- inverts the select lines
	notS0: entity work.notgate port map (a => S(0), r => nsel0);
	notS1: entity work.notgate port map (a => S(1), r => nsel1);
	notS2: entity work.notgate port map (a => S(2), r => nsel2);
	
	-- AND gate for each combination of select lines
	andS0: entity work.and3gate port map (a => nsel2, b => nsel1, c => nsel0, r => sel0); --S:000
	andS1: entity work.and3gate port map (a => nsel2, b => nsel1, c => S(0), r => sel1);  --S:001
	andS2: entity work.and3gate port map (a => nsel2, b => S(1), c => nsel0, r => sel2);  --S:010
	andS3: entity work.and3gate port map (a => nsel2, b => S(1), c => S(0), r => sel3);	  --S:011
	andS4: entity work.and3gate port map (a => S(2), b => nsel1, c => nsel0, r => sel4);  --S:100  
	
	-- compare each select line with its associated input (only one can be active at a time)
	outS0: entity work.andgate port map (a => c0, b => sel0, r => out0); --select 0 with input 0
	outS1: entity work.andgate port map (a => c1, b => sel1, r => out1); --select 1 with input 1
	outS2: entity work.andgate port map (a => c2, b => sel2, r => out2); --select 2 with input 2
	outS3: entity work.andgate port map (a => c3, b => sel3, r => out3); --select 3 with input 3
	outS4: entity work.andgate port map (a => c4, b => sel4, r => out4); --select 4 with input 4
	
	-- combine the outputs into a single output
	bigOr: entity work.or5gate port map (a => out0, b => out1, c => out2, d => out3, e => out4, r => r);

end structural;