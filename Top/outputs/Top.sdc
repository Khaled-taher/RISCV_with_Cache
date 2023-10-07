###################################################################

# Created by write_sdc on Thu Sep 28 21:42:49 2023

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports clk]  -period 1.6  -waveform {0 0.8}
set_clock_uncertainty 0.1  [get_clocks clk]
set_max_delay 0.1  -from [list [get_ports clk] [get_ports rst] [get_ports {InstructionF[31]}]    \
[get_ports {InstructionF[30]}] [get_ports {InstructionF[29]}] [get_ports       \
{InstructionF[28]}] [get_ports {InstructionF[27]}] [get_ports                  \
{InstructionF[26]}] [get_ports {InstructionF[25]}] [get_ports                  \
{InstructionF[24]}] [get_ports {InstructionF[23]}] [get_ports                  \
{InstructionF[22]}] [get_ports {InstructionF[21]}] [get_ports                  \
{InstructionF[20]}] [get_ports {InstructionF[19]}] [get_ports                  \
{InstructionF[18]}] [get_ports {InstructionF[17]}] [get_ports                  \
{InstructionF[16]}] [get_ports {InstructionF[15]}] [get_ports                  \
{InstructionF[14]}] [get_ports {InstructionF[13]}] [get_ports                  \
{InstructionF[12]}] [get_ports {InstructionF[11]}] [get_ports                  \
{InstructionF[10]}] [get_ports {InstructionF[9]}] [get_ports                   \
{InstructionF[8]}] [get_ports {InstructionF[7]}] [get_ports {InstructionF[6]}] \
[get_ports {InstructionF[5]}] [get_ports {InstructionF[4]}] [get_ports         \
{InstructionF[3]}] [get_ports {InstructionF[2]}] [get_ports {InstructionF[1]}] \
[get_ports {InstructionF[0]}] [get_ports {Mem_RDM[31]}] [get_ports             \
{Mem_RDM[30]}] [get_ports {Mem_RDM[29]}] [get_ports {Mem_RDM[28]}] [get_ports  \
{Mem_RDM[27]}] [get_ports {Mem_RDM[26]}] [get_ports {Mem_RDM[25]}] [get_ports  \
{Mem_RDM[24]}] [get_ports {Mem_RDM[23]}] [get_ports {Mem_RDM[22]}] [get_ports  \
{Mem_RDM[21]}] [get_ports {Mem_RDM[20]}] [get_ports {Mem_RDM[19]}] [get_ports  \
{Mem_RDM[18]}] [get_ports {Mem_RDM[17]}] [get_ports {Mem_RDM[16]}] [get_ports  \
{Mem_RDM[15]}] [get_ports {Mem_RDM[14]}] [get_ports {Mem_RDM[13]}] [get_ports  \
{Mem_RDM[12]}] [get_ports {Mem_RDM[11]}] [get_ports {Mem_RDM[10]}] [get_ports  \
{Mem_RDM[9]}] [get_ports {Mem_RDM[8]}] [get_ports {Mem_RDM[7]}] [get_ports     \
{Mem_RDM[6]}] [get_ports {Mem_RDM[5]}] [get_ports {Mem_RDM[4]}] [get_ports     \
{Mem_RDM[3]}] [get_ports {Mem_RDM[2]}] [get_ports {Mem_RDM[1]}] [get_ports     \
{Mem_RDM[0]}]]  -to [list [get_ports MemWriteM] [get_ports {PCF[31]}] [get_ports {PCF[30]}]   \
[get_ports {PCF[29]}] [get_ports {PCF[28]}] [get_ports {PCF[27]}] [get_ports   \
{PCF[26]}] [get_ports {PCF[25]}] [get_ports {PCF[24]}] [get_ports {PCF[23]}]   \
[get_ports {PCF[22]}] [get_ports {PCF[21]}] [get_ports {PCF[20]}] [get_ports   \
{PCF[19]}] [get_ports {PCF[18]}] [get_ports {PCF[17]}] [get_ports {PCF[16]}]   \
[get_ports {PCF[15]}] [get_ports {PCF[14]}] [get_ports {PCF[13]}] [get_ports   \
{PCF[12]}] [get_ports {PCF[11]}] [get_ports {PCF[10]}] [get_ports {PCF[9]}]    \
[get_ports {PCF[8]}] [get_ports {PCF[7]}] [get_ports {PCF[6]}] [get_ports      \
{PCF[5]}] [get_ports {PCF[4]}] [get_ports {PCF[3]}] [get_ports {PCF[2]}]       \
[get_ports {PCF[1]}] [get_ports {PCF[0]}] [get_ports {ALUoutM[31]}] [get_ports \
{ALUoutM[30]}] [get_ports {ALUoutM[29]}] [get_ports {ALUoutM[28]}] [get_ports  \
{ALUoutM[27]}] [get_ports {ALUoutM[26]}] [get_ports {ALUoutM[25]}] [get_ports  \
{ALUoutM[24]}] [get_ports {ALUoutM[23]}] [get_ports {ALUoutM[22]}] [get_ports  \
{ALUoutM[21]}] [get_ports {ALUoutM[20]}] [get_ports {ALUoutM[19]}] [get_ports  \
{ALUoutM[18]}] [get_ports {ALUoutM[17]}] [get_ports {ALUoutM[16]}] [get_ports  \
{ALUoutM[15]}] [get_ports {ALUoutM[14]}] [get_ports {ALUoutM[13]}] [get_ports  \
{ALUoutM[12]}] [get_ports {ALUoutM[11]}] [get_ports {ALUoutM[10]}] [get_ports  \
{ALUoutM[9]}] [get_ports {ALUoutM[8]}] [get_ports {ALUoutM[7]}] [get_ports     \
{ALUoutM[6]}] [get_ports {ALUoutM[5]}] [get_ports {ALUoutM[4]}] [get_ports     \
{ALUoutM[3]}] [get_ports {ALUoutM[2]}] [get_ports {ALUoutM[1]}] [get_ports     \
{ALUoutM[0]}] [get_ports {RD2_Reg_File_aft_muxM[31]}] [get_ports               \
{RD2_Reg_File_aft_muxM[30]}] [get_ports {RD2_Reg_File_aft_muxM[29]}]           \
[get_ports {RD2_Reg_File_aft_muxM[28]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[27]}] [get_ports {RD2_Reg_File_aft_muxM[26]}]           \
[get_ports {RD2_Reg_File_aft_muxM[25]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[24]}] [get_ports {RD2_Reg_File_aft_muxM[23]}]           \
[get_ports {RD2_Reg_File_aft_muxM[22]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[21]}] [get_ports {RD2_Reg_File_aft_muxM[20]}]           \
[get_ports {RD2_Reg_File_aft_muxM[19]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[18]}] [get_ports {RD2_Reg_File_aft_muxM[17]}]           \
[get_ports {RD2_Reg_File_aft_muxM[16]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[15]}] [get_ports {RD2_Reg_File_aft_muxM[14]}]           \
[get_ports {RD2_Reg_File_aft_muxM[13]}] [get_ports                             \
{RD2_Reg_File_aft_muxM[12]}] [get_ports {RD2_Reg_File_aft_muxM[11]}]           \
[get_ports {RD2_Reg_File_aft_muxM[10]}] [get_ports {RD2_Reg_File_aft_muxM[9]}] \
[get_ports {RD2_Reg_File_aft_muxM[8]}] [get_ports {RD2_Reg_File_aft_muxM[7]}]  \
[get_ports {RD2_Reg_File_aft_muxM[6]}] [get_ports {RD2_Reg_File_aft_muxM[5]}]  \
[get_ports {RD2_Reg_File_aft_muxM[4]}] [get_ports {RD2_Reg_File_aft_muxM[3]}]  \
[get_ports {RD2_Reg_File_aft_muxM[2]}] [get_ports {RD2_Reg_File_aft_muxM[1]}]  \
[get_ports {RD2_Reg_File_aft_muxM[0]}]]
set_input_delay -clock clk  -max 0.05  [get_ports rst]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[31]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[30]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[29]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[28]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[27]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[26]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[25]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[24]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[23]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[22]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[21]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[20]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[19]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[18]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[17]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[16]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[15]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[14]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[13]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[12]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[11]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[10]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[9]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[8]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[7]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[6]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[5]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[4]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[3]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[2]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[1]}]
set_input_delay -clock clk  -max 0.05  [get_ports {InstructionF[0]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[31]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[30]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[29]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[28]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[27]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[26]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[25]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[24]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[23]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[22]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[21]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[20]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[19]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[18]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[17]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[16]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[15]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[14]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[13]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[12]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[11]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[10]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[9]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[8]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[7]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[6]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[5]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[4]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[3]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[2]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[1]}]
set_input_delay -clock clk  -max 0.05  [get_ports {Mem_RDM[0]}]
set_output_delay -clock clk  -max 0.1  [get_ports MemWriteM]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[31]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[30]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[29]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[28]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[27]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[26]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[25]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[24]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[23]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[22]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[21]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[20]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[19]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[18]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[17]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[16]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[15]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[14]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[13]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[12]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[11]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[10]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[9]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[8]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[7]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[6]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[5]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[4]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[3]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[2]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[1]}]
set_output_delay -clock clk  -max 0.1  [get_ports {PCF[0]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[31]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[30]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[29]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[28]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[27]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[26]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[25]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[24]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[23]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[22]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[21]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[20]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[19]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[18]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[17]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[16]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[15]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[14]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[13]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[12]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[11]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[10]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[9]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[8]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[7]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[6]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[5]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[4]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[3]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[2]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[1]}]
set_output_delay -clock clk  -max 0.1  [get_ports {ALUoutM[0]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[31]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[30]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[29]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[28]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[27]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[26]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[25]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[24]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[23]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[22]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[21]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[20]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[19]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[18]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[17]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[16]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[15]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[14]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[13]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[12]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[11]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[10]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[9]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[8]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[7]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[6]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[5]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[4]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[3]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[2]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[1]}]
set_output_delay -clock clk  -max 0.1  [get_ports {RD2_Reg_File_aft_muxM[0]}]
