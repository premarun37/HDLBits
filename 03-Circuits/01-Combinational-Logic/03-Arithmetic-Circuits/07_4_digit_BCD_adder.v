module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire c0,c1,c2;
    
    bcd_fadd bcd_fadd0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(c0),
        .sum(sum[3:0])
    );
    
    bcd_fadd bcd_fadd1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c0),
        .cout(c1),
        .sum(sum[7:4])
    );
    
    bcd_fadd bcd_fadd2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c1),
        .cout(c2),
        .sum(sum[11:8])
    );
    
    bcd_fadd bcd_fadd3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c2),
        .cout(cout),
        .sum(sum[15:12])
    );
    
endmodule
