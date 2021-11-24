SOURCES=ALU.v instruction_memory.v register_file.v cpu.v testbench.v
BIN=cpu.vvp
BIN_OPTIONS=-lxt2


all: execute

execute: compile
	vvp $(BIN) $(BIN_OPTIONS)
compile:
	iverilog -Wall -o cpu.vvp $(SOURCES)
