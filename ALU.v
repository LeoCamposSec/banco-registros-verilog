 `timescale 1ns/1ns

 module ALU (
    input [3:0] ALUctrl,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] ALUOut,
    output Zero
);

assign Zero = (ALUOut == 0);

always @(*) begin
    case (ALUctrl)
        4'b0000: ALUOut <= A & B; // AND
        4'b0001: ALUOut <= A | B; // OR
        4'b0010: ALUOut <= A + B; // ADD
        4'b0110: ALUOut <= A - B; // SUBTRACT
        4'b0111: ALUOut <= ($signed(A) < $signed(B)) ? 1 : 0; // SET ON LESS THAN
        4'b1100: ALUOut <= ~(A | B); // NOR
        default: ALUOut <= 0; // DEFAULT CASE
    endcase
end

endmodule
