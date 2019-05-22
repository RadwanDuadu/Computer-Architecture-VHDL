LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL project: VHDL implementation of Lookup Table
-- Testbench VHDL code for Lookup Table Implementation
ENTITY tb_lookuptable IS
END tb_lookuptable;
 
ARCHITECTURE behavior OF tb_lookuptable IS 
 
    -- Component Declaration for Lookup Table Implementation in VHDL
 
    COMPONENT non_linear_lookup
    PORT(
         LUTIN : IN  std_logic_vector(7 downto 0);
         LUTOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LUTIN : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
   signal LUTOUT : std_logic_vector(7 downto 0);
 signal i: integer;
 
BEGIN
 
 -- Instantiate the Lookup Table Implementation
   uut: non_linear_lookup PORT MAP (
          LUTIN => LUTIN,
          LUTOUT => LUTOUT
        );

   stim_proc: process
   begin  
  LUTIN <= x"00";
  -- initialize 4-bit input data in VHDL testbench
      for i in 0 to 15 loop
   LUTIN <= std_logic_vector(to_unsigned(i, 8));
  wait for 100 ns; 
  end loop;
      wait;
   end process;

END;
