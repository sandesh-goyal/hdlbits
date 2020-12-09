module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q[2:0];
    
    dff_t ins1(clk, resetn, in, q[2]);
    dff_t ins2(clk, resetn, q[2], q[1]);
    dff_t ins3(clk, resetn, q[1], q[0]);
    dff_t ins4(clk, resetn, q[0], out);
    
endmodule

module dff_t(
    input clk,
    input reset,
    input d,
    output q);
    
    always @(posedge clk)
        if(~reset)
            q <= 1'b0;
    	else
            q <= d;
endmodule
