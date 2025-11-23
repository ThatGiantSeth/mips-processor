library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity register_file_tb is
end register_file_tb;

architecture TB_ARCHITECTURE of register_file_tb is
	-- Component declaration of the tested unit
	component register_file
	port(
		clk : in STD_LOGIC;
		reg_write : in STD_LOGIC;
		read_addr1 : in STD_LOGIC_VECTOR(3 downto 0);
		read_addr2 : in STD_LOGIC_VECTOR(3 downto 0);
		write_addr : in STD_LOGIC_VECTOR(3 downto 0);
		write_data : in STD_LOGIC_VECTOR(15 downto 0);
		read_data1 : out STD_LOGIC_VECTOR(15 downto 0);
		read_data2 : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reg_write : STD_LOGIC;
	signal read_addr1 : STD_LOGIC_VECTOR(3 downto 0);
	signal read_addr2 : STD_LOGIC_VECTOR(3 downto 0);
	signal write_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal write_data : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal read_data1 : STD_LOGIC_VECTOR(15 downto 0);
	signal read_data2 : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : register_file
		port map (
			clk => clk,
			reg_write => reg_write,
			read_addr1 => read_addr1,
			read_addr2 => read_addr2,
			write_addr => write_addr,
			write_data => write_data,
			read_data1 => read_data1,
			read_data2 => read_data2
		);

	-- Add your stimulus here ... 
process
begin  
	reg_write <= '1';
	write_addr <= "0000";
	write_data <= "0000000000000001";
	wait for 50ns; 
	write_addr <= "0001";
	write_data <= "0000000000000010";
	wait for 50ns;
	read_addr1 <= "0000";
	read_addr2 <= "0001";
	wait;
end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_register_file of register_file_tb is
	for TB_ARCHITECTURE
		for UUT : register_file
			use entity work.register_file(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_register_file;

