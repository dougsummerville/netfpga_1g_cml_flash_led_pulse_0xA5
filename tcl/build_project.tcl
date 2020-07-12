set TOP_NAME [lindex $argv 0]
set PROJECT_NAME "netfpga_1g_cml_$TOP_NAME"
cd project
open_project ${PROJECT_NAME}.xpr
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
close_project
quit
