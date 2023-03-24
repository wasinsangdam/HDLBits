module dff8_tb;

    reg   clk;
    reg   [7 : 0] d;

    wire  [7 : 0] q;

    integer i;

    dff8 inst1 (clk, d, q);

    initial begin
        $dumpfile("dff8.vcd");
        $dumpvars(0, dff8_tb);
    end

    initial clk <= 0;

    always #5 clk = ~clk;

    initial begin
        $display("clk\td\tq");
        $monitor("%b\t%b\t%b", clk, d, q, $time);
    end

    initial begin
        d <= 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            d <= $random;
        end

        $finish;
    end

endmodule