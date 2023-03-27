module counter (
    input           clk,
    input           areset,
    input           train_valid,
    input           train_taken,
    output  [1 : 0] state
);  
    reg [1 : 0] cnt;

    always@(posedge clk, posedge areset) begin
        if (areset) cnt <= 2'b01;
        else if (train_taken & train_valid)     cnt <= (cnt == 2'b11) ? 2'b11 : cnt + 2'b01;
        else if (train_valid & ~train_taken)    cnt <= (cnt == 2'b00) ? 2'b00 : cnt - 2'b01;
        else                                    cnt <= cnt;
    end

    assign state = cnt;

endmodule