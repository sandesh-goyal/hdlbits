module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            ON: begin
                if(k==0)
                    next_state = ON;
                else if(k==1)
                    next_state = OFF;
            end
            OFF: begin
                if(j==0)
                    next_state = OFF;
                else if(j==1)
                    next_state = ON;
            end
            default: next_state = state;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset)
            state = 0;
        else
            state = next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == 1)? 1:0;
endmodule

