module top_module (
    input                       clk         ,
    input           [7 : 0]     in          ,
    input                       reset       ,
    output          [23 : 0]    out_bytes   ,
    output                      done
);

    parameter   IDLE    = 0,
                BYTE1   = 1,
                BYTE2   = 2,
                BYTE3   = 3;

    reg             [1 : 0] curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= IDLE;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            IDLE    :   next_state = in[3] ? BYTE1 : IDLE;
            BYTE1   :   next_state = BYTE2;
            BYTE2   :   next_state = BYTE3;
            BYTE3   :   next_state = in[3] ? BYTE1 : IDLE;
        endcase
    end

    always @ (posedge clk) begin
        if (reset)  out_bytes <= 'h0;
        else        out_bytes <= {out_bytes[15 : 0], in};
    end

    assign done = (curr_state == BYTE3);

endmodule