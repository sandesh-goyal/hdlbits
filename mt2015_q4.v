module top_module (input x, input y, output z);

    wire t1, t2, t3, t4;
    A IA (x, y, t1);
    B IB (x, y, t2);
    assign t3 = t1 | t2;
    assign t4 = t1 & t2;
    assign z = t3 ^ t4;
endmodule

module A (input x, input y, output z);

    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );

    assign z = ~(x ^ y);
endmodule

