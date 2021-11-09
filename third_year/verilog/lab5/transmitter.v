module transmitter(
                   input     clk,
                   input     rst,
                   input reg data,
                   input     start,
                   output    busy,
                   output    tx
                   );

   reg [4:0]                 pulse;
   wire                      second_passed = (pulse == 10 - 3);
   always @ (posedge clk) begin
      if(rst) begin
         pulse <= 0;
         busy <= 0;
      end
      if()
      if(second_passed) begin
         busy <= 0;
         pulse <= 0;
      end

   end

endmodule // transmitter
