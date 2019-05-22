LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL project: VHDL code for Shifter
-- VHDL testbench code for Shifter
ENTITY tb_shifter IS
END tb_shifter;
 
ARCHITECTURE behavior OF tb_shifter IS 
 
    -- Component Declaration for Shifter
    COMPONENT shifter
    PORT(
         SHIFTINPUT : IN  std_logic_vector(15 downto 0);
         SHIFT_Ctrl : IN  std_logic_vector(3 downto 0);
         SHIFTOUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
   --Inputs
   signal SHIFTINPUT : std_logic_vector(15 downto 0) := (others => '0');
   signal SHIFT_Ctrl : std_logic_vector(3 downto 0) := (others => '0');
  --Outputs
   signal SHIFTOUT : std_logic_vector(15 downto 0);
 
BEGIN
 
 -- Instantiate the Shifter
   uut: shifter PORT MAP (
          SHIFTINPUT => SHIFTINPUT,
          SHIFT_Ctrl => SHIFT_Ctrl,
          SHIFTOUT => SHIFTOUT
        );

   -- Stimulus process for shifter
   stim_proc: process
   begin  
      SHIFTINPUT <= x"0044";
      wait for 100 ns; 
  SHIFT_Ctrl <= "1000";-- ROR8
  wait for 100 ns; 
  SHIFT_Ctrl <= "1001";-- ROR4
  wait for 100 ns; 
  SHIFT_Ctrl <= "1010";-- SLL8
      wait;
   end process;

END;