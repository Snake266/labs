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
           input [4:0]       F,
           output reg [31:0] Y,
           output reg Flag);
   always @(*) begin
      case(F)
        ADD: begin
           Y <= A + B;
           Flag <= 0;
        end
        SUB: begin
           Y <= A - B;
           Flag <= 0;
        end
        SLL: begin
           Y <= A << B;
           Flag <= 0;
        end
        LT: begin
           Y <= $signed(A) < $signed(B);
           Flag <= 0;
        end
        UTL: begin
           Y <= (A < B);
           Flag <= 0;
        end
        XOR: begin
           Y <= A ^ B;
           Flag <= 0;
        end
        SRL: begin
           Y <= A >> B;
           Flag <= 0;
        end
        USRL: begin
           Y <= $signed(A) >>> $signed (B);
           Flag <= 0;
        end
        OR: begin
           Y <= A | B;
           Flag <= 0;
        end
        AND: begin
           Y <= A & B;
           Flag <= 0;
        end
        FEQ: begin
           Y <= A == B;
           Flag <= A == B;
        end
        FNEQ: begin
           Y <= A != B;
           Flag <= A != B;
        end
        FLT: begin
           Y <= ($signed(A) < $signed(B));
           Flag <= ($signed(A) < $signed(B));
        end

      endcase // case (sel)
   end
endmodule // ALU
