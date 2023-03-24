module dff2 (
    input   clk,
    input   d,
    input   ar,
    output  q
);
    reg     q;

    always@ (posedge clk or posedge ar) begin
        if (ar) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end


endmodule