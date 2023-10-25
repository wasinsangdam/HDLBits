module top_module (
    input               clk     ,
    input               reset   ,
    input               w       ,
    output              z
);

    parameter   A = 0,  // 000
                B = 1,  // 001
                C = 2,  // 010
                D = 3,  // 011
                E = 4,  // 100
                F = 5;  // 101

    reg             [2 : 0] curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= A;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            A       :   next_state = w ? B : A;
            B       :   next_state = w ? C : D;
            C       :   next_state = w ? E : D;
            D       :   next_state = w ? F : A;
            E       :   next_state = w ? E : D;
            F       :   next_state = w ? C : D;
            default :   next_state = A;
        endcase
    end

    assign z = (curr_state == E) | (curr_state == F);

endmodule