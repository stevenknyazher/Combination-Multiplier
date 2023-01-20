library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end Half_Adder;

architecture Behavioral of Half_Adder is

begin

    sum <= in1 xor in2;
    carry_out <= in1 and in2;

end Behavioral;
