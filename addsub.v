module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] binv;
    wire cout, cout1;
    
    assign binv = b ^ {32{sub}};
    add16 ins1 (a[15:0], binv[15:0], sub, sum[15:0], cout);
    add16 ins2 (a[31:16], binv[31:16], cout, sum[31:16], cout1);
endmodule

