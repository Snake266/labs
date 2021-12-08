SOURCES=ps2_keyboard.v state_machine.v defines.v device.v testbench.v to_hex.v
BIN_FILE=lab6.vvp

zip: compile
	zip -l -1 Baturin-RT-31_lab6.zip *

all: compile execute

execute:
	vvp $(BIN_FILE)


compile:
	iverilog -Wall -o $(BIN_FILE) $(SOURCES)

clean:
	rm  *.vvp *.vcd *.zip
