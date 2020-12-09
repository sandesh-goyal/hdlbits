module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    // State transition logic: next_state = f(state, in)
    always @(*)
        case(state)
            A: begin
                if(in == 1'b0)
                    next_state = A;
                else if(in == 1'b1)
                    next_state = B;
            end
            B: begin
                if(in == 1'b0)
                    next_state = C;
                else if(in == 1'b1)
                    next_state = B;
            end
            C: begin
                if(in == 1'b0)
                    next_state = A;
                else if(in == 1'b1)
                    next_state = D;
            end
            D: begin
                if(in == 1'b0)
                    next_state = C;
                else if(in == 1'b1)
                    next_state = B;
            end
            default: next_state = state;
        endcase

    // State flip-flops with synchronous reset
    always @(posedge clk)
        if(reset)
            state = A;
        else
            state = next_state;
    // Output logic
    assign out = (state == D)? 1:0;
endmodule

