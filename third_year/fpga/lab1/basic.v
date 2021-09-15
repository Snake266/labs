module basic(
             input BTNC,
             input [15:0] SW,
             output [8:0] LED
             );
   bit8_adder a(SW[7:0], SW[15:8], BTNC, LED[7:0], LED[8]);
endmodule // basic
