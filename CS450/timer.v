module timer (
    input           clk,
    input           load,
    input   [9 : 0] data,
    output          tc
);

    reg [9 : 0] cnt;

    always@(posedge clk) begin
        if (load)           cnt <= data;
        else if (cnt == 0)  cnt <= 0;
        else                cnt <= cnt - 1'b1;
    end

    assign tc = (cnt == 0);

endmodule