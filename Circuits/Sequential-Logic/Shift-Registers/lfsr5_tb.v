`timescale 1ps/1ps

module lfsr5_tb;

    reg  clk;
    reg  reset;

    wire [4 : 0] q;

    lfsr5 inst1 (clk, reset, q);

    initial begin
        $dumpfile("lfsr5.vcd");
        $dumpvars(0, lfsr5_tb);
    end

    initial begin
        $display("clk\treset\tq");
        $monitor("%b\t%b\t%b", clk, reset, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #10 reset = 0;
    end

    initial #500 $finish;


endmodule