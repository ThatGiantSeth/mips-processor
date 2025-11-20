library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
	Port(
	addr : in std_logic_vector(15 downto 0); -- program counter
	instruction : out std_logic_vector(15 downto 0) -- output instruction
	);
end instr_mem;

-- how would we implement this dynamically so that the program isn't hard-coded?
architecture behavioral of instr_mem is
type vector_array is array(0 to 255) of std_logic_vector(15 downto 0);
constant program : vector_array := (
x"500A", -- ldi $r0, 10
x"5105", -- ldi $r1, 5
x"5200", -- ldi $r2, 0
x"5300", -- ldi $r3, 0
x"5400", -- ldi $r4, 0
x"5500", -- ldi $r5, 0
x"5600", -- ldi $r6, 0
x"5700", -- ldi $r7, 0
x"0201", -- add $r2, $r0, $r1
x"1301", -- add $r3, $r0, $r1
x"4401", -- sub $r4, $r0, $r1
x"630B", -- sh $r3, 0x0B
x"640A", -- sh $r4, 0x0A
x"760A", -- lh $r6, 0x0A
x"770B", -- lh $r7, 0x0B
others => (others => '0') --fill the rest of the memory with 0s
); 
begin 	
	process(addr)
	begin
		-- address is shifted right by 2 becuase PC = PC + 4 but need to increase index by only 1
		instruction <= program(to_integer(unsigned("00" & addr(15 downto 2))));
	end process;
end behavioral;
