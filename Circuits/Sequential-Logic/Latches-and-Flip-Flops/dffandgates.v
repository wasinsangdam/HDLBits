module dffandgates (
    input   clk,
    input   x,
    output  z
);
    reg     temp1;
    reg     temp2;
    reg     temp3;
    
    assign z = ~|{temp1, temp2, temp3};

    always @ (posedge clk) begin
        temp1 <= x ^ temp1;
        temp2 <= x & (~temp2);
        temp3 <= x | (~temp3);
    end


endmodule