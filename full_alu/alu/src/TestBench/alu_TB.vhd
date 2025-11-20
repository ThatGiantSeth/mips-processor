library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		Clk : in STD_LOGIC;
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		S2 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		S0 : in STD_LOGIC;
		status : out STD_LOGIC_VECTOR(2 downto 0);
		Result : out SIGNED(15 downto 0);
		add_res : out SIGNED(15 downto 0);
		sub_res : out SIGNED(15 downto 0);
		mult_res : out SIGNED(15 downto 0);
		passA_res : out SIGNED(15 downto 0);
		passB_res : out SIGNED(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	signal S2 : STD_LOGIC;
	signal S1 : STD_LOGIC;
	signal S0 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal status : STD_LOGIC_VECTOR(2 downto 0);
	signal Result : SIGNED(15 downto 0);
	signal add_res : SIGNED(15 downto 0);
	signal sub_res : SIGNED(15 downto 0);
	signal mult_res : SIGNED(15 downto 0);
	signal passA_res : SIGNED(15 downto 0);
	signal passB_res : SIGNED(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			Clk => Clk,
			A => A,
			B => B,
			S2 => S2,
			S1 => S1,
			S0 => S0,
			status => status,
			Result => Result,
			add_res => add_res,
			sub_res => sub_res,
			mult_res => mult_res,
			passA_res => passA_res,
			passB_res => passB_res
		);

	-- Add your stimulus here ... 
	stim_proc: process
begin  			  
	-- 000 = A + B, 001 = A - B, 010 = A * B, 011 = pass A, 100 = pass B, else = 0
	
	-- test "0" status bit and addition operation
--    A <= ("0000000000000001"); 
--    B <= ("1111111111111111"); 
--	S2 <= '0';
--	S1 <= '0';
--	S0 <= '0';
	
	-- test addition with negative and overflow status bits
--	A <= ("0000000000100001"); 
--    B <= ("0111111111111111"); 
--	S2 <= '0';
--	S1 <= '0';
--	S0 <= '0'; 

	-- test subtraction operation and negative status bit
--	A <= ("0000000000000111"); 
--    B <= ("0000000000001010"); 
--	S2 <= '0';
--	S1 <= '0';
--	S0 <= '1';
	
	-- test subtraction with overflow
--	A <= ("1000000000000001"); 
--    B <= ("0000000000101010"); 
--	S2 <= '0';
--	S1 <= '0';
--	S0 <= '1'; 
	
	-- test multiplication operator
--	A <= ("0000000000000011"); 
--    B <= ("0000000000011001"); 
--	S2 <= '0';
--	S1 <= '1';
--	S0 <= '0';	
	
	-- test multiplication with overflow
--	A <= ("0001000000000111"); 
--    B <= ("0000000000101010"); 
--	S2 <= '0';
--	S1 <= '1';
--	S0 <= '0';	
	
	-- test passthrough A
--	A <= ("0000000000000101"); 
--    B <= ("1010000000000000"); 
--	S2 <= '0';
--	S1 <= '1';
--	S0 <= '1';
	
	-- test passthrough b
--	A <= ("0000000000000101"); 
--    B <= ("1010000000000000"); 
--	S2 <= '1';
--	S1 <= '0';
--	S0 <= '0';

	-- testing 1000 + 2000 from project requirements
--	A <= ("0000001111101000"); --1000
--	B <= ("0000011111010000"); --2000
--	S2 <= '0';
--	S1 <= '0'; 
--	S0 <= '0'; -- 000 is addition 		   

	-- testing for demonstration
	A <= ("0000000000000011");
	B <= ("0000000000000011");

	
   wait;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(structural);
		end for;
	end for;
end TESTBENCH_FOR_alu;

