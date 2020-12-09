module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8, J=9;
    reg [3:0] PS, NS;
    
    assign f = (PS == B)? 1:0;
    
    always @(posedge clk)
        if(~resetn)
            PS = A;
    	else
            PS = NS;
    
    always @(PS)
        case(PS)
            A: begin
                NS <= B;
                g <= 0;
            end
            B: NS <= J;
            C: NS <= (x)? C:D;
            D: NS <= (x)? E:I;
            E: begin
                NS <= (y)? F:G;
                g <= 1;
            end
            F: begin
                NS <= F;
                g <= 1;
            end
            G: begin
                NS <= (y)? F:H;
                g <= 1;
            end
            H: begin
                NS <= H;
                g <= 0;
            end
            I: NS <= (x)? C:I;
            J: NS <= (x)? C:I;
            default: NS <= PS;
        endcase
    
endmodule

