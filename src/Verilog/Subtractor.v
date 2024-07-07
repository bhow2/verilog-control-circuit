module Subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Diff,
    output Borrow
);
    // Perform the subtraction
    assign Diff = A - B;
    // Borrow occurs if A is less than B
    assign Borrow = A < B;
endmodule

