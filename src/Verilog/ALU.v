module ALU(
    input [3:0] A,
    input [3:0] B,
    input [2:0] opcode,
    output reg [3:0] result,
    output reg [3:0] remainder,
    output zeroFlag,
    output overflowFlag
);
    wire [3:0] add_result, sub_result, and_result, or_result, xor_result, shifter_y, div_result, div_remainder;
    wire [7:0] mul_result;
    wire add_cout, sub_borrow;
    wire enable_adder, enable_subtractor, enable_multiplier, enable_and, enable_or, enable_xor, enable_shifter, enable_divider;

    // Instantiate control module
    ALU_Control control(
        .opcode(opcode),
        .enable_adder(enable_adder),
        .enable_subtractor(enable_subtractor),
        .enable_multiplier(enable_multiplier),
        .enable_divider(enable_divider),
        .enable_and(enable_and),
        .enable_or(enable_or),
        .enable_xor(enable_xor),
        .enable_shifter(enable_shifter)
    );

    // Instantiate functional modules
    Adder add(.A(A), .B(B), .Cin(1'b0), .Sum(add_result), .Cout(add_cout));
    Subtractor sub(.A(A), .B(B), .Diff(sub_result), .Borrow(sub_borrow));
    Multiplier mult(.A(A), .B(B), .Product(mul_result));
    Divider div(.enable(enable_divider), .A(A), .B(B), .Quotient(div_result), .Remainder(div_remainder));
    And and_gate(.A(A), .B(B), .Y(and_result));
    Or or_gate(.A(A), .B(B), .Y(or_result));
    Xor xor_gate(.A(A), .B(B), .Y(xor_result));
    Shifter shifter(.A(A), .B(B), .Y(shifter_y));

    // Conditional operation based on control signals
    always @(*) begin
        case (opcode)
            3'b000: result = enable_adder ? add_result : 4'b0000;
            3'b001: result = enable_subtractor ? sub_result : 4'b0000;
            3'b010: result = enable_multiplier ? mul_result[3:0] : 4'b0000;
            3'b100: result = enable_and ? and_result : 4'b0000;
            3'b101: result = enable_or ? or_result : 4'b0000;
            3'b110: result = enable_xor ? xor_result : 4'b0000;
            3'b011: result = enable_shifter ? shifter_y : 4'b0000;
            3'b111: begin
                result = enable_divider ? div_result: 4'b0000;
                remainder = enable_divider? div_remainder: 4'b0000;
            end 
            default: begin
                result = 4'b0000;
                remainder = 4'b0000;
            end
        endcase
    end
    
    // Flags
    assign zeroFlag = (result == 4'b0000);
    assign overflowFlag = (opcode == 3'b000 && add_cout) || (opcode == 3'b001 && sub_borrow);

endmodule