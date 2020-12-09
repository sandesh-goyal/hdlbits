module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter B1 = 0, B2 = 1, B3 = 2, DONE = 3;
    reg [1:0] state, next_state;
    reg [23:0] out;
    // State transition logic (combinational)
    always @(*)
        case(state)
            B1: begin
                next_state = (in[3] == 1)? B2:B1;
                out[23:16] = in;
            end
            B2: begin
                next_state = B3;
                out[15:8] = in;
            end
            B3: begin
                next_state = DONE;
                out[7:0] = in;
            end
            DONE: begin
                next_state = (in[3] == 1)? B2:B1;
                out[23:16] = in;
            end
            default: next_state = state;
        endcase
    // State flip-flops (sequential)
    always @(posedge clk)
        if(reset)
            state = B1;
    	else
            state = next_state;
 
    // Output logic
    assign done = (state == DONE) ? 1:0;
    
    // New: Datapath to store incoming bytes.
    always @(posedge clk)
        out_bytes = out;
endmodule

