module top_module (
    input   wire    [99 : 0]    in,
    output  wire    [99 : 0]    out
);

    integer i;

    always @ (*) begin
        for (i = 0; i < 100; i = i + 1)
            out[i] = in[100 - i - 1];
    end

endmodule