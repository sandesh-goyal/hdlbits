module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] PS, NS;
    
    assign g[1] = (PS == B)? 1:0;
    assign g[2] = (PS == C)? 1:0;
    assign g[3] = (PS == D)? 1:0;
    
    always @(posedge clk)
        if(~resetn)
            PS = A;
    	else
            PS = NS;
    
    always @(*)
        case(PS)
            A: begin
                if(r[1])
                    NS = B;
                else if(r[2])
                    NS = C;
                else if(r[3])
                    NS = D;
                else
                    NS = A;
            end
            B: begin
                if(r[1])
                    NS = B;
                else
                    NS = A;
            end
            C: begin
                if(r[2])
                    NS = C;
                else
                    NS = A;
            end
            D: begin
                if(r[3])
                    NS = D;
                else
                    NS = A;
            end
            default: NS = PS;
        endcase
endmodule

