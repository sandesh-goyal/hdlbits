module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    wire [31:0] set, in_prev;
    
    genvar i;
   
    generate for(i=0; i<32; i=i+1)
    begin: r_loop
    	always @(posedge clk)
        begin
           if(reset)
               out[i] <= 0;
           else if(in_prev[i] == 1 && in[i] == 0)
               out[i] <= 1;
           in_prev[i] = in[i];
        end
    end
    endgenerate         
endmodule


