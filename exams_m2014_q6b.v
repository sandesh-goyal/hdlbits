module top_module (
    input [3:1] y,
    input w,
    output Y2);

    parameter A=0, B=1, C=2, D=3, E=4, F=5;
    reg [3:1] NS;
    
    assign Y2 = NS[2];
                     
    always @(*)
        case(y)
            A: NS = (w)? A:B;
            B: NS = (w)? D:C;
            C: NS = (w)? D:E;
            D: NS = (w)? A:F;
            E: NS = (w)? D:E;
            F: NS = (w)? D:C;
            default: NS = y;
        endcase
endmodule

