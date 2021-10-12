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


// ���������� ������ ��������
`define ADD   5'b00000 // ��������
`define SUB   5'b01000 // ���������
`define SLL   5'b00001 // ����� �����
`define LT    5'b00010 // ������ ���
`define ULT   5'b00011 // ���������� ������ ���
`define XOR   5'b00100 // XOR
`define SRL   5'b00101 // ����� ������
`define USRL  5'b01101 // ����������� ����� ������
`define OR    5'b00110 // ���������� OR
`define AND   5'b00111 // ���������� AND
`define FEQ   5'b11000 // ��������� � ����������� Flag
`define FNEQ  5'b11001 // ����������� � ����������� Flag
`define FLT   5'b11100 // ������ ��� � ����������� � Flag
`define FGTE  5'b11101 // ������ ��� ����� � ����������� Flag
`define FULT  5'b11110 // ����������� ��������� ������ � ����������� Flag
`define FUGTE 5'b11111 // ����������� ��������� ������ ��� ����� � ����������� Flag

module testbecnh();

    wire Flag;
    wire [31:0] Result;
    reg [31:0] A, B;
    reg [4:0] Op;
    
    ALU alu(.A(A), .B(B), .F(Op), .Y(Result), .Flag(Flag));
    initial begin
        ADD_op(4, 4);
        SUB_op(5, 4);
        SLL_op(4, 1);
        FEQ_op(2, 2);
        wrong_ADD_op(5, 1);
        $stop;
    end
    
    //���� ��� �������� ��������
    task ADD_op;
        input [31:0] a, b;
    begin
        A = a;
        B = b;
        Op = `ADD;
        #100;
        if (Result == (a + b))
            $display("(ADD): Passed...");
        else
            $display("(ADD): Failed...");
        #10;
    end
    endtask
    
    //���� ��� �������� ���������
    task SUB_op;
        input [31:0] a, b;
     begin
        A = a;
        B = b;
        Op = `SUB;
        #100;
        if(Result == (a - b))
            $display("(SUB): Passed...");
        else
            $display("(SUB): Failed...");
        #10;
     end
     endtask
     
     //���� ��� �������� ������ �����
     task SLL_op;
        input [31:0] a, b;
     begin
        A = a;
        B = b;
        Op = `SLL;
        #100;
        if(Result == (a << b))
            $display("(SLL): Passed...");
        else 
            $display("(SLL): Failed...");
        #10;
     end
     endtask
     
     //���� ��� �������� FEQ
     task FEQ_op;
        input [31:0] a, b;
     begin
        A = a;
        B = b;
        Op = `FEQ;
        #100;
        if((Result == (a == b)) && (Flag == (a == b)))
            $display("(FEQ): Passed...");
        else
            $display("(FEQ): Failed...");
        #10;
     end
     endtask
     
     task wrong_ADD_op;
        input [31:0] a, b;
     begin
        A = a;
        B = b;
        Op = `ADD;
        #100;
        if (Result == (a + (b+1)))
            $display("(WADD): Not right");
        else
            $display("(WADD): WRong...");
        #10;
     end
     endtask
        
        
endmodule

