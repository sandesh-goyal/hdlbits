module top_module (
    input clk,
    input d,
    output q
);

    wire q1, q2;
    
    assign q = q1^q2;
    
    always @(negedge clk)
        q2 <= q1^d;
    
    always @(posedge clk)
        q1 <= q2^d;
    
endmodule

    


