module register_10bit(
                      input [9:0] d,
                      input clk,
                      input rst,
                      input en,
                      output reg [9:0] q
                      );
   always @(posedge clk or posedge rst) begin
      if(rst) q <= 0;
      else if(en) q <= d;
   end
endmodule // register_10bit
