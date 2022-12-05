----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 18:33:32
-- Design Name: 
-- Module Name: fsm_tb - Behavioral
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

entity fsm_tb is
--  Port ( );
end fsm_tb;

architecture Behavioral of fsm_tb is
component fsm is 
 Port ( 
 clk : in std_logic ;
 output : out std_logic_vector(15 downto 0) 
--  input_adr : in std_logic_vector(13 downto 0) 
  
--   a1m: out std_logic;
--        a2m: out std_logic;
--        a3m: out std_logic;
--        a4m: out std_logic;
       
--        aam : out std_logic ;
--        bbm: out std_logic ;
--        ccm : out std_logic ;
--        ddm : out std_logic ;
--        eem : out std_logic ;
--        ffm : out std_logic ;
--        ggm : out std_logic; 
--        dp_out : out std_logic 
  
  
  
  
  
  
 );
end component ;
signal output : std_logic_vector(15 downto 0) ; 
signal clk : std_logic := '0' ;
begin

uut : fsm port map(clk => clk,output => output) ; 
clk <= not clk after 5 ns ;


end Behavioral;
