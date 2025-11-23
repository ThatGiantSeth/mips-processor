library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity alu is
	Port (
	A, B 	: in signed(15 downto 0);
	S2, S1, S0		: in std_logic;
	status	: out std_logic_vector(2 downto 0);
	Result  : out signed(15 downto 0)
	);
end alu;

architecture structural of alu is 	

signal sum, diff, prod16, Binv, res	: signed(15 downto 0);	
signal prod32				: signed(31 downto 0);
signal coutA, coutS, Overflow_add, Overflow_sub, Overflow_mult				: std_logic; --over is a temp variable (need to figure out overflow)
signal passA, passB		: signed(15 downto 0);
signal Op : std_logic_vector(2 downto 0);

begin 
	-- combine select lines into one signal
	Op(2) <= S2;
	Op(1) <= S1;
	Op(0) <= S0;
	-- instantiate operation hardware - addition, subtraction, multiplication
	create_adder: entity work.adder16 port map (A => A, B => B, Cin => '0', Sum => sum, Cout => coutA, Overflow => Overflow_add);
	create_subtractor: entity work.subtractor16 port map (A => A, B => B, Diff => diff, Cout => coutS, Overflow => Overflow_sub);
	create_multiplier: entity work.multiplier16 port map (A => A, B => B, Product => prod32, Ovf => Overflow_mult);  
	
	-- truncate the product to the lowest 16 bits
	prod16 <= prod32(15 downto 0);
	
	-- passthrough signals for A and B
	passA <= A;
	passB <= B;
	
	-- create multiplexer to select operation
	create_mux: entity work.multiplexer16 port map (
	S => Op, 
	in0 => sum, 
	in1 => prod16, 
	in2 => passA, 
	in3 => passB, 
	in4 => diff, 
	R => res
	); 	  
			
	-- propagate result
	Result <= res; 
	
	-- set overflow status bit by checking operation and propagating the associated overflow signal	 
	with Op select
	status(2) <= Overflow_add when "000",
				 Overflow_sub when "100",
				 Overflow_mult when "001",
				 '0' when others;
	
	-- set "0" status bit by checking if the result is full of zeros   
	 
	with res select
	status(1) <= '1' when "0000000000000000",
				 '0' when others; 
	
	-- set the "negative" status bit based on the most significant bit of the result
	status(0) <= res(15);

	
end structural;
