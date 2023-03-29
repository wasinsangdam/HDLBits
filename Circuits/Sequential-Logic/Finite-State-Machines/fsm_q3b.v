module fsm_q3b (
    input   clk,
    input   reset,
    input   x,
    output  z
);

    parameter [2 : 0] STATE0 = 3'b000,
                      STATE1 = 3'b001,
                      STATE2 = 3'b010,
                      STATE3 = 3'b011,
                      STATE4 = 3'b100;
    
    reg [2 : 0] state, next_state;

    always @ (posedge clk) begin
        if (reset) state <= STATE0;
        else       state <= next_state;
    end

    always @ (*) begin
        case(state) 
            STATE0 : next_state = x ? STATE1 : STATE0;
            STATE1 : next_state = x ? STATE4 : STATE1;
            STATE2 : next_state = x ? STATE1 : STATE2;
            STATE3 : next_state = x ? STATE2 : STATE1;
            STATE4 : next_state = x ? STATE4 : STATE3;
            default : next_state = 3'bxxx;
        endcase
    end

    assign z = (state == STATE3) || (state == STATE4);

    reg [55 : 0] debug;
    
    always @(*) begin
        case(state) 
            STATE0 : debug = "STATE0";
            STATE1 : debug = "STATE1";
            STATE2 : debug = "STATE2";
            STATE3 : debug = "STATE3";
            STATE4 : debug = "STATE4";
        endcase
    end

    
endmodule