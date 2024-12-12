library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;
entity TrafficLight is
    port (
        Clk : in std_logic;
        Reset : in std_logic;
        -- Inputs
        Go : in std_logic;
        -- Outputs
        Color : out std_logic_vector(4 downto 0)
    );
end entity;

architecture Behavioural of TrafficLight is
	signal Counter : unsigned(15 downto 0); 
	type state_labels is ( Resetting, Idle, Active, Finished, Paused); --Custom labels for our states
	type status_codes is ( Status_Running, Status_Finished, Status_Error);
	
    signal my_state : state_labels;
	signal my_status: status_codes;
begin 

UpdateSimpleState_State: process(Clk)
begin
	if Reset = '1' then
		my_state <= Resetting;
	end if;
	if rising_edge(Clk) then
	-- You should be able to fill out the entire body of this case statement by reviewing the diagram
	-- the **only** variables who's state should be affected by this block of code is `my_state`.
	-- if you find yourself interacting with any other logic elements, move them to the other process block
	
	-- I don't know if VHDL has the same concept, but if you are keeping track you should notice that the only
	-- `lvalue` in an assignment is `my_state`. 
	-- Compare this to the other process block 
	case (my_state) is 
		when Idle =>
			if (Go = '1') then	my_state <= Active; end if;
		when Active =>
			if (Go /='1') then my_state <= Paused; end if;
		when Paused =>
			if (Go = '1') then my_state <= Active; end if;
		when Finished  =>
			null; -- This is an empty statement. 
		when others =>
			null;
	end case;
	end if; -- 'Reset'
end process; -- (UpdateSimpleState)


end architecture; -- TrafficLight
