module fsm2_sync_reset (
    input   clk,
    input   reset,
    input   j,
    input   k,
    output  out
);

    parameter   OFF = 0, ON = 1;
    reg         state, next_state;

    always @ (posedge clk) begin
        if (reset)
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