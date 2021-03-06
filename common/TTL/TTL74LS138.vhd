{\rtf1\ansi\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.17134}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang7 library ieee;\par
\tab use ieee.std_logic_1164.all;\par
\tab use ieee.numeric_std.all;\par
\par
-------------------------------------------------------------------------------\par
-- 74xx138\par
-- 3-to-8 line decoder\par
-------------------------------------------------------------------------------\par
entity LOGIC_74XX138 is\par
\tab port (\par
\tab\tab I_G1  : in  std_logic;\par
\tab\tab I_G2a : in  std_logic;\par
\tab\tab I_G2b : in  std_logic;\par
\tab\tab I_Sel : in  std_logic_vector(2 downto 0);\par
\tab\tab O_Q   : out std_logic_vector(7 downto 0)\par
\tab );\par
end logic_74xx138;\par
\par
architecture RTL of LOGIC_74XX138 is\par
\tab signal I_G : std_logic_vector(2 downto 0) := (others => '0');\par
\par
begin\par
\tab I_G <= I_G1 & I_G2a & I_G2b;\par
\par
\tab xx138 : process(I_G, I_Sel)\par
\tab begin\par
\tab\tab if(I_G = "100" ) then\par
\tab\tab\tab case I_Sel is\par
\tab\tab\tab\tab when "000" => O_Q <= "11111110";\par
\tab\tab\tab\tab when "001" => O_Q <= "11111101";\par
\tab\tab\tab\tab when "010" => O_Q <= "11111011";\par
\tab\tab\tab\tab when "011" => O_Q <= "11110111";\par
\tab\tab\tab\tab when "100" => O_Q <= "11101111";\par
\tab\tab\tab\tab when "101" => O_Q <= "11011111";\par
\tab\tab\tab\tab when "110" => O_Q <= "10111111";\par
\tab\tab\tab\tab when "111" => O_Q <= "01111111";\par
\tab\tab\tab\tab when others => null;\par
\tab\tab\tab end case;\par
\tab\tab  else\par
\tab\tab\tab\tab O_Q <= (others => '1');\par
\tab\tab  end if;\par
\tab end process;\par
end RTL;\par
}
 