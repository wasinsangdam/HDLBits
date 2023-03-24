module dff_gate (
    input   clk,
    input   in,
    output  out
);  
    reg     out;

    initial out = 0;

    always @ (posedge clk) begin
        out <= out ^ in;
    end


endmodule