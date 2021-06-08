`timescale 1ns/1ns

module MEMWB(
    input clk,
    input [1:0]MEM_WB,
    input [31:0]MEMWB_DatoLeido,
    input [31:0]MEMWB_Direccion,
    input [4:0]MEMWB_MUXRes,
    output reg [1:0]MEMWB_WBout,
    output reg [31:0]MEMWB_DatoLeidoout,
    output reg [31:0]MEMWB_Direccionout,
    output reg [4:0]MEMWB_MUXResout
);


always @(posedge clk)
	begin
        MEMWB_WBout = MEM_WB;
        MEMWB_DatoLeidoout = MEMWB_DatoLeido;
        MEMWB_Direccionout = MEMWB_Direccion;
        MEMWB_MUXResout = MEMWB_MUXRes;
	end

endmodule 


