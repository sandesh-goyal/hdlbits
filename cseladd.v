module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout, cin1, cin2, cout1, cout2;
    wire [15:0] sum1, sum2;
    assign cin1 = 0;
    assign cin2 = 1;
    
    add16 ins1 (a[15:0], b[15:0], cin1, sum[15:0], cout);
    add16 ins2 (a[31:16], b[31:16], cin1, sum1, cout1);
    add16 ins3 (a[31:16], b[31:16], cin2, sum2, cout2);
    
    always @(*)
        case (cout)
            1'b0 : sum[31:16] = sum1;
            1'b1 : sum[31:16] = sum2;
            default : sum[31:16] = 16'b0;
        endcase
endmodule

