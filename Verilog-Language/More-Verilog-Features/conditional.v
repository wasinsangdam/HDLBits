module conditional (
    input   [7 : 0] a, b, c, d,
    output  [7 : 0] min
);

    wire    [7 : 0] temp1;
    wire    [7 : 0] temp2;

    assign temp1 = (a < b) ? a : b;
    assign temp2 = (c < d) ? c : d;

    assign min = (temp1 < temp2) ? temp1 : temp2;

endmodule

module test;

    reg     [7 : 0] a, b, c, d;
    wire    [7 : 0] min;

    integer i;

    conditional inst1 (a, b, c, d, min);

    initial begin
        $display("a\tb\tc\td\tmin");
        $monitor("%d\t%d\t%d\t%d\t%d", a, b, c, d, min, $time);
    end

    initial begin
        a = 0; b = 0; c = 0; d = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $random; b = $random; c = $random; d = $random;
        end

        $finish;
    end


endmodule
