`timescale 1ns/1ns

module BBVA (
    input [19:0] instruccion,
    output [31:0] DD
);

wire [3:0] Sel = instruccion[19:16];
wire  we = instruccion[15];
wire [4:0] AW = instruccion[14:10];
wire [4:0] AR2 = instruccion[9:5];
wire [4:0] AR1 = instruccion[4:0];

wire [31:0] DR1, DR2;
wire zero;

BR banco(
    .AR1(AR1),
    .AR2(AR2),
    .AW(AW),
    .we(we),
    .DW(DD),
    .DR1(DR1),
    .DR2(DR2)
);
ALU alu(
    .ALUctrl(Sel),
    .A(DR1),
    .B(DR2),
    .Zero(zero),
    .ALUOut(DD)
);
endmodule