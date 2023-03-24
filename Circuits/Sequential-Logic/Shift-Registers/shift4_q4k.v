module shift4_q4k (
    input   clk,
    input   reset,
    input   in,
    output  out
);

    wire    temp1, temp2, temp3;

    ff  inst1 (clk, reset, in, temp1);
    ff  inst2 (clk, reset, temp1, temp2);
    ff  inst3 (clk, reset, temp2, temp3);
    ff  inst4 (clk, reset, temp3, out);

    // answer code
    reg [3 : 0] sr;

    always @(posedge clk) begin
        if (!reset)
            sr <= 0;
        else    
            sr <= {sr[2 : 0], in};
    end

    assign out = sr[3];

endmodule

module ff (
    input   clk,
    input   reset,
    input   d,
    output  q
);

    always@ (posedge clk) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end

endmodule