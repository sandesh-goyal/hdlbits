module top_module (input a, input b, input c, output out);//

    wire o;
    
    assign out = ~o;
    andgate inst1 (o, a, b, c, 1'b1, 1'b1);

endmodule

