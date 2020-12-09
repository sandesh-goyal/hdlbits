module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter RST=0, ONE=1, ZERO=2;
    reg [1:0] PS, NS;
    
    always @(PS, x)
        case(PS)
            RST:begin
                z <= 0;
                NS <= (x)? ONE:RST;
            end
            ONE:begin
                z <= 0;
                NS <= (x)? ONE:ZERO;
            end
            ZERO:begin
                z <= (x)? 1:0;
                NS <= (x)? ONE:RST;
            end
    	endcase
    
    always @(posedge clk, negedge aresetn)
        if(~aresetn)
            PS <= RST;
        else
            PS <= NS;
endmodule

