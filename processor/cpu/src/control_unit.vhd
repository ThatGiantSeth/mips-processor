library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	Port( 
	--opcode
	op : in std_logic_vector(2 downto 0);
	--control signals
	ImmToReg, ReadSrc, RegWrite, MemRead, MemtoReg, MemWrite : out std_logic; 
	--ALU operation (it will be the same as the opcode for this processsor)
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
		
	--NOTE: refer to control unit diagram in report for how we determined this logic
		
	-- AND gates for each combination of opcode bits
	uAdd : entity work.and3gate port map(notOp2, notOp1, notOp0, add); --000/add
	uMult : entity work.and3gate port map(notOp2, notOp1, op(0), mult); --001/mult
	uPa : entity work.and3gate port map(notOp2, op(1), notOp0, pa);	--010/pass A
	uPb : entity work.and3gate port map(notOp2, op(1), op(0), pb); --011/pass B
	uSub : entity work.and3gate port map(op(2), notOp1, notOp0, sub); --100/subtract 
	uLdi : entity work.and3gate port map(op(2), notOp1, op(0), ldi); --101/load immediate
	uSh : entity work.and3gate port map(op(2), op(1), notOp0, sh); --110/store halfword	
	uLh : entity work.and3gate port map(op(2), op(1), op(0), lh); --111/load halfword 
		
	-- set control signal outputs based on AND gate outputs	  
	ALUOp(2) <= op(2);
	ALUOp(1) <= op(1); 
	ALUOp(0) <= op(0);
	ImmToReg <= ldi;
	ReadSrc	<= sh;
	
	--NOTE: the diagram shows 7/8 of the "instruction" lines ORed together to make the RegWrite signal
	--    : using a NOT gate with the remaining signal avoids having to use a 7-input OR gate.
	--    : The line below could replace the NOT gate if necessary (if a 7-input OR gate is created)
		
	--uRegWrite: entity work.or7gate port map(add, mult, pa, pb, sub, ldi, lh, RegWrite);
	uRegWrite : entity work.notgate port map(sh, RegWrite);	
	MemRead <= lh;
	MemToReg <= lh;
	MemWrite <= sh;
end structural;
