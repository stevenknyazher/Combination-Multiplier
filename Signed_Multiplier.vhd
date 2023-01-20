library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Signed_Multiplier is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (7 downto 0));
end Signed_Multiplier;

architecture Behavioral of Signed_Multiplier is
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

signal and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12 : std_logic := '0';
signal nand13, nand14, nand15, nand16 : std_logic := '0';
signal s00, s01, s02, s03, s04, s05, s06, s10, s11, s12, s13, s14, s15, s20, s21, s22, s23, s24 : std_logic := '0';
signal c00, c01, c02, c03, c04, c05, c10, c11, c12, c13, c14, c20, c21, c22, c23 : std_logic := '0';

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
nand13 <= x(3) nand y(3);
nand14 <= x(2) nand y(3);
nand15 <= x(1) nand y(3);
nand16 <= x(0) nand y(3);

FA00 : Full_Adder port map (in1 => and1, in2 => and5, carry_in => c00, sum => s00, carry_out => open);
FA01 : Full_Adder port map (in1 => and1, in2 => and5, carry_in => c01, sum => s01, carry_out => c00);
FA02 : Full_Adder port map (in1 => and1, in2 => and5, carry_in => c02, sum => s02, carry_out => c01);

FA03 : Full_Adder port map (in1 => and1, in2 => and5, carry_in => c03, sum => s03, carry_out => c02);
FA04 : Full_Adder port map (in1 => and1, in2 => and6, carry_in => c04, sum => s04, carry_out => c03);
FA05 : Full_Adder port map (in1 => and2, in2 => and7, carry_in => c05, sum => s05, carry_out => c04);
HA06 : Half_Adder port map (in1 => and3, in2 => and8, sum => s06, carry_out => c05);
FA10 : Full_Adder port map (in1 => s00, in2 => and9, carry_in => c10, sum => s10, carry_out => open);
FA11 : Full_Adder port map (in1 => s01, in2 => and9, carry_in => c11, sum => s11, carry_out => c10);
FA12 : Full_Adder port map (in1 => s02, in2 => and9, carry_in => c12, sum => s12, carry_out => c11);
FA13 : Full_Adder port map (in1 => s03, in2 => and10, carry_in => c13, sum => s13, carry_out => c12);
FA14 : Full_Adder port map (in1 => s04, in2 => and11, carry_in => c14, sum => s14, carry_out => c13);
HA15 : Half_Adder port map (in1 => s05, in2 => and12, sum => s15, carry_out => c14);
FA20 : Full_Adder port map (in1 => s10, in2 => nand13, carry_in => c20, sum => s20, carry_out => open);
FA21 : Full_Adder port map (in1 => s11, in2 => nand13, carry_in => c21, sum => s21, carry_out => c20);
FA22 : Full_Adder port map (in1 => s12, in2 => nand14, carry_in => c22, sum => s22, carry_out => c21);
FA23 : Full_Adder port map (in1 => s13, in2 => nand15, carry_in => c23, sum => s23, carry_out => c22);
FA24 : Full_Adder port map (in1 => s14, in2 => nand16, carry_in => '1', sum => s24, carry_out => c23);

z(0) <= and4;
z(1) <= s06;
z(2) <= s15;
z(3) <= s24;
z(4) <= s23;
z(5) <= s22;
z(6) <= s21;
z(7) <= s20;

end Behavioral;
