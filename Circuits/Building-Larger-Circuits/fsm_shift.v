module fsm_shift (
    input           clk,
    input           reset,
    output          shift_ena
);

    reg     [2 : 0] cnt;

    always @ (posedge clk) begin
        if (reset) begin
            shift_ena <= 1'b1;
            cnt <= 3'b0;
        end
        else if (shift_ena == 1'b1 && cnt == 3'd3) begin
            shift_ena <= 1'b0;
            cnt <= 3'b0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end



endmodule