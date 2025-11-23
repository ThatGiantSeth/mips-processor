library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity orgate_fast is
  Port ( a, b : in std_logic;
         r : out std_logic );
end orgate_fast;

architecture structural of orgate_fast is
begin
  r <= a or b; -- NOTE: ONLY USE FOR MUX - NO PROPAGATION DELAY
end structural;
