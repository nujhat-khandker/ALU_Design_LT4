library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit_tb is
end alu_8bit_tb;

architecture Behavioral of alu_8bit_tb is
component alu_8bit
        Port (
            a        : in  STD_LOGIC_VECTOR (7 downto 0);
            b        : in  STD_LOGIC_VECTOR (7 downto 0);
            alu_sel  : in  STD_LOGIC_VECTOR (2 downto 0);
            alu_out  : out STD_LOGIC_VECTOR (7 downto 0);
            carry_out: out STD_LOGIC
        );
    end component;
	 signal a        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal b        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal alu_sel  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    signal alu_out  : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_out: STD_LOGIC;

begin
uut: alu_8bit PORT MAP (
          a => a,
          b => b,
          alu_sel => alu_sel,
          alu_out => alu_out,
          carry_out => carry_out
        );

    stim_proc: process
    begin		
        a <= "00001010"; -- 10
        b <= "00000101"; -- 5
		  alu_sel <= "000"; wait for 20 ns; -- ADD (10+5=15)
        alu_sel <= "001"; wait for 20 ns; -- SUB (10-5=5)
        alu_sel <= "010"; wait for 20 ns; -- AND
        alu_sel <= "011"; wait for 20 ns; -- OR
        alu_sel <= "100"; wait for 20 ns; -- XOR
        alu_sel <= "101"; wait for 20 ns; -- NOT A
        alu_sel <= "110"; wait for 20 ns; -- SHL A
        alu_sel <= "111"; wait for 20 ns; -- SHR A

        wait;
    end process;

end Behavioral;