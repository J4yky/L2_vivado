----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2026 15:34:21
-- Design Name: 
-- Module Name: main - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port(
        cathodes : out std_logic_vector(7 downto 0);
        anodes : out std_logic_vector(4 downto 0);
        clk : in std_logic
    );
end main;

architecture Behavioral of main is

signal cntr_value : integer range 0 to 50000000 := 0;
signal change_display : std_logic := '0';
signal number_displayed : std_logic_vector(9 downto 0);
signal pick_number_displayed: integer range 0 to 9;
begin

nmbrs : process()
begin
end process nmbrs;

anodes(0) <= '0';
    
cntr : process(clk)
begin
    if rising_edge(clk) then
        if cntr_value <= 50000000 then
            cntr_value <= cntr_value + 1;
        else
            cntr_value <= 0;
            change_display <= not change_display;
        end if;
    end if;
end process cntr;

display_leds : process (clk)
begin
    if rising_edge(clk) then
        case change_display is
            when '0' =>
                
end process display_leds;
    
end Behavioral;
