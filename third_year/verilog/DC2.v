module DC2(input [3:0] SW, output [3:0] result);
	assign result = ~SW;
endmodule
