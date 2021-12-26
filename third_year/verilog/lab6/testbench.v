`timescale 1ns / 1ps
`include "defines.v"

module testbench;
   reg areset = 1;
   reg clk = 0;
   reg  ps2_clk = 1;
   reg  ps2_dat;
   reg  even;
   wire [6:0] disp0, disp1;

   always begin
      #1 clk = ~clk;
   end

   wire got_a_key;

   device dev(.areset(areset),
              .clk_50(clk),
              .ps2_clk(ps2_clk),
              .ps2_dat(ps2_dat),
              .hex0(disp0),
              .hex1(disp1));

   assign got_a_key = dev.valid;

   task sendkey;
      input [7:0] kc; // short for "keycode"
      begin
         even = ~(kc[0] ^ kc[1] ^ kc[2] ^ kc[3] ^ kc[4] ^ kc[5] ^ kc[6] ^ kc[7]);

         // Here we follow the timings to send a keycode to a controller
         #25 ps2_dat = 0;
         ps2_clk = 0;

         #25 ps2_dat = 0;
         ps2_clk = 1;

         #25 ps2_dat = kc[0];
         ps2_clk = 0;
         #25 ps2_dat = kc[0];
         ps2_clk = 1;

         #25 ps2_dat = kc[1];
         ps2_clk = 0;
         #25 ps2_dat = kc[1];
         ps2_clk = 1;

         #25 ps2_dat = kc[2];
         ps2_clk = 0;
         #25 ps2_dat = kc[2];
         ps2_clk = 1;

         #25 ps2_dat = kc[3];
         ps2_clk = 0;
         #25 ps2_dat = kc[3];
         ps2_clk = 1;

         #25 ps2_dat = kc[4];
         ps2_clk = 0;
         #25 ps2_dat = kc[4];
         ps2_clk = 1;

         #25 ps2_dat = kc[5];
         ps2_clk = 0;
         #25 ps2_dat = kc[5];
         ps2_clk = 1;

         #25 ps2_dat = kc[6];
         ps2_clk = 0;
         #25 ps2_dat = kc[6];
         ps2_clk = 1;

         #25 ps2_dat = kc[7];
         ps2_clk = 0;
         #25 ps2_dat = kc[7];
         ps2_clk = 1;

         #25 ps2_dat = even;
         ps2_clk = 0;
         #25 ps2_dat = even;
         ps2_clk = 1;

         #25 ps2_dat = 1;
         ps2_clk = 0;
         #25 ps2_dat = 1;
         ps2_clk = 1;
      end
   endtask // sendkey

   initial begin
      #10 areset = 0;
      sendkey(8'h3a); // M -- just for testing, wrong key
      sendkey(8'h1c); // A -- testing
      sendkey(`KEYCODE_X); // key from task
      sendkey(`KEYCODE_W); // key from task
      sendkey(`KEYCODE_D); // key from task
      sendkey(`KEYCODE_C); // key from task

      #1000;

      $finish;
   end // initial begin

   initial begin
      $dumpfile("out.vcd");
      $dumpvars;
   end

endmodule // testbench
