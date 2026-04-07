module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] s0,s1;
    wire cout;
    
    add16 inst1 ( .a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(s0),.cout(cout));
    add16 inst2 ( .a(a[31:16]),.b(b[31:16]),.cin(cout),.sum(s1),.cout());
    
    assign sum = {s1,s0};
endmodule
