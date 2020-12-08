module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    wire t1, t2, t3, t4;
    assign t1 = ~x1 &  x2 & ~x3;
    assign t2 =  x1 &  x2 & ~x3;
    assign t3 =  x1 & ~x2 &  x3;
    assign t4 =  x1 &  x2 &  x3;
    assign f = t1 | t2 | t3 | t4;
endmodule

