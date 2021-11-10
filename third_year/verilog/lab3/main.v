module main(input sw,
            input        clk,
            input        start_stop_1,
//            input        submit,
            input        rst,
            output [6:0] hex0,
            output [6:0] hex1,
            output [6:0] hex2,
            output [6:0] hex3);
   reg [2:0]             button_sync_1;
   wire                  button_was_pressed_1;

   always @(posedge clk) begin
      button_sync_1[0] <= start_stop_1;
      button_sync_1[1] <= button_sync_1[0];
      button_sync_1[2] <= button_sync_1[1];
   end
   assign button_was_pressed_1 = ~button_sync_1[2] & button_sync_1[1];


   reg [2:0] rst_sync;
   wire      rst_prsd;
   always @(posedge clk) begin
	  rst_sync[0] <= rst;
		rst_sync[1] <= rst_sync[0];
		rst_sync[2] <= rst_sync[1];
   end
   assign rst_prsd = ~rst_sync[2] & rst_sync[1];

   wire [3:0] hundredths_1;
   wire [3:0] tenths_1;
   wire [3:0] seconds_1;
   wire [3:0] ten_seconds_1;
   stopwatch watch(.reset(rst_prsd),
                    .btn_prs(button_was_pressed_1),
                    .clk(clk),
                    .hundredths_counter(hundredths_1),
                    .tenths_counter(tenths_1),
                    .seconds_counter(seconds_1),
                    .ten_seconds_counter(ten_seconds_1));

   reg [2:0]   button_sync_2;
   wire        button_was_pressed_2;

   always @(posedge clk) begin
      button_sync_2[0] <= start_stop_2;
      button_sync_2[1] <= button_sync_2[0];
      button_sync_2[2] <= button_sync_2[1];
   end
   assign button_was_pressed_2 = ~button_sync_2[2] & button_sync_2[1];

   desh d1(hundredths_1, hex0);
   desh d2(tenths_1, hex1);
   desh d3(seconds_1, hex2);
   desh d4(ten_seconds_1, hex3);
endmodule
