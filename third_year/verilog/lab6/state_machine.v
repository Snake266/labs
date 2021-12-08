`include "defines.v"
module state_machine(
                     input            areset,
                     input            clk_50,
                     input            ps2_dat,
                     input [3:0]      count_bit,
                     input            ps2_clk_negedge,
                     output reg [1:0] state
                     );
   always @(posedge clk_50 or posedge areset) begin
      if(areset) state <= `IDLE;
      else if(ps2_clk_negedge) begin
         case (state)
           `IDLE: begin
              if(!ps2_dat) state <= `RECEIVE_DATA;
           end

           `RECEIVE_DATA: begin
              if(count_bit == 8)
                state <= `CHECK_PARITY_STOP_BITS;
           end

           `CHECK_PARITY_STOP_BITS: state <= `IDLE;

           default: state <= `IDLE;
         endcase // case (state)
      end // if (ps2_clk_negedge)
   end // always @ (posedge clk_50 or posedge areset)

endmodule // state_machine
