module eq4 (
    input   x,
    input   y,
    output  z
);

    wire    z1, z2, z3, z4;
    wire    z5, z6;

    eq4a IA1 (x, y, z1);
    eq4b IB1 (x, y, z2);
    eq4a IA2 (x, y, z3);
    eq4b IB2 (x, y, z4);

    assign z5 = z1 | z2;
    assign z6 = z3 & z4;

    assign z = z5 ^ z6; 

endmodule

module eq4a (
    input x,
    input y,
    output z
);

    assign z = (x ^ y) & x;

endmodule

module eq4b (
    input x,
    input y,
    output z
);

    assign z = ~(x ^ y);

endmodule