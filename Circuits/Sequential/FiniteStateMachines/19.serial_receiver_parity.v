module top_module (
    input                   clk     ,
    input                   in      ,
    input                   reset   ,
    output      [7 : 0]     out_byte,
    output                  done
);

    parameter       IDLE = 0,
                    READ = 1,
                    ERR  = 2,
                    PARI = 3,
                    DONE = 4;

    reg             [2 : 0] curr_state, next_state;
    reg             [3 : 0] cnt;
    reg             [7 : 0] temp;

    wire                    odd;
    wire                    parity_reset;

    parity u_parity (
        .clk    (clk)           ,
        .reset  (parity_reset)  ,
        .in     (in)            ,
        .odd    (odd)
    );


    always @ (posedge clk) begin
        if (reset)  curr_state <= IDLE;
        else        curr_state <= next_state;
    end

    always @ (posedge clk) begin
        if      (reset)                 cnt <= 4'h0;
        else if (curr_state == READ)    cnt <= cnt + 1'b1;
        else                            cnt <= 4'h0;
    end

    always @ (*) begin
        case (curr_state)
            IDLE    :   if (in) next_state = IDLE;
                        else    next_state = READ;
            READ    :   begin
                            if (cnt == 4'd8) begin
                                if (in ^ odd) // odd number check
                                    next_state = PARI;
                                else    
                                    next_state = ERR;
                            end
                            else        next_state = READ;
                        end            
            PARI    :   if (in) next_state = DONE;
                        else    next_state = ERR;
            ERR     :   if (in) next_state = IDLE;
                        else    next_state = ERR;
            DONE    :   if (in) next_state = IDLE;
                        else    next_state = READ;
        endcase
    end

    always @ (posedge clk) begin
        if (reset)  
            temp <= 8'h0;
        else if (curr_state == READ)
            temp[cnt] <= in;
    end

    assign parity_reset = ~(curr_state == READ);
    assign out_byte = temp;

    assign done = (curr_state == DONE);

endmodule
