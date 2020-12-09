module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter NONE=0, ONE=1, TWO=2, THREE=3, FOUR=4, FIVE=5, SIX=6, ERROR=7, DISCARD=8, FLAG=9;
    reg [3:0] state, n_state;
    
    assign err = (state == ERROR)? 1:0;
    assign disc = (state == DISCARD)? 1:0;
    assign flag = (state == FLAG)? 1:0;
    
    always @(*)
        case(state)
            NONE: n_state = (in)? ONE:NONE;
            ONE: n_state = (in)? TWO:NONE;
            TWO: n_state = (in)? THREE:NONE;
            THREE: n_state = (in)? FOUR:NONE;
            FOUR: n_state = (in)? FIVE:NONE;
            FIVE: n_state = (in)? SIX:DISCARD;
            SIX: n_state = (in)? ERROR:FLAG;
            ERROR: n_state = (in)? ERROR:NONE;
            DISCARD: n_state = (in)? ONE:NONE;
            FLAG: n_state = (in)? ONE:NONE;
            default: n_state = state;
        endcase
    
    always @(posedge clk)
        if(reset)
            state = NONE;
    	else
            state = n_state;
endmodule

