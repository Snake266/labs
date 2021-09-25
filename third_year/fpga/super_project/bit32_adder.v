module bit32_adder(
                   input [31 : 0] a,
                   input [31 : 0] b,
                   input carry_In,
                   output [31 : 0] sum,
                   output carry_Out
                   );
   wire [30 : 0]          carry;
   f_adder first(.a(a[0]),
                 .b(b[0]),
                 .carry_in(carry_In),
                 .sum(sum[0]),
                 .carry_out(carry[0]));

   genvar                i;
   generate for(i = 1; i < 31; i=i+1) begin
      adder(.a(a[i]),
            .b(b[i]),
            .carry_in(carry[i-1]),
            .sum(sum[i]),
            .carry_out(carry[i]));
   end
   endgenerate
   adder last(.a(a[31]),
              .b(b[31]),
              .carry_in(carry[30]),
              .sum(sum[31]),
              .carry_out(carry_Out));
endmodule // bit32_adder
