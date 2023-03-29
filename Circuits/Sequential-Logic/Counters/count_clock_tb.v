`timescale 1ps/1ps

module count_clock_tb;

    reg          clk;
    reg          reset;
    reg          ena;

    wire         pm;
    wire [7 : 0] hh;
    wire [7 : 0] mm;
    wire [7 : 0] ss;

    count_clock inst1 (clk, reset, ena, pm, hh, mm, ss);

    initial begin
        $dumpfile("count_clock.vcd");
        $dumpvars(0, count_clock_tb);
    end

    initial begin
        $display("clk\treset\tena\tpm\thh\tmm\tss");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", clk, reset, ena, pm, hh, mm, ss, $time);
    end

    always #1 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        ena = 1;

        #5 reset = 1;
        #1 reset = 0;

        #200000 $finish;
    end

endmodule