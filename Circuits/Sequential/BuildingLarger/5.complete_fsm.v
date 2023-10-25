module top_module (
    input                   clk             ,
    input                   reset           ,
    input                   data            ,
    output                  shift_ena       ,
    output                  counting        ,
    input                   done_counting   ,
    output                  done            ,
    input                   ack
);

    parameter   S       = 0,
                S1      = 1,
                S11     = 2,
                S110    = 3,
                B0      = 4,
                B1      = 5,
                B2      = 6,
                B3      = 7,
                COUNT   = 8,
                WAIT    = 9;

    reg         [3 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= S;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            S       :   if (data)   next_state = S1;
                        else        next_state = S;
            S1      :   if (data)   next_state = S11;
                        else        next_state = S;
            S11     :   if (data)   next_state = S11;
                        else        next_state = S110;
            S110    :   if (data)   next_state = B0;
                        else        next_state = S;
            B0      :               next_state = B1;
            B1      :               next_state = B2;
            B2      :               next_state = B3;
            B3      :               next_state = COUNT;
            COUNT   :   if (done_counting)
                                    next_state = WAIT;
                        else
                                    next_state = COUNT;
            WAIT    :   if (ack)    next_state = S;
                        else        next_state = WAIT;
            default :               next_state = S;
        endcase
    end

    assign shift_ena =  (curr_state == B0) |
                        (curr_state == B1) |
                        (curr_state == B2) |
                        (curr_state == B3);
    assign counting  =  (curr_state == COUNT);
    assign done      =  (curr_state == WAIT);

endmodule