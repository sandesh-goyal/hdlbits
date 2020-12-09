module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire [2:0] d;
    
    assign d[2] = KEY[1] ? SW[2] : (LEDR[2] ^ LEDR[1]);
    assign d[1] = KEY[1] ? SW[1] : LEDR[0];
    assign d[0] = KEY[1] ? SW[0] : LEDR[2];

    dff_t ins1(KEY[0], d[2], LEDR[2]);
    dff_t ins2(KEY[0], d[1], LEDR[1]);
    dff_t ins3(KEY[0], d[0], LEDR[0]);
endmodule

module dff_t(
    input clk,
    input d,
    output q);
    
    always @(posedge clk)
       q <= d;
endmodule
