module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cin, cout1, cout2;
    assign cin = 0;
    add16 ins1 (a[15:0], b[15:0], cin, sum[15:0], cout1);
    add16 ins2 (a[31:16], b[31:16], cout1, sum[31:16], cout2);
endmodule

