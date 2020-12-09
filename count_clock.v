module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire [1:0] ens, enm, enh;
    
    assign ens[0] = ena;
    assign ens[1] = ss[3] & ss[0] & ens[0];
    assign enm[0] = ss[6] & ss[4] & ens[1];
    assign enm[1] = mm[3] & mm[0] & enm[0];
    assign enh[0] = mm[6] & mm[4] & enm[1];
    assign enh[1] = ((hh[3] & hh[0]) | (hh[1] & ~hh[0] & ~hh[2])) & enh[0];
    
    bcd ins1(clk, ens[0], reset, ss[3:0]);
    mod6 ins2(clk, ens[1], reset, ss[7:4]);
    bcd ins3(clk, enm[0], reset, mm[3:0]);
    mod6 ins4(clk, enm[1], reset, mm[7:4]);
    mod10 ins5(clk, enh[0], reset, hh[7:4], hh[3:0]);
    mod2 ins6(clk, enh[1], reset, hh[3:0], hh[7:4]);
    
    initial
        begin
        pm = 1'b0;
        end
    always @(posedge clk)
        begin
            if(hh[7:4]==4'b1 && hh[3:0]==4'b1 && enh[0]==1'b1)
            pm = ~pm;
            
        end
    
endmodule

module bcd (
    input clk,
    input en,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    initial
        q = 4'd0;
    
    always @(posedge clk)
        if(reset | (q == 4'd9 && en==1'b1))
            q = 4'd0;
        else if(en==1'b1)
            q = q + 1'b1;
endmodule

module mod6 (
    input clk,
    input en,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    initial
        q = 4'd0;
    
    always @(posedge clk)
        if(reset | (q == 4'd5 && en==1'b1))
            q = 4'd0;
           else if(en==1'b1)
            q = q + 1'b1;
endmodule

module mod10 (
    input clk,
    input en,
    input reset,        // Synchronous active-high reset
    input [3:0] hi,
    output [3:0] q);

    initial
        q = 4'd2;
    
    always @(posedge clk)
        if(reset)
            q <= 4'd2;
    	else if(q == 4'd2 && en==1'b1 && hi == 4'd1)
            q <= 4'd1;
    	else if(q == 4'd9 && en==1'b1)
            q <= 4'd0;
        else if(en==1'b1)
            q = q + 1'b1;
endmodule

module mod2 (
    input clk,
    input en,
    input reset,        // Synchronous active-high reset
    input [3:0] hl,
    output [3:0] q);

    initial
        q = 4'd1;
    
    always @(posedge clk)
        if(reset)
            q <= 4'd1;
    	else if(en==1'b1 && hl==4'd2 && q==4'd1)
            q <= 4'd0;
    	else if(en==1'b1 && hl==4'd9 && q==4'd0)
            q <= 4'd1;

endmodule
