# Makefile to build NetFPGA 1G CML Reference Nic using Vivado
#
# Douglas Summerville, Binghamton University
#
.PHONY: gui project bitfile clean

PROJECT_NAME=netfpga_1g_cml_${PROJECT}
PROJECT_FILE=project/${PROJECT_NAME}.xpr
BITFILE=project/${PROJECT_NAME}.runs/impl_1/${PROJECT}.bit

project: ${PROJECT_FILE}

gui: ${PROJECT_FILE}
	${VIVADO_COMMAND} ${PROJECT_FILE}

${PROJECT_FILE}: 
	cp -ar ../src .
	${VIVADO_COMMAND} -mode batch -source ../tcl/create_project.tcl -tclargs ${PROJECT}

bitfile: ${BITFILE}

${BITFILE}: |${PROJECTFILE} 
	${VIVADO_COMMAND} -mode batch -source ../tcl/build_project.tcl -tclargs ${PROJECT}
	cp ${BITFILE} ../bitfiles
	${VIVADO_COMMAND} -mode batch -source ../tcl/write_mcs.tcl ${BITFILE}
	cp ${PROJECT}.mcs ../bitfiles

clean:
	-find . -type f -a -not -name Makefile -exec rm {} \;
	-find . -depth -type d -a -not -name . -exec rmdir {} \;
