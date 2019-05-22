library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity structural_model is
port ( 
   ABUS: in std_logic_vector(15 downto 0);
   BBUS: in std_logic_vector(15 downto 0);
   CTRL: in std_logic_vector(3 downto 0);
   RESULT: out std_logic_vector(15 downto 0)
  );
end structural_model;

architecture Behavioral of structural_model is
component non_linear_lookup is 
port (  LUTIN: in std_logic_vector(7 downto 0);
   LUTOUT: out std_logic_vector(7 downto 0)
 );
end component non_linear_lookup;

component shifter is
  generic ( N: integer:=16
  );
    Port ( SHIFTINPUT : in  STD_LOGIC_VECTOR(N-1 downto 0);
   SHIFT_Ctrl : in  STD_LOGIC_VECTOR(3 downto 0); 
   SHIFTOUT: out  STD_LOGIC_VECTOR(N-1 downto 0)
  );
end component shifter;
component ALU is
 port (
   ABUS: in std_logic_vector(15 downto 0);
   BBUS: in std_logic_vector(15 downto 0);
   ALUctrl: in std_logic_vector(3 downto 0);
   ALUOUT: out std_logic_vector(15 downto 0)
   );
end component ALU;

signal tmp_out1,tmp_out2,tmp_out3: std_logic_vector(15 downto 0);
signal lut_out: std_logic_vector(7 downto 0);
begin
-------------
-- ALU Unit--
-------------
ALU_unit: ALU port map( 
ABUS => ABUS, 
BBUS => BBUS,
ALUctrl => CTRL,
ALUOUT => tmp_out1); 
-----------------
-- Shifter Unit--
-----------------
shifter_unit: shifter generic map ( N => 16) -- shifter
 port map( 
 SHIFTINPUT => BBUS, 
 SHIFT_Ctrl => CTRL,
 SHIFTOUT => tmp_out2 ); 
-------------------------------------
-- Non-linear Lookup Operation Unit--
-------------------------------------
non_linear_lookup_unit: non_linear_lookup
 port map( 
 LUTIN => ABUS(7 downto 0), 
 LUTOUT => lut_out);
 tmp_out3 <= ABUS(15 downto 8) & lut_out;

-----------------------
-- Control Logic Unit--
-----------------------
control_logic: process(CTRL,tmp_out1,tmp_out3,tmp_out2) begin
  case(CTRL(3 downto 3)) is
  when "0" => 
    RESULT <= tmp_out1;
  when others => 
    case(CTRL(3 downto 0)) is
    when "1111" =>
     RESULT <= tmp_out3;
    when others =>
     RESULT <= tmp_out2;
    end case;
  end case;
 end process control_logic;
 
end Behavioral;