library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Structure_tb is
end Structure_tb;

architecture Behavior of Structure_tb is

-- component declaration of structure
component Structural_model 
port(
 ABUS, BBUS: in std_logic_vector(15 downto 0);
     ctrl: in std_logic_vector(3 downto 0);
     result: out std_logic_vector(15 downto 0) 
);
end component;

-- inputs
signal ABUS : std_logic_vector(15 downto 0) := (others => '0');
signal BBUS : std_logic_vector(15 downto 0) := (others => '0');
signal ctrl : std_logic_vector(3 downto 0) := (others => '0');

-- output
signal result : std_logic_vector(15 downto 0);

begin

-- initiate structural model
uut: structural_model port map(
ABUS => ABUS,
BBUS => BBUS,
ctrl => ctrl,
result => result
);

stim_proc: process
   begin  
  ABUS <= x"0001";
  BBUS <= x"0002";
  
  ctrl <= x"0";
 
  wait for 10ns;
  if result = x"0003" then
    report"PASS: 1";
  else 
    report"FAIL: 1";
  end if;

  ctrl <= x"1";
  wait for 10ns;
  if result = x"FFFF" then
    report"PASS: 2";
  else 
    report"FAIL: 2";
  end if;  
  
  ctrl <= x"2";
  wait for 10ns;
    if result = x"0000" then
      report"PASS: 3";
    else 
      report"FAIL: 3";
    end if;
  
  
  ctrl <= x"3";
  wait for 10ns;
      if result = x"0003" then
        report"PASS: 4";
      else 
        report"FAIL: 4";
      end if;
      
      
  ctrl <= x"4";
  wait for 10ns;
   if result = x"0003" then
     report"PASS: 5";
   else 
     report"FAIL: 5";
   end if;
   
    ctrl <= x"5";
     wait for 10ns;
    if result = x"FFFE" then
      report"PASS: 6";
    else 
      report"FAIL: 6";
    end if;
    
     ctrl <= x"6"; 
     wait for 10ns;
     if result = x"0001" then
       report"PASS: 7";
     else 
       report"FAIL: 7";
     end if;
     
     ctrl <= x"7";
       wait for 10ns;
      if result = x"0003" then
        report"PASS: 8";
      else 
        report"FAIL: 8";
      end if;
    
    ctrl <= x"8"; 
          wait for 10ns;
          if result = x"2000" then
            report"PASS: 9";
          else 
            report"FAIL: 9";
          end if; 
          
     ctrl <= x"9"; 
      wait for 10ns;
       if result = x"0020" then
         report"PASS: 10";
        else 
          report"FAIL: 10";
         end if; 
      
     ctrl <= x"a";
     wait for 10ns;
     if result = x"0020" then
        report "PASS: 11";
     else
        report "FAIL: 11";
     end if;
     
     ctrl <= x"b";
     wait for 10ns;
     if result = x"0000" then
        report "PASS: 12";
     else 
        report "FAIL: 12";
     end if;
     
     ctrl <= x"c";
     wait for 10ns;
     if result = x"0" then
        report "PASS: 13";
     else
        report "FAIL: 13";
     end if;
     
     ctrl <= x"d";
     wait for 10ns;
        if result = x"0" then
         report "PASS: 14";
        else
        report "FAIL: 14";
        end if;   
     
     ctrl <= x"e";
     wait for 10ns;
      if result = x"0" then
         report "PASS: 15";
      else
       report "FAIL: 15";
      end if;
     
     ctrl <= x"f";
     wait for 10ns;
            if result = x"10" then
               report "PASS: 16";
            else
             report "FAIL: 16";
            end if;        
      

   end process;


end;

