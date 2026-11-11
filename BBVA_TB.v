`timescale 1ns/1ns

module BBVA_TB ();

reg [19:0] instruccion_tb;
wire [31:0] DD_tb;

BBVA bbva(
    .instruccion(instruccion_tb),
    .DD(DD_tb)
);

initial begin
    instruccion_tb = 20'b0010_1_01001_00011_00010; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0010_0_00000_00000_01001; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0110_0_00000_00011_00010; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0110_0_00000_00010_00010; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0111_0_00000_00010_00101; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0111_0_00000_00101_00010; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0000_0_00000_00001_00000; #100;
    instruccion_tb = 20'b0001_0_00000_00001_00000; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b1100_0_00000_00001_00000; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0010_1_01010_00101_00100; #100; // Sel, we, AW, AR2, AR1
    instruccion_tb = 20'b0010_0_00000_00110_01010; #100; // Sel, we, AW, AR2, AR1

    $stop;
end
endmodule