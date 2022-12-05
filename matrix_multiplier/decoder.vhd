----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 12:44:50 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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


-- Simple OR gate design
library IEEE;
use IEEE.std_logic_1164.all;

-- entity or_gate is
-- port(
-- a: in std_logic;
-- b: in std_logic;
-- q: out std_logic);
-- end or_gate;

-- architecture rtl of or_gate is
-- begin
-- process(a, b) is
-- begin
-- q <= a or b;
-- end process;
-- end rtl;


entity decoder is
port (
a: in std_logic ;
b : in std_logic ;
c : in std_logic ;
d : in std_logic ;
dp_in : in std_logic ;

aa : out std_logic ;
bb: out std_logic ;
cc : out std_logic ;
dd : out std_logic ;
ee : out std_logic ;
ff : out std_logic ;
gg : out std_logic; 
dp_out: out std_logic 

--a1 : out std_logic;
--a2 : out std_logic; 
--a3 : out std_logic; 
--a4 : out std_logic ) ;
) ;
end decoder ;

architecture decode of decoder is
begin
aa <= not((a and (not b) and not(c) ) or ( (not a ) and b and d) or (a and not(d)) or (not(a) and c) or (b and c) or (not(b) and not(d))) ;

bb <= not((not(a) and not(c) and not(d) ) or (not(a) and c and d) or (a and not(c) and d) or (not(b) and not(c)) or (not(b) and not(d))) ;

cc <= not((not(a) and not(c)) or (not(a) and d) or (not(c) and d) or (not(a) and b) or (a and not(b))) ;

dd <= not((not(a) and not(b) and not(d)) or (not(b) and c and d) or (b and not(c) and d) or (b and c and not(d)) or (a and not(c))) ;

ee <= not((not(b) and not(d)) or (c and not(d)) or (a and c) or (a and b)) ;

ff <= not((not(a) and b and not(c)) or (not(c) and not(d)) or (b and not(d)) or (a and not(b)) or (a and c)) ;

gg <= not((not(a) and b and not(c)) or (not(b) and c) or (c and not(d)) or (a and not(b)) or (a and d)) ;

dp_out <= dp_in ;

end decode ;



