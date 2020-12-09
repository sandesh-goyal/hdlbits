module top_module (
    input clock,
    input a,
    output p,
    output q );

    initial
        q <= 1'b0;
    
    always @(clock)
        if(clock == 1)
            p = a;
    	else
            p = p;
    
    always @(negedge clock)
        q = a;
endmodule

