module top_module (
    input               clk     ,
    input               reset   ,
    input               in      ,
    output              disc    ,
    output              flag    ,
    output              err
);

    parameter   NONE    = 0,
                ONE     = 1,
                TWO     = 2,
                THREE   = 3,
                FOUR    = 4,
                FIVE    = 5,
                SIX     = 6,
                DISCARD = 7,
                FLAG    = 8,
                ERROR   = 9;

    reg     [3 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= NONE;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            NONE    :   next_state = in ? ONE   : NONE;
            ONE     :   next_state = in ? TWO   : NONE;
            TWO     :   next_state = in ? THREE : NONE;
            THREE   :   next_state = in ? FOUR  : NONE;
            FOUR    :   next_state = in ? FIVE  : NONE;
            FIVE    :   next_state = in ? SIX   : DISCARD;
            SIX     :   next_state = in ? ERROR : FLAG;
            DISCARD :   next_state = in ? ONE   : NONE;
            FLAG    :   next_state = in ? ONE   : NONE;
            ERROR   :   next_state = in ? ERROR : NONE; 
            default :   next_state = NONE;
        endcase
    end

    assign err  = (curr_state == ERROR);
    assign disc = (curr_state == DISCARD);
    assign flag = (curr_state == FLAG);

endmodule