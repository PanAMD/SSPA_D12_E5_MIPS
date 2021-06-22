`timescale 1ns/1ns

module IDEX(
	input [4:0]IDEX_RD,IDEX_RT,
	input [31:0]IDEX_A,IDEX_B,IDEX_Fetch,IDEX_Jump,
	input [27:0]IDEX_target,
	input [31:0]IDEX_contadorPc,
	input IDEX_RegDst,IDEX_Branch,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_ALUSrc,IDEX_RegWrite,IDEX_ControlJump,
	input [2:0]IDEX_ALUOP,
	input clk,
	output reg[4:0]IDEX_SRD,IDEX_SRT,
	output reg[31:0]IDEX_SA,IDEX_SB,IDEX_SFetch,IDEX_SJump,IDEX_Starget,
	output reg IDEX_SRegDst,IDEX_SBranch,IDEX_SMemRead,IDEX_SMemtoReg,IDEX_SMemWrite,IDEX_SALUSrc,IDEX_SRegWrite,IDEX_SControlJump,
	output reg[2:0]IDEX_SALUOP,
	output reg[31:0]IDEX_SContadorPc
);

always @(posedge clk)
	begin
		IDEX_SFetch = IDEX_Fetch;
		IDEX_SA = IDEX_A;
		IDEX_SB = IDEX_B;
		IDEX_SJump = IDEX_Jump;
		IDEX_SRD = IDEX_RD;
		IDEX_SRT = IDEX_RT;
		IDEX_Starget = {IDEX_Fetch[31:28],IDEX_target};
		
		IDEX_SRegDst = IDEX_RegDst;
		IDEX_SBranch = IDEX_Branch;
		IDEX_SMemRead = IDEX_MemRead;
		IDEX_SMemtoReg = IDEX_MemtoReg;
		IDEX_SMemWrite = IDEX_MemWrite;
		IDEX_SALUSrc = IDEX_ALUSrc;
		IDEX_SRegWrite = IDEX_RegWrite;
		IDEX_SALUOP = IDEX_ALUOP;
		IDEX_SControlJump = IDEX_ControlJump;
		IDEX_SContadorPc = IDEX_contadorPc;
	end

endmodule 