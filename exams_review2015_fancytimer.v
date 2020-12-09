module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;
    reg[3:0] PS, NS;
    reg[3:0] c_val, cd_val;
    reg done_counting, dec_ena, count_ena;
    reg[9:0] q;
    
    initial
        begin
            done_counting <= 1'd0;
            q <= 10'd0;
            dec_ena <= 1'd0;
            count_ena <= 1'd0;
        end
    
    assign counting = (PS == Count)? 1:0;
    assign done = (PS == Wait)? 1:0;
    assign count = cd_val;
    
    assign count_ena = ((PS == Count) & (cd_val >= 0))? 1:0;
    assign dec_ena = (q == 10'd999)? 1:0;
    assign done_counting = ((cd_val == 0) & (q == 10'd999))? 1:0;
    
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
            B0: begin
                NS <= B1;
                c_val[3] <= data;
            end
            B1: begin
                NS <= B2;
                c_val[2] <= data;
            end
            B2: begin
                NS <= B3;
                c_val[1] <= data;
            end
            B3: begin
                NS <= Count;
                c_val[0] <= data;
            end
            Count: NS <= (done_counting)? Wait:Count;
            Wait: NS <= (ack)? S:Wait;
            default: NS <= PS;
        endcase
    
    always @(posedge clk)
        if(PS == B3)
            cd_val = {c_val[3:1], data};
        else if(dec_ena && (c_val > 0))
            cd_val = cd_val - 4'd1;
    
    always @(posedge clk)
        if(reset)
            q = 10'd0;
        else if(q == 10'd999)
            q = 10'd0;
    	else if(count_ena)
            q = q + 10'd1;
endmodule


