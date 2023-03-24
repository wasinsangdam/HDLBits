module fsm1_async_reset(
    input       clk,
    input       areset,
    input       in,
    output      out
);

    parameter   A = 0, B = 1;
    reg         state, next_state;

    always @(*) begin
        // state transition logic
        case (state)
            A : next_state <= in ? A : B;
            B : next_state <= in ? B : A; 
        endcase
    end


    always @(posedge clk, negedge areset) begin
        // state flip-flops with asynchronous reset
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    // output logic
    assign out = (state == B);

endmodule
