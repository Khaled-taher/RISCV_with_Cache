module Cache_Memory (clk, Cache_Read_En, Cache_Write_En, Line_number, block_num_Mem, block_num_Addr, Memory_Read_En, Data_From_RISC, Data_From_Memory, Mem_Done, Data_out);
//ports declarations
input clk, Cache_Read_En, Cache_Write_En, Memory_Read_En, Mem_Done;
input [1:0] block_num_Mem, block_num_Addr;
input [4:0] Line_number;
input [31:0] Data_From_RISC, Data_From_Memory;
output [31:0] Data_out;

wire [31:0] Data_in;
wire [1:0] block_num;
wire [6:0] Addr;
reg [31:0] cache_ram [127:0];

assign Addr = {Line_number, block_num};
assign Data_in = (Memory_Read_En == 1'b1)? Data_From_Memory : Data_From_RISC;
assign block_num = (Memory_Read_En == 1'b1)? block_num_Mem : block_num_Addr;

assign Data_out = (Cache_Read_En == 1'b1)? cache_ram[Addr] : 32'h0000_0000;

always @(negedge clk) begin
    if (Cache_Write_En == 1'b1 && Mem_Done == 1'b1)
        cache_ram[Addr] <= Data_in;
    else 
        cache_ram[Addr] <= cache_ram[Addr];
end
endmodule