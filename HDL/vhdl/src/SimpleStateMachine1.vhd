library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;

entity SimpleStateMachine1 is 
    port (
        Clk : in std_logic;
        Reset : in std_logic;

        Go : in std_logic;
        Kill: in std_logic
    );
end entity;

architecture Behavioural of SimpleStateMachine1 is
    -- NOTE: This is an `enunmerated` type
    type state_labels is ( Idle, Active, Finish, Abort);
    signal my_state_reg : state_labels;
begin 
--perform cobinatorial assignments
-- now time declare our counter process
-- # def UpdateSimpleState(Clk)
UpdateSimpleState: process(Clk)
begin
	if Reset = '1' then
		my_state_reg <= Idle;
	elsif rising_edge(Clk) then
	case (my_state_reg) is 
		when Idle =>
			if (Go = '1') then	my_state_reg <= Active; end if;
		when others =>
			my_state_reg <= Idle;
	end case;
	end if; -- 'Reset'
end process; -- (UpdateSimpleState)

end architecture;
