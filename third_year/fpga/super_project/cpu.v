`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2021 12:27:08
// Design Name: 
// Module Name: cpu
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


module cpu(
           input         clk,
           input         rst,
           input [31:0]  in,
           output [31:0] out
           );
   wire [31:0]           se;
   wire [31:0]           inst;
   wire [31:0]           rd1, rd2, result;
   reg [31:0]            write_data;
   reg [7:0]             PC = 0;
   wire                  flag;
    
   assign out = rd1;
    
   instruction_memory im(.a(PC), .rd(inst));
    
   register_file rf(.clk(clk),
                    .a1(inst[22:18]),
                    .a2(inst[17:13]),
                    .a3(inst[4:0]),
                    .we3(inst[29] | inst[28]),
                    .wd3(write_data),
                    .rd1(rd1),
                    .rd2(rd2));
                     
   ALU aLu(.A(rd1), .B(rd2), .F(inst[27:23]), .Y(result), .Flag(flag));
    
   assign se = {{9{inst[12]}}, inst[27:5]};
    
   always @(*) begin
      case(inst[29:28])
        2'b01: write_data <= in;
        2'b10: write_data <= out;
        2'b11: write_data <= result;
      endcase
   end
    
   always @(posedge clk) begin
      if((flag & inst[30]) | inst[31]) PC <= PC + inst[12:5];
      else PC <= PC + 8'b00000001;
      if (rst == 1) PC <= 0;
   end
endmodule
