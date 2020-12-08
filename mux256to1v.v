module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    integer i;
    assign i = sel;
    assign out = in[((i*4)+3) -:4];
endmodule

