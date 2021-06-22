`timescale 1ns/1ns

module Memory32B(
	input MemWrite, MemRead,
	input [31:0]dataInput,
	input [31:0]dir,
	output reg[31:0]result
);

reg [31:0]Memoria[0:31];

initial 
	begin
		$readmemb("MemoriaDatos.txt", Memoria);
	end
	
always @* 
	case(MemWrite)
	
		1'b 1:
		begin
		   Memoria[dir] = dataInput; 
		end
	endcase
	
always @*
	case(MemRead)
		1'b 1:
		begin
			result = Memoria[dir]; 
		end
		
	endcase

endmodule 