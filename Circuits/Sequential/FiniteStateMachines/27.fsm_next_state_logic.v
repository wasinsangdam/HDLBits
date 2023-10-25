module top_module (
    input           [3 : 1] y,
    input                   w,
    output                  Y2
);

    parameter   A = 0,  // 000
                B = 1,  // 001
                C = 2,  // 010
                D = 3,  // 011
                E = 4,  // 100
                F = 5;  // 101

    reg             [2 : 0] next_state;

    always @ (*) begin
        case (y)
            A       :   next_state = w ? A : B;
            B       :   next_state = w ? D : C;
            C       :   next_state = w ? D : E;
            D       :   next_state = w ? A : F;
            E       :   next_state = w ? D : E;
            F       :   next_state = w ? D : C;
            default :   next_state = A;
        endcase
    end

    assign Y2 = next_state[1];

endmodule