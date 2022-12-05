----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2022 17:46:32
-- Design Name: 
-- Module Name: eight_bit_register - Behavioral
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

entity eight_bit_register is
  Port ( 
  d_in : in std_logic_vector(7 downto 0) ; 
  d_out : out std_logic_vector(7 downto 0) ;
  clk : in std_logic ; 
  we : in std_logic  
  
  );
end eight_bit_register;

architecture Behavioral of eight_bit_register is
signal  memory : std_logic_vector(7 downto 0) := (others => '0') ; 
signal state : std_logic_vector( 1 downto 0) := "01" ; 
begin

process(clk) 
    begin 
    
      if (clk'event and clk = '1') then 
      if (we = '1') then memory <=  d_in  ;   
      end if ;
      end if ;    

       
    
end process ;

d_out <= memory ;


end Behavioral;
