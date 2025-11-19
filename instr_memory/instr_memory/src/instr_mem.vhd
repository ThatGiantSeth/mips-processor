library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
	Port(
	addr : in std_logic_vector(2 downto 0);
	instruction : out std_logic_vector(15 downto 0)
	);
end instr_mem;

architecture behavioral of instr_mem is
begin
end behavioral;
