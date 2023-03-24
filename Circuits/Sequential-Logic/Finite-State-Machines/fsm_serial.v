module fsm_serial (
    input           clk,
    input           in,
    input           reset,
    output          done
);
    parameter   [1 : 0] IDLE = 0,
                        READ = 1,
                        DONE = 2,
                        ERR  = 3;

    reg         [1 : 0] state, next_state;
    reg         [3 : 0] cnt;

    always @ (posedge clk) begin
        if (reset)  state <= IDLE;
        else begin
            state <= next_state;

            if (state == READ) cnt <= cnt + 1;
            else               cnt <= 0;
        end
    end

    always @ (*) begin
        case (state)
            IDLE : next_state = in ? IDLE : READ;
            READ : begin
                if ((cnt == 8) & (in)) 
                    next_state = DONE;
                else if ((cnt == 8) & (~in))
                    next_state = ERR;
                else
                    next_state = READ;
            end

            ERR  : next_state = in ? IDLE : ERR;
            DONE : next_state = in ? IDLE : READ;
        endcase
    end

    assign done = (state == DONE); 
             
        
endmodule
