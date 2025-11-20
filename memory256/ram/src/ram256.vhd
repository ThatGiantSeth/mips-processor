library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram256 is
	Port(
		clk : in std_logic;
		write_mem, read_mem : in std_logic; 
		addr : in std_logic_vector(7 downto 0); -- should we do conversion of the address to integer here or in CPU?
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0)
	);
end ram256;

architecture behavioral of ram256 is
type vector_array is array(0 to 255) of std_logic_vector(15 downto 0);
signal ram_array : vector_array;  

begin
	process(clk)
	begin 
		if rising_edge(clk) then   
			if write_mem = '1' then	  
				-- is there a cleaner way to do this than going vector -> unsigned -> integer?
				-- i tried originally with just addr but i assume the array can only take integers for indexing
				ram_array(to_integer(unsigned(addr))) <= data_in;
			end if;
			
			if read_mem = '1' then -- does read need to also be inside clocked process?
				data_out <= ram_array(to_integer(unsigned(addr)));
			end if;
		end if;
	end process;
end behavioral;
