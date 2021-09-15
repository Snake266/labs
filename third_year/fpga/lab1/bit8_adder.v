module bit8_adder(
                  input [7 : 0] a,
                  input [7 : 0] b,
                  input carry_In,
                  output [7 : 0] sum,
                  output carry_Out
                  );
   parameter             SIZE = 8;
   wire [SIZE-2 : 0]     carry;

   f_adder first(.a(a[0]),
                 .b(b[0]),
                 .carry_in(carry_In),
                 .sum(sum[0]),
                 .carry_out(carry[0]));

   genvar                i;
   generate for(i = 1; i < SIZE-1; i=i+1) begin
      adder(.a(a[i]),
            .b(b[i]),
            .carry_in(carry[i-1]),
            .sum(sum[i]),
            .carry_out(carry[i]));
   end
   endgenerate
   adder last(.a(a[7]),
              .b(b[7]),
              .carry_in(carry[SIZE-2]),
              .sum(sum[7]),
              .carry_out(carry_Out));
endmodule // bit8_adder
