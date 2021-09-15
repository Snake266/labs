module MUX(
           input []   first,
           input []   second,
           input []   third,
           input []   sel,
           output reg p[] y);
   always @(first, second, third, sel) begin
      case(sel)
        2'b00: y <= first;
        2'b01: y <= second;
        2'b10: y <= third;
        default: y <= first;
      endcase // case (sel)
   end
endmodule // MUX
