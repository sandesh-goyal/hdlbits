module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);

    parameter A=0, B=1, C=2, D=3, E=4, F=5;
    reg [2:0] PS, NS;
    
    assign z = ((PS == E) || (PS == F))? 1:0;
        
    always @(*)
        case(PS)
            A: NS = (~w)? A:B;
            B: NS = (~w)? D:C;
            C: NS = (~w)? D:E;
            D: NS = (~w)? A:F;
            E: NS = (~w)? D:E;
            F: NS = (~w)? D:C;
            default: NS = PS;
        endcase
    
    always @(posedge clk)
        if(reset)
            PS = A;
    	else
            PS = NS;
endmodule

