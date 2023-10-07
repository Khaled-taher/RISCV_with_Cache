module ff_M2W (clk, RegWriteM, ResultSrcM, ALUoutM, Mem_RDM, RdM, PCPlus4M,
                    RegWriteW, ResultSrcW, ALUoutW, Mem_RDW, RdW, PCPlus4W, Mem_Stall);
    //Input and Output Declaration
    input clk, RegWriteM, Mem_Stall;
    input [31:0] ALUoutM, Mem_RDM, PCPlus4M;
    input [4:0] RdM;
    input [1:0] ResultSrcM;
    output reg RegWriteW;
    output reg [31:0] ALUoutW, Mem_RDW, PCPlus4W;
    output reg [4:0] RdW;
    output reg [1:0] ResultSrcW;

    //Code
    always @(posedge clk) begin
        if (Mem_Stall == 1'b1) begin
            {RegWriteW, ResultSrcW, ALUoutW, Mem_RDW, RdW, PCPlus4W} <=
            {RegWriteW, ResultSrcW, ALUoutW, Mem_RDW, RdW, PCPlus4W};
        end
        else begin
            {RegWriteW, ResultSrcW, ALUoutW, Mem_RDW, RdW, PCPlus4W} <=
            {RegWriteM, ResultSrcM, ALUoutM, Mem_RDM, RdM, PCPlus4M};
        end
    end
endmodule