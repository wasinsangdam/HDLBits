`timescale 1ps/1ps
`include "fsm_q3b.v"

module fsm_q3b_tb;

    reg  clk;
    reg  reset;
    reg  x;

    wire z;

    integer i;

    fsm_q3b inst1 (clk, reset, x, z);

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 0;
        #10 reset = 1;
        #10 reset = 0;
    end

    initial begin
        
        for (i = 0; i < 100; i = i + 1) begin
            x = $random % 2;    #10;
        end

        $finish;
    end

    initial begin
        $dumpfile("fsm_q3b.vcd");
        $dumpvars(0, fsm_q3b_tb);
    end

    initial begin
        $display("clk\treset\tx\tz");
        $monitor("%b\t%b\t%b\t%b", clk, reset, x, z, $time);
    end

endmodule