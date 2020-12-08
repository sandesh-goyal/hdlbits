module top_module( 
    input [2:0] in,
    output [1:0] out );

    integer i, count;
    
    assign out = count;
    always @(*)
    begin
        count = 0;
        for(i=0; i<3; i=i+1)
            if(in[i])
                count = count + 1;
    end
        
endmodule

