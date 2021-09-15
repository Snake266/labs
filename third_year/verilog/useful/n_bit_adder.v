module N_bit_adder
  #(parameter SIZE=32)(
                       input [SIZE-1 : 0] a,
                       input [SIZE-1 : 0] b,
                       input carry_In,
                       output [SIZE-1 : 0] sum,
                       output carry_Out
                       );
   wire [SIZE-2 : 0]          carry;
   f_adder first(.a(a[0]),
                 .b(b[0]),
                 .carry_in(carry_In),
                 .sum(sum[0]),
                 .carry_out(carry[0]));

   genvar                     i;
   generate for(i = 1; i < SIZE-1; i=i+1) begin
      adder(.a(a[i]),
            .b(b[i]),
            .carry_in(carry[i-1]),
            .sum(sum[i]),
            .carry_out(carry[i]));
   end
   endgenerate
   f_adder last(.a(a[SIZE-1]),
                .b(b[SIZE-1]),
                .carry_in(carry[SIZE-2]),
                .sum(sum[SIZE-1]),
                .carry_out(carry_Out));

endmodule // N_bit_adder
