module multiplexer(input [3:0] first,
						 input [3:0] second,
						 input [3:0] third,
						 input [3:0] fourth,
						 input [1:0] s,
						 output reg [3:0] y);
	always @(first, second, third, s) begin
		case(s)
			2'b00: y <= first;
			2'b01: y <= second;
			2'b10: y <= third;
			2'b11: y <= fourth;
			default: y <= first;
		endcase
	end
endmodule
