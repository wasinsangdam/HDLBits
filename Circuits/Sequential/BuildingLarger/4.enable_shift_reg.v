module top_module (
    input                   clk         ,
    input                   reset       ,
    output                  shift_ena
);

    reg         [1 : 0]     cnt;

    // always @ (posedge clk) begin
    //     if (reset) begin
    //         shift_ena <= 1'b1;
    //         cnt <= 2'b0;
    //     end
    //     else if (shift_ena & cnt == 2'd3) begin
    //         shift_ena <= 1'b0;
    //         cnt <= 2'b0;
    //     end
    //     else begin
    //         cnt <= cnt + 1'b1;
    //     end
    // end

    always @ (posedge clk) begin
        if      (reset)         shift_ena <= 1'b1;
        else if (cnt == 2'd3)   shift_ena <= 1'b0;
    end

    always @ (posedge clk) begin
        if (reset)              cnt <= 2'd0;
        else if (cnt == 2'd3)   cnt <= 2'd0;
        else                    cnt <= cnt + 1'b1;
    end

endmodule