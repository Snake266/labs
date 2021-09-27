// Обьявление нужных операций
`define ADD   5'b00000 // сложение
`define SUB   5'b01000 // вычитание
`define SLL   5'b00001 // сдвиг влево
`define LT    5'b00010 // меньше чем
`define USLT  5'b00011 // безнаковое меньше чем
`define XOR   5'b00100 // XOR
`define SRL   5'b00101 // сдвиг вправо
`define SSRL  5'b01101 // беззнаковый сдвиг вправо
`define OR    5'b00110 // Логический OR
`define AND   5'b00111 // Логический AND
`define FEQ   5'b11000 // Равенство с присвоением Flag
`define FNEQ  5'b11001 // Неравенство с присвоением Flag
`define FLT   5'b11100 // Меньше чем с присвоением в Flag
`define FGTE  5'b11101 // Больше или равно с присвоением Flag
`define FULT  5'b11110 // Беззнаковое сравнение меньше с присвоением Flag
`define FUGTE 5'b11111 // Беззнаковое сравнение больше или равно с присвоением Flag

module ALU_MUX(
           input [31:0]      d0, d1, d2, d3,
                             d4, d5, d6, d7,
                             d8, d9, d10, d11,
                             d12, d13, d14, d15,
           input [4:0]       sel,
           output reg [31:0] y);
   always @(*) begin
      case(sel)
        2'b00: y <= d0;
        2'b01: y <= d1;
        2'b10: y <= d2;
        2'b11: y <= d3;
        default: y <= d0;
      endcase // case (sel)
   end
endmodule // MUX
