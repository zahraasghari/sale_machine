library ieee;
use ieee.std_logic_1164.all;
entity sale_machine is

                      port(rst,clk: in std_logic;
							      cd,cw,db,cb: in std_logic;
							      cr_o,dd_o: out std_logic
							      );
								  
end;

architecture bhv of sale_machine is

                      type states is (s0,s1,s2,s3,s4);
                      signal cs,ns:states;
							 
begin

                      process(rst,clk)
							 
                      begin
							 
                           if (rst='1') then
									                 cs <= s0;
														  
									elsif (rising_edge(clk)) then
									                 cs<=ns;
									end if;
									
                      end process;
							 
process(cs,cw,db,cb,cd)

begin
                      case cs is
							       
									 when s0 => cr_o<='0';dd_o<='0';
									               if cb='1' then ns<=s1;
														elsif db='1' then ns<=s2;
														elsif cd='1' then ns<=s3;
														else ns<=s0;
														end if;
									 when s1 => cr_o<='1'; dd_o<='0';
									               ns<=s0;
									 when s2 => cr_o<='0';dd_o<='0';
									               if cw='0' then ns<=s0;
														else ns<=s4;
														end if;
									 when s3 => cr_o<='0';dd_o<='0';
                                          if cw='1' then ns<=s1;
														else ns<=s0;
														end if;
									 when s4 => cr_o<='0';dd_o<='1';
									               ns<=s0;
							end case;
									 
									               
									 
									 
									 



end process;
end  bhv;
