----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2022 18:01:58
-- Design Name: 
-- Module Name: eight_bit_register_tb - Behavioral
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

entity eight_bit_register_tb is
--  Port ( );
end eight_bit_register_tb;

architecture Behavioral of eight_bit_register_tb is
component eight_bit_register is 
    Port ( 
  d_in : in std_logic_vector(7 downto 0) ; 
  d_out : out std_logic_vector(7 downto 0) ;
  clk : in std_logic ; 
  we : in std_logic  
  
  );
end component ;

signal  d_in: std_logic_vector(7 downto 0) ;
signal  d_out: std_logic_vector(7 downto 0) := "00000000"; 
signal  clk,we: std_logic := '0' ; 



begin
uut : eight_bit_register  port map(clk => clk, d_in => d_in, d_out => d_out,
                                     we => we) ;
clk <= not clk after 5 ns ; 

 
we <=  '1' after 95 ns ;

d_in <= "01010111" after 10 ns ;

end Behavioral;