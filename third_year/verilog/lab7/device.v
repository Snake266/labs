`include "defines.v"
module device(
              input rst,
              input clk_50,
              input ps2_clk,
              input ps2_dat,
              output [15:0] square_wave
              );
   // Keyboard
   wire                     valid_data;
   wire [7:0]               data;

   // square
   reg                      enable;
   reg [20:0]               period;
   reg [20:0]               active_period;
   reg [15:0]               volume;
   reg [20:0]               frequency;

   ps2_keyboard kbd(
                    .areset(rst),
                    .clk_50(clk_50),
                    .ps2_clk(ps2_clk),
                    .ps2_dat(ps2_dat),
                    .valid_data(valid_data),
                    .data(data)
                    );

   always @(posedge valid_data) begin
      case(data)
        // What does letter b here? All explanations in defines.v
        `KEYCODE_KP_1: frequency <= `freq_b_c;
        `KEYCODE_KP_2: frequency <= `freq_b_d;
        `KEYCODE_KP_3: frequency <= `freq_b_e;
        `KEYCODE_KP_4: frequency <= `freq_b_f;
        `KEYCODE_KP_5: frequency <= `freq_b_g;
        `KEYCODE_KP_6: frequency <= `freq_b_a;
        `KEYCODE_KP_7: frequency <= `freq_b_b;
      endcase // case (data)
   end // always @ (posedge valid_data)

   square_code sc(
                  .clk(clk_50),
                  .rst(rst),
                  .enable(enable),
                  .full_period(period),
                  .active_period(active_period),
                  .volume(volume),
                  .square_wave(square_wave)
                  );
   state_machine sm(
                    .clk(clk_50),
                    .rst(rst),
                    .valid(valid_data),
                    .enable(enable)
                    );
   always @(posedge frequency or posedge rst) begin
      if(rst) period <= 0;
      else begin
         period = (5000/frequency) - 1;
         active_period = 2;
         volume = 16'ha;
      end
   end
endmodule // device
