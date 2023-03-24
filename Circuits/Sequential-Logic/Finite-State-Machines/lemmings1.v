module lemmings1 (
    input       clk,
    input       areset,
    input       bump_left,
    input       bump_right,
    output      walk_left,
    output      walk_right
);
    parameter   left = 1, right = 0;

    reg         state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) state <= left;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            left  : next_state <= bump_left  ? right : left;
            right : next_state <= bump_right ? left  : right;
        endcase
    end

    assign walk_left = state;
    assign walk_right = ~state; 

    // // parameter LEFT=0, RIGHT=1, ...
    // reg state, next_state;

    // always @(*) begin
    //     // State transition logic
    // end

    // always @(posedge clk, posedge areset) begin
    //     // State flip-flops with asynchronous reset
    // end

    // // Output logic
    // // assign walk_left = (state == ...);
    // // assign walk_right = (state == ...);
endmodule