library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity orgate is
  Port ( a, b : in std_logic;
         r : out std_logic );
end orgate;

architecture structural of orgate is
begin
  r <= a or b after 10ns;
end structural;
