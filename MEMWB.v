`timescale 1ns/1ns

module MEMWB(
	input [31:0]MEMWB_Read_Data,MEMWB_ResALU,
	input[4:0]MEMWB_Write_Reg,
	input MEMWB_MemtoReg,MEMWB_RegWrite,
	input clk,
	output reg[31:0]MEMWB_Sal_RD, MEMWB_SResALU,
	output reg[4:0]MEMWB_Sal_WR,
	output reg MEMWB_SMemtoReg,MEMWB_SRegWrite
);

always @(posedge clk)
	begin
		MEMWB_Sal_RD = MEMWB_Read_Data;
	    MEMWB_SResALU = MEMWB_ResALU;
		MEMWB_Sal_WR = MEMWB_Write_Reg;
		
		MEMWB_SMemtoReg = MEMWB_MemtoReg;
		MEMWB_SRegWrite = MEMWB_RegWrite;
	end

endmodule 