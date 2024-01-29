module top_module (
    input           [399 : 0]   a   ,
    input           [399 : 0]   b   ,
    input                       cin ,
    output                      cout,
    output          [399 : 0]   sum
);

    bcd_fadd inst0 (a[3 : 0], b[3 : 0], cin, cout_wire[0], sum[3 : 0]);

    wire            [99 : 0]    cout_wire;
    genvar i;

    generate
        for (i = 1; i < 100; i = i + 1) begin : bcd
            bcd_fadd (
                .a      (a[4*i +: 4]    ), 
                .b      (b[4*i +: 4]    ), 
                .cin    (cout_wire[i-1] ), 
                .cout   (cout_wire[i]   ), 
                .sum    (sum[4*i +: 4]  )
            );
        end
    endgenerate

    assign cout = cout_wire[99];

endmodule