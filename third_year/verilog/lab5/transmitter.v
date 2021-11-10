module transmitter
#(parameter F = 10)(
                   input            clk,
                   input            rst,
                   input [7:0]      data,
                   input            start,
                   output reg       busy,
                   output reg [7:0] tx
                   );

   reg [4:0]                 pulse;
   wire                      second_passed = (pulse == F - 3);
   always @ (posedge clk) begin
      if(rst) begin
         pulse <= 0;
         busy <= 0;
      end
      if(start | busy) begin
         busy <= 1;
         tx <= data;
         pulse <= pulse + 1;
      end
      if(second_passed) begin
         busy <= 0;
         pulse <= 0;
      end

   end

endmodule // transmitter
