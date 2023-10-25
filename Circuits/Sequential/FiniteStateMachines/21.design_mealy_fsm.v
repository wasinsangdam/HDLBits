module top_module (
    input                   clk     ,
    input                   aresetn ,
    input                   x       ,
    output                  z
);

    parameter   ST_1 = 0,
                ST_2 = 1,
                ST_3 = 2;

    reg         [1 : 0]     curr_state, next_state;

    always @ (posedge clk, negedge aresetn) begin
        if (!aresetn)   curr_state <= ST_1;
        else            curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            ST_1    : next_state = x ? ST_2 : ST_1;
            ST_2    : next_state = x ? ST_2 : ST_3;
            ST_3    : next_state = x ? ST_2 : ST_1;
            default : next_state = ST_1;
        endcase
    end

    assign z = (curr_state == ST_3) & x;

endmodule