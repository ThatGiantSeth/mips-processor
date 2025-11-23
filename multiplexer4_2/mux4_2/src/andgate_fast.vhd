library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity andgate_fast is
	Port(
	a	:	in std_logic;
	b	:	in std_logic;
	r	: 	out std_logic
	);
end andgate_fast;

architecture behavioral of andgate_fast is
begin
	r <= a and b;
end behavioral;