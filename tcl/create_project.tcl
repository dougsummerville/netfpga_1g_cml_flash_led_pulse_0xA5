set TOP_NAME [lindex $argv 0]
set PROJECT_NAME "netfpga_1g_cml_$TOP_NAME"
puts $PROJECT_NAME
create_project -name $PROJECT_NAME -force -dir project -part xc7k325tffg676-1
add_files -norecurse src/hdl
add_files -norecurse -fileset constrs_1 src/xdc
foreach ip [ glob -directory src/ip/ -nocomplain */*.xci ] {
	read_ip $ip
}
set_property top $TOP_NAME  [current_fileset]
update_compile_order -fileset sources_1
close_project
quit
