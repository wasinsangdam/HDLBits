module top_module (
    input       clk;
    input       reset;    // Synchronous reset to state B
    input       in;
    output  reg out;
);

    parameter   A = 0, B = 1;
    reg         state, next_state;

    always @(posedge clk) begin
        if (reset)
            state <= B;
        else
            state <= next_state;
    end

    always @(*) begin
        case (present_state)
            A : next_state = in ? A : B;
            B : next_state = in ? B : A;
        endcase
    end

    assign out = present_state;

endmodule
