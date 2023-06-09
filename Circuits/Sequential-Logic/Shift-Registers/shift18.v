module shift18 (
    input           clk,
    input           load,
    input           ena,
    input   [1 : 0] amount,
    input  [63 : 0] data,
    output [63 : 0] q
);

    reg signed  [63 : 0] q;

    always @ (posedge clk) begin
        if (load)
            q <= data;
        else if (ena) begin
            if (amount == 2'b00)
                q <= q <<< 1;
            else if (amount == 2'b01)
                q <= q <<< 8;
            else if (amount == 2'b10)
                q <= q >>> 1;
            else if (amount == 2'b11)
                q <= q >>> 8;
        end
    end


endmodule