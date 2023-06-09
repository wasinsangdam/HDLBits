module shift4 (
    input           clk,
    input           areset,
    input           load,
    input           ena,
    input   [3 : 0] data,
    output  [3 : 0] q
);
    reg     [3 : 0] q;

    always @ (posedge clk, posedge areset) begin
        if (areset)
            q <= 0;
        else if (load)
            q <= data;
        else if (ena)
            q <= q >> 1;
    end
        
endmodule