library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity notgate_fast is
  Port ( a : in std_logic;
         r : out std_logic );
end notgate_fast;

architecture behavioral of notgate_fast is
begin
  r <= not a;  -- NOTE: ONLY USE FOR MUX - NO PROPAGATION DELAY
end behavioral;
