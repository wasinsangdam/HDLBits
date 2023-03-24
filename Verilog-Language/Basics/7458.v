module top_module ( input   p1a, p2a, p2b, p2c, p2d,
                            p1c, p1b, p1f, p1e, p1d,
                    output  p2y, p1y );

    wire abc1, def1, ab2, cd2;

    assign abc1 = p1a & p1b & p1c;
    assign def1 = p1d & p1e & p1f;

    assign ab2 = p2a & p2b;
    assign cd2 = p2c & p2d;

    assign p1y = abc1 | def1;
    assign p2y = ab2 | cd2;

endmodule

