module top_module (
    input                   clk     ,
    input                   resetn  ,
    input                   x       ,
    input                   y       ,
    output                  f       ,
    output                  g
);

    parameter   A = 0,
                B = 1,
                C = 2,
                D = 3,
                E = 4,
                F = 5,
                G = 6,
                H = 7,
                I = 8;

    reg         [3 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (!resetn)    curr_state <= A;
        else            curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            A       :   next_state = B;
            B       :   next_state = C;
            C       :   next_state = x ? D : C;
            D       :   next_state = x ? D : E;
            E       :   next_state = x ? F : C;
            F       :   next_state = y ? G : H;
            G       :   next_state = G;
            H       :   next_state = y ? G : I;
            I       :   next_state = I;
            default :   next_state = A;
        endcase
    end

    assign f = (curr_state == B);
    assign g = (curr_state == H) | (curr_state == G) | (curr_state == F);

endmodule