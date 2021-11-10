module main(
            input        clk,
            input        rst,
            input [7:0]  data,
            input        we,
            output       full,
            output [7:0] transmit_data
            );
   wire [7:0]            data_from_fifo_for_transmitter;
   wire                  fifo_is_empty;
   wire                  fifo_re;
   wire                  transmitter_is_busy;
   wire                  start_transaction;
   fsm sm(.clk(clk),
          .busy_tr(transmitter_is_busy),
          .empty_fifo(fifo_is_empty),
          .re_fifo(fifo_re),
          .start_tr(start_transaction));
   fifo fifo_input(.clk(clk),
                   .rst(rst),
                   .we(we),
                   .re(fifo_re),
                   .data_in(data),
                   .data_out(data_from_fifo_for_transmitter),
                   .empty(fifo_is_empty),
                   .full(full));
   transmitter tr(.clk(clk),
                  .rst(rst),
                  .data(data_from_fifo_for_transmitter),
                  .start(start_transaction),
                  .busy(transmitter_is_busy),
                  .tx(transmit_data));
endmodule // main
