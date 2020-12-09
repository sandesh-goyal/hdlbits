module top_module (
    input clk,
    input reset,
    output [3:0] q);

    initial
        q = 4'd1;
    
    always @(posedge clk)
        if(reset | q == 4'd10)
            q = 4'd1;
    	else
            q = q + 1'b1;
endmodule

