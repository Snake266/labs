module ALU_8(
             input [7:0]      A,
             input [7:0]      B,
             input [2:0]      F,
             output           Cout,
             output reg [7:0] Y);
   wire [7:0]                 mux_1_wire;
   MUX_1 mux_1(.d0(~B), .d1(B), .sel(F[2]), .y(mux_1_wire));

   wire [7:0]                 adder_wire;
   bit8_adder  adder(.a(A),
                     .b(mux_1_wire),
                     .carry_In(F[2]),
                     .sum(adder_wire),
                     .carry_Out(Cout));

   wire [7:0]                 or_wire;
   wire [7:0]                 and_wire;

   or8_bus or_bus(.a(A), .b(mux_1_wire), or_wire);
   and8_bus and_bus(.a(A), .b(mux_1_wire), and_wire);
   MUX_2 mux_2(.d0(and_wire),
               .d1(or_wire),
               .d2(adder_wire),
               .d3(), // Спросить как сделать zero extend и дописать
               .sel(F[1:0]),
               .y(Y));
endmodule // ALU_8
