library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
	Port(
	clk : in std_logic;
	-- this is 10 bit because of the instruction memory having 256 addresses.
	-- the PC will be shifted right by 2 (dividing it by 4), reducing it to 8 bits (2^8 is 256)
	pc_out : out std_logic_vector(9 downto 0)
	);
end pc;

architecture behavioral of pc is   
signal current_pc : std_logic_vector(9 downto 0) := (others => '0');

begin  
	process(clk)
	begin
		if rising_edge(clk) then
			-- does this have to be structural or can we just update it behaviorally?
			current_pc <= std_logic_vector(unsigned(current_pc) + 4);   -- update the PC each clock cycle
		end if;
	end process;
	pc_out <= current_pc;
end behavioral;