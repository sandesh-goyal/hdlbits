module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    wire [7:0] det, q;
    
    genvar i;
    
    generate for(i=0; i<8; i=i+1) begin : r_loop
        dff_t ins(clk, in[i], q[i]);
        assign det[i] = in[i] & ~q[i];
    end
    endgenerate
        
    always @(posedge clk)
        pedge <= det;
    
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
