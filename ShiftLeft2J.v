`timescale 1ns/1ns

module LeftShifter2(
	input [25:0]in,
	output reg[31:0]out

);

always @*
	begin
	   out = in << 2;
	end

endmodule 