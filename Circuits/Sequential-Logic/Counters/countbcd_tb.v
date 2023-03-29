`timescale 1ps/1ps

module countbcd_tb;

    reg          clk;
    reg          reset;

    wire [3 : 1] ena;
    wire [15: 0] q;

    countbcd inst1 (clk, reset, ena, q);

    initial begin
        $dumpfile("countbcd.vcd");
        $dumpvars(0, countbcd_tb);
    end

    initial begin
        $display("clk\treset\tena\tq");
        $monitor("%b\t%b\t%b\t%b", clk, reset, ena, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #5 reset = 1;
        #1 reset = 0;

        #110000 $finish;
    end


endmodule