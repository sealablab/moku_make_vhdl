library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;

entity SimpleStateMachine1 is 
    port (
        Clk : in std_logic;
        Reset : in std_logic;

    	-- Inputs
        Go : in std_logic;
        Kill: in std_logic;

	-- Outputs
	Done: out std_logic
    );
end entity;

--the architecture block of SimpleStateMachine is for
-- declaring our (local) variables. In this case, a 7-bit counter
architecture Behavioural of SimpleStateMachine1 is
	signal TTL : unsigned(7 downto 0); -- 'TTL' read as: Time-to-live
	type state_labels is ( Idle, Active, Finish, Abort); --Custom labels for our states
    signal my_state_reg : state_labels;
begin 
--perform cobinatorial assignments
-- now time declare our counter process
-- # def UpdateSimpleState(Clk)
UpdateSimpleState_State: process(Clk)
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

Reg_proc: process(Clk)
--The UpdateSimpleSTate_Reg process..
--is responsible for manipulating
begin
	if Reset = '1' then
	TTL <= X"00";
	done <= '0';
--	elsif rising_edge(Clk) then
	-- inside this statement we are safe to update internal registers. right?

	end if;
end process;


end architecture; -- SimpleStateMachine1
