library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unsigned_Multiplier is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (7 downto 0));
end Unsigned_Multiplier;

architecture Behavioral of Unsigned_Multiplier is
component Half_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

component Full_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

signal and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16 : std_logic := '0';
signal s11, s12, s13, s21, s22, s23 : std_logic := '0';
signal c10, c11, c12, c13, c20, c21, c22, c23, c30, c31, c32, c33 : std_logic := '0';

begin
and1 <= x(3) and y(0);
and2 <= x(2) and y(0);
and3 <= x(1) and y(0);
and4 <= x(0) and y(0);
and5 <= x(3) and y(1);
and6 <= x(2) and y(1);
and7 <= x(1) and y(1);
and8 <= x(0) and y(1);
and9 <= x(3) and y(2);
and10 <= x(2) and y(2);
and11 <= x(1) and y(2);
and12 <= x(0) and y(2);
and13 <= x(3) and y(3);
and14 <= x(2) and y(3);
and15 <= x(1) and y(3);
and16 <= x(0) and y(3);

z(0) <= and4;

HA1 : Half_Adder port map (in1 => and3, in2 => and8, sum => z(1), carry_out => c10);
FA1 : Full_Adder port map (in1 => and2, in2 => and7, carry_in => c10, sum => s11, carry_out => c11);
FA2 : Full_Adder port map (in1 => and1, in2 => and6, carry_in => c11, sum => s12, carry_out => c12);
HA2 : Half_Adder port map (in1 => c12, in2 => and5, sum => s13, carry_out => c13);
HA3 : Half_Adder port map (in1 => s11, in2 => and12, sum => z(2), carry_out => c20);
FA3 : Full_Adder port map (in1 => s12, in2 => and11, carry_in => c20, sum => s21, carry_out => c21);
FA4 : Full_Adder port map (in1 => s13, in2 => and10, carry_in => c21, sum => s22, carry_out => c22);
FA5 : Full_Adder port map (in1 => c13, in2 => and9, carry_in => c22, sum => s23, carry_out => c23);
HA4 : Half_Adder port map (in1 => s21, in2 => and16, sum => z(3), carry_out => c30);
FA6 : Full_Adder port map (in1 => s22, in2 => and15, carry_in => c30, sum => z(4), carry_out => c31);
FA7 : Full_Adder port map (in1 => s23, in2 => and14, carry_in => c31, sum => z(5), carry_out => c32);
FA8 : Full_Adder port map (in1 => c23, in2 => and13, carry_in => c32, sum => z(6), carry_out => z(7));
end Behavioral;
