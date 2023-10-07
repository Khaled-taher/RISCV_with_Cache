module Cache_System (clk, rst, Addr, WD, WE, RD, RE, Mem_Stall);
//ports declarations
input clk, rst, WE, RE;
input [31:0] Addr, WD;
output Mem_Stall
output [31:0] RD;

Cache_Control Cache_Control_Instance (clk, rst, RE, WE, Mem_Done, Addr, Cache_Read_En, Cache_Write_En, Line_number, block_num_Addr,
                        Memory_Read_En, Memory_Write_En, Mem_Stall, Addr_Tag);

Cache_Memory Cache_Memory_Instance (clk, Cache_Read_En, Cache_Write_En, Line_number, block_num_Mem, block_num_Addr, Memory_Read_En,
                        WD, Data_From_Memory, Mem_Done, RD);

Main_Memory Main_Memory_Instance (clk, Line_number, block_num_Addr, Addr_Tag, Memory_Read_En, Memory_Write_En, WD, Data_From_Memory, block_num_Mem, Mem_Done);

endmodule