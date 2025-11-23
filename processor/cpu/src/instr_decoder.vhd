library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_decoder is
	Port(
	instr : in std_logic_vector(15 downto 0); -- instruction being decoded
	ImmToReg, ReadSrc, RegWrite, MemRead, MemToReg, MemWrite : out std_logic; -- control signals
	ALUOp : out std_logic_vector(2 downto 0); -- ALU operation
	regC, regA, regB, regD : out std_logic_vector(3 downto 0); -- register addresses for register file
	immed : out std_logic_vector(7 downto 0) -- 8 bit immediate value
	);
end instr_decoder;


architecture structural of instr_decoder is
signal opcode : std_logic_vector(2 downto 0); 
begin	
	opcode <= instr(14 downto 12);
	
	control : entity work.control_unit port map(
		op => opcode,
		ImmToReg => ImmToReg,
		ReadSrc => ReadSrc,
		RegWrite => RegWrite,
		MemRead => MemRead,
		MemToReg => MemToReg,
		MemWrite => MemWrite,
		ALUOp => ALUOp
	);
	
	regC <= instr(11 downto 8);
	regD <= instr(11 downto 8);
	regA <= instr(7 downto 4);
	regB <= instr(3 downto 0);
	immed <= instr(7 downto 0);
end structural;
