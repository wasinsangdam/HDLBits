module top_module (
    input               a,
    input               b,
    output              out
);

    mod_a inst_mod_a (
        .in1(a),
        .in2(b),
        .out(out)
    );

    // mod_a inst_mod_a (a, b, out);

endmodule