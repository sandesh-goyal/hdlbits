// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @(*)
        if(in == 0)
            pos = 0;
    else if(in[0])
            pos = 0;
    else if(in[1])
        	pos = 2'd1;
    else if(in[2])
        	pos = 2'd2;
    	else
        	pos = 2'd3;
endmodule

