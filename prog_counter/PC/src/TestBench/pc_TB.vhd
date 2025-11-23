library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity pc_tb is
end pc_tb;

architecture TB_ARCHITECTURE of pc_tb is
	-- Component declaration of the tested unit
	component pc
	port(
		clk : in STD_LOGIC;
		pc_out : out STD_LOGIC_VECTOR(9 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal pc_out : STD_LOGIC_VECTOR(9 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : pc
		port map (
			clk => clk,
			pc_out => pc_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_pc of pc_tb is
	for TB_ARCHITECTURE
		for UUT : pc
			use entity work.pc(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_pc;

