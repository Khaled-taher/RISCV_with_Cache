module Adder_Risc(A, B, C, Y);
  //Input and Output Declaration
  input [31:0] A, B;
  input C;
  output [31:0] Y;
  
  //code
  assign Y = A + B + C;

endmodule