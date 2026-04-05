`timescale 1ns / 1ns

module multi_mode_alu #(parameter N = 8)(result, carry, zero, overflow, negative, A, B, opcode);
    
    input [N-1:0] A,B;
    input [3:0] opcode;
    output reg [N-1:0] result;
    output reg carry, zero, overflow, negative;
    reg [N:0] temp;

    always@(A or B or opcode)begin

        result = 0;
        carry = 0;
        overflow = 0;

        case(opcode)
            4'b0000:begin //* ADD
                temp = A + B;
                result = temp[N-1:0];
                carry = temp[N];
                overflow = (A[N-1] == B[N-1]) && (result[N-1] != A[N-1]);
            end
            4'b0001:begin//* SUB
                temp = A - B;
                result = temp[N-1:0];
                carry = temp[N];
                overflow = (A[N-1] != B[N-1]) && (result[N-1] != A[N-1]);
            end
            4'b0010://* AND
                result = A & B;
            4'b0011://* OR
                result = A | B;
            4'b0100://* XOR
                result = A ^ B;
            4'b0101://* NOT --- A only
                result = ~A;
            4'b0110:begin//* SHL --- A only
                result = A << 1;
                carry = A[N-1];
            end
            4'b0111:begin//* SHR --- A only
                result = A >> 1;
                carry = A[0];
            end
            4'b1000:begin//* INC --- A only
                temp = A + 1;
                result = temp[N-1];
                carry = temp[N];
                overflow = (A[N-1] == 1'b0) &&(A[N-1] != 1'b0);
            end
            4'b1001:begin//* DEC --- A only
                temp = A + 1;
                result = temp[N-1];
                carry = temp[N];
                overflow = (A[N-1] == 1'b1) &&(A[N-1] != 1'b1);
            end
        endcase

        //* Flags
        zero = (result == 0);
        negative = result[N-1];
    end

endmodule
