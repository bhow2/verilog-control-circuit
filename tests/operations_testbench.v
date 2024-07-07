`timescale 1ns / 1ps

module operations_testbench;

    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] result;
    wire [3:0] remainder;
    wire zeroFlag, overflowFlag;

    // Instantiate the ALU
    ALU alu (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .remainder(remainder),
        .zeroFlag(zeroFlag),
        .overflowFlag(overflowFlag)
    );

    initial begin
        $dumpfile("operations_testbench.vcd");
        $dumpvars(0, operations_testbench);
        A = 0; B = 0; opcode = 3'bxxx;
        // Addition
        A = 4'b1001; B = 4'b0110; opcode = 3'b000; #10;
        A = 4'b1010; B = 4'b0011; opcode = 3'b000; #10;
        A = 4'b0011; B = 4'b0010; opcode = 3'b000; #10;
        A = 4'b1000; B = 4'b0010; opcode = 3'b000; #10; 
        
        // Subtraction
        A = 4'b1001; B = 4'b0110; opcode = 3'b001; #10;
        A = 4'b1010; B = 4'b0011; opcode = 3'b001; #10;
        A = 4'b0011; B = 4'b0010; opcode = 3'b001; #10;
        A = 4'b1000; B = 4'b0010; opcode = 3'b001; #10; 
        
        
        // Multiplication
        A = 4'b1001; B = 4'b0110; opcode = 3'b010; #10;        
        A = 4'b1010; B = 4'b0011; opcode = 3'b010; #10;     
        A = 4'b0011; B = 4'b0010; opcode = 3'b010; #10;
        A = 4'b1000; B = 4'b0010; opcode = 3'b010; #10; 
        
        // Division
        A = 4'b1001; B = 4'b0110; opcode = 3'b111; #10;
        A = 4'b1010; B = 4'b0011; opcode = 3'b111; #10;
        A = 4'b0011; B = 4'b0010; opcode = 3'b111; #10;
        A = 4'b1000; B = 4'b0010; opcode = 3'b111; #10;

        $finish;
    end
endmodule
