module dff3 (
    input clk,
    input d,
    input r,
    output q
);  
    reg    q;

    always @ (posedge clk) begin
        if (r)
            q <= 0;
        else
            q <= d;
    end
    

endmodule