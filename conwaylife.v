module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [0:15] mat [0:15];
    reg [0:15] sol [0:15];
    reg [255:0] sol1;
    
    genvar i, j, k, l;
    integer count [0:15] [0:15];
//-----------------------------------------------
    generate for(i=0; i<16; i++)
        begin: i_loop
            assign mat[i] = q[(16*i)+15:16*i];
            assign sol1[(16*i)+15:16*i] = sol[i];
        end
    endgenerate
//-----------------------------------------------   
    always @(posedge clk)
        begin
            if(load)
                q <= data;
            else
                q <= sol1;
        end
//-----------------------------------------------
    
    generate for(j=1; j<15; j=j+1)
        begin:j_loop
            for(k=1; k<15; k=k+1)
                begin:k_loop
                    assign count[j][k] = mat[j+1][k+1] + mat[j-1][k-1] + mat[j][k+1] + mat[j][k-1] + mat[j+1][k] + mat[j-1][k] + mat[j+1][k-1] + mat[j-1][k+1];
                    assign sol[j][k] = (count[j][k] < 2)? 0: ((count[j][k] == 2)? mat[j][k]:((count[j][k] == 3)? 1:0));  
                end
        end
    endgenerate
    
//----------------------------------------------
    assign count[0][0] = mat[0][15] + mat[0][1] + mat[1][15] + mat[1][0] + mat[1][1] + mat[15][15] + mat[15][0] + mat[15][1];
    assign count[0][15] = mat[15][14] + mat[15][15] + mat[15][0] + mat[0][14] + mat[0][0] + mat[1][14] + mat[1][15] + mat[1][0];
    assign count[15][15] = mat[14][14] + mat[14][15] + mat[14][0] + mat[15][14] + mat[15][0] + mat[0][14] + mat[0][15] + mat[0][0];
    assign count[15][0] = mat[14][15] + mat[14][0] + mat[14][1] + mat[15][15] + mat[15][1] + mat[0][15] + mat[0][0] + mat[0][1];
    assign sol[0][0] = (count[0][0] < 2)? 0: ((count[0][0] == 2)? mat[0][0]:((count[0][0] == 3)? 1:0));
    assign sol[0][15] = (count[0][15] < 2)? 0: ((count[0][15] == 2)? mat[0][15]:((count[0][15] == 3)? 1:0));
    assign sol[15][15] = (count[15][15] < 2)? 0: ((count[15][15] == 2)? mat[15][15]:((count[15][15] == 3)? 1:0));
    assign sol[15][0] = (count[15][0] < 2)? 0: ((count[15][0] == 2)? mat[15][0]:((count[15][0] == 3)? 1:0));
//----------------------------------------------
    generate for(l=1; l<15; l=l+1)
        begin:l_loop
            assign count[0][l] = mat[0][l+1] + mat[0][l-1] + mat[1][l+1] + mat[1][l-1] + mat[1][l] + mat[15][l] + mat[15][l-1] + mat[15][l+1];
            assign sol[0][l] = (count[0][l] < 2)? 0: ((count[0][l] == 2)? mat[0][l]:((count[0][l] == 3)? 1:0));
            assign count[15][l] = mat[15][l+1] + mat[15][l-1] + mat[14][l+1] + mat[14][l-1] + mat[14][l] + mat[0][l] + mat[0][l-1] + mat[0][l+1];
            assign sol[15][l] = (count[15][l] < 2)? 0: ((count[15][l] == 2)? mat[15][l]:((count[15][l] == 3)? 1:0));
            assign count[l][0] = mat[l+1][0] + mat[l-1][0] + mat[l+1][1] + mat[l-1][1] + mat[l][1] + mat[l+1][15] + mat[l-1][15] + mat[l][15];
            assign sol[l][0] = (count[l][0] < 2)? 0: ((count[l][0] == 2)? mat[l][0]:((count[l][0] == 3)? 1:0));
            assign count[l][15] = mat[l+1][15] + mat[l-1][15] + mat[l+1][14] + mat[l-1][14] + mat[l][14] + mat[l+1][0] + mat[l-1][0] + mat[l][0];
            assign sol[l][15] = (count[l][15] < 2)? 0: ((count[l][15] == 2)? mat[l][15]:((count[l][15] == 3)? 1:0));
        end
    endgenerate
    
    
endmodule

