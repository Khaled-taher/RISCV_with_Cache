module Hazard_control (rst, Rs1E, Rs2E, Rs1D, Rs2D, RdM, RdW, RdE, RegWriteM, RegWriteW, ResultSrcE_0, PcSrcE, ForwardAE, ForwardBE, FlushE, StallD, StallF, FlushD);
    input [4:0] Rs1E, Rs2E, Rs1D, Rs2D, RdM, RdW, RdE;
    input RegWriteM, RegWriteW, ResultSrcE_0, PcSrcE, rst;
    output reg [1:0] ForwardAE, ForwardBE;
    output reg FlushE, StallD, StallF, FlushD;

    always @(*) begin
        if (rst == 1'b1) begin
            ForwardAE = 2'b00;
        end
        else begin
            if (((Rs1E == RdM) && (RegWriteM == 1'b1)) && (Rs1E != 1'b0)) 
		        ForwardAE = 2'b10;
	        else if (((Rs1E == RdW) && (RegWriteW == 1'b1)) && (Rs1E != 1'b0))
		        ForwardAE = 2'b01;
	        else
		        ForwardAE = 2'b00;
        end
    end

    always @(*) begin
        if (rst == 1'b1) begin
            ForwardBE = 2'b00;
        end
        else begin
            if (((Rs2E == RdM) && (RegWriteM == 1'b1)) && (Rs2E != 1'b0)) 
		        ForwardBE = 2'b10;
	        else if (((Rs2E == RdW) && (RegWriteW == 1'b1)) && (Rs2E != 1'b0))
		        ForwardBE = 2'b01;
	        else
		        ForwardBE = 2'b00;
        end
    end
    
    always @(*) begin
        if (rst == 1'b1) begin
            {StallD, StallF} = 2'b00;
        end
        else begin
            if (((Rs1D == RdE) || (Rs2D == RdE)) && (ResultSrcE_0 == 1'b1))
	            {StallD, StallF} = 2'b11;
	        else
		        {StallD, StallF} = 2'b00;
        end
    end

    always @(*) begin
        if (rst == 1'b1) begin
            FlushE = 1'b0;
            FlushD = 1'b0;
        end
        else begin
            FlushD = PcSrcE;
	        if ((StallD == 1'b1) || (PcSrcE == 1'b1))
		        FlushE = 1'b1;
	        else
		        FlushE = 1'b0;
        end
    end
endmodule