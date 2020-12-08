module top_module (
    input [7:0] in,
    output parity); 

    wire par;
    assign par = ^ in[7:0];
    assign parity = par ? 1 : 0;
endmodule

