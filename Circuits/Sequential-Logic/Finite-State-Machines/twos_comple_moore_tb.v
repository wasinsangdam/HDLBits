`timescale 1ps/1ps

module twos_comple_moore_tb;

    reg  clk;
    reg  areset;
    reg  x;

    wire z;

    twos_comple_moore inst1 (clk, areset, x, z);

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        areset = 0;
        #10 areset = 1;
        #10 areset = 0;
        #50 areset = 1;
        #10 areset = 0;
    end

    initial begin
        $dumpfile("twos_comple_moore.vcd");
        $dumpvars(0, twos_comple_moore_tb);
    end

    initial begin
        $display("clk\tareset\tx\tz");
        $monitor("%b\t%b\t%b\t%b", clk, areset, x, z, $time);
    end

    initial begin
            x = 1;
        #30 x = 0;
        #10 x = 1;
        #50 x = 0;
        #20 x = 1;
        #60 x = 0;
        #30 x = 1;
        #80 x = 0;
        #50 x = 1;
        #200 $finish;
    end

endmodule