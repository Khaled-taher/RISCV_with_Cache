module Instruction_Mem (Address, Instruction);
    //Input and Output Declaration
    input [31:0] Address;
    output [31:0] Instruction;

    //Signal Declaration
    wire [31:0] Addr; 
    reg [31:0] rom [0:255];

    //Divide External Address Bus by four
    assign Addr = {24'h000000, Address[9:2]};

    //Read Instruction 
    assign Instruction = rom[Addr];

    //Load Memory with Machine Code
    initial begin
    	$readmemh("mem_hex.txt", rom);
    end
endmodule