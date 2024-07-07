`timescale 1ns / 1ns

module binary_testbench;
    reg [3:0] A, B;
    reg[2:0] opcode;
    wire [3:0] result;
    wire zeroFlag, overflowFlag;

    ALU alu (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zeroFlag(zeroFlag),
        .overflowFlag(overflowFlag)
    );

    initial begin
        $dumpfile("binary_testbench.vcd");
        $dumpvars(0, binary_testbench);

        // AND
        A = 4'b1101; B = 4'b0011; opcode = 3'b100; #10;
        A = 4'b0011; B = 4'b0101; opcode = 3'b100; #10;
        A = 4'b1101; B = 4'b1101; opcode = 3'b100; #10;

        // OR
        A = 4'b1101; B = 4'b0011; opcode = 3'b101; #10;
        A = 4'b0011; B = 4'b0101; opcode = 3'b101; #10;
        A = 4'b1101; B = 4'b1101; opcode = 3'b101; #10;

        // XOR
        A = 4'b1101; B = 4'b0011; opcode = 3'b110; #10;
        A = 4'b0011; B = 4'b0101; opcode = 3'b110; #10;
        A = 4'b1101; B = 4'b1101; opcode = 3'b110; #10;

        $finish;
    end
endmodule