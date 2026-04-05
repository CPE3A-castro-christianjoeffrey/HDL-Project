`timescale 1ns / 1ns

module alu8_tb();

    parameter N = 8;

    reg [N-1:0] A,B;
    reg [3:0] opcode;
    wire [N-1:0] result;
    wire carry, zero, overflow, negative;

    multi_mode_alu #(N) uut(result, carry, zero, overflow, negative, A, B, opcode);

    initial begin
        $monitor("opcode=%b A=%d B=%d result=%d carry=%b zero=%b overflow=%b negative=%b",
                  A, B, opcode, result, carry, zero, overflow, negative);

        //* ADD
        opcode = 4'b0000; A = 1; B = 2; #10;
        opcode = 4'b0000; A = -128; B = -128; #10;
        opcode = 4'b0000; A = 127; B = 1; #10;
        opcode = 4'b0000; A = -1; B = 1; #10;


        //* SUB
        opcode = 4'b0001; A = 16; B = 5; #10;
        opcode = 4'b0001; A = 5; B = 16; #10;
        opcode = 4'b0001; A = -128; B = 1; #10;
        opcode = 4'b0001; A = 127; B = -128; #10;


        //* AND
        opcode = 4'b0010; A = 8'hf0; B = 8'h0f; #10;


        //* OR
        opcode = 4'b0011; A = 8'h00; B = 8'h00; #10;


        //* XOR
        opcode = 4'b0100; A = 8'hff; B = 8'hff; #10;


        //* NOT
        opcode = 4'b0101; A = 8'h00; #10;
        opcode = 4'b0101; A = 8'hff; #10;


        //* SHL
        opcode = 4'b0110; A = 8'h40; #10;
        opcode = 4'b0110; A = 8'h80; #10;
        opcode = 4'b0110; A = 8'hff; #10;


        //* SHR
        opcode = 4'b0111; A = 8'h02; #10;
        opcode = 4'b0111; A = 8'h01; #10;
        opcode = 4'b0111; A = 8'h80; #10;


        //* INC
        opcode = 4'b1000; A = 8'h00; #10;
        opcode = 4'b1000; A = 8'h7f; #10;
        opcode = 4'b1000; A = 8'hff; #10;
        opcode = 4'b1000; A = 8'h80; #10;


        //* DEC
        opcode = 4'b1001; A = 8'h01; #10;
        opcode = 4'b1001; A = 8'h00; #10;
        opcode = 4'b1001; A = 8'h80; #10;
        opcode = 4'b1001; A = 8'h81; #10;

        #10 $finish;

    end


endmodule
