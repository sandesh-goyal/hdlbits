module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    initial
        q = 4'd0;
    
    always @(posedge clk)
        if(reset | q == 4'd9)
            q = 4'd0;
    	else
            q = q + 1'b1;
endmodule

