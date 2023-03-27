`timescale 1ps/1ps

module timer_tb;

    reg          clk;
    reg          load;
    reg  [9 : 0] data;

    wire         tc;

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        #20 load = 1;
        #10 load = 0;
    end

    initial begin
        #20 data = 10;
    end

    initial begin
        #500 $finish;
    end
    timer inst1 (clk, load, data, tc);

    initial begin
        $dumpfile("timer.vcd");
        $dumpvars(0, timer_tb);
    end

    initial begin
        $display("clk\tload\tdata\ttc");
        $monitor("%b\t%b\t%b\t%b", clk, load, data, tc, $time);
    end

endmodule