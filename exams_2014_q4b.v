module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    
    MUXDFF ins1(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF ins2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF ins3(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF ins4(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
    
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q);
    wire t1, t2;
    
    assign t1 = E? w : Q;
    assign t2 = L? R : t1;
    
    always @(posedge clk)
        Q <= t2;

endmodule

