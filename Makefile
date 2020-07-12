PROJECT=led_pulse_0xA5
export PROJECT

include system.make

.PHONY: project gui build 

project:
	make -C build project
gui:
	make -C build gui
bitfile: 
	make -C build bitfile
	${VIVADO_COMMAND} -mode batch -source tcl/write_mcs.tcl -tclargs ${PROJECT}
	
clean:
	make -C build clean
	-rm *.{jou,log}
