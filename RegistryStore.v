`timescale 1ns/1ns

module RegistryStore(
    input regWrite,
    input [31:0] dataInput,
    input [4:0]writeDir,
    input [4:0]registryAddressA,
    input [4:0]registryAddressB,
    output reg [31:0] registryOutA,
    output reg [31:0] registryOutB
);

reg [31:0]data [0:31];

initial begin
    $readmemb("TestF1_BReg.mem",data);
end

always @* begin
    if(regWrite) begin
        data[writeDir]<=dataInput;
    end
    registryOutA<=data[registryAddressA];
    registryOutB<=data[registryAddressB];
end

endmodule
