module lfsr5 (
    input           clk,
    input           reset,
    output  [4 : 0] q
);
    reg     [4 : 0] q;

    always @ (posedge clk) begin
        if (reset)
            q <= 5'h1;
        else
            q <= { 1'b0 ^ q[0], q[4], q[0] ^ q[3], q[2], q[1] };
    end
    

endmodule