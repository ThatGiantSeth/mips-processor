library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexer4_2 is
	Port(
	S : in std_logic;
    in0, in1 : in std_logic_vector(3 downto 0);
    R : out std_logic_vector(3 downto 0)
	);
end multiplexer4_2;	 

architecture Structural of multiplexer4_2 is	 

begin	
	-- create 16 1-bit multiplexers, mapping each bit of the inputs and output
  gen_mux: for i in 0 to 3 generate
    mux: entity work.multiplexer1
      port map (
        S => S,
        c0 => in0(i),
        c1 => in1(i),
        R => R(i)
      );
  end generate;
end Structural;