module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
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
            DATA: begin
                	next_state <= (count < 4'd7)? DATA:STOP;
                	out_byte[count] <= in;
            		end
            STOP: begin
           				out <= (in)? 1:0;
            			next_state <= (in)? START:DELAY;
            		end
            DELAY:next_state <= (in)? START:DELAY;
            default: next_state <= state;
        endcase
    
    always @(posedge clk)
        if(reset)
            state <= START;
    	else
            state <= next_state;
    // New: Datapath to latch input bits.

endmodule

