library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or7gate is
  Port ( a, b, c, d, e, f, g : in std_logic;
         r : out std_logic );
end or7gate;

architecture structural of or7gate is
begin
  r <= a or b or c or d or e or f or g after 10ns;
end structural;