module ff_F2D (clk, InstructionF, PCF, PCPlus4F, StallD, FlushD, InstructionD, PCD, PCPlus4D, Mem_Stall);
    //Input and OUtput Declaration
    input clk, StallD, FlushD, Mem_Stall;
    input [31:0] InstructionF, PCF, PCPlus4F;
    output reg [31:0] InstructionD, PCD, PCPlus4D;

    //Code 
    always @(posedge clk) begin
        if (FlushD == 1'b1) begin
             {InstructionD, PCD, PCPlus4D} <= 0;
        end
        else if (StallD == 1'b1 || Mem_Stall == 1'b1) begin
            {InstructionD, PCD, PCPlus4D} <= {InstructionD, PCD, PCPlus4D};
        end
        else begin
            {InstructionD, PCD, PCPlus4D} <= {InstructionF, PCF, PCPlus4F};
        end
    end
endmodule