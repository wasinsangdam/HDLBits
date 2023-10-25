module top_module (
    input                   clk     ,
    input                   reset   ,
    output      [ 3 : 1]    ena     ,
    output      [15 : 0]    q
);

    reg         [3 : 0]     temp1, temp2, temp3, temp4;
    wire                    ena_10, ena_100, ena_1000;

    bcd_counter cnt0 (
        .clk    (clk    ),
        .reset  (reset  ),
        .enable (1'b1   ),
        .q      (temp1  )
    );

    bcd_counter cnt1 (
        .clk    (clk    ),
        .reset  (reset  ),
        .enable (ena[1] ),
        .q      (temp2  )
    );

    bcd_counter cnt2 (
        .clk    (clk    ),
        .reset  (reset  ),
        .enable (ena[2] ),
        .q      (temp3  )
    );

    bcd_counter cnt3 (
        .clk    (clk    ),
        .reset  (reset  ),
        .enable (ena[3] ),
        .q      (temp4  )
    );

    assign ena_10   = (temp1 == 4'd9);
    assign ena_100  = (temp1 == 4'd9) & (temp2 == 4'd9);
    assign ena_1000 = (temp1 == 4'd9) & (temp2 == 4'd9) & (temp3 == 4'd9);

    assign ena = {ena_1000, ena_100, ena_10};
    assign q = {temp4, temp3, temp2, temp1};

endmodule

module bcd_counter (
    input                   clk     ,
    input                   reset   ,
    input                   enable  ,
    output  reg     [3 : 0] q       
);

    always @ (posedge clk) begin
        if (reset | enable & (q == 4'd9))
            q <= 'h0;
        else begin
            if (enable) q <= q + 1'b1;
            else        q <= q;
        end
    end

endmodule