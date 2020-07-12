#Constraints for NetFPGA 1G CML Led Pulser
#Doug, Summerville, Binghamton University

set_property PACKAGE_PIN AA3 [get_ports system_clk_p]	
set_property IOSTANDARD LVDS [get_ports system_clk_p]
set_property PACKAGE_PIN AA2 [get_ports system_clk_n] 		
set_property IOSTANDARD LVDS [get_ports system_clk_n]
set_property PACKAGE_PIN  E17  [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN  AF14 [get_ports {led[1]}]		
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property PACKAGE_PIN  F17  [get_ports {led[2]}]	
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN  W19  [get_ports {led[3]}]		
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
