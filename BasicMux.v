`timescale 1ns/1ns

module Basic4BitsMux(
	input inp,
	input [4:0]A,B,
	output reg[4:0]out
);

always @* begin
	case(inp)
		1'b 0: begin
			out = A;
		end

		1'b 1: begin
			out = B;
		end

	endcase
end

endmodule 
