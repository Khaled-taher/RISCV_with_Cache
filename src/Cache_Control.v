module Cache_Control (clk, rst, MemRead, MemWrite, Mem_Done, Address, Cache_Read_En, Cache_Write_En, Line_number, block_num_Addr,
                        Memory_Read_En, Memory_Write_En, Mem_Stall, Addr_Tag);
//ports declarations
input clk, rst, MemRead, MemWrite, Mem_Done;
input [31:0] Address;
output reg Mem_Stall, Cache_Read_En, Cache_Write_En, Memory_Read_En, Memory_Write_En;
output [1:0] block_num_Addr;
output [2:0] Addr_Tag;
output [4:0] Line_number;

//parameters of fs 
parameter Read = 2'b01, Idle = 2'b00, Write = 2'b10;

//signals declarations
wire [9:0] Addr;
wire Cache_hit;
wire [2:0] Tag_comp;
reg Valid;
reg [1:0] State, Next_State;
reg [2:0] Tag;
integer i;  

//ram of tags and valid bit
reg [3:0] Tag_Valid_Ram [31:0];

//address extraction
assign Addr = Address[11:2];
assign Line_number = Addr[6:2];
assign block_num_Addr = Addr[1:0];
assign Addr_Tag = Addr[9:7];

//calculate cache hit bit
assign Tag_comp = &(Tag & Addr_Tag);
assign Cache_hit = Tag_comp & Valid;

//extract tag and valid bit from ram
always @(*) begin
    if (rst == 1'b1) begin
        for (i = 0; i < 32; i = i + 1) begin
            Tag_Valid_Ram[i] = 4'b0000;
        end  
    end
    else 
        {Valid, Tag} = Tag_Valid_Ram[Line_number];
end

////fs logic blocks////
//Current State logic
always @(negedge clk, negedge rst) begin
    if (rst == 1'b1) begin
        State <= Idle;
    end
    else
        State <= Next_State;
end

//Next State logic
always @(*) begin
    case (State)
        Idle: begin
		if (MemWrite == 1'b1)
			Next_State <= Write;
		else if (MemRead == 1'b1 && Cache_hit == 1'b0)
			Next_State <= Read; 
		else 
			Next_State <= Idle;
	end
        Read: begin
		if (Mem_Done == 1'b1)
			Next_State <= Idle;
		else
			Next_State <= Read;
	end
        Write: begin 
		if (Mem_Done == 1'b1)
			Next_State <= Idle;
		else
			Next_State <= Write;
	end
        default:    Next_State = Idle;
    endcase
end

//output logic 
always @(*) begin
    case (State)
        Idle: {Mem_Stall, Memory_Read_En, Memory_Write_En, Cache_Write_En, Cache_Read_En} = (MemRead == 1'b1)? 5'b00001 : 5'b00000;
        Read: {Mem_Stall, Memory_Read_En, Memory_Write_En, Cache_Write_En, Cache_Read_En} = 5'b11010;
        Write: {Mem_Stall, Memory_Read_En, Memory_Write_En, Cache_Write_En, Cache_Read_En} = (Cache_hit == 1'b1)? 5'b10110 : 5'b10100;
        default: {Mem_Stall, Memory_Read_En, Memory_Write_En, Cache_Write_En, Cache_Read_En} = 5'b00000;
    endcase
end

//in reading change valid and tag 
always @(posedge clk) begin
    if (State == Read && Mem_Done == 1'b1)
        Tag_Valid_Ram[Line_number] <= {1'b1, Addr_Tag};
    else
        Tag_Valid_Ram[Line_number] <= Tag_Valid_Ram[Line_number];
end
endmodule