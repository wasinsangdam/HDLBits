module top_module (
    input                   clk     ,
    input                   reset   ,
    input                   j       ,
    input                   k       ,
    output                  out
);

    parameter OFF = 1'b0, ON = 1'b1;

    reg                     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)      curr_state <= OFF;
        else            curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            OFF : next_state = j ? ON  : OFF;
            ON  : next_state = k ? OFF : ON;
        endcase
    end

    assign out = (curr_state == ON);

endmodule