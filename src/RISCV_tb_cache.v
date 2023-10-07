`timescale 1ns/1ps
`include "include.v"

module RISCV_tb();
  //Signal Declaration
  reg clk, rst;
  wire [31:0] Instruction, RD_Memory, ALUout, RD2_Reg_File, PC;
  wire MemWrite;

  //Modules Instanciation
  Top Top_instance(clk, rst, Instruction, RD_Memory, MemWrite, MemRead, PC, ALUout, RD2_Reg_File, Mem_Stall);
  Instruction_Mem Instruction_Mem_instance(PC, Instruction);
  Data_Mem Data_Mem_instance(clk, rst, ALUout, RD2_Reg_File, MemWrite, RD_Memory, MemRead, Mem_Stall);

  // clock generation
  initial begin
	$dumpfile("RISC_tb.vcd")
	$dumpvars(0, RISCV_tb)
	clk = 1'b0;
	forever #0.8 clk = ~clk;
  end

  // rst the system in the beginning
  initial begin
	rst = 1'b1;
	#1.6 rst = ~rst;
	#60;
  $finish;
  end
endmodule