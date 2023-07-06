module fsm2_async_reset (
    input   clk,
    input   areset,
    input   j, 
    input   k,
    output  out
);

    parameter   OFF = 0, ON = 1;
    reg         state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset)
            state <= OFF;
        else
            state <= next_state;
    end

    always @ (*) begin
        case (state)
            OFF : next_state = j ? ON  : OFF;
            ON  : next_state = k ? OFF : ON;
        endcase
    end

    assign out = state;

endmodule