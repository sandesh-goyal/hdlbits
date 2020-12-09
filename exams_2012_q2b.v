module top_module (
    input [6:1] y,
    input w,
    output Y1,
    output Y3
);

    reg [6:1] NS;
    
    assign Y1 = NS[2];
    assign Y3 = NS[4];
    
    assign NS[1] = (y[1]& ~w) | (y[4]& ~w);
    assign NS[2] = (y[1]& w);
    assign NS[3] = (y[2]& w) | (y[6]& w);
    assign NS[4] = (y[2]& ~w) | (y[3]& ~w) | (y[5]& ~w) | (y[6]& ~w);
    assign NS[5] = (y[3]& w) | (y[5]& w);
    assign NS[6] = (y[4]& w);
    
endmodule

