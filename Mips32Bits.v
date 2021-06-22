`timescale 1ns/1ns

module Mips32(  
	input clk
);

wire [31:0]MEM_B, RD1_B,RD2_B,CA,CB,CRes,CFetch1,CFetch2,CFetch3,Res_Mem;
wire [5:0]COpcode;
wire [31:0]Shift_Sum, Sum_BFF3,MuxALU,J_BFF2,CJump2,WD_Mem,Mem_BFF4,AMux3,BMux3,Mux3_BR;
wire [31:0]Fetch_Mux4,Fetch_Mux4_2,Fetch_Mux4_3,Fetch_Mux4_4,FetchB_Mux4,mux4_mux5;
wire [31:0]SL_mux5,BFF2_mux5,BFF2_mux52,jumpAddress,jumpAddress2;
wire [4:0]CRS,CRT,CRD,CRT2,CRD2,Mux_BFF,CWR,WR_BR;
wire [3:0]Sel_B, B_ALU;
wire [2:0]ALUOP,ALUOP1;
wire [15:0]CJump;
 
//Control conections
wire [31:0]Mux_PC;
wire ZF,ZF_AND,PCSrc,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump;
wire Branch2,MemRead2,MemtoReg2,MemWrite2,RegWrite2,Jump2,MemtoReg3,RegWrite3;
wire RegDst1,Branch1,MemRead1,MemtoReg1,MemWrite1,ALUSrc1,RegWrite1,Jump1;
wire [25:0]tar;
 
 
FetchCycle fetch(
	.out(Fetch_Mux4),
	.inputDir(Mux_PC),
	.clk(clk),
	.Sal(MEM_B),
	.Fetch(CFetch1)
);

 
IFID buffer1( 
	.IFID_in(MEM_B),
	.clk(clk),
	.IFID_Fetch(CFetch1),
	.IFID_contadorPc(Fetch_Mux4),
	.IFID_RS(CRS),
	.IFID_RT(CRT),
	.IFID_RD(CRD),
	.IFID_Opcode(COpcode),
	.IFID_Jump(CJump),
	.IFID_SFetch(CFetch2),
	.IFID_out(tar),
	.IFID_SContadorPc(Fetch_Mux4_2)
);

IDEX buffer2(
	.IDEX_Fetch(CFetch2),
	.clk(clk),
	.IDEX_A(RD1_B),
	.IDEX_B(RD2_B),
	.IDEX_SFetch(CFetch3),
    .IDEX_SA(CA),
	.IDEX_SB(CB),
	.IDEX_Jump(J_BFF2),
	.IDEX_RT(CRT),
	.IDEX_RD(CRD),
	.IDEX_target(SL_mux5),
	.IDEX_contadorPc(Fetch_Mux4_2),
	.IDEX_ControlJump(Jump),
	.IDEX_SRD(CRD2),
	.IDEX_SRT(CRT2),
	.IDEX_SJump(CJump2),
	.IDEX_RegDst(RegDst),
	.IDEX_Branch(Branch),
	.IDEX_MemRead(MemRead),
	.IDEX_ALUOP(ALUOP),
	.IDEX_MemtoReg(MemtoReg),
	.IDEX_MemWrite(MemWrite),
	.IDEX_ALUSrc(ALUSrc),
	.IDEX_RegWrite(RegWrite),
	.IDEX_SRegDst(RegDst1),
	.IDEX_SBranch(Branch1),
	.IDEX_SMemRead(MemRead1),
	.IDEX_SALUOP(ALUOP1),
    .IDEX_SMemtoReg(MemtoReg1),
	.IDEX_SMemWrite(MemWrite1),
	.IDEX_SALUSrc(ALUSrc1),
	.IDEX_SRegWrite(RegWrite1),
	.IDEX_SControlJump(Jump1),
	.IDEX_Starget(jumpAddress),
	.IDEX_SContadorPc(Fetch_Mux4_3)
);

EXMEM buffer3( 
	.EXMEM_Fetch(Sum_BFF3),
	.EXMEM_Res_ALU(CRes),
	.clk(clk),
	.EXMEM_zero_flag(ZF),
	.EXMEM_SRes_ALU(Res_Mem),
	.EXMEM_Write_Data(CB),
	.EXMEM_contadorPc(Fetch_Mux4_3),
	.EXMEM_ControlJump(Jump1),
	.EXMEM_Sal_zf(ZF_AND),
	.EXMEM_Write_Reg(Mux_BFF),
	.EXMEM_target(jumpAddress),
	.EXMEM_Sal_WR(CWR),
	.EXMEM_SFetch(FetchB_Mux4),
	.EXMEM_SalWD(WD_Mem),
	.EXMEM_Branch(Branch1),
	.EXMEM_MemRead(MemRead1),
	.EXMEM_MemtoReg(MemtoReg1),
	.EXMEM_MemWrite(MemWrite1),
	.EXMEM_RegWrite(RegWrite1),
	.EXMEM_SBranch(Branch2),
	.EXMEM_SMemRead(MemRead2),
	.EXMEM_SMemtoReg(MemtoReg2),
	.EXMEM_SMemWrite(MemWrite2),
	.EXMEM_SRegWrite(RegWrite2),
	.EXMEM_SControlJump(Jump2),
	.EXMEM_Starget(jumpAddress2),
	.EXMEM_SContadorPc(Fetch_Mux4_4)
);
			
MEMWB buffer4(
    .clk(clk),
	.MEMWB_Read_Data(Mem_BFF4),
	.MEMWB_ResALU(Res_Mem),
	.MEMWB_Write_Reg(CWR),
	.MEMWB_Sal_WR(WR_BR),
    .MEMWB_Sal_RD(BMux3),
	.MEMWB_SResALU(AMux3),
	.MEMWB_MemtoReg(MemtoReg2),
	.MEMWB_RegWrite(RegWrite2),
	.MEMWB_SMemtoReg(MemtoReg3),
	.MEMWB_SRegWrite(RegWrite3)
);

SignExtender signExtender(
	.mainInput(CJump),
	.result(J_BFF2)
);

LeftShifter shift(
	.in(CJump2),
	.out(Shift_Sum)
);

Adder32B adder32(
	.inputA(CFetch3),
	.inputB(Shift_Sum),
	.result(Sum_BFF3)
);

Mux2 muxy3(
	.A(AMux3),
	.B(BMux3),
	.in(MemtoReg3),
	.Sal(Mux3_BR)
);

ControlUnit controlUnit(
	.instruction(COpcode),
	.RegDst(RegDst),
	.Branch(Branch),
	.MemRead(MemRead),
	.ALUOP(ALUOP),
    .MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.Jump(Jump)
);

Mux muxy1(
	.in(RegDst1),
	.A(CRT2),
	.B(CRD2),
	.Sal(Mux_BFF)
);
 
RegistryStore regArray( 
	.RegistryAddressA(CRS),
	.RegistryAddressB(CRT),
	.writeDir(WR_BR),
	.regWrite(RegWrite3),
    .registryOutA(RD1_B),
	.registryOutB(RD2_B),
	.dataInput(Mux3_BR)
);
				
Mux2 muxy2(
	.in(ALUSrc1),
	.A(CB),
	.B(CJump2),
	.Sal(MuxALU)
);
 
AluControl aluControl(
	.opALU(ALUOP1),
	.opFunction(CJump2[5:0]),
	.ALUout(Sel_B)
);			
 
ALUKawaii mainALU(
	.inputA(CA),
	.inputB(MuxALU),
	.aluOperation(Sel_B),
	.zeroFlag(ZF),
	.result(CRes)
);
				
Memory32B mainMemory(
	.dir(Res_Mem),
	.dataInput(WD_Mem),
	.result(Mem_BFF4),
	.MemWrite(MemWrite2),
	.MemRead(MemRead2)
);

Mux2 muxy4(
	.A(Fetch_Mux4_4),
	.B(FetchB_Mux4),
	.in(PCSrc),
	.Sal(mux4_mux5)
);

AND andbranch( 
	.A(Branch2),
	.B(ZF_AND),
	.Sal(PCSrc)
);
	
Mux2 muxy5(
	.B(jumpAddress2),
	.A(mux4_mux5),
	.in(Jump2),
	.Sal(Mux_PC)
);	

LeftShifter2 shift2(
	.in(tar),
	.out(SL_mux5[27:0])
);
 
endmodule
