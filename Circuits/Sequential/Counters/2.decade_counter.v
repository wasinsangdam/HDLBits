module top_module (
    input               clk     ,
    input               reset   ,
    output  [3 : 0]     q
);

    always @ (posedge clk) begin
        if      (reset)         q <= 'h0;
        else if (q == 4'd9)     q <= 'h0;
        else                    q <= q + 1'b1;
    end


endmodule