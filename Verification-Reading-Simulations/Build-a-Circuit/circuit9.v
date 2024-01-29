module circuit9 (
    input           clk,
    input           a,
    output [3 : 0]  q
);

    always @ (posedge clk) begin
        if (a)  q <= 4'd4;
        else begin
            if (q == 4'd6)  q <= 4'd0;
            else            q <= q + 1;
        end
    end

endmodule