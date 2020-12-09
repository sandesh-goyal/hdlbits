module top_module ();
	reg clk;
    reg reset;
    reg t;
    wire q;
    
    tff ins(clk, reset, t, q);
    initial
        begin
            clk = 1'b0;
            reset = 1'b1;
            #10 reset = 1'b0;
        end
    always 
        #5 clk = ~clk;
    
    initial
        begin
            t = 1'b1;
            #20 t = 1'b0;
        end
endmodule

