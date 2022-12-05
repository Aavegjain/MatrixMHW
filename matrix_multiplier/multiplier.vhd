----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 12:34:28 PM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
port 
(a :in  std_logic_vector(7 downto 0) ;
b : in  std_logic_vector(7 downto 0) ; 
c : out std_logic_vector(15 downto 0);
cntrl : in std_logic_vector(1 downto 0); 
clk : in std_logic ) ;
end multiplier;

architecture Behavioral of multiplier is 
signal counter: integer:= 0;
signal tempclk: integer := 0;
--component sixteen_bit_register is 
--    Port ( 
--  d_in : in std_logic_vector(15 downto 0) ; 
--  d_out : out std_logic_vector(15 downto 0) ;
--  clk : in std_logic ; 
--  re,we : in std_logic  
  
--  );
--end component ;

signal sum,product : std_logic_vector(15 downto 0) := (others => '0') ;
--signal re,we : std_logic := '0' ; 
--signal temp :  std_logic_vector(15 downto 0) := (others => '0') ;
begin

--uut : sixteen_bit_register port map (clk => clk, d_in => sum , d_out => temp 
--                                        , re => re, we => we) ; 

process(clk) 
begin  

    if (clk'event and clk = '1' ) then 
    if (cntrl(1) = '1') then
          product <= std_logic_vector(unsigned(a)*unsigned(b));
          
          if (cntrl(0) = '1') then
            sum <= product ;
          else
            sum <= sum + product;
          end if;
--        counter <= counter + 1 ; 
        
--        if (counter < 27) then 
--                if (counter mod 3= 1) then 
--                   -- perform multiplication 
--                   product <= std_logic_vector(unsigned(a)*unsigned(b));
----                   re <= '1' ;
----                   we <= '0' ;
--                end if ;
                
--                if (counter mod 3 = 2) then 
--                       -- perform addition 
--                       sum <= sum + product ;
----                       we <= '1' ;
----                       re <= '0' ;
--                end if ;
--            end if ;    
            
    end if ; 
    end if ; 
    
      
end process ;
c <= sum ;
















--process(clk)
--begin

--if (clk'event and clk = '1') then
--if (counter < 8) then
--    report std_logic'image(a(counter));
--    if (a(counter) = '1') then 

--    temp <=  "00000000" & b;
--    else 
--    temp <= std_logic_vector(to_unsigned(0,16));
--    end if;

----  temp <= shift_left(unsigned(temp(7 downto 0)),counter) ;
--    temp <= std_logic_vector(unsigned(temp) sll counter);
--    partial <= partial + temp;
                                                                               
--    counter <= counter + 1;
--    report integer'image(counter);
--elsif (counter = 8) then
--    c <= partial;
--    counter <= counter + 1;
--end if;
--end if;
--end process;  





--process(clk) 
--begin  

--    if (clk'event and clk = '1') then 
--        counter <= counter + 1 ; 
        
--        if (counter < 10) then 
--                if (counter mod 3 = 1) then 
--                   -- perform multiplication 
--                   product <= std_logic_vector(unsigned(a)*unsigned(b));
--            --       we <= '1' ;
--                end if ;
                
--                if (counter mod 3 = 2) then 
--                       -- perform addition 
--                       sum <= sum + product ;
--                end if ;
--            end if ;    
--    end if ; 
    
      
    

--end process ;

--c <= sum ;


end Behavioral;