module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [98:0] cr;    
    
    FA ins1 (a[0], b[0], cin, cr[0], sum[0]);
    FA ins2 (a[99], b[99], cr[98], cout, sum[99]);
    genvar i;
    
    generate for (i=1; i<99; i=i+1) begin : r_loop
        FA ins (a[i], b[i], cr[i-1], cr[i], sum[i]);
    end
    endgenerate
endmodule

module FA( 
    input a, b, cin,
    output cout, sum );

    assign sum = a + b + cin;
    assign cout = a&b | b&cin | cin&a;
endmodule
