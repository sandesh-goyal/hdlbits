module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    wire [31:0] d, r_val;
    
    assign r_val = 32'h1;
    
    assign d[31] = q[0] ^ 1'b0;
    assign d[21] = q[0] ^ q[22];
    assign d[1] = q[0] ^ q[2];
    assign d[0] = q[0] ^ q[1];
    
    assign d[30:22] = q[31:23];
    assign d[20:2] = q[21:3];
    
    genvar i;
    
    generate for(i=0; i<32; i=i+1)
        begin:r_loop
            dff_t ins(clk, reset, r_val[i], d[i], q[i]);
        end
    endgenerate
    
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
