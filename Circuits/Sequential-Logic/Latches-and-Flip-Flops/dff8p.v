module dff8p (
    input           clk,
    input           reset,
    input  [7 : 0] d,
    output  [7 : 0] q
);

    reg [7 : 0] q;

    always @(negedge clk) begin
        if (reset)
            q <= 6'h34;
        else
            q <= d;
    end

endmodule