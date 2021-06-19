`timescale 1ns/1ns

module Muxyj(
    input [31:0]inA,
    input [31:0]inB,
    input Op,
    output reg[31:0]outC
);

always @*
begin
    case (Op)
        1'b0:
        begin
            outC=inA;
        end
        1'b1:
        begin
            outC=inB;
        end
    endcase
end 

endmodule
