module fsm_q6b (
    input   [3 : 1] y,
    input           w,
    output          Y2
);

    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100,
              F = 3'b101;
    
    reg [3 : 1] state;
    
    always @(*) begin
        case (y)
            A : state = w ? A : B;
            B : state = w ? D : C;
            C : state = w ? D : E;
            D : state = w ? A : F;
            E : state = w ? D : E;
            F : state = w ? D : C;
            default : state = 3'bxxx; 
        endcase
    end

    assign Y2 = state[2];

endmodule