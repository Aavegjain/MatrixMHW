----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 03:09:28 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
  port (
  i1 : in std_logic ; 
  i2 : in std_logic ;
  i3 : in std_logic ;
  i4 : in std_logic ;
  dp_1 : in std_logic ;
  
  i5 : in std_logic ;
  i6 : in std_logic ;
  i7 : in std_logic ;
  i8 : in std_logic ;
  dp_2 : in std_logic ;
  
  i9 : in std_logic ; 
    i10 : in std_logic ;
    i11 : in std_logic ;
    i12 : in std_logic ;
    dp_3 : in std_logic ;
    
    i13 : in std_logic ;
    i14 : in std_logic ;
    i15 : in std_logic ;
    i16 : in std_logic;
    dp_4 : in std_logic ;
    
    o1 : out std_logic ; 
     o2 : out std_logic ; 
      o3 : out std_logic ; 
       o4 : out std_logic ;
       dp_out : out std_logic ;
    
    s1 : in std_logic ; 
    s2 : in std_logic 
    
  
   );
end MUX;

architecture Behavioral of MUX is
begin 
    o1 <= (not(s1) and not(s2) and i1) or (not(s1) and s2 and i5) or (s1 and not(s2) and i9) or (s1 and s2 and i13) ;  
   o2 <= (not(s1) and not(s2) and i2) or (not(s1) and s2 and i6) or (s1 and not(s2) and i10) or (s1 and s2 and i14) ; 
    o3 <= (not(s1) and not(s2) and i3) or (not(s1) and s2 and i7) or (s1 and not(s2) and i11) or (s1 and s2 and i15) ;
     o4 <= (not(s1) and not(s2) and i4) or (not(s1) and s2 and i8) or (s1 and not(s2) and i12) or (s1 and s2 and i16) ; 
     
     dp_out <= (not(s1) and not(s2) and dp_1) or (not(s1) and s2 and dp_2) or (s1 and not(s2) and dp_3) or (s1 and s2 and dp_4) ;  
end Behavioral;
