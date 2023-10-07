module Main_Memory (clk, Line_number, block_num_Addr, Addr_Tag, Memory_Read_En, Memory_Write_En, Data_From_RISC, Data_From_Memory, block_num_Mem, Mem_Done);
//ports declarations
input clk, Memory_Read_En, Memory_Write_En;
input [1:0] block_num_Addr;
input [2:0] Addr_Tag;
input [4:0] Line_number;
input [31:0] Data_From_RISC;
output reg Mem_Done;
output [1:0] block_num_Mem;
output [31:0] Data_From_Memory;

//signal declarations
wire [9:0] Addr;
reg [2:0] block_num;
reg [31:0] memory_ram [0:1023];

//address extraction
assign Addr = {Addr_Tag, Line_number, block_num};
assign block_num_Mem = (Memory_Read_En == 1'b1)? block_num[1:0] : block_num_Addr;

//read from memory 
assign Data_From_Memory = (Memory_Read_En == 1'b1)? memory_ram[Addr] : 32'h0000_0000;

//write into the memory
always @(negedge clk) begin
    if (Memory_Write_En == 1'b1)
        memory_ram[Addr] <= Data_From_RISC;
    else
        memory_ram[Addr] <= memory_ram[Addr];
end

//generate block number  to access words asround the target and count the number of cycle 
always @(posedge clk) begin
    if (Memory_Read_En == 1'b1 || Memory_Write_En == 1'b1)
        block_num <= block_num + 1;
    else 
        block_num <= 3'b111;
end

//generate memory done signal
always @(negedge clk) begin
    if (block_num == 3'b010)
        Mem_Done <= 1'b1;
    else if (block_num == 3'b011)
        Mem_Done <= 1'b0;
    else 
        Mem_Done <= Mem_Done;
end
endmodule