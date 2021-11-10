`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2021 10:53:22
// Design Name: 
// Module Name: register_file
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


module register_file(
                     input         clk,
                     input [4:0]   a1,
                     input [4:0]   a2,
                     input [4:0]   a3,
                     input         we3,
                     input [31:0]  wd3,
                     output [31:0] rd1,
                     output [31:0] rd2
    );
   reg [31:0]                      RAM[0:31];
   assign rd1 = (a1 == 5'b00000) ? 32'b0 : RAM[a1];
   assign rd2 = (a2 == 5'b00000) ? 32'b0 : RAM[a2];
    
    always @(posedge clk) if (we3) RAM[a3] <= wd3;
endmodule
