`timescale 1ns/1ns

module Adder32B(
	input [31:0]inputA,inputB,
	output reg[31:0]result
);

always@*
	begin
		result = inputA + inputB;
	end

endmodule 