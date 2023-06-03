library IEEE;
use IEEE.std_logic_1164.all;

entity project2 is 

port( sensor : in std_logic;
       clk : in std_logic;
       hbridge : out std_logic);
end project2;

architecture behaviour of project2 is 
begin 

process(sensor, clk)
begin 
if (sensor = '1') then
	hbridge <= '1';
else
	hbridge <= '0';
end if;
end process;
end behaviour;