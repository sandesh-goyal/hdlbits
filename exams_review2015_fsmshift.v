module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    integer count = 0;
    
    always @(posedge clk)
        if(reset)
            begin
                shift_ena = 1;
            	count = 0;
            end
    	else if(count < 3)
            count = count + 1;
        else
            begin
                count = 0;
                shift_ena = 0;
            end
            
    		
endmodule

