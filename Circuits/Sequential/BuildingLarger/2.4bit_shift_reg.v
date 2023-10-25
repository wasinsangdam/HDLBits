module top_module (
    input                   clk         ,
    input                   shift_ena   ,
    input                   count_ena   ,
    input                   data        ,
    output      [3 : 0]     q
);

    // Data is shifted in MSB first when shift_ena is 1
    // The number currently in the shift register is decremented 
    // when count_ena is 1.

    always @ (posedge clk) begin
        case ({shift_ena, count_ena})
            2'b00 : q <= q;
            2'b01 : q <= q - 1'b1;
            2'b10 : q <= { q[2 : 0], data};
            2'b11 : q <= q;
        endcase
    end

endmodule