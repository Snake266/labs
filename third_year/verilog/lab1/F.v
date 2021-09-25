module F(input [3:0] SW, output [3:0] result);
	assign result[3:1] = 0;
	assign result[0] = ~(SW[0] & SW[1] ^ (~SW[2]) & (~SW[3]));
endmodule
