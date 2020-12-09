module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    initial
        q = 4'd0;
    
    always @(posedge clk)
        if(reset | (q == 4'd9 && slowena == 1'b1))
            q = 4'd0;
    	else if(slowena)
            q = q + 1'b1;
endmodule

