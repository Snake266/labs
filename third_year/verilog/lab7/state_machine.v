`include "defines.v"
module state_machine(
                     input     clk,
                     input     rst,
                     input     valid,
                     input reg enable
                     );
   reg                         state;
   always @(posedge clk or posedge rst) begin
      case(state)
        `DISABLED: begin
           in = 0;
           if(valid == 1) state <= `WORKING;
        end
        `WORKING: begin
           enable = 1;
           if(rst) state <= `DISABLED;
        end
        default: state <= DISABLED;
      endcase // case (state)
   end // always @ (posedge clk or posedge rst)
endmodule // state_machine
