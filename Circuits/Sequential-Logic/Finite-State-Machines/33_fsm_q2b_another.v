module fsm_q2b_another(
    input       clk,
    input       resetn,    // active-low synchronous reset
    input       x,
    input       y,
    output      f,
    output      g
);
    
    parameter A = 0,
              B = 1,
              C = 2,
              D = 3,
              E = 4,
              F = 5,
              G = 6,
              H = 7,
              I = 8;

    reg [3 : 0] state, next;

    always @(posedge clk) begin
        if (!resetn)    state <= A;
        else            state <= next;
    end

    always @(*) begin
        case (state)
            A : next = B;
            B : next = C;
            C : next = x ? D : C;
            D : next = x ? D : E;
            E : next = x ? F : C;
            F : next = y ? G : H;
            G : next = G;
            H : next = y ? G : I;
            I : next = I;
            default : next = 4'bxxxx;
        endcase
    end

    assign f = (state == B);
    assign g = (state == F) | (state == G) | (state == H);
    
endmodule