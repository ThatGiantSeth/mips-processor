library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity and3gate is
	Port(
	a, b, c	:	in std_logic;
	r	: 	out std_logic
	);
end and3gate;

architecture behavioral of and3gate is
begin
	r <= a and b and c after 10ns;
end behavioral;