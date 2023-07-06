module lemmings4 (
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
                        DIG_L = 2,
                        DIG_R = 3,
                        AH_L  = 4,
                        AH_R  = 5,
                        SPLAT = 6;

    reg         [2 : 0] state, next_state;
    reg         [31 : 0] cnt;

    always @ (posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT;
        end
        else if (state == AH_L || state == AH_R) begin
            cnt <= cnt + 1;
            state <= next_state;
        end
        else begin
            state <= next_state;
            cnt <= 0;
        end

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

            AH_L : begin
                if (ground) begin
                    if (cnt > 5'd19) next_state = SPLAT;
                    else             next_state = LEFT;
                end 
                else                 next_state = AH_L;
            end

            AH_R : begin
                if (ground) begin
                    if (cnt > 5'd19) next_state = SPLAT;
                    else             next_state = RIGHT;
                end 
                else                 next_state = AH_R;
            end

            SPLAT : next_state = SPLAT;

            DIG_L : next_state = (!ground) ? AH_L : DIG_L;
            DIG_R : next_state = (!ground) ? AH_R : DIG_R;

        endcase
    end

    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign digging    = (state == DIG_L) || (state == DIG_R);
    assign aaah       = (state == AH_L)  || (state == AH_R);

endmodule