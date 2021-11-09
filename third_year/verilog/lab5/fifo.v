module fifo
#(parameter DATA_WIDTH = 8,
  parameter FIFO_DEPTH = 16)(
            input                         clk,
            input                         rst,
            input                         we,
            input                         re,
            input [DATA_WIDTH-1 : 0]      data_in,
            output reg [DATA_WIDTH-1 : 0] data_out,
            output                        empty,
            output                        full
            );
   reg [FIFO_DEPTH-1 : 0]        write_ptr;
   reg [FIFO_DEPTH-1 : 0]        read_ptr;
   reg [DATA_WIDTH-1 : 0]        mem [0 : FIFO_DEPTH-1];
   assign empty = (counter == 0);
   assign full = (counter == FIFO_DEPTH-1);

   always @(posedge clk) begin
      if (rst) counter <= 0;
      if(we) begin
         mem[write_ptr] <= data_in;
         write_ptr <= write_ptr + 1;
      end
      if (re) begin
         data_out <= mem[read_ptr];
         read_ptr <= read_ptr + 1;
      end
   end // always @ (posedge clk)
endmodule // fifo
