TARGET ?= tinyfpga-soc2

SOURCES = targets/$(TARGET)/lm32_config.v
INCDIRS = -I. -I$(RTL)

# Add user sources/include paths here via MY_SOURCES and MY_INCDIRS.
# Add MY_POST_SYNTH_SOURCES for post synthesis comparison.
# Add MY_PAR_SOURCES for post-PAR comparison.
# Add MY_DATA for any data files besides the firmware.
# Add MY_FIRMWARE for the firmware file you want to use.
# Also define TB_TOP- root name of top level .v file (without extension)
# Also define DUT_TOP- root name of top level dut .v file pre-synthesis
# Also define POST_DUT_TOP- root name of top level dut .v file post-synthesis
# Also define POST_YS- yosys script to generate post-synthesis
# Also define PAR_DUT_TOP- root name of top level dut .v file post-PAR
# Also define PAR_BIT- bitstream to generate post-PAR
include targets/$(TARGET)/config.mk

INCDIRS += $(MY_INCDIRS)

TARGET_DIR = targets/$(TARGET)
GATEWARE_DIR = $(TARGET_DIR)/gateware
BUILD_DIR = build/$(TARGET)

RTL=./extern/lm32/rtl

INCDIRS += -Itargets/$(TARGET)

SOURCES += $(RTL)/lm32_adder.v $(RTL)/lm32_addsub.v $(RTL)/lm32_cpu.v
SOURCES += $(RTL)/lm32_dcache.v $(RTL)/lm32_debug.v $(RTL)/lm32_decoder.v
SOURCES += $(RTL)/lm32_dp_ram.v $(RTL)/lm32_icache.v
SOURCES += $(RTL)/lm32_instruction_unit.v $(RTL)/lm32_interrupt.v
SOURCES += $(RTL)/lm32_jtag.v $(RTL)/lm32_load_store_unit.v
SOURCES += $(RTL)/lm32_logic_op.v $(RTL)/lm32_mc_arithmetic.v
SOURCES += $(RTL)/lm32_multiplier.v $(RTL)/lm32_ram.v $(RTL)/lm32_shifter.v
SOURCES += $(RTL)/lm32_itlb.v $(RTL)/lm32_dtlb.v
SOURCES += $(RTL)/lm32_top.v


all: sim sim-post-synth sim-par

# Convert the firmware to an appropriate format for iverilog.
$(BUILD_DIR)/firmware.hex: $(MY_FIRMWARE)
	mkdir -p $(BUILD_DIR)
	lm32-elf-objcopy -O verilog $(MY_FIRMWARE) $(BUILD_DIR)/firmware.hex


# Pre-synthesis simulation
$(BUILD_DIR)/$(TB_TOP).vvp: $(TARGET_DIR)/$(TB_TOP).v $(GATEWARE_DIR)/$(DUT_TOP).v $(MY_SOURCES) $(BUILD_DIR)/firmware.hex
	mkdir -p $(BUILD_DIR)
	iverilog -o $(BUILD_DIR)/$(TB_TOP).vvp $(INCDIRS) $(SOURCES) $(MY_SOURCES) $(TARGET_DIR)/$(TB_TOP).v $(GATEWARE_DIR)/$(DUT_TOP).v
	cp $(MY_DATA) $(BUILD_DIR)

sim: $(BUILD_DIR)/$(TB_TOP).vvp
	cd $(BUILD_DIR) && vvp $(TB_TOP).vvp


# Post-synthesis simulation
# Dummy target for checking output.
post-synth: $(BUILD_DIR)/$(POST_DUT_TOP).v

# Post-synthesis output verilog
$(BUILD_DIR)/$(POST_DUT_TOP).v: $(GATEWARE_DIR)/$(POST_YS).ys
	mkdir -p $(BUILD_DIR)
	cd $(GATEWARE_DIR) && yosys -q -l ../../../$(BUILD_DIR)/$(POST_DUT_TOP).rpt $(POST_YS).ys

$(BUILD_DIR)/$(TB_TOP)-post-synth.vvp: $(TARGET_DIR)/$(TB_TOP).v $(BUILD_DIR)/$(POST_DUT_TOP).v $(MY_POST_SYNTH_SOURCES) $(BUILD_DIR)/firmware.hex
	mkdir -p $(BUILD_DIR)
	iverilog -DPOST_SYNTH -o $(BUILD_DIR)/$(TB_TOP)-post-synth.vvp $(INCDIRS) $(MY_POST_SYNTH_SOURCES) $(TARGET_DIR)/$(TB_TOP).v $(BUILD_DIR)/$(POST_DUT_TOP).v
	cp $(MY_DATA) $(BUILD_DIR)

sim-post-synth: $(BUILD_DIR)/$(TB_TOP)-post-synth.vvp
	cd $(BUILD_DIR) && vvp $(TB_TOP)-post-synth.vvp


# Post-PAR simulation
par-asc: $(BUILD_DIR)/$(PAR_BIT).asc
par-synth: $(BUILD_DIR)/$(PAR_DUT_TOP).v

$(BUILD_DIR)/$(PAR_DUT_TOP).v: $(BUILD_DIR)/$(PAR_BIT).asc
	mkdir -p $(BUILD_DIR)
	icebox_vlog -l $(BUILD_DIR)/$(PAR_BIT).asc > $(BUILD_DIR)/$(PAR_DUT_TOP).v

$(BUILD_DIR)/$(PAR_BIT).asc: $(GATEWARE_DIR)/$(PAR_BIT).bin
	mkdir -p $(BUILD_DIR)
	iceunpack $(GATEWARE_DIR)/$(PAR_BIT).bin $(BUILD_DIR)/$(PAR_BIT).asc

$(BUILD_DIR)/$(TB_TOP)-par.vvp: $(TARGET_DIR)/$(TB_TOP).v $(BUILD_DIR)/$(PAR_DUT_TOP).v $(MY_PAR_SOURCES) $(BUILD_DIR)/firmware.hex
	mkdir -p $(BUILD_DIR)
	iverilog -DPAR -o $(BUILD_DIR)/$(TB_TOP)-par.vvp $(INCDIRS) $(MY_PAR_SOURCES) $(TARGET_DIR)/$(TB_TOP).v $(BUILD_DIR)/$(PAR_DUT_TOP).v
	cp $(MY_DATA) $(BUILD_DIR)

sim-par: $(BUILD_DIR)/$(TB_TOP)-par.vvp
	cd $(BUILD_DIR) && vvp $(TB_TOP)-par.vvp


clean:
	rm -rf $(BUILD_DIR)
