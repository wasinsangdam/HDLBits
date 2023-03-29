module twos_comple_mealy (
    input clk,
    input areset,
    input x,
    output z
);
    parameter STATE0 = 0,
              STATE1 = 1;
    
    reg [1 : 0] state, next_state;

    always @(posedge clk, posedge areset) begin
        if (areset) state <= STATE0;
        else        state <= next_state;
    end
    
    always @(*) begin
        case (state)
            STATE0 : next_state = x ? STATE1 : STATE0;
            STATE1 : next_state = STATE1;
            default : next_state = 2'bxx;
        endcase
    end

    assign z = (state == STATE1) & ~x || (state == STATE0) & x; 


endmodule