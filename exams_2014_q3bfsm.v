module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
	parameter A=0, B=1, C=2, D=3, E=4;
    reg [2:0] PS, NS;
    
    assign z = ((PS == D) || (PS == E))? 1:0;
    
    always @(*)
        case(PS)
            A: NS = (x)? B:A;
            B: NS = (x)? E:B;
            C: NS = (x)? B:C;
            D: NS = (x)? C:B;
            E: NS = (x)? E:D;
            default: NS = PS;
        endcase
    
    always @(posedge clk)
        if(reset)
            PS = A;
    	else
            PS = NS;
endmodule

