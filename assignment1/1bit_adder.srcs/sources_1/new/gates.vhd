library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gates is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           co : out STD_LOGIC;
           s : out STD_LOGIC);
end gates;

architecture Behavioral of gates is
  signal g: std_logic;
  signal p: std_logic;
begin
  p <= a xor b;
  g <= a and b;
  s <= ci xor p;
  co <= g or (ci and p);

end Behavioral;
