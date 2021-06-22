`timescale 1ns/1ns

module IFID(
	input [31:0]IFID_in,IFID_Fetch,IFID_contadorPc,
	input clk,
	output reg[31:0]IFID_SFetch,
	output reg[25:0]IFID_out,
	output reg[31:0]IFID_SContadorPc,
	output reg[15:0]IFID_Jump,
	output reg[4:0]IFID_RS,IFID_RT,IFID_RD,
	output reg[5:0]IFID_Opcode
);

always @(posedge clk)
	begin
		IFID_SFetch = IFID_Fetch;
		IFID_Opcode = IFID_in[31:26];
		IFID_RS = IFID_in[25:21];
		IFID_RT = IFID_in[20:16];
		IFID_RD = IFID_in[15:11];
		IFID_Jump = IFID_in[15:0];
		IFID_out = IFID_in[25:0];
		IFID_SContadorPc = IFID_contadorPc;
		
	end

endmodule 