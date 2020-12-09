module top_module (
    input clk,
    input in, 
    output out);

    wire t;
    assign t = in ^ out;
    
    always @(posedge clk)
        out <= t;
endmodule

