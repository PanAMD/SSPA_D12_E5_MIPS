`timescale 1ns/1ns

module AluControl(
	input [5:0]opFunction,
	input [2:0]opALU,
	output reg[3:0]ALUout
);

always @*
	case(opALU)
	
	3'b 010: //R-type instruction UWU
			case(opFunction)
			
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
				
			6'b 011010: //DIVISIÓN
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
			
	3'b 000: //sumI-type instruction UWU
	
			begin
					ALUout = 4'b 0001; 
			end
			
	3'b 001: //ResI-type instruction UWU
	
			begin
					ALUout = 4'b 0010; 
			end
	
	3'b 100: //SltI-type instruction UWU
	
			begin
					ALUout = 4'b 1000; //STL
			end
			
	3'b 011: //AndI-type instruction UWU
	
			begin
					ALUout = 4'b 0101; //AND
			end
			
			
	3'b 101: //ORI-type instruction UWU
	
			begin
					ALUout = 4'b 0110; //OR
			end
			
		endcase

endmodule 