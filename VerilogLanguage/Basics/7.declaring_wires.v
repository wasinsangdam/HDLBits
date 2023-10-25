module top_module (
    input               a,
    input               b,
    input               c,
    input               d,
    output              out,
    output              out_n
);

    wire                ab_wire;
    wire                cd_wire;
    wire                out_wire;

    assign ab_wire = a & b;
    assign cd_wire = c & d;
    
    assign out_wire = ab_wire | cd_wire;

    assign out = out_wire;
    assign out_n = ~out_wire;

endmodule