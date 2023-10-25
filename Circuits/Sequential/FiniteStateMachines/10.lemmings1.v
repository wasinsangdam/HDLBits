module top_module (
    input                   clk         ,
    input                   areset      ,
    input                   bump_left   ,
    input                   bump_right  ,
    output                  walk_left   ,
    output                  walk_right
);

    parameter   LEFT    = 0,
                RIGHT   = 1;

    reg                     curr_state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) curr_state <= LEFT;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            LEFT    :   if (bump_left)  next_state = RIGHT;
                        else            next_state = LEFT;
            RIGHT   :   if (bump_right) next_state = LEFT;
                        else            next_state = RIGHT;
        endcase
    end

    assign walk_left    = (curr_state == LEFT);
    assign walk_right   = (curr_state == RIGHT); 

endmodule