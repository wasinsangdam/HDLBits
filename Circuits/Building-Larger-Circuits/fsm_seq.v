module fsm_seq (
    input           clk,
    input           reset,
    input           data,
    output          start_shifting
);

    parameter [2 : 0] IDLE = 0,
                      STEP1 = 1,
                      STEP2 = 2,
                      STEP3 = 3,
                      STEP4 = 4;

    reg       [2 : 0] state, next_state;

    always @ (posedge clk) begin
        if (reset)  state <= IDLE;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            IDLE  : next_state = data ? STEP1 : IDLE;
            STEP1 : next_state = data ? STEP2 : IDLE;
            STEP2 : next_state = data ? STEP2 : STEP3;
            STEP3 : next_state = data ? STEP4 : IDLE;
            STEP4 : next_state = STEP4;
            default : next_state = IDLE;
        endcase
    end

    assign start_shifting = (state == STEP4);
                        

endmodule