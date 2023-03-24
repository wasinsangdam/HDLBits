module onehot (
    input   wire            in,
    input   wire [9 : 0]    state,
    output  reg  [9 : 0]    next_state,
    output  wire            out1,
    output  wire            out2
);

    parameter   [9 : 0] S0 = 10'b00_0000_0001,
                        S1 = 10'b00_0000_0010,
                        S2 = 10'b00_0000_0100,
                        S3 = 10'b00_0000_1000,
                        S4 = 10'b00_0001_0000,
                        S5 = 10'b00_0010_0000,
                        S6 = 10'b00_0100_0000,
                        S7 = 10'b00_1000_0000,
                        S8 = 10'b01_0000_0000,
                        S9 = 10'b10_0000_0000;

    always @ (*) begin
        case (state)
            S0 : next_state = in ? S1 : S0;
            S1 : next_state = (in) ? S2 : S0;
            S2 : next_state = (in) ? S3 : S0;
            S3 : next_state = (in) ? S4 : S0;
            S4 : next_state = (in) ? S5 : S0;
            S5 : next_state = (in) ? S6 : S8;
            S6 : next_state = (in) ? S7 : S9;
            S7 : next_state = (in) ? S7 : S0;
            S8 : next_state = (in) ? S1 : S0;
            S9 : next_state = (in) ? S1 : S0;              
        endcase
    end

    assign out1 = (state == S8) || (state == S9);
    assign out2 = (state == S9) || (state == S7);

endmodule