module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    parameter A=0, B=1, C=2, D=3, E=4;
    reg [2:0] NS;
    
    assign Y0 = NS[0];
    assign z = ((y == D) || (y == E))? 1:0;
    
    always @(*)
        case(y)
            A: NS = (x)? B:A;
            B: NS = (x)? E:B;
            C: NS = (x)? B:C;
            D: NS = (x)? C:B;
            E: NS = (x)? E:D;
            default: NS = y;
        endcase
endmodule

