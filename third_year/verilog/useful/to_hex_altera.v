module to_hex(input [3:0] bin, output [6:0] HEX);
	reg [6:0] decoder_output;
	always @(*) begin
		case(bin)
			4'b0000: decoder_output <= 7'b1000000; //0
			4'b0001: decoder_output <= 7'b1111001; //1
			4'b0010: decoder_output <= 7'b0100100; // 2
			4'b0011: decoder_output <= 7'b0110000; // 3
			4'b0100: decoder_output <= 7'b0011001; // 4
			4'b0101: decoder_output <= 7'b0010010; // 5
			4'b0110: decoder_output <= 7'b0000010; // 6
			4'b0111: decoder_output <= 7'b1111000; // 7
			4'b1000: decoder_output <= 7'b0000000; // 8
			4'b1001: decoder_output <= 7'b0010000; // 9
			4'b1010: decoder_output <= 7'b0001000; // A
			4'b1011: decoder_output <= 7'b0000011; // b
			4'b1100: decoder_output <= 7'b1000110; // C
			4'b1101: decoder_output <= 7'b0100001; // d
			4'b1110: decoder_output <= 7'b0000110; // E
			4'b1111: decoder_output <= 7'b0001110; // F
			default: decoder_output <= 7'b1111111; // Empty
		endcase
	end
	assign HEX = decoder_output;
endmodule
