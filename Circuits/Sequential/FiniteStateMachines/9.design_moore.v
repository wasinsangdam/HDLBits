module top_module (
    input                   clk     ,
    input                   reset   ,
    input       [3 : 1]     s       ,
    output                  fr3     ,
    output                  fr2     ,
    output                  fr1     ,
    output                  dfr
);

    parameter   A   = 0,
                B0  = 1,
                B1  = 2,
                C0  = 3,
                C1  = 4,
                D   = 5;

    reg         [2 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= A;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            A       : next_state = s[1] ? B1 : A;
            B0      : next_state = s[2] ? C1 : s[1] ? B0 : A;
            B1      : next_state = s[2] ? C1 : s[1] ? B1 : A;
            C0      : next_state = s[3] ? D  : s[2] ? C0 : B0;
            C1      : next_state = s[3] ? D  : s[2] ? C1 : B0;
            D       : next_state = s[3] ? D  : C0;
            default : next_state = A;
        endcase
    end

    always @ (*) begin
        case (curr_state)
            A       : {fr3, fr2, fr1, dfr} = 4'b1111;
            B0      : {fr3, fr2, fr1, dfr} = 4'b0111;
            B1      : {fr3, fr2, fr1, dfr} = 4'b0110;
            C0      : {fr3, fr2, fr1, dfr} = 4'b0011;
            C1      : {fr3, fr2, fr1, dfr} = 4'b0010;
            D       : {fr3, fr2, fr1, dfr} = 4'b0000;
            default : {fr3, fr2, fr1, dfr} = 4'bxxxx;
        endcase
    end

endmodule