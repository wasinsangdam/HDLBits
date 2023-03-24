module always_case2 (
    input       [3 : 0] in,
    output reg  [1 : 0] pos
);

    always @ (*) begin
        case (in)
            in[0] == 1'b1 : pos = 0;
            in[1] == 1'b1 : pos = 1;
            in[2] == 1'b1 : pos = 2;
            in[3] == 1'b1 : pos = 3;

            default : pos = 2'b00;

        endcase
    end


endmodule