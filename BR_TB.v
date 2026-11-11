`timescale 1ns/1ns

module BR_TB();
reg [4:0] AR1_tb;
reg [4:0] AR2_tb;
reg [4:0] AW_tb;
reg [31:0] DW_tb;
reg we_tb;

wire [31:0] DR1_tb;
wire [31:0] DR2_tb;

BR banquito (
    .AR1(AR1_tb),
    .AR2(AR2_tb),
    .AW(AW_tb),
    .DW(DW_tb),
    .we(we_tb),
    .DR1(DR1_tb),
    .DR2(DR2_tb)
);

initial begin
    we_tb = 1'b0;
    AW_tb = 5'd0;
    DW_tb = 32'd0;

    AR1_tb = 5'd0; AR2_tb = 5'd1; #100;
    AR1_tb = 5'd2; AR2_tb = 5'd3; #100;
    AR1_tb = 5'd4; AR2_tb = 5'd5; #100;
    AR1_tb = 5'd5; AR2_tb = 5'd0; #100;

    AR1_tb = 5'd2; AR2_tb = 5'd2; #100;
    
    AW_tb = 5'd9; DW_tb = 32'd175; we_tb = 1'b1; #100;

    we_tb = 1'b0;
    AR1_tb = 5'd9; AR2_tb = 5'd3; #100;
    
    AW_tb = 5'd0; DW_tb = 32'd99; we_tb = 1'b1; #100;
    we_tb = 1'b0;
    AR1_tb = 5'd0; AR2_tb = 5'd1; #100;
    
    $stop;

end

endmodule

