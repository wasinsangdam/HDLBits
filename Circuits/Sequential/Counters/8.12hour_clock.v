module top_module (
    input                   clk     ,
    input                   reset   ,
    input                   ena     ,
    output                  pm      ,
    output      [7 : 0]     hh      ,
    output      [7 : 0]     mm      ,
    output      [7 : 0]     ss
);


endmodule

module hh_counter (
    input                   clk     ,
    input                   reset   ,
    input                   ena     ,
    output      [7 : 0]     out
);

    reg         [3 : 0]     one_digit;
    reg         [3 : 0]     ten_digit;

    wire                    ten_enable;

    always @ (posedge clk) begin
        if (reset | ena & out == 8'h11)
            out <= 'h12;
        else begin
            if (ena)
                out <= out + 1'b1;
            else if (ena & out == 8'h09)
                out <= 8'h10;
            else
                out <= out;
        end
    end

    // 1 digit
    always @ (posedge clk) begin
        if      (reset)                     one_digit <= 'h2;
        else if (ena & one_digit == 4'd9)   one_digit <= 'h0;
        else if (ena)                       one_digit <= one_digit + 1'b1;
        else                                one_digit <= one_digit;
    end

    // 10 digit
    always @ (posedge clk) begin
        if      (reset)                     ten_digit <= 'h1;
        else if (ena & ten_digit == 4'd)

endmodule

module ms_counter (
    input                   clk     ,
    input                   reset   ,
    input                   ena     ,
    output      [7 : 0]     out
);

    reg         [3 : 0]     one_digit;
    reg         [3 : 0]     ten_digit;

    wire                    ten_enable;

    assign ten_enable = (one_digit == 4'd9);

    // 1 digit counter
    always @ (posedge clk) begin
        if      (reset)                     one_digit <= 'h0;
        else if (ena & one_digit == 4'd9)   one_digit <= 'h0;
        else if (ena)                       one_digit <= one_digit + 1'b1;
        else                                one_digit <= one_digit;
    end

    // 10 digit counter
    always @ (posedge clk) begin
        if      (reset)                         ten_digit <= 'h0;
        else if (ten_ena & ten_digit == 4'd5)   ten_digit <= 'h0;
        else if (ten_ena)                       ten_digit <= ten_digit + 1'b1;
        else                                    ten_digit <= ten_digit;
    end

    assign out = {ten_digit, one_digit};

endmodule