module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] en;
    
    assign en[0] = 1'b1;
    assign ena[1] = q[3] & q[0];
    assign ena[2] = q[7] & q[4] & ena[1];
    assign ena[3] = q[11] & q[8] & ena[2];
    
    bcd ins1(clk, en[0], reset, q[3:0]);
    bcd ins2(clk, ena[1], reset, q[7:4]);
    bcd ins3(clk, ena[2], reset, q[11:8]);
    bcd ins4(clk, ena[3], reset, q[15:12]);
    
endmodule

module bcd (
    input clk,
    input en,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    initial
        q = 4'd0;
    
    always @(posedge clk)
        if(reset | (q == 4'd9 && en==1'b1))
            q = 4'd0;
           else if(en==1'b1)
            q = q + 1'b1;
endmodule

