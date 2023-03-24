module eq4b (
    input x,
    input y,
    output z
);

    assign z = ~(x ^ y);

endmodule

module test;

    reg     x, y;
    wire    z;

    integer i;

    eq4b inst1(x, y, z);

    initial begin
        $display("x\ty\tz");
        $monitor("%b\t%b\t%b", x, y, z, $time);
    end    

    initial begin
        x = 0; y = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            x = $random;
            y = $random;
        end

        $finish;

    end

endmodule