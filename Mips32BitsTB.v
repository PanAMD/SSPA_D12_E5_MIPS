`timescale 1ns/1ns

module Mips32TB();

reg clk = 1;

Mips32 DUV(
	.clk(clk)
);

always #10 clk = !clk;
initial
	begin
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;	
	
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;		
		#80;			
		
		$stop;
		
	end

endmodule 
