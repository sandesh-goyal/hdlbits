module top_module;
    reg clk;
    
    dut ins(clk);

    initial
        clk = 1'b0;
    
    always
    	#5 clk = ~clk;
    
endmodule

