module top_module (
    input                       clk     ,
    input                       reset   ,
    input           [31 : 0]    in      ,
    output          [31 : 0]    out
);

    reg             [31 : 0]    q;

    always @ (posedge clk) begin
        q <= in;
    end

    always @ (posedge clk) begin
        if (reset)  out <= 'h0;
        else        out <= q & ~in | out;
    end

endmodule