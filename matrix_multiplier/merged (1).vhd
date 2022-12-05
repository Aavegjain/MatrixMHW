----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 05:11:15 PM
-- Design Name: 
-- Module Name: merged - Behavioral
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

entity merged is
  port (
    clkm : in std_logic;
    i1m : in std_logic ; 
      i2m : in std_logic ;
      i3m : in std_logic ;
      i4m : in std_logic ;
      
      i5m : in std_logic ;
      i6m : in std_logic ;
      i7m : in std_logic ;
      i8m : in std_logic ;
      
        i9m : in std_logic ; 
        i10m : in std_logic ;
        i11m : in std_logic ;
        i12m : in std_logic ;
        
        i13m : in std_logic ;
        i14m : in std_logic ;
        i15m : in std_logic ;
        i16m : in std_logic;
        
        a1m: out std_logic;
        a2m: out std_logic;
        a3m: out std_logic;
        a4m: out std_logic;
        
        aam : out std_logic ;
        bbm: out std_logic ;
        ccm : out std_logic ;
        ddm : out std_logic ;
        eem : out std_logic ;
        ffm : out std_logic ;
        ggm : out std_logic
   );
end merged;

architecture Behavioral of merged is

SIGNAL d1: std_logic;
SIGNAL d2: std_logic; 

SIGNAL c1: std_logic;
SIGNAL c2: std_logic;
SIGNAL c3: std_logic;
SIGNAL c4: std_logic; 

component decoder
PORT (
    a: in std_logic ;
    b : in std_logic ;
    c : in std_logic ;
    d : in std_logic ;
    
    aa : out std_logic ;
    bb: out std_logic ;
    cc : out std_logic ;
    dd : out std_logic ;
    ee : out std_logic ;
    ff : out std_logic ;
    gg : out std_logic 


);
end component;

component MUX
PORT(
    i1 : in std_logic ; 
    i2 : in std_logic ;
    i3 : in std_logic ;
    i4 : in std_logic ;
    
    i5 : in std_logic ;
    i6 : in std_logic ;
    i7 : in std_logic ;
    i8 : in std_logic ;

    i9 : in std_logic ; 
    i10 : in std_logic ;
    i11 : in std_logic ;
    i12 : in std_logic ;
  
    i13 : in std_logic ;
    i14 : in std_logic ;
    i15 : in std_logic ;
    i16 : in std_logic;
  
    o1 : out std_logic ; 
    o2 : out std_logic ; 
    o3 : out std_logic ; 
    o4 : out std_logic ;
  
    s1 : in std_logic ; 
    s2 : in std_logic 
);
end component;

component clock_divider
PORT(
    clk : in std_logic;
    s1: out std_logic;
    s2: out std_logic;
    a1: out std_logic;
    a2: out std_logic;
    a3: out std_logic;
    a4: out std_logic
);
end component;




begin
u0: clock_divider
        port map (
            clk => clkm,
            s1 => d1,
            s2 => d2,
            a1 => a1m,
            a2 => a2m,
            a3 => a3m,
            a4 => a4m 
                
        );

u1 : MUX 
    port map (
        i1 => i1m , 
        i2 => i2m ,
        i3 => i3m ,
        i4 => i4m ,
        
        i5 => i5m , 
        i6 => i6m ,
        i7 => i7m ,
        i8 => i8m ,
        
         i9 => i9m , 
           i10 => i10m ,
           i11 => i11m ,
           i12 => i12m ,
           
           i13 => i13m , 
           i14 => i14m ,
           i15 => i15m ,
           i16 => i16m , 
           
          
         
         o1 => c1 , 
         o2 => c2 ,
         o3 => c3 , 
         o4 => c4 ,
         
         s1 => d1 , 
                  s2 => d2 
            
         ) ;
u2 : decoder 
    port map (
        a => c1 , 
        b => c2 , 
        c => c3 , 
        d => c4 , 
        
        aa => aam , 
        bb => bbm, 
        cc => ccm , 
        dd => ddm, 
        ee => eem , 
                        ff => ffm, 
        gg => ggm ) ;
         
               
  
        
        

        
end Behavioral;
