module circuit4 (
    input       a,
    input       b,
    input       c,
    input       d,
    output      q
);

    assign q = b || c;

endmodule