module top_module (
    input clk,
    input x,
    output z
); 
    wire t1,t2,t3,q1,q2,q3,qb1,qb2,qb3;

    initial
    begin
        q1 = 0;
        q2 = 0;
        q3 = 0;
        qb1 = 1;
        qb2 = 1;
        qb3 = 1;
    end
    
    assign z = ~(q1||q2||q3);
    assign t1 = x ^ q1;
    assign t2 = x && qb2;
    assign t3 = x || qb3;
    assign qb1 = ~q1;
    assign qb2 = ~q2;
    assign qb3 = ~q3;
    
    dff_t ins1(clk, t1, q1);
    dff_t ins2(clk, t2, q2);
    dff_t ins3(clk, t3, q3);
    
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

