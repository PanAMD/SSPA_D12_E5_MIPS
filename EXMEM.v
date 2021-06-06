`timescale 1ns/1ns

module EXMEM(
    input clk,
    input [1:0]EXMEM_WB,
    input [2:0]EXMEM_M,
    input [31:0]EXMEM_SumRes,
    input EXMEM_ZFlag,
    input [31:0]EXMEM_ALURes,
    input [31:0]EXMEM_DatoLeidoB,
    input [4:0]EXMEM_MUXRes,
    output reg [1:0]EXMEM_WBout,
    output reg [2:0]EXMEM_Mout,
    output reg [31:0]EXMEM_SumResout,
    output reg EXMEM_ZFlagout,
    output reg [31:0]EXMEM_ALUResout,
    output reg [31:0]EXMEM_DatoLeidoBout,
    output reg [4:0]EXMEM_MUXResout
);


always @(posedge clk)
	begin
        EXMEM_WBout = EXMEM_WB;
        EXMEM_Mout = EXMEM_M;
        EXMEM_SumResout = EXMEM_SumRes;
        EXMEM_ZFlagout = EXMEM_ZFlag;
        EXMEM_ALUResout = EXMEM_ALURes;
        EXMEM_DatoLeidoBout = EXMEM_DatoLeidoB;
        EXMEM_MUXResout = EXMEM_MUXRes;
	end

endmodule 

