MY_POST_SYNTH_SOURCES += /c/msys64/mingw32/share/yosys/ice40/cells_sim.v

MY_DATA += targets/$(TARGET)/gateware/mem.init

# Dummy- not used.
MY_FIRMWARE = targets/$(TARGET)/firmware.elf

TB_TOP=tinyfpga-soc-no-trigger
DUT_TOP=top
POST_DUT_TOP=top-post
POST_YS=top-post