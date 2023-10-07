module DataPath(clk, rst, BranchD, JumpD, MemWriteD, MemReadD, ALUSrcD, RegWriteD, PctargetSrcD, ResultSrcD, ImmSrcD, ALUControlD, 
InstructionF, Mem_RDM, ALUoutM, StallD, StallF, FlushD, FlushE, ForwardAE, ForwardBE, Rs1E, Rs2E,
RdE, RdM, RdW, RegWriteM, RegWriteW, ResultSrcE_0, PCSrcE, InstructionD, MemWriteM, MemReadM, PCF, RD2_Reg_File_aft_muxM, Mem_Stall);
  input clk, rst, BranchD, JumpD, MemWriteD, MemReadD, ALUSrcD, RegWriteD, PctargetSrcD, StallD, StallF, FlushD, FlushE, Mem_Stall;
  input [1:0] ResultSrcD, ImmSrcD, ForwardAE, ForwardBE;
  input [2:0] ALUControlD;
  input [31:0] InstructionF, Mem_RDM;
  output ResultSrcE_0, PCSrcE, RegWriteM, RegWriteW, MemWriteM, MemReadM;
  output [31:0] ALUoutM, RD2_Reg_File_aft_muxM, InstructionD;
  output [31:0] PCF;
  output [4:0] Rs1E, Rs2E, RdE, RdM, RdW;

  wire [31:0] ResultW, RD1_Reg_FileD, RD2_Reg_FileD, PCPlus4F, ImmExtE, SrcA_PCtargetE, PCtargetE, ImmExtD, RD1_Reg_File_aft_muxE,
  B_ALUE, ALUoutE, RD1_Reg_FileE, RD2_Reg_File_aft_muxE, RD2_Reg_FileE, PCE, ALUoutW, Mem_RDW, PCPlus4W, PCF_dash, PCD, PCPlus4D, PCPlus4E, PCPlus4M;
  wire [2:0] ALUControlE;
  wire [1:0] ResultSrcW, ResultSrcE, ResultSrcM;
  wire PctargetSrcE, ALUSrcE, Func3_0E, BranchE, JumpE, RegWriteE, MemWriteE, MemReadE;
  
  Register_File Register_File_instance(clk, InstructionD[19:15], InstructionD[24:20], RdW, ResultW, RegWriteW, RD1_Reg_FileD, RD2_Reg_FileD);
  Adder_Risc Adder_PCPlus4_instance(PCF, 32'h0000_0004, 1'b0, PCPlus4F);
  Adder_Risc Adder_PCtarget_instance(ImmExtE, SrcA_PCtargetE, 1'b0, PCtargetE);
  Extend Extend_instance(InstructionD[31:7], ImmSrcD, ImmExtD);
  ALU ALU_instance(RD1_Reg_File_aft_muxE, B_ALUE, ALUControlE, ALUoutE, ZeroE);

  assign RD1_Reg_File_aft_muxE = (ForwardAE == 2'b00)? RD1_Reg_FileE :
  (ForwardAE == 2'b01)? ResultW :
  (ForwardAE == 2'b10)? ALUoutM : RD1_Reg_FileE;

  assign RD2_Reg_File_aft_muxE = (ForwardBE == 2'b00)? RD2_Reg_FileE :
  (ForwardBE == 2'b01)? ResultW :
  (ForwardBE == 2'b10)? ALUoutM : RD2_Reg_FileE;

  assign SrcA_PCtargetE = (PctargetSrcE == 1'b0)? PCE : RD1_Reg_File_aft_muxE;
  assign B_ALUE = (ALUSrcE == 1'b0)? RD2_Reg_File_aft_muxE : ImmExtE;

  assign ResultW =
  (ResultSrcW == 2'b00)? ALUoutW :
  (ResultSrcW == 2'b01)? Mem_RDW :
  (ResultSrcW == 2'b10)? PCPlus4W : ALUoutW;

  assign PCF_dash = (PCSrcE == 1'b0)? PCPlus4F : PCtargetE;
  assign PCSrcE = (((Func3_0E ^ ZeroE) & BranchE) | JumpE);
  assign ResultSrcE_0 = ResultSrcE[0];

  ff_F_dash2F ff_F_dash2F_instance(clk, rst, StallF, PCF_dash, PCF, Mem_Stall);
  ff_F2D ff_F2D_instance(clk, InstructionF, PCF, PCPlus4F, StallD, FlushD, InstructionD, PCD, PCPlus4D, Mem_Stall);
  ff_D2E_hazard ff_D2E_hazard_instance(clk, RegWriteD, ResultSrcD, MemWriteD, MemReadD, JumpD, BranchD, InstructionD[12], ALUControlD, ALUSrcD, RD1_Reg_FileD,
      RD2_Reg_FileD, PCD, InstructionD[11:7], ImmExtD, PCPlus4D, PctargetSrcD, InstructionD[19:15], InstructionD[24:20], FlushE, RegWriteE, ResultSrcE,MemWriteE,
      MemReadE, JumpE, BranchE, Func3_0E, ALUControlE, ALUSrcE, RD1_Reg_FileE, RD2_Reg_FileE, PCE, RdE, ImmExtE, PCPlus4E, PctargetSrcE, Rs1E, Rs2E, Mem_Stall);
  ff_E2M ff_E2M_instance(clk, RegWriteE, ResultSrcE, MemWriteE, MemReadE, ALUoutE, RD2_Reg_File_aft_muxE, RdE, PCPlus4E,RegWriteM, ResultSrcM, MemWriteM, MemReadM,
      ALUoutM, RD2_Reg_File_aft_muxM, RdM, PCPlus4M, Mem_Stall);
  ff_M2W ff_m2w_instance(clk, RegWriteM, ResultSrcM, ALUoutM, Mem_RDM, RdM, PCPlus4M, RegWriteW, ResultSrcW, ALUoutW, Mem_RDW, RdW, PCPlus4W, Mem_Stall);
        
endmodule