module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [2:0] cr;
    
    bcd_fadd ins1 (a[3:0], b[3:0], cin, cr[0], sum[3:0]);
    bcd_fadd ins2 (a[7:4], b[7:4], cr[0], cr[1], sum[7:4]);
    bcd_fadd ins3 (a[11:8], b[11:8], cr[1], cr[2], sum[11:8]);
    bcd_fadd ins4 (a[15:12], b[15:12], cr[2], cout, sum[15:12]);
endmodule

