`timescale 1ns/1ps

module testbench;
reg       reset;
reg       clk = 0;
reg [7:0] data;
wire [7:0] tx;
wire full;
reg write;

wire [4:0] pulse = testbench.mod.my_transmitter.pulse_counter;

always begin
    #1 clk = ~clk;
end

projekt mod(.clk(clk),
          .rst(reset),
          .data(data),
          .full(full),
          .transmit_lane(tx),
          .we(write)
);

initial begin
  reset = 1;
  #2

  reset = 0;
  data = 3;
  write = 1;
  #2

  write = 0;
  #2

  data = 4;
  write = 1;
  #2

  write = 0;
  #2

  data = 5;
  write = 1;
  #2

  write = 0;

  #100
  $stop;
end

initial begin
  $dumpfile("out.vcd");
  $dumpvars;
end

endmodule
