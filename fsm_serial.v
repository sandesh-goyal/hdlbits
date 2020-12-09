module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    parameter START = 0, DATA = 1, STOP = 2, DELAY = 3;
    reg [1:0] state, next_state;
    reg [3:0] count;
    reg out;
    
    always @(posedge clk)
   	done = out;
    
    always @(posedge clk)
    	if(state == DATA)
    		count <= count + 4'd1;
    	else if(state == START)
    		count <= 4'd0;
    
    always @(*)
        case(state)
            START: begin
            			next_state <= (in)? START:DATA;
            			out <= 0;
            		end
            DATA: next_state <= (count < 4'd7)? DATA:STOP;
            STOP: begin
           				out <= (in)? 1:0;
            			next_state <= (in)? START:DELAY;
//            			next_state <= START;
            		end
            DELAY:next_state <= (in)? START:DELAY;
            default: next_state <= state;
        endcase
    
    always @(posedge clk)
        if(reset)
            state <= START;
    	else
            state <= next_state;
    
endmodule

