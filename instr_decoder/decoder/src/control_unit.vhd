library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	Port(
	op : in std_logic_vector(2 downto 0);
	ImmToReg, ReadSrc, RegWrite, MemRead, MemtoReg, MemWrite : out std_logic;
	ALUOp : out std_logic_vector(2 downto 0)
	);
end control_unit;

architecture structural of control_unit is
signal add, mult, pa, pb, sub, ldi, sh, lh : std_logic;	
signal notOp2, notOp1, notOp0 : std_logic;
begin 	 
	-- create inverted opcode bits
	uNotOp2 : entity work.notgate port map(op(2), notOp2);
	uNotOp1 : entity work.notgate port map(op(1), notOp1);
	uNotOp0 : entity work.notgate port map(op(0), notOp0);
		
	-- and gates for each combination of opcode bits/instruction
	uAdd : entity work.and3gate port map(notOp2, notOp1, notOp0, add);
	uMult : entity work.and3gate port map(notOp2, notOp1, op(0), mult);
	uPa : entity work.and3gate port map(notOp2, op(1), notOp0, pa);	
	uPb : entity work.and3gate port map(notOp2, op(1), op(0), pb);
	uSub : entity work.and3gate port map(op(2), notOp1, notOp0, sub); 
	uLdi : entity work.and3gate port map(op(2), notOp1, op(0), ldi);
	uSh : entity work.and3gate port map(op(2), op(1), notOp0, sh);	
	uLh : entity work.and3gate port map(op(2), op(1), op(0), lh);  
		
	-- determine control signal outputs	  
	ALUOp(2) <= op(2);
	ALUOp(1) <= op(1); 
	ALUOp(0) <= op(0);
	ImmToReg <= ldi;
	ReadSrc	<= sh;
	--uRegWrite: entity work.or7gate port map(add, mult, pa, pb, sub, ldi, lh, RegWrite);
	uRegWrite : entity work.notgate port map(sh, RegWrite);	
	MemRead <= lh;
	MemToReg <= lh;
	MemWrite <= sh;
end structural;
