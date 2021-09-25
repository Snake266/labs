module ALU(
           input [31:0]      A,
           input [31:0]      B,
           input [2:0]       F,
           output            Cout,
           output reg [31:0] Y
           );
   // провод, который свяжет 1-битный мультиплексер и сумматор
   wire [31:0]               mux_1_wire;
   // 1-битный сумматор, на вход идет ~B и B, управляет этим F[2]
   MUX_1 mux_1(.d0(~B), .d1(B), .sel(F[2]), .y(mux_1_wire));

   // Провод, который свяжет сумматор и 2-битный мультиплексор
   wire [31:0]               adder_wire;
   bit32_adder adder(.a(A),
                     .b(mux_1_wire),
                     .carry_In(F[2]),
                     .sum(adder_wire),
                     .carry_Out(Cout));

   // Провода, которые свяжут вентили и мультиплесор
   wire [31:0]               or_wire;
   wire [31:0]               and_wire;
   // Вентили подтягиваются к A и выходу первого мультиплексора
   // Их выводы подключены ко второму мультиплексору
   or32_bus or_bus(.a(A), .b(mux_1_wire), or_wire);
   and32_bus and_bus(.a(A), .b(mux_1_wire), and_wire);

   // Сам мультиплексер
   MUX_2 mux_2(.d0(and_wire),
               .d1(or_wire),
               .d2(adder_wire),
               .d3(), // Спросить как сделать zero extend и дописать
               .sel(F[1:0]),
               .y(Y));


endmodule // ALU
