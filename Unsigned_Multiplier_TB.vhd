library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unsigned_Multiplier_TB is
--  Port ( );
end Unsigned_Multiplier_TB;

architecture Behavioral of Unsigned_Multiplier_TB is

component Unsigned_Multiplier is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x_TB, y_TB : std_logic_vector(3 downto 0);
signal z_TB : std_logic_vector(7 downto 0);

begin

uut: Unsigned_Multiplier port map (x => x_TB, y => y_TB, z => z_TB);

process
begin
x_TB <= "0110";
wait for 20 ns;
x_TB <= "1100";
wait for 30 ns;
x_TB <= "0101";
wait for 50 ns;
x_TB <= "1110";
wait for 40 ns;
x_TB <= "0111";
wait;
end process;

process
begin
y_TB <= "1010";
wait for 30 ns;
y_TB <= "1011";
wait for 50 ns;
y_TB <= "1000";
wait for 20 ns;
y_TB <= "1001";
wait for 40 ns;
y_TB <= "1101";
wait;
end process;

end Behavioral;
