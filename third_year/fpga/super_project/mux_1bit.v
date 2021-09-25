//одно-битный мультиплексер
module MUX_1(
           input [31:0]      first,
           input [31:0]      second,
           input             sel,
           output reg [31:0] y);
   always @(first, second, sel) begin
      case(sel)
        1'b0: y <= first;
        1'b1: y <= second;
        default: y <= first;
      endcase // case (sel)
   end
endmodule // MUX
