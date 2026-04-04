`timescale 1ns / 1ns

module alu4_tb();

    parameter N = 4;

    reg [N-1:0] A,B;
    reg [3:0] opcode;
    wire [N-1:0] result;
    wire carry, zero, overflow, negative;

    multi_mode_alu #(N) uut(result, carry, zero, overflow, negative, A, B, opcode);

    initial begin
        $monitor("A=%d B=%d opcode=%b result=%d carry=%b zero=%b overflow=%b negative=%b",
                  A, B, opcode, result, carry, zero, overflow, negative);

        //* ADD
        opcode = 4'b0000; A = 2; B = 1; #10;
        opcode = 4'b0000; A = -1; B = 1; #10;
        opcode = 4'b0000; A = 4; B = 4; #10;
        opcode = 4'b0000; A = -7; B = -7; #10;
        opcode = 4'b0000; A = -1; B = 1; #10;
        opcode = 4'b0000; A = -8; B = -8; #10;

        #10 $finish;
    end


endmodule
