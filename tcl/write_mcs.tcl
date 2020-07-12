set BITFILE [lindex $argv 0]
write_cfgmem -format mcs -interface bpix16 -size 1024 -loadbit "up 0x0 bitfiles/${BITFILE}.bit" -file bitfiles/${BITFILE}.mcs
quit
