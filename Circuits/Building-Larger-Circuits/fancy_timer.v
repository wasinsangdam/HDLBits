module fancy_timer (
    input           clk,
    input           reset,
    input           data,
    input           ack,
    output [3 : 0]  count,
    output          counting,
    output          done
);

    parameter   [3 : 0] S = 0,
                        S1 = 1,
                        S11  = 2,
                        S110 = 3;

    parameter [3 : 0]   B0 = 4,
                        B1 = 5,
                        B2 = 6,
                        B3 = 7;
    
    parameter [3 : 0]   Count = 8,
                        Delay = 9,
                        Last  = 10,
                        Hold  = 11;

    reg       [3 : 0]   state, next_state, delay;
    reg       [9 : 0]   thousand;
    reg       [3 : 0]   counter;

    always @ (*) begin
        case(state)
            S    : next_state = data ? S1 : S;
            S1   : next_state = data ? S11 : S;
            S11  : next_state = data ? S11 : S110;
            S110 : next_state = data ? B0 : S;

            B0 : begin
                next_state = B1;
                delay[3] = data;
            end

            B1 : begin
                next_state = B2;
                delay[2] = data;
            end

            B2 : begin
                next_state = B3;
                delay[1] = data;
            end

            B3 : begin
                next_state = Count;
                delay[0] = data;
            end

            Count : begin
                if (delay == 4'd0)
                    next_state = Last;
                else begin
                    if (thousand == 10'd998)
                        next_state = Delay;
                    else
                        next_state = Count;
                end
            end

            Delay : begin
                if (counter == 4'd1)
                    next_state = Last;
                else begin
                    if (thousand == 10'd998)
                        next_state = Delay;
                    else
                        next_state = Count;
                end
            end

            Last : next_state = (thousand == 10'd999) ? Hold : Last;
            
            Hold : next_state = (ack) ? S : Hold;
            default : next_state = S;
        endcase
    end

    always @ (posedge clk) begin
        if (state == B3) begin
            counter <= {delay[3 : 1], data};
            thousand <= 0;
        end

        if (state == Count || state == Last)
            thousand <= thousand + 1;

        if (state == Delay) begin
            thousand <= 0;
            counter <= counter - 1;
        end
    end

    always @ (posedge clk) begin
        if (reset)
            state <= S;
        else
            state <= next_state;
    end

    assign counting = (state == Count) || (state == Delay) || (state == Last);
    assign done     = (state == Hold);
    assign count    = counter;


                        

endmodule