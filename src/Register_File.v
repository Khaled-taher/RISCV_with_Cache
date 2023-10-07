module Register_File (clk, Addr1, Addr2, Addr3, WD3, WE3, RD1, RD2);
    //Input and Output Declaration
    input clk, WE3;
    input [4:0] Addr1, Addr2, Addr3;
    input [31:0] WD3;
    output [31:0] RD1, RD2;

    //Signal Declaration
    reg [31:0] rom [0:31];

    //Initialize Register File with zeros
    initial begin
    	$readmemh("initialization.txt", rom);
    end

    //Write Data when Enable equals 1 in falling edge 
    always @(negedge clk) begin
        if (WE3 == 1'b1)begin
            rom[Addr3] <= WD3;            
        end
        else begin
            rom[Addr3] <= rom[Addr3];
        end
    end

    //Reading Data
    assign RD1 = (Addr1 == 32'h0000_0000)? 32'h0000_0000 : rom[Addr1];
    assign RD2 = (Addr2 == 32'h0000_0000)? 32'h0000_0000 : rom[Addr2];
endmodule
