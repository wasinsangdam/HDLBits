module lemmings2 (
    input       clk,
    input       areset,
    input       bump_left,
    input       bump_right,
    input       ground,
    output      walk_left,
    output      walk_right,
    output      aaah
);

    parameter   [2 : 0]     LEFT = 0, RIGHT = 1, AH_L = 2, AH_R = 3;
    reg         [2 : 0]     state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            LEFT  : next_state <= (~ground) ? AH_L : bump_left  ? RIGHT : LEFT;
            RIGHT : next_state <= (~ground) ? AH_R : bump_right ? LEFT  : RIGHT;
            AH_L  : next_state <= (~ground) ? AH_L : LEFT;
            AH_R  : next_state <= (~ground) ? AH_R : RIGHT;
        endcase
    end

    assign aaah       = (state == AH_L) | (state == AH_R);
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);   

endmodule