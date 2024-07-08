module Divider(
    input enable,
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] Quotient,
    output reg [3:0] Remainder
);
    // Evaluate division and modulus, handling division by zero
    always @* begin
        if (enable && B != 0) begin
            Quotient = A / B;
            Remainder = A % B;
        end else begin
            Quotient = 0; // Handle division by zero by setting quotient to 0
            Remainder = 0; // Remainder also set to 0 to indicate invalid operation
        end
    end
endmodule
