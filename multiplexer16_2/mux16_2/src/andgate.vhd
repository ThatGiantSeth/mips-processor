library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity andgate is
	Port(
	a	:	in std_logic;
	b	:	in std_logic;
	r	: 	out std_logic
	);
end andgate;

architecture behavioral of andgate is
begin
	r <= a and b;
end behavioral;