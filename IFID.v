`timescale 1ns/1ns

module IFID(
	input [31:0]in,
	input clk,
	input [31:0]Fetchout,
	output reg[31:0]sum,
	output reg[4:0]RS,RT,RD,
	output reg[5:0]Opcode,
    output reg[15:0]instruction
);


always @(posedge clk)
	begin
		sum = Fetchout;
		Opcode = in[31:26];
		RS = in[25:21];
		RT = in[20:16];
		RD = in[15:11];
        instruction= in[15:0];
	end

endmodule 
