module top_module (
    input           [31 : 0]    a,
    input           [31 : 0]    b,
    input                       sub,
    output          [31 : 0]    sum
);

    wire                        cout;
    wire            [31 : 0]    xor_b;
    wire            [31 : 0]    rep_sub;

    assign rep_sub = { 32{sub} };

    assign xor_b = b ^ rep_sub;

    add16 inst1 (
        .a      (a[15 : 0]      ),
        .b      (xor_b[15 : 0]  ),
        .cin    (sub            ),
        .sum    (sum[15 : 0]    ),
        .cout   (cout           )
    );

    add16 inst2 (
        .a      (a[31 : 16]     ),
        .b      (xor_b[31 : 16] ),
        .cin    (cout           ),
        .sum    (sum[31 : 16]   ),
        .cout   (1'b0           )
    );

endmodule