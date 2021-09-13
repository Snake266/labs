module f (
          input [3:0] SW,
          output y
          );
   assign y = ~(SW[0] & SW[1] ^ (~SW[2]) & (~SW[3]));
endmodule
