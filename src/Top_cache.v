module Top(clk, rst, InstructionF, Mem_RDM, MemWriteM, MemReadM, PCF, ALUoutM, RD2_Reg_File_aft_muxM, Mem_Stall);
  //Input and Output Declaration
  input clk, rst, Mem_Stall;
  input [31:0] InstructionF, Mem_RDM; 
  output MemWriteM, MemReadM;
  output [31:0] PCF, ALUoutM, RD2_Reg_File_aft_muxM;

  //Signal Declaration
  wire [31:0] InstructionD;
  wire PCSrcE, RegWriteM, RegWriteW, ResultSrcE_0, FlushE, StallD, StallF, FlushD, PctargetSrcD, RegWriteD, ALUSrcD, MemWriteD, MemReadD, BranchD, JumpD;
  wire [1:0] ForwardAE, ForwardBE, ImmSrcD, ResultSrcD;
  wire [2:0] ALUControlD;
  wire [4:0] Rs1E, Rs2E, RdM, RdW, RdE;

  //Modules Instanciation
  DataPath DataPath_inst(clk, rst, BranchD, JumpD, MemWriteD, MemReadD, ALUSrcD, RegWriteD, PctargetSrcD, ResultSrcD, ImmSrcD, ALUControlD, InstructionF, Mem_RDM,
  ALUoutM, StallD, StallF, FlushD, FlushE, ForwardAE, ForwardBE, Rs1E, Rs2E, RdE, RdM, RdW, RegWriteM, RegWriteW, ResultSrcE_0, PCSrcE, InstructionD,
  MemWriteM, MemReadM, PCF, RD2_Reg_File_aft_muxM, Mem_Stall);
  control_logic control_logic_inst(rst, InstructionD[6:0], InstructionD[14:12], InstructionD[30], BranchD, JumpD, ResultSrcD, MemWriteD, MemReadD, ALUSrcD, ImmSrcD,
  RegWriteD, ALUControlD, PctargetSrcD);
  Hazard_control Hazard_control_instance(rst, Rs1E, Rs2E, InstructionD[19:15], InstructionD[24:20], RdM, RdW, RdE, RegWriteM, RegWriteW, ResultSrcE_0, PCSrcE,
  ForwardAE, ForwardBE, FlushE, StallD, StallF, FlushD);
endmodule