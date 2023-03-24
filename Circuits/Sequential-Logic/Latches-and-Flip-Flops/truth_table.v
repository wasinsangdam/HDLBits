module truth_table (
    input   clk,
    input   j,
    input   k,
    output  Q
);
    reg     [2 : 0] temp;
    
    assign temp = { j, k };

    always @ (posedge clk) begin
        case(temp)
            2'b00 : Q <= Q;
            2'b01 : Q <= 0;
            2'b10 : Q <= 1;
            2'b11 : Q <= ~Q;
        endcase
    end

endmodule