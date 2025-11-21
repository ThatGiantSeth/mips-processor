library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity control_unit_tb is
end control_unit_tb;

architecture TB_ARCHITECTURE of control_unit_tb is
	-- Component declaration of the tested unit
	component control_unit
	port(
		op : in STD_LOGIC_VECTOR(2 downto 0);
		ImmToReg : out STD_LOGIC;
		ReadSrc : out STD_LOGIC;
		RegWrite : out STD_LOGIC;
		MemRead : out STD_LOGIC;
		MemtoReg : out STD_LOGIC;
		MemWrite : out STD_LOGIC;
		ALUOp : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal op : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ImmToReg : STD_LOGIC;
	signal ReadSrc : STD_LOGIC;
	signal RegWrite : STD_LOGIC;
	signal MemRead : STD_LOGIC;
	signal MemtoReg : STD_LOGIC;
	signal MemWrite : STD_LOGIC;
	signal ALUOp : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : control_unit
		port map (
			op => op,
			ImmToReg => ImmToReg,
			ReadSrc => ReadSrc,
			RegWrite => RegWrite,
			MemRead => MemRead,
			MemtoReg => MemtoReg,
			MemWrite => MemWrite,
			ALUOp => ALUOp
		);

	-- Add your stimulus here ...
process
begin  
	op <= "000";
	wait for 40ns;
	op <= "001";
	wait for 40ns;
	op <= "010";
	wait for 40ns;
	op <= "011";
	wait for 40ns;
	op <= "100";
	wait for 40ns;
	op <= "101";
	wait for 40ns;
	op <= "110";
	wait for 40ns;	
	op <= "111";
	wait for 40ns;
end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_control_unit of control_unit_tb is
	for TB_ARCHITECTURE
		for UUT : control_unit
			use entity work.control_unit(structural);
		end for;
	end for;
end TESTBENCH_FOR_control_unit;

