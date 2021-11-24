module instruction_memory(
                          input [7:0]   A,
                          output [31:0] RD
                          );
   reg [31:0]                           RAM[0:63];
   assign RD = RAM[A];

   initial $readmemb("binfile.mem", RAM);
endmodule
