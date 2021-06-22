`timescale 1ns/1ns

module SignExtender(
	input [15:0]mainInput,
	output reg[31:0]result
);

always @*
	case(mainInput[15])
	
	1'b 0:
	begin
		result = mainInput;
	end
	
	1'b 1:
	begin
	 result = {16'b 1111111111111111 ,mainInput};
	end
	
  endcase
endmodule 