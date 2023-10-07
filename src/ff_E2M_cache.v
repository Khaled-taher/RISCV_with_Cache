module ff_E2M (clk, RegWriteE, ResultSrcE, MemWriteE, MemReadE, ALUoutE, RD2E, RdE, PCPlus4E,
                    RegWriteM, ResultSrcM, MemWriteM, MemReadM, ALUoutM, RD2M, RdM, PCPlus4M, Mem_Stall);
    //Input and OUtput Declaration
    input clk, RegWriteE, MemWriteE, MemReadE, Mem_Stall;
    input [31:0] ALUoutE, RD2E, PCPlus4E;
    input [4:0] RdE;
    input [1:0] ResultSrcE;
    output reg RegWriteM, MemWriteM, MemReadM;
    output reg [31:0] ALUoutM, RD2M, PCPlus4M;
    output reg [4:0] RdM;
    output reg [1:0] ResultSrcM;

    //Code
    always @(posedge clk) begin
        if (Mem_Stall == 1'b1) begin
            {RegWriteM, ResultSrcM, MemWriteM, MemReadM, ALUoutM, RD2M, RdM, PCPlus4M} <=
            {RegWriteM, ResultSrcM, MemWriteM, MemReadM, ALUoutM, RD2M, RdM, PCPlus4M};
        end
        else begin
            {RegWriteM, ResultSrcM, MemWriteM, MemReadM, ALUoutM, RD2M, RdM, PCPlus4M} <=
            {RegWriteE, ResultSrcE, MemWriteE, MemReadE, ALUoutE, RD2E, RdE, PCPlus4E};
        end
    end
endmodule