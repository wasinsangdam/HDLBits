module top_module (
    input       [99 : 0]    a   ,
    input       [99 : 0]    b   ,
    input                   cin ,
    output      [99 : 0]    cout,
    output      [99 : 0]    sum 
);

    fadd inst0 (a[0], b[0], cin, cout[0], sum[0]);

    genvar i;

    generate
        for (i = 1; i < 100; i = i + 1) begin : full_adder
            fadd (a[i], b[i], cout[i-1], cout[i], sum[i]);
        end
    endgenerate

endmodule

module fadd (
    input                   a,
    input                   b,
    input                   cin,
    output                  cout,
    output                  sum
);

    assign {cout, sum} = a + b + cin;

endmodule