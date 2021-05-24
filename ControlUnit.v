`timescale 1ns/1ns

module ControlUnit(
	input [5:0]instruction,
	output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemtoReg,
	output reg [2:0]ALUOP,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite
);

always @*
	case(instruction)
	6'b 000000: //R-type instruction
		begin
			RegDst = 1'b 1;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 0;
			ALUOP = 3'b 010;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 0;
			RegWrite = 1'b 1;
		end
	endcase

endmodule 