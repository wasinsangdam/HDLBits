module oneHertz (
    input           clk,
    input           reset,
    output          oneHertz,
    output [2 : 0]  c_enable
);
    
    wire   [3 : 0] q0, q1, q2;

    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);

    assign c_enable = {(q1 == 4'd9) & (q0 == 4'd9), q0 == 4'd9, 1'b1};
    assign oneHertz = (q2 == 4'd9) & (q1 == 4'd9) & (q0 == 4'd9);


endmodule

module bcdcount (
    input           clk,
    input           reset,
    input           enable,
    output  [3 : 0] Q
);
    reg     [3 : 0] Q;

    always @ (posedge clk) begin
        if (reset | (enable & (Q == 9)))
            Q <= 0;
        else begin
            if (enable)
                Q <= Q + 1;
            else
                Q <= Q;
        end
    end

endmodule