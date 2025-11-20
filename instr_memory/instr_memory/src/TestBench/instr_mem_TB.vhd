library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity instr_mem_tb is
end instr_mem_tb;

architecture TB_ARCHITECTURE of instr_mem_tb is
	-- Component declaration of the tested unit
	component instr_mem
	port(
		addr : in STD_LOGIC_VECTOR(15 downto 0);
		instruction : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal addr : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal instruction : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : instr_mem
		port map (
			addr => addr,
			instruction => instruction
		);

	-- Add your stimulus here ...
process
begin  
	addr <= "0000000000000000"; -- PC + 4 = 0
	wait for 50ns;
	addr <= "0000000000000100";	-- PC + 4 = 4
	wait for 50ns;
	addr <= "0000000000001000";	-- PC + 4 = 8
	wait for 50ns;
end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instr_mem of instr_mem_tb is
	for TB_ARCHITECTURE
		for UUT : instr_mem
			use entity work.instr_mem(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_instr_mem;

