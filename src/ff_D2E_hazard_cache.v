module ff_D2E_hazard (clk, RegWriteD, ResultSrcD, MemWriteD, MemReadD, JumpD, BranchD, Func3_0D, ALUControlD, ALUSrcD, RD1D, RD2D, PCD, RdD, ImmExtD, PCPlus4D, PctargetSrcD, Rs1D,
        Rs2D, FlushE, RegWriteE, ResultSrcE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUControlE, ALUSrcE, RD1E, RD2E, PCE, RdE, ImmExtE, PCPlus4E, PctargetSrcE, Rs1E, Rs2E,
        Mem_Stall);
    input clk, RegWriteD, MemWriteD, MemReadD, JumpD, BranchD, Func3_0D, ALUSrcD, PctargetSrcD, FlushE, Mem_Stall;
    input [31:0] RD1D, RD2D, PCD, ImmExtD, PCPlus4D;
    input [4:0] RdD, Rs1D, Rs2D;
    input [1:0 ]ResultSrcD;
    input [2:0] ALUControlD;
    output reg RegWriteE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUSrcE, PctargetSrcE;
    output reg[31:0] RD1E, RD2E, PCE, ImmExtE, PCPlus4E;
    output reg[4:0] RdE, Rs1E, Rs2E;
    output reg [1:0 ]ResultSrcE;
    output reg [2:0] ALUControlE;

    always @(posedge clk) begin
        if (FlushE == 1'b1) begin
            {RegWriteE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUSrcE, ResultSrcE, ALUControlE} <= 0;
            {RD1E, RD2E, PCE, ImmExtE, PCPlus4E, RdE, Rs1E, Rs2E, PctargetSrcE} <= 0;        
        end
        else if (Mem_Stall == 1'b1) begin
            {RegWriteE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUSrcE, ResultSrcE, ALUControlE} <= 
            {RegWriteE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUSrcE, ResultSrcE, ALUControlE};

            {RD1E, RD2E, PCE, ImmExtE, PCPlus4E, RdE, Rs1E, Rs2E, PctargetSrcE} <= {RD1E, RD2E, PCE, ImmExtE, PCPlus4E, RdE, Rs1E, Rs2E, PctargetSrcE};
        end
        else begin
            {RegWriteE, MemWriteE, MemReadE, JumpE, BranchE, Func3_0E, ALUSrcE, ResultSrcE, ALUControlE} <= 
            {RegWriteD, MemWriteD, MemReadD, JumpD, BranchD, Func3_0D, ALUSrcD, ResultSrcD, ALUControlD};

            {RD1E, RD2E, PCE, ImmExtE, PCPlus4E, RdE, Rs1E, Rs2E, PctargetSrcE} <= {RD1D, RD2D, PCD, ImmExtD, PCPlus4D, RdD, Rs1D, Rs2D, PctargetSrcD};
        end
        
    end
endmodule