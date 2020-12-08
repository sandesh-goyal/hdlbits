module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] coutt;
    genvar j;
    
    assign cout = coutt[99];
    
    bcd_fadd inst1 (a[3:0], b[3:0], cin, coutt[0], sum[3:0]);
    generate for(j=1; j<100; j=j+1) begin : r_loop
        bcd_fadd inst (a[(4*j)+3:4*j], b[(4*j)+3:4*j], coutt[j-1], coutt[j], sum[(4*j)+3:4*j]);
    end
    endgenerate
endmodule

