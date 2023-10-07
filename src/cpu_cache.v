module control_logic (rst, OpD, Func3D, Func7D, BranchD, JumpD, ResultSrcD, MemWriteD, MemReadD, ALUSrcD, ImmSrcD, RegWriteD, ALUControlD, PctargetSrcD);
    //Input and OUtput Declaration
    input [6:0] OpD;
    input [2:0] Func3D;
    input Func7D, rst;
    output reg MemWriteD, MemReadD, ALUSrcD, RegWriteD, PctargetSrcD, BranchD, JumpD;
    output reg [1:0] ResultSrcD, ImmSrcD;
    output reg [2:0] ALUControlD;

    //Siganl Declaration
    wire [1:0] selD;
    reg [1:0] ALUOpD;

    //Code
    assign selD = {OpD[5], Func7D};
    localparam Lw = 7'b0000011, Sw = 7'b0100011, JalR = 7'b1100111, Jal= 7'b1101111, B_Type = 7'b1100011, I_Type = 7'b0010011, R_Type = 7'b0000011;

    //Main Decoder
    always @(*) begin
        if (rst == 1'b1) begin
            {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b10_1_00_0_0_00_0_0_0;
        end
        else begin
            case (OpD)
                Lw:         {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b00_1_00_1_0_1_01_0_0_0; 
                Sw:         {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b00_0_01_1_1_0_00_0_0_0;
                JalR:       {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b00_1_00_0_0_0_10_0_1_1;
                Jal:        {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b00_1_11_1_0_0_10_0_1_0;
                B_Type:     {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b01_0_10_0_0_0_00_1_0_0;
                I_Type:     {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b10_1_00_1_0_0_00_0_0_0;
                R_Type:     {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b10_1_00_0_0_0_00_0_0_0;
                default:    {ALUOpD, RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, MemReadD, ResultSrcD, BranchD, JumpD, PctargetSrcD} = 13'b10_1_00_0_0_0_00_0_0_0;
            endcase
        end
    end

    //ALU Decoder
    always @(*) begin
        case (ALUOpD)
            2'b00:      ALUControlD = 3'b000;
            2'b01:      ALUControlD = 3'b001;
            2'b10:      begin
                case (Func3D)
                    3'b000:     begin
                        if (selD == 2'b11) begin
                            ALUControlD = 3'b001;
                        end
                        else begin
                            ALUControlD = 3'b000;
                        end
                    end
                    3'b010:     ALUControlD = 3'b101;
                    3'b110:     ALUControlD = 3'b011;
                    3'b111:     ALUControlD = 3'b010;
                    default:    ALUControlD = 3'b000;
                endcase
            end 
            default:    ALUControlD = 3'b000;
        endcase        
    end
endmodule