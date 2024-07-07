`timescale 1ns / 1ps

module shifter_testbench;
    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] result;
    wire zeroFlag, overflowFlag;

    // Instantiate the ALU
    ALU alu (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zeroFlag(zeroFlag),
        .overflowFlag(overflowFlag)
    );

    initial begin
        $dumpfile("shifter_testbench.vcd");
        $dumpvars(0, shifter_testbench);

        // Set up the monitor for debugging
        $monitor("Time=%t, Opcode=%b, A=%b, B=%b, Result=%b", $time, opcode, A, B, result);

        // Test 1: Left shift A=4'b1010 by 1 (B=4'b1001 -> [3] is direction, [2:0] is number of shifts)
        A = 4'b1010; B = 4'b1001; opcode = 3'b011; #10;

        // Test 2: Right shift A=4'b1010 by 2 (B=4'b0010)
        A = 4'b1010; B = 4'b0010; opcode = 3'b011; #10;

        // Test 3: Left shift A=4'b1101 by 3 (B=4'b1111)
        A = 4'b1101; B = 4'b1111; opcode = 3'b011; #10;

        // Test 4: Right shift A=4'b1001 by 1 (B=4'b0001)
        A = 4'b1001; B = 4'b0001; opcode = 3'b011; #10;

        $finish;
    end
endmodule
