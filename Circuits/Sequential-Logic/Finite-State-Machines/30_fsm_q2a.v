module fsm_q2a (
    input   clk,
    input   reset,

    input   w,
    output  z
);

    parameter A = 6'b000001,
              B = 6'b000010,
              C = 6'b000100,
              D = 6'b001000,
              E = 6'b010000,
              F = 6'b100000;

    reg [5 : 0] state, next_state;

    always @(posedge clk) begin
        if (reset) state <= A;
        else       state <= next_state;
    end

    always @(*) begin
        case(state)
            A : next_state = w ? B : A;
            B : next_state = w ? C : D;
            C : next_state = w ? E : D;
            D : next_state = w ? F : A;
            E : next_state = w ? E : D;
            F : next_state = w ? C : D;
            default : next_state = 6'bxxxxxx;
        endcase
    end

    assign z = (state == E) || (state == F);

endmodule

