`timescale 1ns/1ns

module AluControl(
    input [5:0] opFunction,
    input [2:0] opALU,
    output reg [3:0]ALUout
);

always @* begin
    case (opALU)
        3'b010: //R-type instruction UWU
        begin
        case (opFunction)
            6'b 000000: //NOP
				begin
					ALUout = 4'b 0000;
				end
			6'b 100000: //ADD
				begin
					ALUout = 4'b 0001;
				end
				
			6'b 100010: //SUB
				begin
					ALUout = 4'b 0010;
				end

			6'b 011001: //PRODUCT
				begin
					ALUout = 4'b 0011;
				end
	
			6'b 011010: //DIVISION
				begin
					ALUout = 4'b 0100;
				end
				
			6'b 100100: //AND
				begin
					ALUout = 4'b 0101;
				end
				
			6'b 100101: //OR
				begin
					ALUout = 4'b 0110;
				end
				
			6'b 100111: //NOR
				begin
					ALUout = 4'b 0111;
				end
			
			6'b 100110: //XOR
				begin
					ALUout = 4'b 1001;
				end
				
			6'b 101010: //SLT
				begin
					ALUout = 4'b 1000;
				end 
		endcase
        end
    endcase
end

endmodule