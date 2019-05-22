library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity gates_tb is
end;

architecture bench of gates_tb is

  component gates
      Port ( a : in STD_LOGIC;
             b : in STD_LOGIC;
             ci : in STD_LOGIC;
             co : out STD_LOGIC;
             s : out STD_LOGIC);
  end component;

  signal a: STD_LOGIC;
  signal b: STD_LOGIC;
  signal ci: STD_LOGIC;
  signal co: STD_LOGIC;
  signal s: STD_LOGIC;

begin

  uut: gates port map ( a  => a,
                        b  => b,
                        ci => ci,
                        co => co,
                        s  => s );

  stimulus: process
  begin
  
    -- Put initialisation code here
        a  <= '0';
        b  <= '0';
        ci <= '0';
        wait for 10 ns;
         a  <= '0';
         b  <= '0';
         ci <= '1';
         wait for 10 ns;       
         a  <= '0';
         b  <= '1';
         ci <= '0';
         wait for 10 ns;   
         a  <= '0';
         b  <= '1';
         ci <= '1';
         wait for 10 ns;   
         a  <= '1';
         b  <= '0';
         ci <= '0';
         wait for 10 ns;   
         a  <= '1';
         b  <= '0';
         ci <= '1';
         wait for 10 ns;  
         a  <= '1';
         b  <= '1';
         ci <= '0';
         wait for 10 ns;   
         a  <= '1';
         b  <= '1';
         ci <= '1';
         wait for 10 ns;   
         a  <= '0';
         b  <= '0';
         ci <= '0';
         wait for 10 ns;    
    -- Put test bench stimulus code here

    wait;
  end process;


end;