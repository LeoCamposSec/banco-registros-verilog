`timescale 1ns/1ns

module BR (
    input [4:0] AR1,
    input [4:0] AR2,
    input [4:0] AW,
    input [31:0] DW,
    input we,
    output [31:0] DR1,
    output [31:0] DR2
);

reg [31:0]mem[0:31];

assign DR1 = mem[AR1];
assign DR2 = mem[AR2];

always @*
begin
    if (we)
        mem[AW] <= DW;
end

initial begin
    $readmemb("datos.txt", mem);
end

endmodule