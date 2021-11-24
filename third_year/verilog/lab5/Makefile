SOURCES=imports.v fsm.v fifo.v transmitter.v main.v testbench.v

zip: all execute
	zip -l -1 Baturin-RT-31_lab5.zip *

execute: all
	vvp lab5.vvp -lxt2

all:
	iverilog -Wall -o lab5.vvp $(SOURCES)

clean:
	rm  *.vvp *.vcd *.zip
