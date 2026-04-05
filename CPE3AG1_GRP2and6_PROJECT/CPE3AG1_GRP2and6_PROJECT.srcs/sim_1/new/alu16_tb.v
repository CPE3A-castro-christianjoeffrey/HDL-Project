`timescale 1ns / 1ns

module alu16_tb();

    parameter N = 16;

    reg [N-1:0] A,B;
    reg [3:0] opcode;
    wire [N-1:0] result;
    wire carry, zero, overflow, negative;

    multi_mode_alu #(N) uut(result, carry, zero, overflow, negative, A, B, opcode);

    initial begin
        $monitor("opcode=%b A=%d B=%d result=%d carry=%b zero=%b overflow=%b negative=%b",
                  A, B, opcode, result, carry, zero, overflow, negative);

        //* ADD
        opcode = 4'b0000; A = 16'h0001; B = 16'h0002; #10;
        opcode = 4'b0000; A = 16'h8000; B = 16'h8000; #10;
        opcode = 4'b0000; A = 16'h7fff; B = 16'h0001; #10;
        opcode = 4'b0000; A = 16'hffff; B = 16'h0001; #10;


        //* SUB
        opcode = 4'b0001; A = 16'h1000; B = 16'h0200; #10;
        opcode = 4'b0001; A = 16'h0200; B = 16'h1000; #10;
        opcode = 4'b0001; A = 16'h8000; B = 16'h0001; #10;
        opcode = 4'b0001; A = 16'h7fff; B = 16'h8000; #10;


        //* AND
        opcode = 4'b0010; A = 16'hff00; B = 16'h00ff; #10;


        //* OR
        opcode = 4'b0011; A = 16'h0000; B = 16'h0000; #10;
        opcode = 4'b0011; A = 16'h0010; B = 16'h0d00; #10;


        //* XOR
        opcode = 4'b0100; A = 16'hffff; B = 16'hffff; #10;
        opcode = 4'b0011; A = 16'h0010; B = 16'h0d00; #10;


        //* NOT
        opcode = 4'b0101; A = 16'h0000; #10;
        opcode = 4'b0101; A = 16'hffff; #10;


        //* SHL
        opcode = 4'b0110; A = 16'h4000; #10;
        opcode = 4'b0110; A = 16'h8000; #10;
        opcode = 4'b0110; A = 16'hffff; #10;


        //* SHR
        opcode = 4'b0111; A = 16'h0002; #10;
        opcode = 4'b0111; A = 16'h0001; #10;
        opcode = 4'b0111; A = 16'h8000; #10;


        //* INC
        opcode = 4'b1000; A = 16'h8000; #10;
        opcode = 4'b1000; A = 16'h7fff; #10;
        opcode = 4'b1000; A = 16'hffff; #10;
        opcode = 4'b1000; A = 16'h8000; #10;


        //* DEC
        opcode = 4'b1001; A = 16'h0001; #10;
        opcode = 4'b1001; A = 16'h0000; #10;
        opcode = 4'b1001; A = 16'h8000; #10;
        opcode = 4'b1001; A = 16'h8001; #10;

        #10 $finish;

    end


endmodule
