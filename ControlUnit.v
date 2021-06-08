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
	output reg RegWrite,
	output [9:0]SalCU
);

always @*
	case(instruction)
	6'b 000000: //R-type instruction-
		begin
			RegDst = 1'b 1;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 010;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 0;
			RegWrite = 1'b 1;
		end
	
	6'b 000100: //BEQ instruction-
		begin
			RegDst = 1'b 1;
			Branch = 1'b 1;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 001;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 0;
			RegWrite = 1'b 0;
		end
	
	6'b 001000: //ADDi-type instruction-
		begin
			RegDst = 1'b 0;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 000;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 1;
		end

	6'b 001100: //ANDi-type instruction
		begin
			RegDst = 1'b 0;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 011;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 1;
		end

	6'b 001101: //ORi-type instruction
		begin
			RegDst = 1'b 0;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 111;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 1;
		end

	6'b 100011: //LW-type instruction-
		begin
			RegDst = 1'b 0;
			Branch = 1'b 0;
			MemRead = 1'b 1;
			MemtoReg = 1'b 0;
			ALUOP = 3'b 000;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 1;
		end

	6'b 101011: //SW-type instruction-
		begin
			RegDst = 1'b 1;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 000;
			MemWrite = 1'b 1;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 0;
		end

	6'b 001010: //SLTI-type instruction-
		begin
			RegDst = 1'b 0;
			Branch = 1'b 0;
			MemRead = 1'b 0;
			MemtoReg = 1'b 1;
			ALUOP = 3'b 100;
			MemWrite = 1'b 0;
			ALUSrc = 1'b 1;
			RegWrite = 1'b 1;
		end
	endcase

assign SalCU = {ALUSrc, ALUOP, RegDst, MemWrite, MemRead, Branch, MemtoReg, RegWrite}; // se concatena

endmodule 