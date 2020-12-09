module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;
    reg[3:0] PS, NS;
    
    assign shift_ena = ((PS == B0) | (PS == B1) | (PS == B2) | (PS == B3))? 1:0;
    assign counting = (PS == Count)? 1:0;
    assign done = (PS == Wait)? 1:0;
    
    always @(posedge clk)
        if(reset)
            PS <= S;
    	else
            PS <= NS;
    
    always @(*)
        case(PS)
            S: NS <= (data)? S1:S;
            S1: NS <= (data)? S11:S;
            S11: NS <= (data)? S11:S110;
            S110: NS <= (data)? B0:S;
            B0: NS <= B1;
            B1: NS <= B2;
            B2: NS <= B3;
            B3: NS <= Count;
            Count: NS <= (done_counting)? Wait:Count;
            Wait: NS <= (ack)? S:Wait;
            default: NS <= PS;
        endcase
            
endmodule

