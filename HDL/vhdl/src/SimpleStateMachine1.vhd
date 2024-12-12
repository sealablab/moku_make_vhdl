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
    -- NOTE: This is 
    type state_labels is ( Idle, Active, Finish, Abort);
    signal my_state_reg : state_labels;
begin 
	--perform cobinatorial assignments
	-- now time declare our counter process
	SimpleStateReg_process: process(Clk)
	begin
	if Reset = '1' then
		my_state_reg <= Idle;
	end if;
	end process; -- (SimpleStateReg_process)

end architecture;
