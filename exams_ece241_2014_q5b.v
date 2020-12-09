module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

	parameter A=1, B=2;
    reg [1:0] PS, NS;
    
    always @(PS,x)
        case(PS)
            A: begin
                NS <= (x)? B:A;
                z <= (x)? 1:0;
            end
            B: begin
                NS <= B;
                z <= (x)? 0:1;
            end
        endcase
    
    always @(posedge clk, posedge areset)
        if(areset)
            PS <= A;
    	else
            PS <= NS;
endmodule

