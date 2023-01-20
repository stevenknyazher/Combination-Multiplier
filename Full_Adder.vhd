library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is
component Half_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

signal sum_1, carry_out_1, carry_out_2 : std_logic;

begin
Half_Adder_1 : Half_Adder
port map (
    in1 => in1,
    in2 => in2,
    sum => sum_1,
    carry_out => carry_out_1
);
Half_Adder_2 : Half_Adder
port map (
    in1 => sum_1,
    in2 => carry_in,
    sum => sum,
    carry_out => carry_out_2
);
carry_out <= carry_out_1 or carry_out_2;
end Behavioral;
