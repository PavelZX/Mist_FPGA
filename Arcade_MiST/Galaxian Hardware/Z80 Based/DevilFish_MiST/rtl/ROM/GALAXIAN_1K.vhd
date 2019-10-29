library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity GALAXIAN_1K is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of GALAXIAN_1K is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"0E",X"3F",X"7F",X"73",X"E3",X"E3",X"00",X"00",X"00",X"80",X"E0",X"E0",X"F0",X"F0",
		X"E0",X"E0",X"70",X"7F",X"3F",X"0E",X"00",X"00",X"F0",X"F0",X"E0",X"E0",X"80",X"00",X"00",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"70",X"E0",X"E0",X"00",X"00",X"00",X"80",X"E0",X"E0",X"70",X"70",
		X"E3",X"E3",X"7F",X"7F",X"3F",X"0E",X"00",X"00",X"F0",X"F0",X"E0",X"E0",X"80",X"00",X"00",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"70",X"F0",X"F0",X"00",X"00",X"00",X"80",X"E0",X"E0",X"70",X"70",
		X"FC",X"FC",X"7C",X"7F",X"3F",X"0E",X"00",X"00",X"70",X"70",X"E0",X"E0",X"80",X"00",X"00",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"7F",X"FC",X"FC",X"00",X"00",X"00",X"80",X"E0",X"E0",X"70",X"70",
		X"E0",X"E0",X"70",X"7F",X"3F",X"0E",X"00",X"00",X"70",X"70",X"E0",X"E0",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"3B",X"33",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"31",X"39",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"39",X"30",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"33",X"3F",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"39",X"38",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"3C",X"3D",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"3F",X"3C",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"30",X"39",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0C",X"0D",X"07",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"09",X"0D",X"07",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0D",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"09",X"0F",X"07",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0D",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0C",X"0F",X"07",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"07",X"1F",X"3F",X"39",X"71",X"71",X"00",X"00",X"80",X"E0",X"F0",X"F8",X"F8",X"F8",
		X"30",X"10",X"18",X"0F",X"0F",X"07",X"00",X"00",X"78",X"78",X"70",X"F0",X"E0",X"80",X"00",X"00",
		X"00",X"00",X"07",X"0F",X"1F",X"1C",X"18",X"08",X"00",X"00",X"80",X"E0",X"F0",X"30",X"18",X"18",
		X"08",X"18",X"1F",X"1F",X"0F",X"07",X"00",X"00",X"F8",X"F8",X"F8",X"F0",X"E0",X"80",X"00",X"00",
		X"00",X"00",X"07",X"0F",X"1F",X"1C",X"1C",X"0C",X"00",X"00",X"80",X"E0",X"F0",X"30",X"18",X"18",
		X"0F",X"1F",X"1F",X"1F",X"1F",X"0F",X"07",X"00",X"18",X"18",X"38",X"F0",X"F0",X"E0",X"80",X"00",
		X"00",X"00",X"07",X"0F",X"0F",X"1F",X"1F",X"3F",X"00",X"00",X"80",X"E0",X"F0",X"F0",X"18",X"18",
		X"38",X"38",X"1C",X"1F",X"0F",X"03",X"00",X"00",X"18",X"18",X"30",X"F0",X"E0",X"80",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"3F",X"7F",X"73",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"E0",
		X"E3",X"E3",X"E0",X"E0",X"70",X"7F",X"3F",X"0E",X"F0",X"F0",X"F0",X"F0",X"E0",X"E0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"3F",X"7F",X"70",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"E0",
		X"E0",X"E0",X"E3",X"E3",X"7F",X"7F",X"3F",X"0E",X"70",X"70",X"F0",X"F0",X"E0",X"E0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"07",X"3F",X"7F",X"70",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"E0",
		X"F0",X"F0",X"FC",X"FC",X"7C",X"7F",X"3F",X"0E",X"70",X"70",X"70",X"70",X"E0",X"E0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"3F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"E0",
		X"FC",X"FC",X"E0",X"E0",X"70",X"7F",X"3F",X"0E",X"70",X"70",X"70",X"70",X"E0",X"E0",X"80",X"00",
		X"00",X"0F",X"1F",X"1F",X"3F",X"33",X"63",X"63",X"00",X"00",X"80",X"E0",X"F0",X"F0",X"F0",X"F0",
		X"20",X"00",X"10",X"0F",X"0F",X"07",X"00",X"00",X"F0",X"E0",X"E0",X"E0",X"C0",X"80",X"00",X"00",
		X"00",X"00",X"00",X"07",X"0F",X"1F",X"1C",X"08",X"00",X"00",X"00",X"C0",X"E0",X"E0",X"38",X"10",
		X"08",X"18",X"18",X"1F",X"0F",X"0F",X"07",X"00",X"10",X"F8",X"F0",X"F0",X"F0",X"E0",X"C0",X"00",
		X"00",X"00",X"00",X"1F",X"1F",X"1F",X"1C",X"0C",X"00",X"00",X"00",X"C0",X"E0",X"F8",X"38",X"10",
		X"0C",X"1F",X"1F",X"3F",X"1F",X"0F",X"07",X"00",X"10",X"10",X"10",X"30",X"F0",X"E0",X"80",X"00",
		X"00",X"00",X"00",X"07",X"0F",X"1F",X"1F",X"3C",X"00",X"00",X"00",X"80",X"C0",X"E0",X"F0",X"70",
		X"7C",X"60",X"60",X"70",X"3F",X"3F",X"1F",X"00",X"70",X"70",X"70",X"F0",X"E0",X"C0",X"80",X"00",
		X"00",X"00",X"00",X"07",X"7F",X"73",X"E3",X"E3",X"00",X"00",X"00",X"C0",X"E0",X"F0",X"F0",X"F0",
		X"E0",X"E0",X"70",X"7F",X"07",X"00",X"00",X"00",X"F0",X"F0",X"F0",X"E0",X"C0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"3E",X"7F",X"70",X"E0",X"E0",X"00",X"00",X"00",X"40",X"E0",X"F0",X"70",X"70",
		X"E3",X"E3",X"7F",X"7F",X"3E",X"00",X"00",X"00",X"70",X"70",X"F0",X"F0",X"60",X"00",X"00",X"00",
		X"00",X"00",X"08",X"3E",X"3F",X"70",X"F0",X"F0",X"00",X"00",X"00",X"60",X"E0",X"F0",X"70",X"70",
		X"FC",X"FC",X"7C",X"7F",X"3E",X"08",X"00",X"00",X"70",X"70",X"F0",X"E0",X"60",X"00",X"00",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"7F",X"FC",X"FC",X"00",X"00",X"00",X"80",X"E0",X"E0",X"70",X"70",
		X"E0",X"E0",X"70",X"7F",X"3F",X"0E",X"00",X"00",X"70",X"70",X"E0",X"E0",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0F",X"1F",X"3B",X"33",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C0",
		X"31",X"19",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0F",X"0F",X"19",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C0",
		X"03",X"1F",X"0F",X"07",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"07",X"1F",X"19",X"18",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C0",
		X"1C",X"1D",X"0F",X"07",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0F",X"1F",X"1F",X"3C",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C0",
		X"30",X"39",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"3B",X"33",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"31",X"39",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"39",X"30",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"33",X"3F",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"39",X"38",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"3C",X"3D",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"3F",X"3C",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"30",X"39",X"1F",X"0E",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0F",X"39",X"19",X"0F",X"1F",X"04",X"00",X"00",X"00",X"C0",X"80",X"00",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"04",X"36",X"7F",X"3F",X"00",X"00",X"00",X"00",X"00",X"C0",X"E0",X"C0",
		X"70",X"F0",X"70",X"30",X"30",X"7F",X"36",X"04",X"E0",X"F0",X"E0",X"C0",X"C0",X"E0",X"C0",X"00",
		X"00",X"00",X"00",X"00",X"06",X"0F",X"1D",X"1B",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"19",X"1D",X"0F",X"06",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0E",X"3F",X"3F",X"7B",X"73",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",
		X"71",X"79",X"3F",X"3F",X"0E",X"00",X"00",X"00",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"04",X"76",X"7F",X"30",X"00",X"00",X"00",X"00",X"00",X"E0",X"E0",X"C0",
		X"6F",X"EF",X"6F",X"2F",X"30",X"7F",X"76",X"04",X"60",X"70",X"60",X"40",X"C0",X"E0",X"E0",X"00",
		X"00",X"00",X"00",X"00",X"00",X"02",X"36",X"19",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"C0",
		X"16",X"6F",X"2F",X"16",X"19",X"36",X"02",X"00",X"80",X"60",X"40",X"80",X"C0",X"40",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"60",X"C0",X"CC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",
		X"08",X"00",X"00",X"0C",X"08",X"20",X"70",X"30",X"40",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"70",X"20",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"00",X"00",X"08",X"CC",X"C0",X"60",X"00",X"80",X"80",X"C0",X"40",X"40",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"C4",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"01",X"01",X"04",X"CC",X"E0",X"00",X"00",X"80",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"10",X"30",X"60",X"4C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"04",X"01",X"00",X"0C",X"44",X"60",X"30",X"10",X"E0",X"F0",X"F0",X"E0",X"00",X"00",X"00",X"00",
		X"00",X"01",X"02",X"02",X"01",X"40",X"A6",X"A9",X"7C",X"E0",X"80",X"40",X"20",X"A0",X"FC",X"03",
		X"A9",X"A6",X"40",X"01",X"02",X"02",X"01",X"00",X"03",X"EC",X"A0",X"40",X"80",X"40",X"E0",X"7C",
		X"70",X"2F",X"18",X"06",X"01",X"40",X"A6",X"A9",X"00",X"00",X"80",X"60",X"20",X"A0",X"FC",X"03",
		X"A9",X"A6",X"40",X"01",X"06",X"18",X"2F",X"70",X"03",X"FC",X"A0",X"20",X"60",X"80",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"4D",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"00",X"00",X"0C",X"49",X"E0",X"C0",X"80",X"80",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"70",X"60",X"C8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0C",X"00",X"00",X"08",X"CC",X"60",X"70",X"30",X"80",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"44",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"01",X"01",X"04",X"4C",X"E0",X"C0",X"80",X"80",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"70",X"60",X"CC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",
		X"04",X"01",X"01",X"0C",X"C4",X"60",X"70",X"30",X"80",X"80",X"80",X"80",X"40",X"00",X"00",X"00",
		X"00",X"03",X"07",X"07",X"03",X"01",X"42",X"A6",X"00",X"C0",X"00",X"80",X"C0",X"C0",X"60",X"50",
		X"AF",X"A6",X"42",X"01",X"03",X"07",X"07",X"03",X"D0",X"50",X"60",X"C0",X"C0",X"80",X"00",X"C0",
		X"00",X"0E",X"07",X"07",X"03",X"01",X"42",X"A6",X"00",X"00",X"00",X"80",X"C0",X"C0",X"60",X"50",
		X"AF",X"A6",X"42",X"01",X"03",X"07",X"07",X"0E",X"D0",X"50",X"60",X"C0",X"C0",X"80",X"00",X"00",
		X"00",X"7C",X"1F",X"0F",X"03",X"01",X"42",X"A6",X"00",X"00",X"00",X"80",X"C0",X"C0",X"60",X"50",
		X"AF",X"A6",X"42",X"01",X"03",X"0F",X"1F",X"7C",X"D0",X"50",X"60",X"C0",X"C0",X"80",X"00",X"00",
		X"00",X"0E",X"07",X"07",X"03",X"01",X"42",X"A6",X"00",X"00",X"00",X"80",X"C0",X"C0",X"60",X"50",
		X"AF",X"A6",X"42",X"01",X"03",X"07",X"07",X"0E",X"D0",X"50",X"60",X"C0",X"C0",X"80",X"00",X"00",
		X"00",X"0F",X"10",X"27",X"48",X"53",X"54",X"55",X"00",X"F0",X"08",X"E4",X"12",X"C9",X"25",X"95",
		X"55",X"54",X"53",X"48",X"27",X"10",X"0F",X"00",X"55",X"55",X"95",X"25",X"C9",X"12",X"E4",X"00",
		X"00",X"00",X"00",X"07",X"48",X"53",X"54",X"55",X"00",X"00",X"00",X"E0",X"10",X"C8",X"24",X"94",
		X"55",X"54",X"53",X"48",X"27",X"10",X"0F",X"00",X"54",X"54",X"94",X"24",X"C8",X"10",X"E0",X"00",
		X"00",X"00",X"00",X"07",X"08",X"13",X"14",X"15",X"00",X"00",X"00",X"E0",X"10",X"C8",X"24",X"94",
		X"15",X"14",X"13",X"08",X"07",X"00",X"00",X"00",X"50",X"50",X"90",X"20",X"C0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"04",X"05",X"00",X"00",X"00",X"00",X"00",X"C0",X"20",X"90",
		X"05",X"04",X"03",X"00",X"00",X"00",X"00",X"00",X"50",X"50",X"90",X"20",X"40",X"00",X"00",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"8C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"0C",X"6E",X"9A",X"9A",X"B2",X"F2",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"30",X"30",X"00",X"0C",X"0C",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F7",X"FF",X"7F",X"3B",X"1B",X"07",X"03",X"03",X"01",X"01",X"21",X"C1",X"83",X"83",X"C3",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",
		X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",
		X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",
		X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",
		X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",
		X"E3",X"E3",X"E1",X"C1",X"C0",X"80",X"00",X"00",X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",
		X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",
		X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",
		X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",X"EE",X"CC",X"A8",X"18",X"04",X"06",X"0D",X"1D",
		X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",X"0C",X"5E",X"D2",X"92",X"92",X"F6",X"64",X"00",
		X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",
		X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",X"F8",X"FE",X"1C",X"38",X"1C",X"FE",X"F8",X"00",
		X"00",X"00",X"18",X"3C",X"3C",X"18",X"00",X"00",X"C0",X"F0",X"1E",X"1E",X"F0",X"C0",X"00",X"00",
		X"60",X"F0",X"90",X"18",X"18",X"90",X"0F",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"10",X"18",X"18",X"08",X"10",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"42",X"85",X"58",X"24",X"24",X"18",X"A0",X"40",X"00",X"40",X"40",X"60",X"60",X"40",X"40",X"00",
		X"00",X"02",X"02",X"06",X"06",X"02",X"02",X"00",X"00",X"7E",X"18",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"18",X"7E",X"00",X"00",X"00",X"04",X"03",X"01",X"03",X"07",X"0F",
		X"00",X"00",X"40",X"80",X"00",X"80",X"80",X"C0",X"0F",X"0F",X"07",X"06",X"03",X"01",X"00",X"00",
		X"C0",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"1C",X"26",X"67",X"7F",X"67",X"26",X"1C",X"10",X"30",X"38",X"78",X"78",X"FC",X"FC",X"00",
		X"F0",X"F0",X"FE",X"C0",X"80",X"10",X"30",X"70",X"3C",X"7E",X"E7",X"C3",X"81",X"00",X"00",X"00",
		X"00",X"00",X"04",X"03",X"01",X"03",X"07",X"0F",X"00",X"00",X"40",X"80",X"00",X"80",X"80",X"C0",
		X"0F",X"0F",X"07",X"06",X"03",X"01",X"00",X"00",X"C0",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",
		X"00",X"00",X"02",X"01",X"01",X"02",X"04",X"08",X"00",X"00",X"20",X"C0",X"00",X"80",X"80",X"40",
		X"0C",X"0E",X"07",X"07",X"03",X"01",X"00",X"00",X"40",X"40",X"C0",X"80",X"80",X"00",X"00",X"00",
		X"00",X"01",X"03",X"07",X"0F",X"1E",X"3C",X"78",X"C0",X"C0",X"C0",X"80",X"3C",X"40",X"40",X"3C",
		X"F0",X"78",X"3C",X"1E",X"0F",X"07",X"03",X"01",X"00",X"7C",X"64",X"64",X"6C",X"BC",X"C0",X"C0",
		X"3F",X"1F",X"07",X"63",X"F3",X"F3",X"E7",X"CF",X"DF",X"87",X"03",X"03",X"03",X"17",X"3F",X"FB",
		X"FF",X"FF",X"FF",X"7F",X"FF",X"EB",X"47",X"0F",X"1F",X"3F",X"0F",X"27",X"3F",X"FF",X"F9",X"FF",
		X"FF",X"39",X"1F",X"0F",X"0F",X"07",X"03",X"C3",X"E3",X"E7",X"FF",X"FF",X"73",X"23",X"07",X"0F",
		X"00",X"00",X"06",X"C7",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"F8",X"F8",X"FC",X"FC",X"FF",
		X"FF",X"FF",X"FF",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FF",X"FF",X"FF",
		X"FF",X"FC",X"FC",X"F8",X"F8",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"C7",X"02",X"00",X"00",
		X"00",X"0C",X"1F",X"3F",X"3F",X"1F",X"8F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"3F",X"3F",X"9F",X"9F",X"9F",X"9F",X"9F",X"3F",X"3F",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"8F",X"1F",X"3F",X"3F",X"1F",X"0C",X"00",X"00",X"00",X"00",X"00",X"E0",X"F8",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FE",X"FF",X"BF",X"DF",X"FF",
		X"DF",X"BF",X"FF",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"E0",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"0F",X"7F",X"FF",X"FF",X"FF",X"87",X"03",X"31",X"79",X"79",X"31",
		X"03",X"87",X"FF",X"FF",X"DF",X"1F",X"3F",X"3F",X"3F",X"3F",X"1F",X"DF",X"FF",X"FF",X"87",X"03",
		X"31",X"79",X"79",X"31",X"03",X"87",X"FF",X"FF",X"FF",X"7F",X"0F",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"0F",X"0F",X"1E",X"1E",X"1E",
		X"1F",X"0F",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"0F",X"0F",X"1F",
		X"1E",X"1E",X"1E",X"0F",X"0F",X"07",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3F",X"9F",X"C7",X"C3",X"C3",X"C3",X"C7",X"8F",X"1F",X"07",X"03",X"03",X"1B",X"3F",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"7F",X"FF",X"E7",X"47",X"0F",X"1F",X"3F",X"0F",X"0B",X"1B",X"FB",X"FF",X"FF",
		X"FF",X"7F",X"EF",X"67",X"0F",X"07",X"C3",X"E3",X"E3",X"F7",X"FF",X"FF",X"73",X"23",X"07",X"0F",
		X"00",X"38",X"1D",X"DF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",X"F8",X"F8",X"FC",X"FC",X"FF",
		X"FF",X"FC",X"FC",X"F8",X"F8",X"FB",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"DF",X"0F",X"06",X"00",
		X"FF",X"FF",X"87",X"03",X"11",X"19",X"19",X"11",X"11",X"19",X"19",X"11",X"03",X"87",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"C0",X"80",X"C0",X"C0",X"E0",
		X"E0",X"E0",X"E0",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"1C",X"FF",X"73",X"20",X"00",X"00",X"00",X"00",X"00",X"70",X"FD",X"BF",X"1F",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"00",X"01",X"03",
		X"01",X"30",X"30",X"80",X"8C",X"CC",X"C0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",
		X"E0",X"E0",X"C0",X"C1",X"C3",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"0C",X"07",X"03",X"00",
		X"00",X"00",X"00",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"80",X"E0",X"F0",X"F9",X"FD",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"F8",X"F0",X"C0",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"3F",X"6F",X"CF",X"9F",X"9F",X"CE",X"CE",X"E7",X"E3",X"E3",X"C3",X"C3",X"E3",
		X"FF",X"FF",X"FF",X"FF",X"EB",X"D5",X"AB",X"F7",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"80",X"00",
		X"00",X"00",X"00",X"3E",X"3F",X"3F",X"1F",X"07",X"07",X"0F",X"0F",X"1F",X"3F",X"3F",X"7F",X"7F",
		X"FF",X"EF",X"FF",X"F7",X"FF",X"FF",X"FF",X"F9",X"71",X"73",X"3B",X"3F",X"1F",X"8F",X"87",X"01",
		X"00",X"00",X"00",X"00",X"00",X"60",X"60",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",
		X"C1",X"02",X"04",X"01",X"C3",X"C5",X"01",X"01",X"C3",X"C3",X"03",X"03",X"C3",X"C3",X"03",X"03",
		X"01",X"61",X"61",X"01",X"01",X"30",X"30",X"00",X"00",X"0C",X"0C",X"00",X"00",X"01",X"01",X"00",
		X"00",X"00",X"02",X"01",X"00",X"01",X"83",X"87",X"07",X"07",X"03",X"8F",X"8D",X"C0",X"C3",X"E3",
		X"80",X"C0",X"E0",X"E0",X"C0",X"C0",X"80",X"00",X"00",X"00",X"80",X"E0",X"F0",X"F8",X"FC",X"FF",
		X"07",X"1F",X"3F",X"7F",X"FF",X"CF",X"9F",X"9F",X"E0",X"F8",X"FE",X"7F",X"3F",X"1F",X"0F",X"07",
		X"FF",X"FF",X"DE",X"FF",X"EF",X"FF",X"FF",X"FB",X"73",X"71",X"39",X"3F",X"1F",X"0F",X"0E",X"04",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"60",X"60",X"00",X"00",X"00",X"00",X"00",X"60",X"60",
		X"01",X"02",X"C4",X"C1",X"03",X"05",X"01",X"C1",X"C3",X"03",X"03",X"03",X"63",X"63",X"03",X"03",
		X"01",X"01",X"61",X"61",X"01",X"00",X"30",X"30",X"00",X"18",X"18",X"00",X"03",X"03",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"20",X"E0",X"B8",X"FE",X"38",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"F0",X"F0",X"F0",X"60",X"00",X"00",X"A8",X"50",
		X"AE",X"AA",X"AE",X"51",X"AA",X"15",X"EA",X"AA",X"EA",X"15",X"AA",X"51",X"AE",X"AA",X"AE",X"50",
		X"A8",X"10",X"00",X"40",X"E0",X"E0",X"F4",X"FE",X"FE",X"FC",X"54",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"15",X"1F",X"3F",X"3F",X"17",X"03",X"03",X"00",X"EA",X"15",X"AA",X"51",
		X"AA",X"15",X"EA",X"A8",X"03",X"03",X"43",X"E1",X"E1",X"C0",X"40",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"50",X"F8",X"FC",X"FE",X"7E",X"3E",X"20",X"02",X"15",X"AA",X"51",
		X"AA",X"15",X"0A",X"20",X"3E",X"3E",X"3F",X"1F",X"1F",X"0F",X"05",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"01",X"FA",X"F9",X"FA",X"FA",X"FA",X"F9",X"FA",X"01",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C1",X"07",X"0F",X"1F",
		X"0F",X"07",X"C1",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"18",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"38",X"FE",X"B8",X"E0",X"20",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"54",X"FC",X"FE",X"FE",X"F4",X"E0",X"E0",X"40",X"00",X"10",X"AA",X"50",
		X"AA",X"10",X"00",X"40",X"C0",X"E0",X"E0",X"E0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"40",X"C0",X"E1",X"E1",X"43",X"03",X"03",X"A8",X"EA",X"15",X"AA",X"51",
		X"AA",X"15",X"EA",X"A8",X"03",X"03",X"17",X"3F",X"3F",X"1F",X"15",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"05",X"0F",X"1F",X"1F",X"3F",X"3E",X"3E",X"20",X"0A",X"15",X"AA",X"51",
		X"AA",X"15",X"0A",X"20",X"3E",X"7E",X"FE",X"FC",X"F8",X"50",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"01",X"7A",X"F9",X"FA",X"FA",
		X"FA",X"F9",X"7A",X"01",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"03",
		X"01",X"01",X"00",X"18",X"18",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"01",X"03",X"07",
		X"03",X"01",X"00",X"60",X"60",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"0F",X"3F",
		X"7B",X"D7",X"D7",X"AF",X"AF",X"7E",X"FC",X"F8",X"F8",X"FC",X"EE",X"DF",X"5F",X"B9",X"B9",X"FF",
		X"BF",X"5F",X"FE",X"FE",X"FC",X"F8",X"F0",X"C0",X"06",X"06",X"00",X"00",X"18",X"18",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"E0",X"E0",X"F0",X"F0",X"F8",X"F8",X"F8",
		X"FC",X"FC",X"FC",X"FD",X"FF",X"FF",X"DF",X"FF",X"FF",X"E9",X"F7",X"EF",X"3C",X"3C",X"1F",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"F8",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"DD",X"FF",X"FF",X"FF",X"EF",X"FF",X"7B",X"7F",X"3F",X"1F",X"3F",
		X"44",X"B3",X"EF",X"FF",X"FF",X"FC",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"16",X"FD",X"F9",X"FB",X"7B",X"3F",X"FF",X"7F",X"3F",X"17",X"1B",X"09",X"0D",X"07",
		X"07",X"07",X"23",X"C3",X"83",X"C1",X"C1",X"E1",X"00",X"00",X"03",X"03",X"07",X"07",X"01",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"0F",X"3F",X"F8",X"FF",
		X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"01",X"03",X"07",
		X"07",X"07",X"03",X"0F",X"0D",X"00",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"30",X"00",X"00",X"00",X"00",
		X"00",X"40",X"E0",X"F0",X"B8",X"68",X"9C",X"F8",X"F8",X"FC",X"EE",X"DF",X"5F",X"BF",X"B9",X"F9",
		X"BF",X"5F",X"FE",X"FE",X"FC",X"F8",X"F0",X"C0",X"00",X"00",X"00",X"00",X"0C",X"0C",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"F0",X"F8",X"F8",X"FC",X"FF",X"E9",X"F7",X"EF",X"3F",X"3C",X"1C",X"07",
		X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"00",X"0C",X"7F",X"FF",X"FF",X"F6",X"EE",X"DC",X"D8",
		X"F8",X"F8",X"FE",X"F7",X"FF",X"FF",X"FF",X"FF",X"34",X"25",X"1B",X"0F",X"02",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"05",X"2F",X"7F",X"6F",X"EF",X"EF",X"F7");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;