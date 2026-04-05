`timescale 1ns / 1ns

module alu4_tb();

    parameter N = 4;

    reg [N-1:0] A,B;
    reg [3:0] opcode;
    wire [N-1:0] result;
    wire carry, zero, overflow, negative;

    multi_mode_alu #(N) uut(result, carry, zero, overflow, negative, A, B, opcode);

    initial begin
        $monitor("opcode=%b A=%d B=%d result=%d carry=%b zero=%b overflow=%b negative=%b",
                  A, B, opcode, result, carry, zero, overflow, negative);

        //* ADD
        opcode = 4'b0000; A = 2; B = 1; #10;
        opcode = 4'b0000; A = -1; B = 1; #10;
        opcode = 4'b0000; A = 4; B = 4; #10;
        opcode = 4'b0000; A = -7; B = -7; #10;
        opcode = 4'b0000; A = -1; B = 1; #10;
        opcode = 4'b0000; A = -8; B = -8; #10;

        //* SUB
        opcode = 4'b0001; A = 2; B = 1; #10;
        opcode = 4'b0001; A = 1; B = 2; #10;
        opcode = 4'b0001; A = 7; B = -8; #10;
        opcode = 4'b0001; A = -8; B = 1; #10;
        opcode = 4'b0001; A = 5; B = 5; #10;
        opcode = 4'b0001; A = -8; B = -8; #10;

        //* AND
        opcode = 4'b0010; A = 4'b1010; B = 4'b0101; #10;
        opcode = 4'b0010; A = 4'b1111; B = 4'b1111; #10;
        opcode = 4'b0010; A = 4'b1100; B = 4'b0011; #10;
        opcode = 4'b0010; A = 4'b1110; B = 4'b1010; #10;

        //* OR
        opcode = 4'b0011; A = 4'b1010; B = 4'b0101; #10;
        opcode = 4'b0011; A = 4'b1010; B = 4'b0000; #10;
        opcode = 4'b0011; A = 4'b0000; B = 4'b0000; #10;
        opcode = 4'b0011; A = 4'b0011; B = 4'b0100; #10;

        //* XOR
        opcode = 4'b0100; A = 4'b1111; B = 4'b1111; #10;
        opcode = 4'b0100; A = 4'b1010; B = 4'b0000; #10;
        opcode = 4'b0100; A = 4'b1010; B = 4'b1111; #10;
        opcode = 4'b0100; A = 4'b1100; B = 4'b1010; #10;
        opcode = 4'b0100; A = 4'b1111; B = 4'b0000; #10;

        //* NOT
        opcode = 4'b0101; A = 4'b0000; #10;
        opcode = 4'b0101; A = 4'b1111; #10;
        opcode = 4'b0101; A = 4'b0011; #10;
        opcode = 4'b0101; A = 4'b1010; #10;

        //* SHL
        opcode = 4'b0110; A = 4'b0110; #10;
        opcode = 4'b0110; A = 4'b1010; #10;
        opcode = 4'b0110; A = 4'b0000; #10;
        opcode = 4'b0110; A = 4'b1111; #10;
        opcode = 4'b0110; A = 4'b1000; #10;

        //* SHR
        opcode = 4'b0111; A = 4'b0110; #10;
        opcode = 4'b0111; A = 4'b0101; #10;
        opcode = 4'b0111; A = 4'b0000; #10;
        opcode = 4'b0111; A = 4'b1111; #10;
        opcode = 4'b0111; A = 4'b0001; #10;

        //* INC
        opcode = 4'b1000; A = 4'b0011; #10;
        opcode = 4'b1000; A = 4'b0111; #10;
        opcode = 4'b1000; A = 4'b1000; #10;
        opcode = 4'b1000; A = 4'b1111; #10;
        opcode = 4'b1000; A = 4'b0000; #10;

        //* DEC
        opcode = 4'b1001; A = 4'b0100; #10;
        opcode = 4'b1001; A = 4'b1000; #10;
        opcode = 4'b1001; A = 4'b0000; #10;
        opcode = 4'b1001; A = 4'b0001; #10;
        opcode = 4'b1001; A = 4'b0111; #10;
        opcode = 4'b1001; A = 4'b1111; #10;





        #10 $finish;
    end


endmodule
