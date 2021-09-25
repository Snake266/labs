//двух-битный мультиплексер
module MUX_2(
           input [31:0]      first,
           input [31:0]      second,
           input [31 : 0]    third,
           input [31:0]      fourth,
           input [1:0]       sel,
           output reg [31:0] y);
   always @(first, second, third, fourth, sel) begin
      case(sel)
        2'b00: y <= first;
        2'b01: y <= second;
        2'b10: y <= third;
        2'b11: y <= fourth;
        default: y <= first;
      endcase // case (sel)
   end
endmodule // MUX
