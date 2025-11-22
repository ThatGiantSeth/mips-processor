library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
	Port(
	clk : in std_logic;
	reg_write : in std_logic;
	read_addr1 : in std_logic_vector(3 downto 0);	
	read_addr2 : in std_logic_vector(3 downto 0);
	write_addr : in std_logic_vector(3 downto 0);
	write_data : in std_logic_vector(15 downto 0);
	read_data1 : out std_logic_vector(15 downto 0);
	read_data2 : out std_logic_vector(15 downto 0)
	); 
end register_file;

architecture behavioral of register_file is	 
type vector_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal read_3bit1, read_3bit2, write_3bit : std_logic_vector(2 downto 0);
signal reg_array : vector_array;
begin  
	-- convert 4 bit addresses to 3bit because there are have 8 registers (0 to 7)
	read_3bit1 <= read_addr1(2 downto 0);
	read_3bit2 <= read_addr2(2 downto 0);
	write_3bit <= write_addr(2 downto 0);
	process(clk)
	begin
		if rising_edge(clk) then 
			if reg_write = '1' then
				reg_array(to_integer(unsigned(write_3bit))) <= write_data;
			else
				read_data1 <= reg_array(to_integer(unsigned(read_3bit1))); 
				read_data2 <= reg_array(to_integer(unsigned(read_3bit2))); 
			end if;
		end if;
	end process;
end behavioral;