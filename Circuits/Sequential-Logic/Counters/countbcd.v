module countbcd (
    input           clk,
    input           reset,
    output  [3 : 1] ena,
    output  [15 :0] q
);
    wire   digit_1, digit_10, digit_100;

    assign digit_1    = q[3  :  0] == 4'd9 ? 1 : 0;
    assign digit_10   = q[7  :  4] == 4'd9 ? 1 : 0;
    assign digit_100  = q[11 :  8] == 4'd9 ? 1 : 0;

    assign ena = {digit_100 & digit_10 & digit_1, digit_10 & digit_1, digit_1};

    counter_10 inst_digit_1    (clk, reset, 1'b1,   q[3  :  0]);
    counter_10 inst_digit_10   (clk, reset, ena[1], q[7  :  4]);
    counter_10 inst_digit_100  (clk, reset, ena[2], q[11 :  8]);
    counter_10 inst_digit_1000 (clk, reset, ena[3], q[15 : 12]);

endmodule

module counter_10 (
    input           clk,
    input           reset,
    input           enable,
    output  [3 : 0] q
);  
    reg     [3 : 0] q;

    always @ (posedge clk) begin
        if (reset | ((enable) & (q == 9)))
            q <= 0;
        else begin
            if (enable)
                q <= q + 1;
            else
                q <= q;
        end

    end

endmodule
