module fsm_q6c (
    input   [6 : 1] y,
    input           w,
    output          Y2,
    output          Y4
);

    parameter A = 6'b000001,
              B = 6'b000010,
              C = 6'b000100,
              D = 6'b001000,
              E = 6'b010000,
              F = 6'b100000;
    
    reg [6 : 1] state;
    
    always @(*) begin
        case (y)
            A : state = w ? A : B;
            B : state = w ? D : C;
            C : state = w ? D : E;
            D : state = w ? A : F;
            E : state = w ? D : E;
            F : state = w ? D : C;
            default : state = 6'bxxxxxx; 
        endcase
    end

    assign Y2 = state[2];
    assign Y4 = state[4];



endmodule