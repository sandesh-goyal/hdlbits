module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT=0, RIGHT=1, FALL_L=2, FALL_R=3, DIG_L=4, DIG_R=5, SPLAT=6, DONE=7;
    reg [2:0] PS, NS;
    reg [4:0] count;
    
    assign walk_left = (PS == LEFT)? 1:0;
    assign walk_right = (PS == RIGHT)? 1:0;
    assign aaah = ((PS == FALL_L) || (PS == FALL_R) || (PS == SPLAT))? 1:0;
    assign digging = ((PS == DIG_L) | (PS == DIG_R))? 1:0;
    
    always @(posedge clk)
        if((PS == FALL_L) || (PS == FALL_R))
    		count <= count + 5'd1;
    	else
    		count <= 5'd0;
    
    always @(posedge clk, posedge areset)
        if(areset)
            PS <= LEFT;
    	else
            PS <= NS;
    
    always @(*)
        case(PS)
            LEFT:begin
                if(~ground)
                    NS <= FALL_L;
                else if(dig)
                    NS <= DIG_L;
                else if(bump_left)
                    NS <= RIGHT;
                else
                    NS <= LEFT;
            end
            RIGHT:begin
                if(~ground)
                    NS <= FALL_R;
                else if(dig)
                    NS <= DIG_R;
                else if(bump_right)
                    NS <= LEFT;
                else
                    NS <= RIGHT;
            end
            FALL_L:begin
                if(count == 5'd20)
                    NS <= (ground)? DONE:SPLAT;
                else if(~ground)
                    NS <= FALL_L;
                else
                    NS <= LEFT;
            end
            FALL_R:begin
                if(count == 5'd20)
                    NS <= (ground)? DONE:SPLAT;
                else if(~ground)
                    NS <= FALL_R;
                else
                    NS <= RIGHT;
            end
            DIG_L:begin
                if(~ground)
                    NS <= FALL_L;
                else
                    NS <= DIG_L;
            end
            DIG_R:begin
                if(~ground)
                    NS <= FALL_R;
                else
                    NS <= DIG_R;
            end
            SPLAT:begin
                NS <= (ground)? DONE:SPLAT;
            end
            DONE:begin
                NS <= DONE;
            end
            default: NS <= PS;
        endcase            
        
endmodule

