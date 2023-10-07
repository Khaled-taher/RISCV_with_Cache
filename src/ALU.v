module ALU(A, B, ALUcontrol, ALUout, Zero);
  //Input an OUtput Declaration
  input [31:0] A;
  input [31:0] B;
  input [2:0] ALUcontrol;
  output reg [31:0] ALUout;
  output reg Zero;

  //signal Declaration
  wire [31:0] B_dash;
  wire [31:0] adder_out;

  //Code 
  assign B_dash = (ALUcontrol[0] == 1'b1)? ~B : B;
  Adder_Risc Adder_Risc_instance(A, B_dash, ALUcontrol[0], adder_out);

  always @(*)
  begin
    case(ALUcontrol)
      3'b000:    ALUout = adder_out;
      3'b001:	 ALUout = adder_out;
      3'b010:    ALUout = A & B;
      3'b011:    ALUout = A | B;
      3'b101:    ALUout = {{31{1'b0}}, adder_out[31]};
      default:   ALUout = adder_out;
    endcase
    
    if (ALUout == 31'h0000_0000)
      Zero = 1'b1;
    else
      Zero = 1'b0;    
  end
endmodule