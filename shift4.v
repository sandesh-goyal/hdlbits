module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge areset, posedge clk)
        begin
            if(areset)
                q <= 4'd0;
            else if(clk && load)
                q <= data;
            else if(clk && ena)
                q <= {1'b0,q[3:1]};
        end
endmodule

