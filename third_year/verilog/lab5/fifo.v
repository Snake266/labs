module fifo
#(parameter DATA_WIDTH = 8,
  parameter FIFO_DEPTH = 4)( // Для удобного тестирования FIFO_DEPTH=4 вместо 16
            input                         clk,
            input                         rst,
            input                         we,
            input                         re,
            input [DATA_WIDTH-1 : 0]      data_in,
            output reg [DATA_WIDTH-1 : 0] data_out,
            output                        empty,
            output                        full
            );
   reg [3 : 0]        write_ptr;
   reg [3 : 0]        read_ptr;
   reg [3 : 0]        counter;
   // Инициализация указателей нулем
   initial begin
      write_ptr = 0;
      read_ptr = 0;
      counter = 0;
   end

   reg [DATA_WIDTH-1 : 0] mem [0 : FIFO_DEPTH-1];

   assign empty = (counter == 0) ? 1'b1 : 1'b0;
   assign full = (counter == FIFO_DEPTH-1);

   always @(posedge clk) begin
      if (rst) begin
         write_ptr <= 0;
         read_ptr <= 0;
         counter <= 0;
      end
      if(we) begin
         mem[write_ptr] <= data_in;
         write_ptr <= write_ptr + 1;
      end
      if (re) begin
         data_out <= mem[read_ptr];
         read_ptr <= read_ptr + 1;
      end
   end // always @ (posedge clk)

   always @(posedge clk) begin
      if(we) begin
         if(!(we & re)) counter <= counter + 1;
      end
      if(re) begin
         if(!(we & re)) counter <= counter - 1;
      end
   end

   always @(posedge clk) begin
      if (write_ptr == 4) write_ptr = 0;
      if (read_ptr == 4) read_ptr = 0;
   end


endmodule // fifo
