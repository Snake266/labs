`timescale 1ns / 1ps
module stopwatch(
                 input            reset,
                 input            btn_prs,
                 input            clk,
                 input            submit,
                 input            start_time,
                 output reg [3:0] hundredths_counter,
                 output reg [3:0] tenths_counter,
                 output reg [3:0] seconds_counter,
                 output reg [3:0] ten_seconds_counter
             );
   wire                           secs, ten_secs;
   parse_secs(start_time, secs, ten_secs);
   reg                            device_running;
   always @(posedge clk) begin
      if(btn_prs) device_running <= ~device_running;
      if(submit) begin
         seconds_counter = secs;
         tenths_counter = ten_secs;
      end
   end

   reg [17:0]             pulse_counter = 18'd0;
   wire                   hundredths_of_second_passed = (pulse_counter == 18'd239999);
   always @(posedge clk or posedge reset) begin
      if(reset) pulse_counter <= 0;
      else if (device_running | hundredths_of_second_passed)
        if(hundredths_of_second_passed) pulse_counter <= 0;
        else pulse_counter <= pulse_counter + 1;
   end

   wire tenth_of_second_passed = ((hundredths_counter == 4'd9) & hundredths_of_second_passed);
   always @(posedge clk or posedge reset) begin
      if (reset) hundredths_counter <= 0;
      else if(hundredths_of_second_passed)
        if (tenth_of_second_passed) hundredths_counter <= 0;
        else hundredths_counter <= hundredths_counter + 1;
   end

   wire second_passed = ((tenths_counter == 4'd9) & tenth_of_second_passed);
   always @(posedge clk or posedge reset) begin
      if(reset) tenths_counter <= 0;
      else if(tenth_of_second_passed)
        if(second_passed) tenths_counter <= 0;
        else tenths_counter <= tenths_counter + 1;
   end

   wire ten_seconds_passed = ((seconds_counter == 4'd9) & second_passed);
   always @(posedge clk or posedge reset) begin
      if(reset) seconds_counter <= 0;
      else if(second_passed)
        if(ten_seconds_passed) seconds_counter <= 0;
        else seconds_counter <= seconds_counter + 1;
   end

   always @(posedge clk or posedge reset) begin
      if(reset) ten_seconds_counter <= 0;
      else if(ten_seconds_passed)
        if(ten_seconds_counter == 4'd9) ten_seconds_counter <= 0;
        else ten_seconds_counter <= ten_seconds_counter + 1;
   end


endmodule // timer
