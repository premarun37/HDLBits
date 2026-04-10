module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    wire a,b,c,d;
    assign a = (~x3 & x2 & ~x1);
    assign b = (~x3 & x2 & x1);
    assign c = (x3 & ~x2 & x1);
    assign d = (x3 & x2 & x1);
    assign f = (a | b | c | d);
endmodule
