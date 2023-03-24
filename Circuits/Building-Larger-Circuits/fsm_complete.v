module fsm_complete (
    input           clk,
    input           reset,
    input           data,
    input           done_counting,
    input           ack,
    output          shit_ena,
    output          counting,
    output          done
);

    parameter [3 : 0]   S    = 0,
                        S1   = 1,
                        S11  = 2,
                        S110 = 3;

    parameter [3 : 0]   B0 = 4,
                        B1 = 5,
                        B2 = 6,
                        B3 = 7;
    
    parameter [3 : 0]   Count = 8,
                        Wait  = 9;

    reg       [3 : 0]   state, next_state;

    always @ (posedge clk) begin
        if (reset)
            state <= S;
        else
            state <= next_state;
    end

    always @ (*) begin
        case(state)
            S    : next_state = data ? S1 : S;
            S1   : next_state = data ? S11 : S;
            S11  : next_state = data ? S11 : S110;
            S110 : next_state = data ? B0 : S;

            B0 : next_state = B1;
            B1 : next_state = B2;
            B2 : next_state = B3;
            B3 : next_state = B4;
            B4 : next_state = Count;

            Count : next_state = done_counting ? Wait : Count;
            Wait  : next_state = ack ? S : Wait;

            default : next_state = S;
        endcase
    end

    assign shift_ena = (state == B0 || state == B1 || state == B2 || state == B3);
    assign counting = (state == Count);
    assign done = (state == Wait);


endmodule