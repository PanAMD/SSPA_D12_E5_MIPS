`timescale 1ns/1ns

module Memory32B(
    input MemWrite, MemRead,
    input [31:0] dataInput,
    input [31:0]dir,
    output reg [31:0] result
);

reg [31:0]data [0:31];

always @* begin
    case(MemWrite) 
        1'b1: 
        begin
            data[dir]<=dataInput;
        end
    endcase
end

always @* begin
	case(MemRead)
		1'b 1:
		begin
			result = data[dir]; 
		end
    endcase
end

endmodule
