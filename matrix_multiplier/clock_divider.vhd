----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 04:14:42 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
  Port ( 
    clk : in std_logic;
    s1: out std_logic;
    s2: out std_logic;
    a1: out std_logic;
    a2: out std_logic;
    a3: out std_logic;
    a4: out std_logic
  );
end clock_divider;

architecture Behavioral of clock_divider is
    signal count: integer:= 0;
    signal c: integer:= 0;
begin
    
process(c)
begin

if (c = 0) then
s1 <= '0';
s2 <= '0';
a1 <= '0' ; a2 <= '1' ; a3 <= '1' ; a4 <= '1' ;
elsif (c = 1) then
s1 <= '0';
s2 <= '1';
a1 <= '1' ; a2 <= '0' ; a3 <= '1' ; a4 <= '1' ;
elsif (c = 2) then
s1 <= '1';
s2 <= '0';
a1 <= '1' ; a2 <= '1' ; a3 <= '0' ; a4 <= '1' ;
elsif(c = 3) then
s1 <= '1';
s2 <= '1';
a1 <= '1' ; a2 <= '1' ; a3 <= '1' ; a4 <= '0' ;
end if;
end process;

process(clk)
begin
  if (clk'event and clk = '1') then
    if (count > 100000) then
        count <= 0;
        if (c < 3) then
        c <= c+1;   
        else
        c <= 0;
        end if; 
    else
    count <= count + 1;
    end if;
   end if;
end process;
end Behavioral;
