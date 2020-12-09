module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=0, RIGHT=1, GROUND_L=2, GROUND_R=3;
    reg [1:0] state, next_state;

    always @(state) begin
        // State transition logic
        case(state)
            LEFT: begin
                if(~ground)
                    next_state = GROUND_L;
                else if(bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT: begin
                if(~ground)
                    next_state = GROUND_R;
                else if(bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            GROUND_L: begin
                if(~ground)
                    next_state = GROUND_L;
                else
                    next_state = LEFT;
            end
            GROUND_R: begin
                if(~ground)
                    next_state = GROUND_R;
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
    assign aaah = ((state == GROUND_L) || (state == GROUND_R))? 1:0;
    assign walk_left = (~aaah && ((state == LEFT) ? 1:0));
    assign walk_right = (~aaah && (~walk_left));

endmodule

