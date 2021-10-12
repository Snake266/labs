`timescale 1ns / 1ps
module timer_bench();
   reg [3:0] hundredths_c;
   reg [3:0] tenths_c;
   reg [3:0] seconds_c;
   reg [3:0] ten_second_c;
   wire      clk;
   wire      rst;
   wire      btn;

   timer t(.reset(rst),
           .btn_prs(btn),
           .hundredths_counter(hundredths_c),
           .tenths_counter(tenths_c),
           .seconds_counter(seconds_c),
           .ten_second_counter(ten_second_c));
   initial begin
      assign btn = 1;

   end


endmodule // timer_bench
