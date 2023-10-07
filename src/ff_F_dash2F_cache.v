module ff_F_dash2F (clk, rst, StallF, PCF_dash, PCF, Mem_Stall);
    //Input and Output Declaration
    input clk, rst, StallF, Mem_Stall;
    input [31:0] PCF_dash;
    output reg [31:0] PCF;

    //Code
    always @(posedge clk) begin
        if (rst == 1'b1) begin
            PCF <= 32'h0000_0000;
        end
        else begin
            if (StallF == 1'b1 || Mem_Stall == 1'b1) begin
                PCF <= PCF;
            end
            else begin
                PCF <= PCF_dash;
            end
        end
    end
endmodule