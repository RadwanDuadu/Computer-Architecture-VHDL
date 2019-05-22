library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity shifter is
  generic ( N: integer:=16
  );
    Port ( SHIFTINPUT : in  STD_LOGIC_VECTOR(N-1 downto 0);
   SHIFT_Ctrl : in  STD_LOGIC_VECTOR(3 downto 0); 
   SHIFTOUT: out  STD_LOGIC_VECTOR(N-1 downto 0)
  );
end shifter;

architecture Behavioral of shifter is

begin
process(SHIFTINPUT,SHIFT_Ctrl)
begin
case(SHIFT_Ctrl) is
when "1000" => SHIFTOUT <= SHIFTINPUT(3 downto 0)&SHIFTINPUT(15 downto 4);
when "1001" => SHIFTOUT <= SHIFTINPUT(11 downto 0)&SHIFTINPUT(15 downto 12);
when "1010" => SHIFTOUT <= SHIFTINPUT(11 downto 0) & "0000"; 
when "1011" => SHIFTOUT <= "0000" & SHIFTINPUT(15 downto 4); 
when others => SHIFTOUT <= x"0000";
end case;
end process;

end Behavioral;
