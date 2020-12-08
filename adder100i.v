module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar j;
    
    FA inst1 (a[0], b[0], cin, cout[0], sum[0]);
    generate for(j=1; j<100; j=j+1) begin : r_loop
        FA inst (a[j], b[j], cout[j-1], cout[j], sum[j]);
    end
    endgenerate
    
endmodule

module FA( 
    input a, b, cin,
    output cout, sum);

    assign sum = a + b + cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule
