#TCL Script to program a .bit file onto NetFPGA 1G CML FPGA (RAM)
#Author: Doug Summerville

puts "This takes about a minute to complete..."
puts [pwd]
puts [lindex $argv 0]
open_hw
connect_hw_server
open_hw_target
current_hw_device [get_hw_devices xc7k325t_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7k325t_0] 0]
set_property PROBES.FILE {} [get_hw_devices xc7k325t_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7k325t_0]
set_property PROGRAM.FILE [lindex $argv 0] [get_hw_devices xc7k325t_0]
program_hw_devices [get_hw_devices xc7k325t_0]
refresh_hw_device [lindex [get_hw_devices xc7k325t_0] 0]
quit
