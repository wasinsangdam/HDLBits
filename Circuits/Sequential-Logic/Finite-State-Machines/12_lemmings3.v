module lemmings3 (
    input       clk,
    input       areset,
    input       bump_left,
    input       bump_right,
    input       ground,
    input       dig,
    output      walk_left,
    output      walk_right,
    output      aaah,
    output      digging
);

    parameter   [2 : 0] LEFT  = 0, 
                        RIGHT = 1, 
                        AH_L  = 2, 
                        AH_R  = 3, 
                        DIG_L = 4, 
                        DIG_R = 5;

    reg         [2 : 0] state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            LEFT : begin
                if (!ground)        next_state = AH_L;
                else if (dig)       next_state = DIG_L;
                else if (bump_left) next_state = RIGHT;
                else                next_state = LEFT;
            end

            RIGHT : begin
                if (!ground)         next_state = AH_R;
                else if (dig)        next_state = DIG_R;
                else if (bump_right) next_state = LEFT;
                else                 next_state = RIGHT;
            end

            DIG_L : next_state = ground ? DIG_L : AH_L;
            DIG_R : next_state = ground ? DIG_R : AH_R;

            AH_L  : next_state = ground ? LEFT  : AH_L;
            AH_R  : next_state = ground ? RIGHT : AH_R;
        endcase
    end

    assign walk_right = (state == RIGHT);
    assign walk_left  = (state == LEFT);
    assign digging    = (state == DIG_L || state == DIG_R);
    assign aaah       = (state == AH_L  || state == AH_R);

endmodule