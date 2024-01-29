`default_nettype none

module top_module (
    input   wire        [15 : 0]    in,
    output  wire        [ 7 : 0]    out_hi,
    output  wire        [ 7 : 0]    out_lo
);

    assign out_lo = in[7 : 0];
    assign out_hi = in[15 : 8];

    // assign {out_hi, out_lo} = in;
endmodule