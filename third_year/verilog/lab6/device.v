module device(
              input        clk_50,
              input        ps2_clk,
              input        areset,
              input        ps2_dat,
              output [6:0] hex0,
              output [6:0] hex1
              );
   wire                    valid;
   wire [7:0]              keys;
   ps2_keyboard kbd(.areset(areset),
                    .clk_50(clk_50),
                    .ps2_clk(ps2_clk),
                    .ps2_dat(ps2_dat),
                    .valid_data(valid),
                    .data(keys));

   reg [3:0]               disp0, disp1;
   to_hex d0(.in(disp0), .hex(hex0[6:0]));
   to_hex d1(.in(disp1), .hex(hex1[6:0]));

   always @(posedge valid) begin
      case (keys)
        `KEYCODE_W, `KEYCODE_S, `KEYCODE_X, `KEYCODE_E, `KEYCODE_D, `KEYCODE_C: begin
           disp0 <= keys[3:0];
           disp1 <= keys[7:4];
        end
      endcase // case (keys)
   end
endmodule // device
