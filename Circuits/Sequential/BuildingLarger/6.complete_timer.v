module top_module (
    input                   clk             ,
    input                   reset           ,
    input                   data            ,
    output      [3 : 0]     count           ,
    output                  counting        ,
    output                  done            ,
    input                   ack         
);

    wire                    shift_ena;
    wire                    count_ena;
    wire        [9 : 0]     count_1000;
    wire                    done_counting;

    fsm u_fsm (
        .clk            (clk            ),
        .reset          (reset          ),
        .data           (data           ),
        .shift_ena      (shift_ena      ),
        .counting       (counting       ),
        .done_counting  (done_counting  ),
        .done           (done           ),
        .ack            (ack            )
    );

    shift_count u_shift_count (
        .clk            (clk            ),
        .shift_ena      (shift_ena      ),
        .count_ena      (count_ena      ),
        .data           (data           ),
        .q              (count          )
    );

    counter u_counter (
        .clk            (clk            ),
        .reset          (reset          ),
        .counting       (counting       ),
        .q              (count_1000     )
    );

    assign count_ena = (count_1000 == 10'd999);
    assign done_counting = (count== 4'd0) & count_ena;

    

endmodule

module fsm (
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
                        else        next_state = COUNT;
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


module shift_count (
    input                   clk         ,
    input                   shift_ena   ,
    input                   count_ena   ,
    input                   data        ,
    output      [3 : 0]     q
);

    // Data is shifted in MSB first when shift_ena is 1
    // The number currently in the shift register is decremented 
    // when count_ena is 1.

    always @ (posedge clk) begin
        case ({shift_ena, count_ena})
            2'b01   : q <= q - 1'b1;
            2'b10   : q <= { q[2 : 0], data};
            default : q <= q;
        endcase
    end

endmodule

module counter (
    input                   clk     ,
    input                   reset   ,
    input                   counting,
    output      [9 : 0]     q
);

    always @ (posedge clk) begin
        if      (reset)         q <= 10'h0;
        else if (q == 10'd999)  q <= 10'h0;
        else if (counting)      q <= q + 1'b1;
    end

endmodule