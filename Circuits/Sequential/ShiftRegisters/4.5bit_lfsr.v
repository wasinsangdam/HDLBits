module top_module (
    input                   clk     ,
    input                   reset   ,
    output      [4 : 0]     q
);

    always @ (posedge clk) begin
        if (reset)  q <= 'h1;
        else begin
            q <= {q[0] ^ 1'b0, q[4], q[3], ^ q[0], q[2], q[1]};
        end
    end

endmodule