module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] q1, q2, q3;
    
    my_dff8 ins1 (clk, d, q1);
    my_dff8 ins2 (clk, q1, q2);
    my_dff8 ins3 (clk, q2, q3);
    
    always @(*)
        case (sel)
            2'd0 : q = d;
            2'd1 : q = q1;
            2'd2 : q = q2;
            2'd3 : q = q3;
            default: q = 8'd0;
        endcase
endmodule
