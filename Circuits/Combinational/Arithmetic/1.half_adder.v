module top_module (
    input               a,
    input               b,
    output              cout,
    output              sum
);

    assign {cout, sum} = a + b;

endmodule
