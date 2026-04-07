module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);

    wire [100:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_chain
            bcd_fadd fa (
                .a   (a[4*i +: 4]),
                .b   (b[4*i +: 4]),
                .cin (carry[i]),
                .sum (sum[4*i +: 4]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[100];

endmodule