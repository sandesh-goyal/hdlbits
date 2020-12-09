module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire [3:0] q1, q2, q3;
    
    assign c_enable[0] = ~reset;
    assign c_enable[1] = ((~reset) & q1[3] & q1[0] & c_enable[0]);
    assign c_enable[2] = ((~reset) & q2[3] & q2[0] & c_enable[1]);
    assign OneHertz = ((~reset) & q3[3] & q3[0]& c_enable[2]);
    
    bcdcount counter0 (clk, reset, c_enable[0], q1);
    bcdcount counter1 (clk, reset, c_enable[1], q2);
    bcdcount counter2 (clk, reset, c_enable[2], q3);

endmodule

