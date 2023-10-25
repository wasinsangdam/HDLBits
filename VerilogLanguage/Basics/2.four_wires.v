module top_module (
    input           a,
    input           b,
    input           c,
    output          w,
    output          x,
    output          y,
    output          z
);

    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

    // assign {w, x, y, z} = {a, b, b, c};s

endmodule