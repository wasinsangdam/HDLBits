module dff_tb;

    reg   clk;
    reg   d;

    wire  q;

    integer i;

    dff inst1 (clk, d, q);

    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0, dff_tb);
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