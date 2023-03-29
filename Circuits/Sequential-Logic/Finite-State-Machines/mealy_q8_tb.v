`timescale 1ps/1ps

module mealy_q8_tb;

    reg  clk;
    reg  areset;
    reg  x;

    wire z;

    integer i;

    mealy_q8 inst1 (clk, areset, x, z);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
            areset = 1;
        #10 areset = 0;
        #10 areset = 1;
    end

    initial begin
        for (i = 0; i < 500; i = i + 1) begin
           x = $random % 2;
           #10;
        end
        $finish;
    end

    initial begin
        $dumpfile("mealy_q8.vcd");
        $dumpvars(0, mealy_q8_tb);
    end

    initial begin
        $display("clk\tareset\tx\tz");
        $monitor("%b\t%b\t%b\t%b", clk, areset, x, z, $time);
    end

endmodule