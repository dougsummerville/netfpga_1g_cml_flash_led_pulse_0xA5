# Makefile to build NetFPGA 1G CML Reference Nic using Vivado
#
# Douglas Summerville, Binghamton University
#
PROJECT_NAME=netfpga_1g_cml_${PROJECT}
PROJECT_FILE=project/${PROJECT_NAME}.xpr
BITFILE=project/${PROJECT_NAME}.runs/impl_1/${PROJECT}.bit

gui: project
	${VIVADO_COMMAND} ${PROJECT_FILE}

project: |${PROJECT_FILE}

${PROJECT_FILE}: 
	cp -ar ../src .
	${VIVADO_COMMAND} -mode batch -source ../tcl/create_project.tcl -tclargs ${PROJECT}

bitfile: ${BITFILE}

${BITFILE}: |${PROJECTFILE} 
	${VIVADO_COMMAND} -mode batch -source ../tcl/build_project.tcl -tclargs ${PROJECT}
	cp ${BITFILE} ../bitfiles

clean:
	-find . -type f -a -not -name Makefile -exec rm {} \;
	-find . -depth -type d -a -not -name . -exec rmdir {} \;

