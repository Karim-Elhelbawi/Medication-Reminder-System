library IEEE;
use IEEE.std_logic_1164.all;

entity project1 is
Port (clk: in  STD_LOGIC;
		switch: in STD_LOGIC;
		sensor: in STD_LOGIC;
		buzzer: buffer STD_LOGIC;
		motor: out STD_LOGIC);
end project1;

architecture behaviour of project1 is

signal clk_sec: std_logic;
signal count: integer:=1;
signal tmp : std_logic := '0';
signal t: integer := 1;


begin

process(clk, switch)
begin

if(switch = '0') then
	count <= 1;
	tmp <= '0';

else
	if rising_edge(clk) then	
		count <= count + 1;
		
	if (count = 25000000) then
		tmp <= NOT tmp;
		count <= 1; 
		
end if;
end if;
end if;

clk_sec <= tmp;

end process;

 
process (clk_sec, switch,sensor)
 
begin

if(switch = '0') then
	buzzer <= '0';
	motor <='0';
	t <= 1;
else
	if rising_edge(clk_sec) then
		t <= t+1;

	if(t < 10) then
		buzzer <= '0';
	else if(t>=10 and t<=20) then
	   buzzer<='1';
		if (sensor = '1' and buzzer='1') then
	   motor <= '1';
      else
		motor <= '0';
		end if;
	else
		buzzer <= '0';
		t <= 0;
		motor<='0';

end if;
end if;
end if;
end if;

end process;

 
end behaviour;


 
		 



