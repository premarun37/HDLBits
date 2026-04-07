module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_lower;
    wire [15:0] sum_upper0, sum_upper1;  // upper results for cin=0 and cin=1

    // Lower 16 bits — only one needed, cin is always 0
    add16 lower (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(cout_lower)       // this selects which upper result to use
    );

    // Upper 16 bits — assuming carry-in = 0
    add16 upper0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_upper0),
        .cout()
    );

    // Upper 16 bits — assuming carry-in = 1
    add16 upper1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_upper1),
        .cout()
    );

    // 2-to-1 mux: pick the correct upper sum based on actual carry from lower
    assign sum[31:16] = cout_lower ? sum_upper1 : sum_upper0;

endmodule