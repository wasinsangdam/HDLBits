module count1to10 (
    input           clk,
    input           reset,
    output  [3 : 0] q
);

    reg     [3 : 0] q;

    always @ (posedge clk) begin
        if (reset || q == 4'd10)
            q <= 1;
        else
            q <= q + 1;
    end


endmodule