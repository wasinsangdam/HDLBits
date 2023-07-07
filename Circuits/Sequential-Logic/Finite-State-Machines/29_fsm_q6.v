module fsm_q6 (
    input           clk,
    input           reset,
    input           w,
    output          z
);

    parameter A = 6'b000001,
              B = 6'b000010,
              C = 6'b000100,
              D = 6'b001000,
              E = 6'b010000,
              F = 6'b100000;
    
    reg [5 : 0] state, next;

    always @(posedge clk) begin
        if (reset)  state <= A;
        else        state <= next;
    end
    
    always @(*) begin
        case (state)
            A : next = w ? A : B;
            B : next = w ? D : C;
            C : next = w ? D : E;
            D : next = w ? A : F;
            E : next = w ? D : E;
            F : next = w ? D : C;
            default : next = 6'bxxxxxx; 
        endcase
    end

    assign z = (state == E) | (state == F);



endmodule