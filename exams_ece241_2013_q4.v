module top_module (
    input clk,
    input reset,
    input [2:0] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    reg [2:0] state, next_state;
    reg [2:0] prev_s;
    always @(*)
        begin            
            case(s)
                3'd0: next_state <= 3'd0;
                3'd1: next_state <= ((state == 3'd3)||(state == 3'd4)||(state == 3'd1))? 3'd1:3'd2;
                3'd3: next_state <= ((state == 3'd5)||(state == 3'd3))? 3'd3:3'd4;
                3'd7: next_state <= 3'd5;
                default: next_state <= state;
            endcase
            prev_s <= s;
        end
    

    always @(posedge clk)
        begin
            if(reset)
                state <= 3'd0;
            else
                state <= next_state;
        end
    
    assign fr3 = (state == 3'd0)? 1:0;
    assign fr2 = ((state == 3'd0) || (state == 3'd1) || (state == 3'd2))? 1:0;
    assign fr1 = ((state == 3'd0) || (state == 3'd1) || (state == 3'd2) || (state == 3'd3) || (state == 3'd4))? 1 : 0;
    assign dfr = ((state == 3'd0) || (state == 3'd1) || (state == 3'd3))? 1:0;
    
endmodule

