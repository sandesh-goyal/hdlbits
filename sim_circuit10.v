module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    assign q = a^b^state;
    
    always @(posedge clk)
        if({a,b} == 2'd3)
            state <= 1;
    	else if({a,b} == 2'd0)
            state <= 0;
        else
            state <= state;
    
endmodule

