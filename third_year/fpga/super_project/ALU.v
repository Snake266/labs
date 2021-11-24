`timescale 1ns / 1ps

// Обьявление нужных операций
`define ADD   5'b00000 // сложение
`define SUB   5'b01000 // вычитание
`define SLL   5'b00001 // сдвиг влево
`define LT    5'b00010 // меньше чем
`define ULT   5'b00011 // безнаковое меньше чем
`define XOR   5'b00100 // XOR
`define SRL   5'b00101 // сдвиг вправо
`define USRL  5'b01101 // беззнаковый сдвиг вправо
`define OR    5'b00110 // Логический OR
`define AND   5'b00111 // Логический AND
`define FEQ   5'b11000 // Равенство с присвоением Flag
`define FNEQ  5'b11001 // Неравенство с присвоением Flag
`define FLT   5'b11100 // Меньше чем с присвоением в Flag
`define FGTE  5'b11101 // Больше или равно с присвоением Flag
`define FULT  5'b11110 // Беззнаковое сравнение меньше с присвоением Flag
`define FUGTE 5'b11111 // Беззнаковое сравнение больше или равно с присвоением Flag

module ALU(
           input [31:0]      A,
           input [31:0]      B,
           input [4:0]       ALUOp,
           output reg [31:0] Result,
           output reg Flag);
   always @(*) begin
      case(ALUOp)
        `ADD: begin
           Result <= A + B;
           Flag <= 0;
        end
        `SUB: begin
           Result <= A + ~B + 1;
           Flag <= 0;
        end
        `SLL: begin
           Result <= A << B;
           Flag <= 0;
        end
        `LT: begin
           Result <= $signed(A) < $signed(B);
           Flag <= 0;
        end
        `ULT: begin
           Result <= (A < B);
           Flag <= 0;
        end
        `XOR: begin
           Result <= A ^ B;
           Flag <= 0;
        end
        `SRL: begin
           Result <= A >> B;
           Flag <= 0;
        end
        `USRL: begin
           Result <= $signed(A) >>> $signed (B);
           Flag <= 0;
        end
        `OR: begin
           Result <= A | B;
           Flag <= 0;
        end
        `AND: begin
           Result <= A & B;
           Flag <= 0;
        end
        `FEQ: begin
           Result <= A == B;
           Flag <= A == B;
        end
        `FNEQ: begin
           Result <= A != B;
           Flag <= A != B;
        end
        `FLT: begin
           Result <= ($signed(A) < $signed(B));
           Flag <= ($signed(A) < $signed(B));
        end
        `FGTE: begin
           Result <= ($signed(A) >= $signed(B));
           Flag <= ($signed(A) >= $signed(B));
        end
        `FULT: begin
           Result <= (A < B);
           Flag <= (A < B);
        end
        `FUGTE: begin
           Result <= (A >= B);
           Flag <= (A >= B);
        end
      endcase // case (sel)
   end
endmodule // ALU
