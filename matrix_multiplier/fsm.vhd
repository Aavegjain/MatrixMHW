----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2022 10:42:40
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
  Port ( 
  clk : in std_logic ; 
  
   
   input_adr : in std_logic_vector(13 downto 0) ;
   
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
        ggm : out std_logic; 
        dp_out : out std_logic 
   
   
   
   
   
   
  );
end fsm;



architecture Behavioral of fsm is

component merged is 
port 
(
    clkm : in std_logic;
    i1m : in std_logic ; 
      i2m : in std_logic ;
      i3m : in std_logic ;
      i4m : in std_logic ;
      dp_1 : in std_logic ;
      
      i5m : in std_logic ;
      i6m : in std_logic ;
      i7m : in std_logic ;
      i8m : in std_logic ;
      dp_2 : in std_logic ;
      
        i9m : in std_logic ; 
        i10m : in std_logic ;
        i11m : in std_logic ;
        i12m : in std_logic ;
        dp_3 : in std_logic ;
        
        i13m : in std_logic ;
        i14m : in std_logic ;
        i15m : in std_logic ;
        i16m : in std_logic;
        dp_4 : in std_logic ;
        
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
        ggm : out std_logic; 
        dp_out : out std_logic 
   );

end component ; 




component eight_bit_register is
  Port ( 
  d_in : in std_logic_vector(7 downto 0) ; 
  d_out : out std_logic_vector(7 downto 0) ;
  clk : in std_logic ; 
  we : in std_logic  
  
  );
end component;

component sixteen_bit_register is
  Port ( 
  d_in : in std_logic_vector(15 downto 0) ; 
  d_out : out std_logic_vector(15 downto 0) ;
  clk : in std_logic ; 
  we : in std_logic  
  
  );
end component;

component multiplier is
port 
(a :in  std_logic_vector(7 downto 0) ;
b : in  std_logic_vector(7 downto 0) ; 
c : out std_logic_vector(15 downto 0);
cntrl : in std_logic_vector(1 downto 0); 
clk : in std_logic ) ;
end component;

component dist_mem_gen_0 is 
port ( 
a : in std_logic_vector(13 downto 0) ; 
clk : in std_logic ; 
spo : out std_logic_vector(7 downto 0) ) ;
end component ;  

component dist_mem_gen_1 is 
port ( 
a : in std_logic_vector(13 downto 0) ; 
clk : in std_logic ; 
spo : out std_logic_vector(7 downto 0) ) ;
end component ;  



component dist_mem_gen_2 is 
port ( 
a : in std_logic_vector(13 downto 0) ; 
d : in std_logic_vector(15 downto 0) ; 
we : in std_logic ; 
clk : in std_logic ; 
spo : out std_logic_vector(15 downto 0) ) ;

end component ; 




signal counter : integer := 0 ;
signal cntrl2  : integer := 0 ;
signal state : std_logic_vector(4 downto 0) := "00001" ;  
--constant compute1 : std_logic_vector(4 downto 0) := "00001" ;
--constant compute2 : std_logic_vector(4 downto 0) := "00010" ;
--constant compute3 : std_logic_vector(4 downto 0) := "00100" ;

--constant transfer_to_register : std_logic_vector(2 downto 0) := "01000" ; 
--constant transfer_to_ram : std_logic_vector(2 downto 0) := "10000" ;  
signal temp1, temp2, mul1, mul2 : std_logic_vector(7 downto 0) := (others => '0');
signal temp, ram_temp : std_logic_vector(15 downto 0) := (others => '0');
signal dout : std_logic_vector(15 downto 0);

signal  re1 :  std_logic := '1' ; -- rom 
signal  re2,we2 :  std_logic := '1' ; -- eight bit registers
signal  re3,we3 :  std_logic := '1'; -- sixteen bit registers 
signal  re4,we4:  std_logic := '0' ; -- ram 
signal  addr1, addr2, addr3 :  std_logic_vector(13 downto 0) := (others => '0') ; -- rom address 
signal  cntrl :  std_logic_vector(1 downto 0);  -- contrl for mac
signal n: integer := 128 * 128 * 128 + 1;
signal base: integer := 128;
signal tempdelay: integer:= 0;
signal dp : std_logic := '1' ;
signal output : std_logic_vector(15 downto 0)  ;
begin

umt1 : dist_mem_gen_0 port map(clk => clk, a => addr1, spo => temp1);
umt2 : dist_mem_gen_1 port map(clk => clk, a => addr2, spo => temp2);
reg1 : eight_bit_register port map(d_in => temp1, d_out => mul1, clk => clk, we => we2);
reg2 : eight_bit_register port map(d_in => temp2, d_out => mul2, clk => clk, we => we2);
uut : multiplier port map(a => mul1, b => mul2, c => temp, clk => clk, cntrl => cntrl);
reg3 : sixteen_bit_register port map(clk => clk, d_in => temp, d_out => ram_temp, we => we3);
umt3 : dist_mem_gen_2 port map(clk => clk, a => addr3, d => ram_temp, we => we4, spo => output);
display : merged port map( clkm => clk , i1m => output(15), i2m => output(14), i3m => output(13), i4m => output(12),
                                         i5m => output(11), i6m => output(10), i7m => output(9), i8m => output(8),
                                         i9m => output(7), i10m => output(6), i11m => output(5), i12m => output(4),
                                         i13m => output(3), i14m => output(2), i15m => output(1), i16m => output(0),
                                         dp_1 => dp , dp_2 => dp , dp_3 => dp , dp_4 => dp , dp_out => dp , 
                                         a1m => a1m , a2m => a2m ,a3m => a3m ,a4m => a4m , 
                                         aam => aam , bbm => bbm ,ccm => ccm ,ddm => ddm ,eem => eem ,ffm => ffm ,ggm => ggm );




process(clk) begin 

if (clk'event and clk = '1' ) then 

--    if (counter > n ) then 
--        addr3 <= std_logic_vector(to_unsigned(counter - n - 1 , 14)) ; 
--        counter <= counter + 1 ;
--    end if ;


    if (counter > n) then 
        addr3 <= input_adr ;  
    
    else
    
    case state is 
    
        when "00001" =>  --rom to register
            we2 <= '1' ; 
            state <= "00010";
            counter <= counter + 1 ;    
        
        when "00010" => --register to mac
            
            re2 <= '1'; 
            state <= "00100" ; 
            cntrl(1)  <= '1';
            
        
        when "00100" => --mac multiplication
            
--                state <= "00001" 
                -- compute next address ; 
                addr1 <= std_logic_vector(to_unsigned((counter mod base)*base + counter/(base*base),14)) ; 
                addr2 <= std_logic_vector(to_unsigned(((counter/base) mod base)*base + counter mod base , 14)) ;
            -- change address of roms ;
                if ((counter -1)mod base = 0) then
                    state <= "01000";
                    cntrl <= "01";
                else 
                    state <= "00001";
                    cntrl <= "00";
                end if;
   
        when "01000" => --transfer to register
            if (tempdelay = 2) then
            if (counter /= n) then
--            if (addr3 /= std_logic_vector(to_unsigned(base*base -1, 14))) then
            addr3 <= std_logic_vector(to_unsigned((((counter-1)/(base*base)) mod base) + ((((counter-1)/base)  )mod base)*base , 14));
            end if;
            state <= "10000" ;
            tempdelay <= 0;
            elsif (tempdelay = 0) then
            re3 <= '1' ;
            we4 <= '1' ;
            tempdelay <= tempdelay + 1;
            else
                tempdelay <= tempdelay + 1;
            end if; 
            
            -- compute address
        
        when "10000" => --transfer to ram
            state <= "00001" ; 
            we4 <= '0' ;
--            cntrl2 <= cntrl2 + 1 ;
--            addr1 <= std_logic_vector(to_unsigned(cntrl2,13)) ; 
--            addr2 <= std_logic_vector(to_unsigned(3 * (cntrl2 mod 3) , 13)) ;

            
        
        
        when others => 
            state <= "00001" ;
            
        
    end case ;
    end if ;
end if ;

end process ;
end Behavioral;


