module count15 (
    input           clk,
    input           reset,
    output  [3 : 0] q
);

    reg     [3 : 0] q;

    always @ (posedge clk) begin
        if (reset)
            q <= 0;
        else begin
            q <= q + 1;
        end
    end

endmodule