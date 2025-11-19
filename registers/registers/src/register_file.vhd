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
signal reg_array : vector_array;
begin 
	process(clk)
	begin
		if rising_edge(clk) then 
			if reg_write = '1' then
				reg_array(to_integer(unsigned(write_addr))) <= write_data;
			else
				read_data1 <= reg_array(to_integer(unsigned(read_addr1))); 
				read_data2 <= reg_array(to_integer(unsigned(read_addr2))); 
			end if;
		end if;
	end process;
end behavioral;