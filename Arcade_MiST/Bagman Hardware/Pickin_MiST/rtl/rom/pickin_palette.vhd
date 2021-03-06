library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity pickin_palette is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(5 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of pickin_palette is
	type rom is array(0 to  63) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
--58 green

	
		X"00",X"58",X"FF",X"27",X"00",X"3F",X"FF",X"C7",X"00",X"38",X"FF",X"EA",X"00",X"C0",X"FF",X"3E",
		X"00",X"C7",X"FF",X"FF",X"00",X"E8",X"FF",X"FA",X"00",X"07",X"FF",X"07",X"00",X"58",X"FF",X"27",
		X"00",X"13",X"FF",X"38",X"00",X"D3",X"FF",X"D3",X"00",X"1F",X"07",X"3E",X"00",X"07",X"27",X"E8",
		X"00",X"07",X"3E",X"FF",X"00",X"C0",X"FF",X"3E",X"00",X"17",X"27",X"E8",X"00",X"C0",X"38",X"FF");
		
		
--		X"00",X"58",X"FF",X"27",X"00",X"3F",X"FF",X"C7",X"00",X"38",X"FF",X"EA",X"00",X"C0",X"FF",X"3E",
--		X"00",X"C7",X"FF",X"FF",X"00",X"E8",X"FF",X"FA",X"00",X"07",X"FF",X"07",X"00",X"58",X"FF",X"27",
--		X"00",X"13",X"FF",X"38",X"00",X"D3",X"FF",X"D3",X"00",X"1F",X"07",X"3E",X"00",X"07",X"27",X"E8",
--		X"00",X"07",X"3E",X"FF",X"00",X"C0",X"FF",X"3E",X"00",X"17",X"27",X"E8",X"00",X"C0",X"38",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
