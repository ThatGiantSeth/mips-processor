library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or5gate is
  Port ( a, b, c, d, e : in std_logic;
         r : out std_logic );
end or5gate;

architecture structural of or5gate is
begin
  r <= a or b or c or d or e after 10ns;
end structural;
