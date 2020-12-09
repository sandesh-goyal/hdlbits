module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    wire t1,t2,t3,qb;
    
    assign qb = ~Q;
    assign t1 = qb & j;
    assign t2 = Q & ~k;
    assign t3 = t1 | t2;
    
    dff_t ins1(clk,t3,Q);
endmodule

module dff_t(
	input clk,
	input d,
	output q);
    
    always @(posedge clk)
    begin
        q <= d;
    end
endmodule
