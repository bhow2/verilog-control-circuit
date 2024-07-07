module Adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [4:0] full_sum;
    assign full_sum = A + B + Cin;
    assign Sum = full_sum[3:0];
    assign Cout = full_sum[4];
endmodule

