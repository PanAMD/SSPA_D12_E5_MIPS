`timescale 1ns/1ns

module Mips32(
    input clk
);

wire [31:0]MEM_B, RD1_B,RD2_B,CFetch1;
wire [31:0] muxyOut;
wire [31:0] pcMux;
wire [31:0] fetchMux4;
wire [31:0]Mem_BFF4,Mux3_RegStr;
wire [5:0]COpcode;
wire [4:0]CRS,CRT,CRD,Mux_BFF;
wire [2:0]ALUOP;
wire [31:0]aluOpResult;

//Control connections
wire ZF,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [15:0]instructionBuffer;
wire [31:0] extendedSign;
wire [31:0] shiftedData;
wire [31:0] shiftedSumResult;
wire muxy3Flag;
wire [3:0] aluControlOut;
wire [4:0]registryStrWriteAddr;

FetchCycle fetch(
	.clk(clk),
	.inputDir(pcMux),
	.out(fetchMux4),
	.Fetch(CFetch1),
	.Sal(MEM_B)
);

AuxBuffer buffyUwU(
	.in(MEM_B),
	.clk(clk),
	.RS(CRS),
    .RT(CRT),
    .RD(CRD),
	.Opcode(COpcode),
    .instruction(instructionBuffer)
);

SignExtender signExtender(
    .mainInput(instructionBuffer),
	.result(extendedSign)
);

LeftShifter shift(
	.in(extendedSign),
	.out(shiftedData)
);

Adder32B adder32(
	.inputA(CFetch1),
    .inputB(shiftedData),
	.result(shiftedSumResult)
);

Multiplexor muxy3(
    .inA(CFetch1),
    .inB(shiftedSumResult),
    .Op(muxy3Flag),
    .outC(pcMux)
);

ControlUnit controlUnit(
	.instruction(COpcode),
	.RegDst(RegDst),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemtoReg(MemtoReg),
	.ALUOP(ALUOP),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite)    
);

Basic4BitsMux mux4bits(
	.inp(RegDst),
	.A(CRT),
    .B(instructionBuffer[15:11]),
	.out(registryStrWriteAddr)
);

RegistryStore regArray(
    .regWrite(RegWrite),
    .dataInput(Mux3_RegStr),
    .writeDir(registryStrWriteAddr),
    .registryAddressA(CRS),
    .registryAddressB(CRT),
    .registryOutA(RD1_B),
    .registryOutB(RD2_B)
);

Multiplexor muxy(
    .inA(RD2_B),
    .inB(shiftedSumResult),
    .Op(ALUSrc),
    .outC(muxyOut)
);

AluControl aluControl(
    .opFunction(instructionBuffer[5:0]),
    .opALU(ALUOP),
    .ALUout(aluControlOut)    
);

ALUKawaii mainALU(
	.inputA(RD1_B),
    .inputB(muxyOut),
	.aluOperation(aluControlOut),
	.result(aluOpResult),
	.zeroFlag(ZF)
);

assign muxy3Flag =(Branch &  ZF);

Memory32B mainMemory(
    .MemWrite(MemWrite), 
    .MemRead(MemRead),
    .dataInput(RD2_B),
    .dir(aluOpResult),
    .result(Mem_BFF4)
);

Multiplexor muxyMemOut(
    .inA(aluOpResult),
    .inB(Mem_BFF4),
    .Op(MemtoReg),
    .outC(Mux3_RegStr)
);

endmodule