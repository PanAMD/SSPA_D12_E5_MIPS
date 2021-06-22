`timescale 1ns/1ns

module EXMEM(
	input [31:0]EXMEM_Res_ALU,EXMEM_Fetch,EXMEM_target,
	input [31:0]EXMEM_Write_Data,
	input [31:0]EXMEM_contadorPc,
	input EXMEM_zero_flag,
	input[4:0]EXMEM_Write_Reg,
	input EXMEM_Branch, EXMEM_MemRead,EXMEM_MemtoReg, EXMEM_MemWrite, EXMEM_RegWrite, EXMEM_ControlJump,
	input clk,
	output reg EXMEM_Sal_zf,
	output reg[31:0]EXMEM_SRes_ALU, EXMEM_SFetch, EXMEM_Starget,
	output reg[31:0]EXMEM_SalWD, 
	output reg[4:0]EXMEM_Sal_WR,
	output reg EXMEM_SBranch, EXMEM_SMemRead, EXMEM_SMemtoReg, EXMEM_SMemWrite, EXMEM_SRegWrite, EXMEM_SControlJump,
	output reg[31:0]EXMEM_SContadorPc
);

always @(posedge clk)
	begin
		EXMEM_SFetch = EXMEM_Fetch;
	    EXMEM_SRes_ALU = EXMEM_Res_ALU;
		EXMEM_Sal_zf = EXMEM_zero_flag;
		EXMEM_SalWD = EXMEM_Write_Data;
		EXMEM_Sal_WR = EXMEM_Write_Reg;
		
		EXMEM_SBranch = EXMEM_Branch;
		EXMEM_SMemRead = EXMEM_MemRead;
		EXMEM_SMemtoReg = EXMEM_MemtoReg;
		EXMEM_SMemWrite = EXMEM_MemWrite;
		EXMEM_SRegWrite = EXMEM_RegWrite;
		EXMEM_SControlJump = EXMEM_ControlJump;
		EXMEM_Starget = EXMEM_target;
		EXMEM_SContadorPc = EXMEM_contadorPc;
		
	end

endmodule 