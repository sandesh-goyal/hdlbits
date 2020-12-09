module top_module();

    reg [1:0] in;
    wire out;
    
    andgate ins(in, out);
    initial
        begin
            in[0] = 1'b0; in[1] = 1'b0;
            #10 in[0] = 1'b1;
            #10 in[0] = 1'b0; in[1] = 1'b1;
            #10 in[0] = 1'b1;
        end
endmodule

