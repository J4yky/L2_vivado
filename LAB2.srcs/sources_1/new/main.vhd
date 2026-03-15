library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port(
        cathodes : out std_logic_vector(7 downto 0);
        anodes : out std_logic_vector(4 downto 0) := "11111";
        Clock100MHz : in std_logic
    );
end main;

architecture Behavioral of main is

signal cntr_value : integer range 0 to 50000000 := 0;
signal change_display : integer range 0 to 9 := 0;
signal number_displayed : std_logic_vector(9 downto 0);
signal pick_number_displayed: integer range 0 to 9;
begin

nmbrs : process(pick_number_displayed)
begin
case pick_number_displayed is
    when 0 =>
        number_displayed <= "11000000";
    when 1 =>
        number_displayed <= "11111001";
    when 2 =>
        number_displayed <= "10100100";
    when 3 =>
        number_displayed <= "10110000";
    when 4 =>
        number_displayed <= "10011001";
    when 5 =>
        number_displayed <= "10010010";
    when 6 =>
        number_displayed <= "10000010";
    when 7 =>
        number_displayed <= "11111000";
    when 8 =>
        number_displayed <= "10000000";
    when 9 =>
        number_displayed <= "10010000";
    when others =>
        number_displayed <= "01111111";
end case;

end process nmbrs;

anodes(4) <= '0';
    
cntr : process(Clock100MHz)
begin
    if rising_edge(Clock100MHz) then
        if cntr_value <= 50000000 then
            cntr_value <= cntr_value + 1;
        else
            cntr_value <= 0;
            if change_display = 1 then 
                change_display <= 0;
            else
                change_display <= change_display + 1;
            end if;
        end if;
    end if;
end process cntr;

display_leds : process (Clock100MHz)
begin
    if rising_edge(Clock100MHz) then
        case change_display is
            when 0 =>
                pick_number_displayed <= 2;
            when others =>
                pick_number_displayed <= 5;
        end case;
        
        cathodes <= number_displayed;
    end if;
                
end process display_leds;
    
end Behavioral;
