module muxdiff2 (
    input   clk,
    input   w,
    input   R,
    input   E,
    input   L,
    output  Q
);

    always @ (posedge clk) begin
        Q <= L ? R : E ? w : Q;
    end 

endmodule