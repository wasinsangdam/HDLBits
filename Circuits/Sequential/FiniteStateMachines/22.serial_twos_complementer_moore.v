module top_module (
    input                   clk     ,
    input                   areset  ,
    input                   x       ,
    output                  z
);

    parameter   Q0  = 0,
                Q1  = 1,
                Q2  = 2;

    reg         [1 : 0]     curr_state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset) curr_state <= Q0;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            Q0      :   if (x)  next_state = Q1;
                        else    next_state = Q0;
            Q1      :   if (x)  next_state = Q2;
                        else    next_state = Q1;
            Q2      :   if (x)  next_state = Q2;
                        else    next_state = Q1;
            default :           next_state = Q0;
        endcase
    end     

    assign z = (curr_state == Q1);

endmodule