module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(state) begin
        // State transition logic
        case(state)
            LEFT: begin
                if(bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT: begin
                if(bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            default: next_state = state;       
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state = LEFT;
        else if(clk)
            state = next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT) ? 1:0;
    assign walk_right = ~walk_left;

endmodule

