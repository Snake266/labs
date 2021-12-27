`timescale 100ns/1ps

module testbench;
   reg rst, clk_50, ps2_clk, ps2_dat;
   wire [15:0] square_wave;

   device lab(
              .rst(rst),
              .clk_50(clk_50),
              .ps2_clk(ps2_clk),
              .ps2_dat(ps2_dat),
              .square_wave(square_wave)
              );

   always #1 clk_50 = ~clk_50;

   always begin
      ps2_clk = ~ps2_clk;
   end

   reg         even;
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
endmodule // testbench
