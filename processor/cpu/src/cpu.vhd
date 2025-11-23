library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpu is
	Port( 
	clk : in std_logic
	);
end cpu;

architecture structural of cpu is  
-- PC
signal current_pc : std_logic_vector(9 downto 0);

-- instruction memory
signal current_instr : std_logic_vector(15 downto 0); 

-- decode
signal ImmToReg, ReadSrc, RegWrite, MemRead, MemToReg, MemWrite : std_logic;
signal ALUOp : std_logic_vector(2 downto 0);
signal regC, regA, regB, regD : std_logic_vector(3 downto 0);
signal immediate : std_logic_vector(7 downto 0);  

-- register file
signal reg_addr2 : std_logic_vector(3 downto 0);
signal reg_write_data, reg_read1, reg_read2 : std_logic_vector(15 downto 0);
signal signExt_imm : signed(15 downto 0);

-- ALU
signal aluStatus : std_logic_vector(2 downto 0);
signal aluRes : signed(15 downto 0);

-- data memory
signal memory_out : std_logic_vector(15 downto 0); 

-- MemToReg output
signal memRegRes : std_logic_vector(15 downto 0);

begin	
	-- PC
	counter : entity work.pc port map(
		clk => clk,
		pc_out => current_pc
		); 
		
	-- instruction memory
	instructions : entity work.instr_mem port map(
		addr => current_pc,
		instruction => current_instr
		);
		
	-- instruction decode
	decode : entity work.instr_decoder port map(
		instr => current_instr,
		ImmToReg => ImmToReg,
		ReadSrc => ReadSrc,
		RegWrite => RegWrite,
		MemRead => MemRead,
		MemToReg => MemToReg,
		MemWrite => MemWrite,
		ALUOp => ALUOp,
		regC => regC,
		regA => regA,
		regB => regB,
		regD => regD,
		immed => immediate
		);
		
	-- mux for register read 2
	read2_mux : entity work.multiplexer4_2 port map(
		S => ReadSrc,
		in0 => regB,
		in1 => regC,
		R => reg_addr2
		);
		
	-- register file
	registers : entity work.register_file port map(
		clk => clk,
		reg_write => RegWrite,
		read_addr1 => regA,
		read_addr2 => reg_addr2,
		write_addr => regC,
		write_data => reg_write_data,
		read_data1 => reg_read1,
		read_data2 => reg_read2
		); 
	-- immediate sign extend
	signExt_imm <= resize(signed(immediate), signExt_imm'length);
		
	-- mux for load immediate or from MemToReg
	loadImmMux : entity work.multiplexer16_2 port map( 
		S => ImmToReg,
		in0 => memRegRes,
		in1 => std_logic_vector(signExt_imm),
		R => reg_write_data
		);
		
	--ALU
	execute : entity work.alu port map(
		A => signed(reg_read1),
		B => signed(reg_read2),
		S2 => ALUOp(2),
		S1 => ALUOp(1),
		S0 => ALUOp(0),
		status => aluStatus,
		Result => aluRes
		);
		
	-- data memory
	datamem : entity work.ram256 port map(
		clk => clk,
		write_mem => MemWrite,
		read_mem => MemRead,
		addr => immediate,
		data_in => reg_read2,
		data_out => memory_out
		); 
		
	-- MemToReg mux
	regMux : entity work.multiplexer16_2 port map( 
	S => MemToReg,
	in0 => std_logic_vector(aluRes),
	in1 => memory_out,
	R => memRegRes
	);
	
end structural;
