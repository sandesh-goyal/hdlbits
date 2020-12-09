module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=0, B=1;
    reg PS, NS;
    reg [1:0] check, cyc;
    
	initial 
        begin
            check <= 2'd0;
            z <= 0;
            cyc <= 2'd0;
        end
    
    always @(posedge clk)
        if(reset)begin
            cyc <= 2'd0;
    		check <= 2'd0;
        end
        else if(cyc == 2'd3)begin
            cyc <= 2'd1;
    		check <= w;
        end
    	else if(PS == B)begin
            cyc <= cyc + 2'd1;
            check <= check + w;
    	end
    
    always @(posedge clk)
        if(reset)
            PS <= A;
    	else
            PS <= NS;
    
    always @(*)
        case(PS)
            A: begin
                NS <= (s)? B:A;
                z <= 0;
            end
            B: begin
                NS <= B;
                z <= ((cyc == 2'd3) && (check == 2'd2))? 1:0;
            end
			default: NS <= PS;
        endcase
    
                
endmodule

