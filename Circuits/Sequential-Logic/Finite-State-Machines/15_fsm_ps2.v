module ps2 (
    input           clk,
    input   [7 : 0] in,
    input           reset,
    output          done
);
    // The only indication is that the first byte of each three byte message always has
    // bit[3] = 1 (but bit[3] of the other two bytes may be 1 or 0 depending on data).

    // We want a finite state machine that wil search for message boundaries when given an input byte stream.
    // The algorithm we'll use is to discard bytes untill we see one with bit[3] = 1.
    // we then assume that this is byte 1 of a message, and signal the receipt of a message once all 3 bytes have benn received(done).

    // The FSM should signal done in the cycle immediately after the third byte of each message was successfully received.

    parameter   [1 : 0] BYTE1 = 0,
                        BYTE2 = 1,
                        BYTE3 = 2,
                        DONE  = 3;
    
    reg         [1 : 0] state, next_state;

    always @ (posedge clk) begin
        if (reset)  state <= BYTE1;
        else        state <= next_state;
    end

    always @ (*) begin
        case (state)
            BYTE1 : next_state = in[3] ? BYTE2 : BYTE1;
            BYTE2 : next_state = BYTE3;
            BYTE3 : next_state = DONE;
            DONE  : next_state = in[3] ? BYTE2 : BYTE1;
        endcase
    end

    assign done = (state == DONE);


endmodule