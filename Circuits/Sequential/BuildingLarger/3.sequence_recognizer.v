module top_module (
    input                   clk             ,
    input                   reset           ,  
    input                   data            ,
    output                  start_shifting
);

    parameter   IDLE    = 3'd0,
                ST_1    = 3'd1,
                ST_2    = 3'd2,
                ST_3    = 3'd3,
                ST_4    = 3'd4;

    reg         [2 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= IDLE;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            IDLE :  if (data)   next_state = ST_1;
                    else        next_state = IDLE;
            ST_1 :  if (data)   next_state = ST_2;
                    else        next_state = IDLE;
            ST_2 :  if (data)   next_state = ST_2;
                    else        next_state = ST_3;
            ST_3 :  if (data)   next_state = ST_4;
                    else        next_state = IDLE;
            ST_4 :              next_state = ST_4;
            default :           next_state = IDLE;
        endcase
    end

    assign start_shifting = (curr_state == ST_4);
endmodule