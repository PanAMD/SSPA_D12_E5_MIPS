`timescale 1ns/1ns

module FetchCycle(
	input clk,
	input [31:0]inputDir,
	output reg[31:0]out,
	output reg [31:0]Fetch,
	output [31:0]Sal
);

 reg[31:0]DirSalida;
 reg[7:0]pc;
 reg [7:0]MEM[149:0];
 
initial
	begin
		pc = 8'd 0;
	end
	
always @(posedge clk)
 begin
		if (inputDir >= 32'd 0 )
			begin
				DirSalida = inputDir;
			end
		else
			begin
				DirSalida = 32'd 0;
			end
		pc = DirSalida;
		pc = pc + 8'd 4;
		out=pc;
		Fetch=pc;
 end
	
initial
	begin
		$readmemb("Instrucciones.txt", MEM);
	end
 
assign Sal = {MEM[DirSalida],MEM[DirSalida+1],MEM[DirSalida+2],MEM[DirSalida+3]}; // se concatena
   
endmodule 