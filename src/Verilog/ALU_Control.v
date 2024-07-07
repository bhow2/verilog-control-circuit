// Control module for the ALU
module ALU_Control(
    input wire [2:0] opcode,
    output wire enable_adder,
    output wire enable_subtractor,
    output wire enable_multiplier,
    output wire enable_divider,
    output wire enable_and,
    output wire enable_or,
    output wire enable_xor,
    output wire enable_shifter
);

    // Decode the opcode to enable signals
    assign enable_adder = (opcode == 3'b000);
    assign enable_subtractor = (opcode == 3'b001);
    assign enable_multiplier = (opcode == 3'b010);
    assign enable_divider = (opcode == 3'b111);
    assign enable_and = (opcode == 3'b100);
    assign enable_or = (opcode == 3'b101);
    assign enable_xor = (opcode == 3'b110);
    assign enable_shifter = (opcode == 3'b011);

endmodule