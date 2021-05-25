
module FetchCycle(
	input clk,
	input [31:0]inputDir,
	output reg[31:0]out,
	output reg [31:0]Fetch,
	output [31:0]Sal
);

reg[31:0]outputDir;
reg[7:0]pc;
reg [7:0]Memory[399:0];
 
initial begin
    pc = 8'd 0;
end
	
always @(posedge clk)
begin
        if (inputDir >= 32'd 0 )
			begin
				outputDir = inputDir;
			end
		else
			begin
				outputDir = 32'd 0;
			end
		pc = outputDir;
		pc = pc + 8'd 4;
		out=pc;
		Fetch=pc;
end
	
initial begin
		$readmemb("TestF1_MemInst.mem", Memory);
end
 
assign Sal = {Memory[outputDir],Memory[outputDir+1],Memory[outputDir+2],Memory[outputDir+3]}; // se concatena
   
endmodule