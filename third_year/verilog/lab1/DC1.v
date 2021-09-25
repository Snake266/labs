module DC1(input [3:0] SW, output [3:0] y);
	reg [2:0] decoder_output;
	always @(SW) begin
		case(SW)
			4'b0000: decoder_output <= 4'b0011;
			4'b0001: decoder_output <= 4'b0010;
			4'b0010: decoder_output <= 4'b0001;
			4'b0011: decoder_output <= 4'b0001;
			4'b0100: decoder_output <= 4'b0001;
			4'b1000: decoder_output <= 4'b0010;
			4'b1000: decoder_output <= 4'b0001;
			4'b1001: decoder_output <= 4'b0001;
			4'b1100: decoder_output <= 4'b0001;
			default: decoder_output <= 4'b0000;
		endcase
	end
	assign y = decoder_output;
endmodule
