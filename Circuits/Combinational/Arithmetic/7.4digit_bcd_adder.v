module top_module (
    input           [15 : 0]    a,
    input           [15 : 0]    b,
    input                       cin,
    output                      cout,
    output          [15 : 0]    sum
);

    wire            [3 : 0]     cout_wire;

    bcd_fadd inst0 (
        .a      (a[3 : 0]       ),
        .b      (b[3 : 0]       ),
        .cin    (cin            ),
        .cout   (cout_wire[0]   ),
        .sum    (sum[3 : 0]     )
    );

    bcd_fadd inst1 (
        .a      (a[7 : 4]       ),
        .b      (b[7 : 4]       ),
        .cin    (cout_wire[0]   ),
        .cout   (cout_wire[1]   ),
        .sum    (sum[7 : 4]     )
    );

    bcd_fadd inst2 (
        .a      (a[11 : 8]      ),
        .b      (b[11 : 8]      ),
        .cin    (cout_wire[1]   ),
        .cout   (cout_wire[2]   ),
        .sum    (sum[11 : 8]    )
    );

    bcd_fadd inst3 (
        .a      (a[15 : 12]     ),
        .b      (b[15 : 12]     ),
        .cin    (cout_wire[2]   ),
        .cout   (cout_wire[3]   ),
        .sum    (sum[15 : 12]   )
    );

    assign cout = cout_wire[3];



endmodule