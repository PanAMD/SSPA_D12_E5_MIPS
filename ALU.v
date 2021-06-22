`timescale 1ns/1ns

module ALUKawaii(
	input [31:0]inputA,inputB,
	input [3:0]aluOperation,
	output reg[31:0]result,
	output reg zeroFlag = 1'b 0
);


always @(aluOperation)
begin
		case(aluOperation)
		
		4'b 0000:
			begin
				result = 32'd 0;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0001:
			begin
				result = inputA + inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0010:
			begin
				result = inputA - inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0011:
			begin
				result = inputA * inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0100:
			begin
				result = inputA / inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0101:
			begin
				result = inputA & inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0110:
			begin
				result = inputA | inputB;
				zeroFlag = (result == 32'd 0);
			end
		4'b 0111:
			begin
				result = ~(inputA | inputB);
				zeroFlag = (result == 32'd 0);
			end
		4'b 1000:
			begin
				if(inputA < inputB)
					result = 32'd 1;
				else 
					result = 32'd 0;
					zeroFlag = (result == 32'd 0);
			end
			
		4'b 1001:
			begin
				result = (inputA ^ inputB);
				zeroFlag = (result == 32'd 0);
			end
			
		default:
			begin
				result = 32'd 0;
				zeroFlag = (result == 32'd 0);
			end

		endcase
end
endmodule 