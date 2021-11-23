`timescale 1ns/1ps

module testbench;
   reg       reset;
   reg       clk = 0;
   reg [7:0] data;
   wire [7:0] tx;
   wire       full;
   reg        write;

   wire [4:0] pulse = testbench.m.tr.pulse;

   always begin
      #1 clk = ~clk;
   end

   main m(.clk(clk),
          .rst(reset),
          .data(data),
          .full(full),
          .transmit_data(tx),
          .we(write)
);

initial begin
   reset = 1;
   #2 reset = 0;
   data = 1;
   write = 1;

   #2 write = 0;

   #2 data = 2;
   write = 1;

   #2 write = 0;

   #2 data = 3;
   write = 1;

   #2 write = 0;

   #2 data = 4;
   write = 1;

   #2 write = 0;

   #2 data = 5;
   write = 1;

   #2 write = 0;

  #100
  $finish;
end

initial begin
  $dumpfile("out.vcd");
  $dumpvars;
end

endmodule
