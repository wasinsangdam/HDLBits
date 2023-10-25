module top_module (
    input                   clk     ,
    input                   areset  ,
    input                   in      ,
    output                  out
);

    parameter B = 1'b0, A = 1'b1;

    reg                     curr_state, next_state;

    always @ (posedge clk, posedge areset) begin
        if (areset)     curr_state <= B;
        else            curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            B : next_state = in ? B : A;
            A : next_state = in ? A : B;
        endcase
    end

    assign out = (curr_state == B);

endmodule