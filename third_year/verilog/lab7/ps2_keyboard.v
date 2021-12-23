`include "defines.v"
module ps2_keyboard(
                    input areset,
                    input clk_50,
                    input ps2_clk,
                    input ps2_dat,
                    output reg valid_data,
                    output [7:0] data
                    );
   reg [8:0]                     shift_reg;
   reg [3:0]                     count_bit;
   assign data = shift_reg[7:0];

   function parity_calc;
      input [7:0]                a;
      parity_calc = ~(a[0] ^ a[1] ^ a[2] ^ a[3] ^ a[4] ^ a[5] ^ a[6] ^ a[7]);
   endfunction // parity_calc

   reg [9:0]                     ps2_clk_detect;

   always @(posedge clk_50 or posedge areset) begin
      if(areset) ps2_clk_detect <= 10'd0;
      else ps2_clk_detect <= {ps2_clk, ps2_clk_detect[9:1]};
   end

   wire ps2_clk_negedge = &ps2_clk_detect[4:0] && &(~ps2_clk_detect[9:5]);

   wire [1:0] state;
   state_machine sm(.areset(areset),
                    .clk_50(clk_50),
                    .ps2_dat(ps2_dat),
                    .count_bit(count_bit),
                    .ps2_clk_negedge(ps2_clk_negedge),
                    .state(state));

   always @(posedge clk_50 or posedge areset) begin
      if(areset) valid_data <= 1'b0;
      else if(ps2_clk_negedge)
        if(ps2_dat
           && parity_calc(shift_reg[7:0]) == shift_reg[8]
           && state == `CHECK_PARITY_STOP_BITS) valid_data <= 1'b1;
        else valid_data <= 1'b0;
   end

   always @(posedge clk_50 or posedge areset) begin
      if(areset) shift_reg <= 9'b0;
      else if(ps2_clk_negedge)
        if(state == `RECEIVE_DATA) shift_reg <= {ps2_dat, shift_reg[8:1]};
   end

   always @(posedge clk_50 or posedge areset) begin
      if(areset) count_bit <= 4'b0;
      else if(ps2_clk_negedge) begin
        if(state == `RECEIVE_DATA) count_bit <= count_bit + 4'b1;
        else count_bit <= 4'b0;
      end
   end
endmodule // ps2_keyboard
