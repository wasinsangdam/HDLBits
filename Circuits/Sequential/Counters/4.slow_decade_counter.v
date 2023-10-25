module top_module (
    input               clk     ,
    input               reset   ,
    input               slowena ,
    output  [3 : 0]     q
);

    always @ (posedge clk) begin
        if (reset)  q <= 4'b0;
        else if (slowena & (q == 4'd9)) q <= 4'b0;
        else if (slowena)               q <= q + 1'b1;
    end
       


endmodule