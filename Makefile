PROJECT=led_pulse_0xA5
export PROJECT

include system.make

.PHONY: project gui build bitfile clean program_fpga program_flash

project:
	make -C build project
gui:
	make -C build gui
bitfile: 
	make -C build bitfile
	
program_fpga: bitfiles/${PROJECT}.bit
	( cd build && \
	${VIVADO_COMMAND} -mode batch -source ../tcl/program_netfpga_fpga.tcl -tclargs ../bitfiles/${PROJECT}.bit \
	)
program_bpiflash: bitfiles/${PROJECT}.mcs
	( cd build && \
	${VIVADO_COMMAND} -mode batch -source ../tcl/program_netfpga_bpi_flash.tcl -tclargs ../bitfiles/${PROJECT}.mcs \
	)

bitfiles/${PROJECT}.bit: 
	make -C build bitfile
bitfiles/${PROJECT}.mcs:
	make -C build bitfile

clean:
	make -C build clean
	-rm *.{jou,log}
