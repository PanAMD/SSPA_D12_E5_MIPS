`timescale 1ns/1ns

module IDEX(
    input clk,
	input [9:0]IDEX_UC,
    input [31:0]IDEX_SumIFID,
    input [31:0]IDEX_DatoLeidoA,
    input [31:0]IDEX_DatoLeidoB,
    input [31:0]IDEX_DatoExtendido,
    input [4:0]IDEX_InsRT,
    input [4:0]IDEX_InsRD,
    output reg [1:0]IDEX_WB,
    output reg [2:0]IDEX_M,
    output reg [4:0]IDEX_EX,
    output reg [31:0]IDEX_SumIFIDout,
    output reg [31:0]IDEX_DatoLeidoAout,
    output reg [31:0]IDEX_DatoLeidoBout,
    output reg [31:0]IDEX_DatoExtendidoout,
    output reg [4:0]IDEX_InsRTout,
    output reg [4:0]IDEX_InsRDout
);


always @(posedge clk)
	begin
		IDEX_WB = IDEX_UC[1:0];
		IDEX_M = IDEX_UC[4:2];
        IDEX_EX = IDEX_UC[9:5];
        IDEX_SumIFIDout = IDEX_SumIFID;
        IDEX_DatoLeidoAout = IDEX_DatoLeidoA;
        IDEX_DatoLeidoBout = IDEX_DatoLeidoB;
        IDEX_DatoExtendidoout = IDEX_DatoExtendido;
        IDEX_InsRTout = IDEX_InsRT;
        IDEX_InsRDout = IDEX_InsRD;
	end

endmodule 
