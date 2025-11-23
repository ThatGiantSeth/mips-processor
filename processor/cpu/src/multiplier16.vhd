library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--16 bit inputs A & B
--32 bit output product and single bit overflow output
entity multiplier16 is
	Port(
	A	:	in signed(15 downto 0);
	B	:	in signed(15 downto 0);
	Product:out signed(31 downto 0);
	Ovf	: out std_logic
	);
end multiplier16;

--behavioral multiplier
architecture behavioral of multiplier16 is 
 	--16 bit multiplicand and multiplier with 32 bit result
	signal multiplicand	:	signed(15 downto 0);
	signal multiplier	:	signed(15 downto 0);
	signal result		:	signed(31 downto 0); 	
	
	begin
		process(A,B)
		variable temp_result	:	signed(31 downto 0);
		variable mcand			:	signed(31 downto 0);
		variable mlt			:	signed(15 downto 0); 
		variable sign			: 	std_logic;	 
		variable sign_extend	:	signed(15 downto 0);
		
		begin 
			--fills temp result with '0's
			temp_result := (others => '0');
			--resize multiplicand to 32 bits
			mcand := resize(signed(A), 32);
			--assigning B to multiplier
			mlt := signed(B);
			sign := mcand(15) xor mlt(15);
			
			--loops through 16 bits and checks if multiplier bit is 1
			--if the multiplier bit is one then add the multipland shifted by i to the temp result
			--if the multiplier bit is 0 move onto the next bit
			for i in 0 to 15 loop
				if mlt(i) = '1' then
					temp_result := temp_result + (mcand sll i);
				end if;
			end loop;  
			--stores temp result in result
			result <= temp_result;	
			
			--testing for an overflow condition
			sign_extend := (others => temp_result(15));	 
			if temp_result(31 downto 16) /= sign_extend then
				Ovf <= '1';
			else
				Ovf <= '0';
			end if;

		end process;
		
		Product <= result;
	end behavioral;

