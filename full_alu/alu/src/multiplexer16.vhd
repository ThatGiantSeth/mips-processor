library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexer16 is
	Port(
	S : in std_logic_vector(2 downto 0);
    in0, in1, in2, in3, in4 : in signed(15 downto 0);
    R : out signed(15 downto 0)
	);
end multiplexer16;	 

architecture Structural of multiplexer16 is	 

begin	
	-- create 16 1-bit multiplexers, mapping each bit of the inputs and output
  gen_mux: for i in 0 to 15 generate
    mux: entity work.multiplexer1
      port map (
        S => S,
        c0 => in0(i),
        c1 => in1(i),
        c2 => in2(i),
        c3 => in3(i),
        c4 => in4(i),
        R => R(i)
      );
  end generate;
end Structural;