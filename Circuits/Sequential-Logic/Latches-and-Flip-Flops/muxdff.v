module dff8r ( 
    input           clk,
    input           L,
    input           r_in,
    input           q_in,
    output          Q
);

    reg             rtemp;
    wire            wtemp;

    always @(posedge clk) begin
        rtemp <= wtemp;
    end

    assign wtemp = L ? r_in : q_in;

    assign Q = rtemp;

endmodule