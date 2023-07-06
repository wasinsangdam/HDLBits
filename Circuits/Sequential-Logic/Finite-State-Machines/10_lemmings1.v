module lemmings1 (
    input       clk,
    input       areset,
    input       bump_left,
    input       bump_right,
    output      walk_left,
    output      walk_right
);
    parameter   LEFT = 1, RIGHT = 0;

    reg         state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            LEFT  : next_state = bump_left  ? RIGHT : LEFT;
            RIGHT : next_state = bump_right ? LEFT  : RIGHT;
        endcase
    end

    assign walk_left = state;
    assign walk_right = ~state; 

   
endmodule