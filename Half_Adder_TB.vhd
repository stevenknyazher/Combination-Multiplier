library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder_TB is
--  Port ( );
end Half_Adder_TB;

architecture Behavioral of Half_Adder_TB is

component Half_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end component Half_Adder;

signal in1_TB : std_logic;
signal in2_TB : std_logic;
signal sum_TB : std_logic;
signal carry_out_TB : std_logic;

begin

uut : Half_Adder port map (in1 => in1_TB, in2 => in2_TB, sum => sum_TB, carry_out => carry_out_TB);

process
begin
in1_TB <= '0';
wait for 20 ns;
in1_TB <= '1';
wait for 30 ns;
in1_TB <= '0';
wait for 50 ns;
in1_TB <= '1';
wait for 40 ns;
in1_TB <= '0';
wait;
end process;

process
begin
in2_TB <= '0';
wait for 30 ns;
in2_TB <= '1';
wait for 50 ns;
in2_TB <= '0';
wait for 20 ns;
in2_TB <= '1';
wait for 40 ns;
in2_TB <= '0';
wait;
end process;

end Behavioral;
