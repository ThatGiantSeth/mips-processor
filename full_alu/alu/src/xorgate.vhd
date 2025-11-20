library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity xorgate is
	Port(
	a	:	in std_logic;
	b	:	in std_logic;
	r	: 	out std_logic
	);
end xorgate;

architecture behavioral of xorgate is
begin
	r <= a xor b after 10ns;
end behavioral;