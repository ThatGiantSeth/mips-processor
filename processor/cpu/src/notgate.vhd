library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity notgate is
  Port ( a : in std_logic;
         r : out std_logic );
end notgate;

architecture behavioral of notgate is
begin
  r <= not a after 10ns;
end behavioral;
