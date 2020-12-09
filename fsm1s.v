// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state = 1;
        end 
        else begin
            case (present_state)
                // Fill in state transition logic
                1: begin
                    if(in == 0)
                        next_state = 0;
                    else if(in == 1)
                        next_state = 1;
                end
                0: begin
                    if(in == 1)
                        next_state = 0;
                    else if(in == 0)
                        next_state = 1;
                end
                default: next_state = present_state;
            endcase
            // State flip-flops
            present_state = next_state;   
        end
            case (present_state)
                // Fill in output logic
                1: out = 1;
                0: out = 0;
                default: out = 0;
            endcase
    end

endmodule

