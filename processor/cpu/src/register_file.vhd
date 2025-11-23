library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--NOTE: All 4 bit register address values are truncated to 3 bit during indexing because there are only 7 registers
entity register_file is
	Port( 
	--clock input for writes
	clk : in std_logic;
	--RegWrite from control unit
	reg_write : in std_logic;
	--source register addresses	and data
	read_addr1 : in std_logic_vector(3 downto 0);	
	read_addr2 : in std_logic_vector(3 downto 0);
	read_data1 : out std_logic_vector(15 downto 0);
	read_data2 : out std_logic_vector(15 downto 0);
	--write address and data
	write_addr : in std_logic_vector(3 downto 0);
	write_data : in std_logic_vector(15 downto 0)
	); 
end register_file;

architecture behavioral of register_file is	
--array with 8 register slots
type vector_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg_array : vector_array;
begin  
	process(clk)
	begin
		if rising_edge(clk) then 
			if reg_write = '1' then	
				-- write data to register specified by write address on clock edge
				reg_array(to_integer(unsigned(write_addr(2 downto 0)))) <= write_data; 
			end if;
		end if;
	end process;
	
	process(read_addr1, read_addr2)
	begin 
		-- read data from registers independent from clock
		read_data1 <= reg_array(to_integer(unsigned(read_addr1(2 downto 0)))); 
		read_data2 <= reg_array(to_integer(unsigned(read_addr2(2 downto 0))));
	end process;
end behavioral;