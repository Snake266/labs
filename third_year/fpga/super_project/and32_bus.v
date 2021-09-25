module and32_bus(
                 input [31:0] a,
                 input [31:0] b,
                 output y
                 );
   assign y = a & b;
endmodule // and32_bus
