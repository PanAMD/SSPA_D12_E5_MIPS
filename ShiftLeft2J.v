`timescale 1ns/1ns

module ShiftLeft2J (
	input [25:0] shift_in, 
	output [27:0] shift_out
);

assign shift_out[27:0]={shift_in[25:0],2'b00};

endmodule

