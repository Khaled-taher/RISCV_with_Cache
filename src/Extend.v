module Extend(Imm, ImmSrc, ImmExt);
  //Input and Output Declaration
  input [31:7] Imm;
  input [1:0] ImmSrc;
  output reg [31:0] ImmExt;
  
  //Code
  always @(*) begin
    case(ImmSrc)
      3'b00:    ImmExt = {{20{Imm[31]}}, Imm[31:20]};
      3'b01:    ImmExt = {{20{Imm[31]}}, Imm[31:25], Imm[11:7]};
      3'b10:    ImmExt = {{20{Imm[31]}}, Imm[7], Imm[30:25], Imm[11:8], 1'b0};
      3'b11:    ImmExt = {{12{Imm[31]}}, Imm[19:12], Imm[20], Imm[30:21], 1'b0};
      default:  ImmExt = {{20{Imm[31]}}, Imm[31:20]};
    endcase
  end
endmodule