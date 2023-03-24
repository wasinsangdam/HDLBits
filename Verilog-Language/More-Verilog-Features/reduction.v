module reduction (
    input   [7 : 0] in,
    output           parity
);

    assign parity = ^ in;

endmodule

module test;

    reg     [7 : 0] in;
    wire            parity;

    integer i;

    reduction inst1 (in, parity);

    initial begin
        $display("in\t\tparity");
        $monitor("%b\t%b", in, parity, $time);
    end

    initial begin
        in = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            in = $random;
        end

        $finish;
    end


endmodule