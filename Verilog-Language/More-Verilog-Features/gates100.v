module gates100 (
    input   [99 : 0] in,
    output  [99 : 0] out_and,
    output  [99 : 0] out_or,
    output  [99 : 0] out_xor
);

    assign out_and = & in;
    assign out_or  = | in;
    assign out_xor = ^ in;

endmodule

module test;

    reg     [99 : 0] in;
    wire    [99 : 0] out_and;
    wire    [99 : 0] out_or;
    wire    [99 : 0] out_xor;

    integer i;

    gates100 inst1 (in, out_and, out_or, out_xor);

    initial begin
        $display("in\tout_and\tout_or\tout_xor");
        $monitor("%d\t%d\t%d\t%d", in, out_and, out_or, out_xor, $time);
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