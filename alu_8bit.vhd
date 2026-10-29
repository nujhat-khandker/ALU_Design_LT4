library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alu_8bit is
    Port (
        a        : in  STD_LOGIC_VECTOR (7 downto 0);
        b        : in  STD_LOGIC_VECTOR (7 downto 0);
        alu_sel  : in  STD_LOGIC_VECTOR (2 downto 0);
        alu_out  : out STD_LOGIC_VECTOR (7 downto 0);
        carry_out: out STD_LOGIC
    );
end alu_8bit;

architecture Behavioral of alu_8bit is
    signal result_ext : STD_LOGIC_VECTOR (8 downto 0);
begin
process(a, b, alu_sel)
    begin
        case alu_sel is
            when "000" => -- Addition
                result_ext <= ('0' & a) + ('0' & b);
            when "001" => -- Subtraction
                result_ext <= ('0' & a) - ('0' & b);
            when "010" => -- AND
                result_ext <= '0' & (a and b);
            when "011" => -- OR
				result_ext <= '0' & (a or b);
            when "100" => -- XOR
                result_ext <= '0' & (a xor b);
            when "101" => -- NOT (A)
                result_ext <= '0' & (not a);
            when "110" => -- Shift Left (A)
                result_ext <= '0' & a(6 downto 0) & '0';
            when "111" => -- Shift Right (A)
                result_ext <= "00" & a(7 downto 1);
            when others =>
                result_ext <= (others => '0');
        end case;
    end process;
	 alu_out   <= result_ext(7 downto 0);
    carry_out <= result_ext(8);

end Behavioral;