module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg cy;

    always @(posedge clk, posedge areset)
        if(areset)
            begin
    			cy <= 1;
                z <= 0;
            end
    	else
        	{cy,z} <= (!x) + cy;
        
endmodule

