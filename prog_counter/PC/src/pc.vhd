library ieee;
use ieee.std_logic_1164.all;

entity pc is
	Port(
	clk : in std_logic;
	-- these are 10 bit because of the instruction memory having 256 addresses.
	-- the PC will be shifted right by 2 (dividing it by 4), reducing it to 8 bits (2^8 is 256)
	pc_in : in std_logic_vector(9 downto 0);
	pc_out : out std_logic_vector(9 downto 0)
	);
end pc;

architecture behavioral of pc is
begin  
	process(clk)
	begin
		if rising_edge(clk) then
			pc_out <= pc_in;   -- update the PC each clock cycle
		end if;
	end process;
end behavioral;