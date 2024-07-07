module Shifter(
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [3:0] Y
);
    integer i;
    reg [3:0] temp;
    wire shift_dir;  // 0 for right shift, 1 for left shift
    wire fill_bit = 0;  // Can be parameterized or made an input if necessary

    assign shift_dir = B[3]; // Let's use B[3] as the direction flag explicitly

    always @* begin
        temp = A;
        for (i = 0; i < B[2:0]; i = i + 1) begin  // Use B[2:0] for up to 7 shifts
            if (shift_dir) 
                temp = {temp[2:0], fill_bit};  // Left shift, fill LSB
            else 
                temp = {fill_bit, temp[3:1]};  // Right shift, fill MSB
        end
        Y = temp;
    end
endmodule
