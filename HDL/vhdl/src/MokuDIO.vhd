library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;

-- NOTE: I don't know how to seperate this into its own little file (yet). maybe if i  maybe if i  maybe if i 

-- moku_customwrap.vhd
-- Simplifed revision of the CustomWrapper interface
-- https://compile.liquidinstruments.com/docs/wrapper.html#wrapper-ports
entity MokuDIO is 
    port (
        Clk : in std_logic;
        Reset : in std_logic;

        InputA : in signed(15 downto 0);
        InputB : in signed(15 downto 0);

        OutputA : out signed(15 downto 0);
        OutputB : out signed(15 downto 0);

        Control0 : in std_logic_vector(31 downto 0);
        Control1 : in std_logic_vector(31 downto 0);
        Control2 : in std_logic_vector(31 downto 0);
        Control3 : in std_logic_vector(31 downto 0)
    );
end entity;

architecture Behavioural of MokuDIO is
    signal Count3: unsigned(2 downto 0);
begin
	OutputA(0) <= InputA(0);     -- Q1: DIO.Outputs[0] <= DIO.Inputs(0) 
    OutputA(1) <= not InputA(1); -- Q2: DIO.Outputs[1] is the inverse of DIO_Pin[1]	
    OutputA(2) <= InputA(2) xor InputA(3); --Q3 

end architecture;
