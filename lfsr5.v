module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 

    wire d4, d2;
    
    assign d4 = 1'b0 ^ q[0];
    assign d2 = q[3] ^ q[0];
    
    dff_t ins1(clk, reset, 1'b0, d4, q[4]);
    dff_t ins2(clk, reset, 1'b0, q[4], q[3]);
    dff_t ins3(clk, reset, 1'b0, d2, q[2]);
    dff_t ins4(clk, reset, 1'b0, q[2], q[1]);
    dff_t ins5(clk, reset, 1'b1, q[1], q[0]);
    
endmodule

module dff_t(
    input clk,
    input reset,
    input r_val,
    input d,
    output q);
    
    always @(posedge clk)
        if(reset)
            q <= r_val;
    	else
            q <= d;
endmodule

