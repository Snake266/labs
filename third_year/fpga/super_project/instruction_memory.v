`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 12:42:55
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
                          input [7:0]   a,
                          output [31:0] rd
                          );
   reg [31:0]                           RAM[0:63];
   assign rd = RAM[a];
   initial $readmemb("binfile.mem", RAM);
endmodule
