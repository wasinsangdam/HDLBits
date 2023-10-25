module top_module (
    input                   clk         ,
    input                   areset      ,
    input                   bump_left   ,
    input                   bump_right  ,
    input                   ground      ,
    output                  walk_left   ,
    output                  walk_right  ,
    output                  aaah
);

    parameter   LEFT    = 0,
                RIGHT   = 1,
                FALL_L  = 2,
                FALL_R  = 3;

    reg         [1 : 0]     curr_state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) curr_state <= LEFT;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            LEFT    :   if      (!ground)   next_state = FALL_L;
                        else if (bump_left) next_state = RIGHT;
                        else                next_state = LEFT;
            RIGHT   :   if      (!ground)   next_state = FALL_R;
                        else if (bump_right)next_state = LEFT;
                        else                next_state = RIGHT;
            FALL_L  :   if      (ground)    next_state = LEFT;
                        else                next_state = FALL_L;
            FALL_R  :   if      (ground)    next_state = RIGHT;
                        else                next_state = FALL_R;
        endcase
    end

    assign walk_left  = (curr_state == LEFT);
    assign walk_right = (curr_state == RIGHT);
    assign aaah       = (curr_state == FALL_L) |
                        (curr_state == FALL_R);

endmodule