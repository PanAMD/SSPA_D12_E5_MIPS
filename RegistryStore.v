`timescale 1ns/1ns

module RegistryStore(
	input [4:0]RegistryAddressA,RegistryAddressB,writeDir,
	input [31:0]dataInput,
	input regWrite,
	output reg[31:0]registryOutA,registryOutB
);

reg [31:0]BR[0:31];

initial begin
    $readmemb("BancoR.mem",BR);
end

always @* begin
    if(regWrite) begin
        BR[writeDir]<=dataInput;
    end
    registryOutA<=BR[RegistryAddressA];
    registryOutB<=BR[RegistryAddressB];
end

endmodule