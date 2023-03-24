module shift_count (
    input           clk,
    input           shift_ena,
    input           count_ena,
    input           data,
    output [3 : 0]  q
);

    always @ (posedge clk) begin
        case ({ shift_ena, count_ena })
            2'b00 : q <= q;
            2'b01 : q <= q - 1;
            2'b10 : q <= {q[2 : 0], data};
            2'b11 : q <= q;
        endcase
    end

endmodule