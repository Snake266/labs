odule lab1(input [9:0] SW, output [6:0] HEX0);
	wire [3:0] result_dc1;
	wire [3:0] result_dc2;
	wire [3:0] result_f;

	DC1 dc1(.SW(SW[3:0]), .y(result_dc1));
	DC2 dc2(.SW(SW[7:4]), .result(result_dc2));
	F f(.SW(SW[3:0]), .result(result_dc3));

	wire [3:0] wire_mux;
	multiplexer mux(.first(result_dc1),
						 .second(result_dc2),
						 .third(result_f),
						 .fourth(SW[3:0]),
						 .s(SW[9:8]),
						 .y(wire_mux));

	to_hex(wire_mux[3:0], HEX0);
endmodule
