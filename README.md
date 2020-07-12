NetFPGA 1G CML project that creates an alternating pattern 0xA,0x5,0xA... on the four LEDs.  This simple project may be useful to troubleshoot the various programming vectors for the board, which provide no indication of which program source was used to configure the FPGA; for example, this can be place in the BPI flash to provide an indication that programming via the USB drive did not succeed.  The *bitfiles* directory contains prebuilt .bit and a .mcs program file.

The project was created with Vivado 2018.3.  Later versions of Vivado may required to upgrade the clock wizard IP.  In that case, build the project, open it in the gui, and update the IP.

If you want to build the porject, edit the file system.make to match your environment.  The the following make targets are available

*clean
*project : creates the project on disk to be opened if you want to explore/modify/etc.
*bitfile : creates the bitfiles (.bit and .mcs)
*gui : opens the project in Vivado gui
