module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout_lower;  // carry out from lower 16 bits into upper 16 bits

    // Lower 16 bits: a[15:0] + b[15:0], cin = 0
    add16 lower (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(cout_lower)
    );

    // Upper 16 bits: a[31:16] + b[31:16], cin = carry from lower
    add16 upper (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout_lower),
        .sum(sum[31:16]),
        .cout()           // ignored, left unconnected
    );

endmodule


module add1 ( input a, input b, input cin, output sum, output cout );

    assign sum  = a ^ b ^ cin;           // XOR gives 1-bit sum
    assign cout = (a & b) | (a & cin) | (b & cin);  // carry out

endmodule