module main(
            input switch,
            input start_stop,
            input clk,
            output [6:0] hex0,
            output [6:0] hex1,
            output [6:0] hex2,
            output [6:0] hex3
            );
   reg [2:0]             button_sync;
   wire                  button_was_pressed;

   always @(posedge clk) begin
      button_sync[0] <= start_stop;
      button_sync[1] <= button_sync[0];
      button_sync[2] <= button_sync[1];
   end

   assign button_was_pressed = ~button_sync[2] & button_sync[1];

   //TODO: сделать device running
   reg device_running;


endmodule // main
