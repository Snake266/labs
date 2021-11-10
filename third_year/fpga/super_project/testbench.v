`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2021 12:48:57
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module testbench;
    reg  [31:0] SW;
    wire [31:0] out_res;
    reg  reset, clock;

    cpu processor(.clk(clock), .rst(reset), .out(out_res), .in(SW));

    always begin
        #1 clock = ~clock;
    end

    initial begin
        clock = 0;
        SW = 32'd2;
        $monitor("PC=%d :: Instr=%32b :: OUT = %d", testbench.processor.PC, testbench.processor.inst, out_res);
        #100
        $finish;
    end
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
   end


endmodule
