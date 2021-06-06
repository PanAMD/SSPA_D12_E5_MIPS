`timescale 1ns/1ns

module Mips32(
    input clk
);

wire [31:0]MEM_B, RD1_B,RD2_B,CFetch1, RD1_B2, RD2_B2, RD2_B3;
wire [31:0] muxyOut;
wire [31:0] pcMux;
wire [31:0] fetchMux4;
wire [31:0]Mem_BFF4,Mem_BFF42,Mux3_RegStr;
wire [5:0]COpcode;
wire [4:0]CRS,CRT,CRD,Mux_BFF, CRT2, CRD2;
wire [2:0]ALUOP;
wire [31:0]aluOpResult, aluOpResult2, aluOpResult3;
wire [31:0]Csum1, Csum2;

//Control connections
wire ZF, ZF2,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [15:0]instructionBuffer;
wire [31:0] extendedSign, extendedSign2;
wire [31:0] shiftedData;
wire [31:0] shiftedSumResult, shiftedSumResult2;
wire muxy3Flag;
wire [3:0] aluControlOut;
wire [4:0]registryStrWriteAddr, registryStrWriteAddr2, registryStrWriteAddr3;
wire [9:0] CSalCU;
wire [1:0] CWB1, CWB2, CWB3;
wire [2:0] CM1, CM2, CM3;
wire [4:0] CEX1, CEX2, CEX3;


FetchCycle fetch(
	.clk(clk),
	.inputDir(pcMux),
	.out(fetchMux4),
	.Fetch(CFetch1),
	.Sal(MEM_B)
);

IFID buffer1(
    .clk(clk),
	.in(MEM_B),
    .Fetchout(CFetch1),
    .sum(Csum1),
	.RS(CRS),
    .RT(CRT),
    .RD(CRD),
	.Opcode(COpcode),
    .instruction(instructionBuffer)
);

IDEX buffer2(
    .clk(clk),
    .IDEX_UC(CSalCU),
    .IDEX_SumIFID(Csum1),
    .IDEX_DatoLeidoA(RD1_B),
    .IDEX_DatoLeidoB(RD2_B),
    .IDEX_DatoExtendido(extendedSign),
    .IDEX_InsRT(CRT),
    .IDEX_InsRD(CRD),
    .IDEX_WB(CWB1),
    .IDEX_M(CM1),
    .IDEX_EX(CEX1),
    .IDEX_SumIFIDout(Csum2),
    .IDEX_DatoLeidoAout(RD1_B2),
    .IDEX_DatoLeidoBout(RD2_B2),
    .IDEX_DatoExtendidoout(extendedSign2),
    .IDEX_InsRTout(CRT2),
    .IDEX_InsRDout(CRD2)
);

EXMEM buffer3(
    .clk(clk),
    .EXMEM_WB(CWB1),
    .EXMEM_M(CM1),
    .EXMEM_SumRes(shiftedSumResult),
    .EXMEM_ZFlag(ZF),
    .EXMEM_ALURes(aluOpResult),
    .EXMEM_DatoLeidoB(RD2_B2),
    .EXMEM_MUXRes(registryStrWriteAddr),
    .EXMEM_WBout(CWB2),
    .EXMEM_Mout(CM2),
    .EXMEM_SumResout(shiftedSumResult2),
    .EXMEM_ZFlagout(ZF2),
    .EXMEM_ALUResout(aluOpResult2),
    .EXMEM_DatoLeidoBout(RD2_B3),
    .EXMEM_MUXResout(registryStrWriteAddr2)
);

MEMWB buffer4(
    .clk(clk),
    .MEM_WB(CWB2),
    .MEMWB_DatoLeido(Mem_BFF4),
    .MEMWB_Direccion(aluOpResult2),
    .MEMWB_MUXRes(registryStrWriteAddr2),
    .MEMWB_WBout(CWB3),
    .MEMWB_DatoLeidoout(Mem_BFF42),
    .MEMWB_Direccionout(aluOpResult3),
    .MEMWB_MUXResout(registryStrWriteAddr3)
);

SignExtender signExtender(
    .mainInput(instructionBuffer),
	.result(extendedSign)
);

LeftShifter shift(
	.in(extendedSign2),
	.out(shiftedData)
);

Adder32B adder32(
	.inputA(Csum2),
    .inputB(shiftedData),
	.result(shiftedSumResult)
);

Multiplexor muxy3(
    .inA(CFetch1),
    .inB(shiftedSumResult2),
    .Op(muxy3Flag),
    .outC(pcMux)
);

ControlUnit controlUnit(
	.instruction(COpcode),
    .SalCU(CSalCU)  
);

Basic4BitsMux mux4bits(
	.inp(CEX1[0]),
	.A(CRT2),
    .B(CRD2),
	.out(registryStrWriteAddr)
);

RegistryStore regArray(
    .regWrite(CWB3[0]),
    .dataInput(Mux3_RegStr),
    .writeDir(registryStrWriteAddr3),
    .registryAddressA(CRS),
    .registryAddressB(CRT),
    .registryOutA(RD1_B),
    .registryOutB(RD2_B)
);

Multiplexor muxy(
    .inA(RD2_B2),
    .inB(extendedSign2),
    .Op(CEX1[4]),
    .outC(muxyOut)
);

AluControl aluControl(
    .opFunction(extendedSign2),
    .opALU(CEX1[3:1]),
    .ALUout(aluControlOut)    
);

ALUKawaii mainALU(
	.inputA(RD1_B2),
    .inputB(muxyOut),
	.aluOperation(aluControlOut),
	.result(aluOpResult),
	.zeroFlag(ZF)
);

assign muxy3Flag =(CM2[0] &  ZF2);

Memory32B mainMemory(
    .MemWrite(CM2[2]), 
    .MemRead(CM2[1]),
    .dataInput(RD2_B3),
    .dir(aluOpResult2),
    .result(Mem_BFF4)
);

Multiplexor muxyMemOut(
    .inA(Mem_BFF42),
    .inB(aluOpResult3),
    .Op(CWB3[1]),
    .outC(Mux3_RegStr)
);

endmodule