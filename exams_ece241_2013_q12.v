module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    wire [2:0] sel;
    wire [7:0] Q;
    
    sr8b ins10(clk, enable, S, Q);
    
    assign sel = {A,B,C};
    always @(*)
        case(sel)
            3'd0: Z = Q[0];
            3'd1: Z = Q[1];
            3'd2: Z = Q[2];
            3'd3: Z = Q[3];
            3'd4: Z = Q[4];
            3'd5: Z = Q[5];
            3'd6: Z = Q[6];
            3'd7: Z = Q[7];
            default: Z = 1'b0;
        endcase
    
endmodule

module sr8b(
    input clk,
    input en,
    input S,
    output [7:0] q);
    
    dff_t ins1(clk, en, S, q[0]);
    dff_t ins2(clk, en, q[0], q[1]);
    dff_t ins3(clk, en, q[1], q[2]);
    dff_t ins4(clk, en, q[2], q[3]);
    dff_t ins5(clk, en, q[3], q[4]);
    dff_t ins6(clk, en, q[4], q[5]);
    dff_t ins7(clk, en, q[5], q[6]);
    dff_t ins8(clk, en, q[6], q[7]);
    
endmodule

module dff_t(
    input clk,
    input en,
    input d,
    output q);
    
    always @(posedge clk)
        if(en)
            q <= d;
endmodule
